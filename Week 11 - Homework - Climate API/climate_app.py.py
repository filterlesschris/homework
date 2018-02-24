import datetime as dt
import numpy as np
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify, request, render_template

engine = create_engine('sqlite:///hawaii.sqlite')

Base = automap_base()
Base.prepare(engine, reflect=True)

# Save reference to the table
Measurements = Base.classes.measurement
Stations = Base.classes.station

# Create our session (link) from Python to the DB
session = Session(engine)

# 2. Create an app, being sure to pass __name__
app = Flask(__name__)


# 3. Define what to do when a user hits the index route
@app.route("/")
def welcome():
	return (
		f"Welcome!<br/>"
        f"Available Routes:<br/>"
        f"<a href=/api/v1.0/precipitation target=_blank>Precipitation</a><br/>"
        f"<a href=/api/v1.0/stations target=_blank>Stations</a><br/>"
        f"<a href=/api/v1.0/tobs target=_blank>Temperature Observations Last Year</a><br/>"
        f"<a href=/api/v1.0/2015-01-01 target=_blank>Enter a Start Date to Run Analysis (Default: 2015-01-01)</a><br/>"
    	f"<a href=/api/v1.0/2015-01-01/2015-01-02 target=_blank>Enter a Start and End Date to Run Analysis (Default: 2015-01-01/2015-01-02)</a><br/>"
    	)

######### DEFINE ROUTES ###########

@app.route("/api/v1.0/precipitation")
def precipitation():

    """Return a list of dates and precipitation observations from the past year.
    Each item in the list is a dictionary with keys `date` and `prcp`"""

    # Query all prcp observations from the Measures table
    results = session.query(Measurements.date, Measurements.prcp).filter(Measurements.date > "2016-08-25").group_by(Measurements.date).all()

    # Create a list of dicts with `date` and `prcp` as the keys
    prcp_totals = []
    for result in results:
        row = {}
        row["date"] = result[0]
        row["prcp"] = str(result[1])
        prcp_totals.append(row)

    return jsonify(prcp_totals)

@app.route("/api/v1.0/stations")
def stations():

	results = session.query(Stations.name).order_by(Stations.name).all()
	return jsonify(results)

@app.route("/api/v1.0/tobs")
def tobs_func():
    
    """Return a list of dates and temperature observations (tobs) from the past year.
    Each item in the list is a dictionary with keys `date` and `tobs`"""

    # Query all tobs observations from the Measures table
    results = session.query(Measurements.date, Measurements.tobs).filter(Measurements.date > "2016-08-25").\
        group_by(Measurements.date).all()

    # Create a list of dicts with `date` and `prcp` as the keys
    tobs_totals = []
    for result in results:
        row = {}
        row["date"] = result[0]
        row["tobs"] = float(result[1])
        tobs_totals.append(row)

    return jsonify(tobs_totals)


@app.route("/api/v1.0/<start_date>")
def temp_start(start_date):
    
    qry = session.query(Measurements.date, Measurements.tobs).filter(Measurements.date >= start_date)\
        .group_by(Measurements.date).all()
    
    df = pd.DataFrame({'temp': [result[1] for result in qry[:len(qry)]]})
    
    temp_df = pd.DataFrame({"Measurements": ["Min Temp", "Avg Temp", "Max Temp"],
        "Value": [df.min().values[0], df.mean().values[0], df.max().values[0]]})

    temp_dict = dict(zip(temp_df.Measurements, temp_df.Value))

    return jsonify(temp_dict)

@app.route("/api/v1.0/<start_date>/<end_date>")
def temp_start_end(start_date, end_date):
    
    qry = session.query(Measurements.date, Measurements.tobs).filter(Measurements.date >= start_date)\
        .filter(Measurements.date <= end_date).group_by(Measurements.date).all()
    
    df = pd.DataFrame({'temp': [result[1] for result in qry[:len(qry)]]})
    
    temp_df = pd.DataFrame({"Measurements": ["Min Temp", "Avg Temp", "Max Temp"],
        "Temp": [df.min().values[0], df.mean().values[0], df.max().values[0]]})

    temp_dict = dict(zip(temp_df.Measurements, temp_df.Temp))

    return jsonify(temp_dict)

if __name__ == "__main__":
    app.run(debug=True)