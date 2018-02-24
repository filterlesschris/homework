
// Get references to the tbody element, input field and button
var $tbody = document.querySelector("tbody");
var $stateInput = document.querySelector("#state");
var $cityInput = document.querySelector("#city");
var $countryInput = document.querySelector("#country");
var $shapeInput = document.querySelector("#shape");
var $datetimeInput = document.querySelector("#datetime");
var $searchBtn = document.querySelector("#search");
var $loadMoreBtn = document.querySelector("#load-btn");


// Set filteredAddresses to dataSet initially
var filteredAddresses = dataSet;

// Set a startingIndex and resultsPerPage variable
var startingIndex = 0;
var resultsPerPage = 100;
// renderTable renders the filteredAddresses to the tbody
function renderSearchTable() {
  $tbody.innerHTML = "";
  for (var i = 0; i < filteredAddresses.length; i++) {
    // Get get the current address object and its fields
    var address = filteredAddresses[i];
    var fields = Object.keys(address);
    // Create a new row in the tbody, set the index to be i + startingIndex
    var $row = $tbody.insertRow(i);
    for (var j = 0; j < fields.length; j++) {
      // For every field in the address object, create a new cell at set its inner text to be the current value at the current address's field
      var field = fields[j];
      var $cell = $row.insertCell(j);
      $cell.innerText = address[field];
    }
  }
}


function renderTable() {
  
  // Set the value of endingIndex to startingIndex + resultsPerPage
  var endingIndex = startingIndex + resultsPerPage;
  // Get a section of the addressData array to render
  var addressSubset = dataSet.slice(startingIndex, endingIndex);

  //$tbody.innerHTML = "";
  for (var i = 0; i < addressSubset.length; i++) {
    // Get get the current address object and its fields
    var address = addressSubset[i];
    var fields = Object.keys(address);
    // Create a new row in the tbody, set the index to be i + startingIndex
    var $row = $tbody.insertRow(i + startingIndex);
    for (var j = 0; j < fields.length; j++) {
      // For every field in the address object, create a new cell at set its inner text to be the current value at the current address's field
      var field = fields[j];
      var $cell = $row.insertCell(j);
      $cell.innerText = address[field];
    }
  }
}
// Add an event listener to the button, call handleButtonClick when clicked
$loadMoreBtn.addEventListener("click", handleButtonClick);

function handleButtonClick() {
  // Increase startingIndex by resultsPerPage, render the next section of the table
  startingIndex += resultsPerPage;
  renderTable();
  // Check to see if there are any more results to render
  if (startingIndex + resultsPerPage >= dataSet.length) {
    $loadMoreBtn.classList.add("disabled");
    $loadMoreBtn.innerText = "All Addresses Loaded";
    $loadMoreBtn.removeEventListener("click", handleButtonClick);
  }
}

// Add an event listener to the searchButton, call handleSearchButtonClick when clicked
$searchBtn.addEventListener("click", handleSearchButtonClick);

function handleSearchButtonClick() {
  // Format the user's search by removing leading and trailing whitespace, lowercase the string
  var filterState = $stateInput.value.trim().toLowerCase();
  var filterCity = $cityInput.value.trim().toLowerCase();
  var filterCountry = $countryInput.value.trim().toLowerCase();
  var filterShape = $shapeInput.value.trim().toLowerCase();
  var filterDateTime = $datetimeInput.value.trim().toLowerCase();
  // Set filteredAddresses to an array of all addresses whose "state" matches the filter
  filteredAddresses = dataSet.filter(function(address) {
    var addressState = address.state.substring(0, filterState.length).toLowerCase();
    var addressCity = address.city.substring(0, filterCity.length).toLowerCase();
    var addressCountry = address.country.substring(0, filterCountry.length).toLowerCase();
    var addressShape = address.shape.substring(0, filterShape.length).toLowerCase();
    var addressDateTime = address.datetime.substring(0, filterDateTime.length).toLowerCase();
    // If true, add the address to the filteredAddresses, otherwise don't add it to filteredAddresses
    if (addressState === filterState && addressCity === filterCity && addressCountry === filterCountry && addressShape === filterShape && addressDateTime === filterDateTime) {
      return true;
    }
    return false;
  });
  renderSearchTable();
}

// Render the table for the first time on page load
renderTable();