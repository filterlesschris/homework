// Create map object 
var map = L.map("map", {
    center: [37.09, -95.71],
    zoom: 4

});

// add api key to variable 
var apiKey = "access_token=pk.eyJ1IjoiZmlsdGVybGVzc2NocmlzIiwiYSI6ImNqZTZoeHVzOTAwam4yem52aDgwY2htbHUifQ.djQkiJ5I-YONxl89MM90ew";

// Add default layer - Dark Map layer
L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?" + apiKey).addTo(map);

// Outdoors 
var outdoors = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/outdoors-v10/tiles/256/{z}/{x}/{y}?" + apiKey, 
{id: 'map'});

// Satellite map
var satellite = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/satellite-streets-v9/tiles/256/{z}/{x}/{y}?" + apiKey,
{id: 'map'});

// Dark map - default map
var grayscale = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?" + apiKey,
{id: 'map'});


var baseMaps = {
    "Outdoors": outdoors,
    "Satellite": satellite,
    "Grayscale": grayscale
};

// earthquakes all week data
var link = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson"

var plates_link = "../json/plates.json"

// var plates_link = "https://raw.githubusercontent.com/fraxen/tectonicplates/master/GeoJSON/PB2002_plates.json"

var controlLayers = L.control.layers(baseMaps).addTo(map);


 function styleInfo(feature){
     return{
     fillOpacity: getOpacity(feature.properties.mag),
     color: getColor(feature.properties.mag),
     radius: getRadius(feature.properties.mag),
     stroke: true,
     //border: true,
     weight: 0.5
    };
 };

function getOpacity(magnitude){
    
    }
};


 function getColor(magnitude){
    switch(true) {
        case magnitude > -99:
        return "#ff0000"; // dark umber
        return "#ff0000"; // powderblue
    }
};


// function get Radius

 function getRadius(magnitude){
    switch(true) {
        case magnitude > 5:
        return 20;
        case magnitude > 4:
        return 13;
        case magnitude > 3:
        return 10;
        case magnitude > 2:
        return 7;
        case magnitude > 1:
        return 6;
        default:
        return 0;
    }
};

//create a function: populateInfo to add data
function populateInfo(feature, layer) {
    layer.bindPopup("<h1 class='infoHeader'>Weekly Earthquake Data</h1> \
    <p class='description'>" + "Location: " + feature.properties.place + "</p>\
    <p class='description'>" + "Magnitude: " + feature.properties.mag + "</p>");
        
};

// function for plate color
function colorPlates(feature){
    return{
        color: "#FFA500",
        fillOpacity: 0.05
    };
};

// function for plate popup
function popPlate(feature, layer) {
    layer.bindPopup("<h1 class='infoHeader'>Tectonic Plate:</h1> \
<p class='plate'>" + feature.properties.PlateName + "</p>");
        
};

// Here we add a GeoJSON layer to the map once the file is loaded.
d3.json(link, function(data){
    var earthquakeLayer = L.geoJson(data, {
        // We turn each feature into a circleMarker on the map.
        pointToLayer: function(feature, latlng) {
          return L.circleMarker(latlng);
        },
        // We set the style for each circleMarker using our styleInfo function.
        style: styleInfo,
        // We create a popup for each marker to display the magnitude and location of the earthquake after the marker has been created and styled
        onEachFeature: populateInfo,
        
        
      }).addTo(map);
      controlLayers.addOverlay(earthquakeLayer, 'Earthquakes');

    });

// add plate layer
d3.json(plates_link, function(data) {
    // Creating a GeoJSON layer with the retrieved data
    var plateLayer  = L.geoJson(data, {
        style: colorPlates,
        // onEachFeature - popPlate to add popup for each plate
        onEachFeature: popPlate,
    }).addTo(map);
    controlLayers.addOverlay(plateLayer, "Fault Lines");
        

// Setting up the legend
var legend = L.control({position: 'bottomleft'});
legend.onAdd = function (map) {

    var div = L.DomUtil.create('div', 'info legend'),
        grades = [0, 1, 2, 3, 4, 5],
        labels = [];

    // loop through our density intervals and generate a label with a colored square for each interval
    for (var i = 0; i < grades.length; i++) {
        div.innerHTML +=
            '<i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
            grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '<br>' : '+');
    }

    return div;
};

legend.addTo(map);

});