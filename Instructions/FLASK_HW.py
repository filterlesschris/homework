import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, jsonify
import datetime as dt
import numpy as np
import pandas as pd

#engine = create_engine('sqlite:///hawaii.sqlite',echo=False)
engine = create_engine('sqlite:///hawaii.sqlite')

Base = automap_base()
Base.prepare(engine, reflect=True)

# Save reference to the table
Measurements = Base.classes.measurements
#Stations = Base.classes.stations

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
        f"<a href=/api/v1.0/precipitation>Precipitation</a><br/>"
        f"<a href=/api/v1.0/stations>Stations</a><br/>"

    )



@app.route("/api/v1.0/Precipitation")
def precipitation():


	results = session.query(stations).all()
	precip = list(np.ravel(results))

	return jsonify(precip)

@app.route("/api/v1.0/Stations")
def stations():


	results = session.query(stations).all()
	station_results = list(np.ravel(results))

	return jsonify(station_results)

if __name__ == "__main__":
    app.run(debug=True)