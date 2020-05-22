var selectedNode = null;
var active = [];
var unselect = false;
var sankeyJSON;
var calendarJSON;
var showAll = false;
var activeFilter = {
  dates: [],
  users: [],
  sessions: [],
  intents: [],
  chart: []
}

function showAll() {
  //console.log(showAll)
  if (showAll) {
    showAll = false;
    document.getElementById("show").innerHTML = "Show All"
  }
  else {
    showAll = true;
    document.getElementById("show").innerHTML = "Show Start"
  }
  load(sankeyJSON);

}

function show() {
  // //console.log(showAll)
  if (showAll) {
    showAll = false;
    document.getElementById("show").innerHTML = "Show All"
  }
  else {
    showAll = true;
    document.getElementById("show").innerHTML = "Show Start"
  }
  load(sankeyJSON);
}

function init() {
  google.charts.load("current", { packages: ["sankey", "calendar", "table", "corechart"] });
  loaded("all");
  // document.getElementById('filter').innerHTML=activeFilter.toString();
  // drawPieDiagram()
  printFilter();
}

function loaded(id) {
  getJSON(id, "all", "JSON");
  getJSON(id, "dates", "JSON");
}

function filter(param, value) {
  if (!activeFilter[param].includes(value))
    activeFilter[param].push(value);
  else
    remove(param, value);
  printFilter();
}

function remove(param, item) {
  var arr = [];
  activeFilter[param].forEach(function (value) {
    if (value != item) arr.push(value);
  })
  activeFilter[param] = arr;
}

function resetFilter() {
  var keys = Object.keys(activeFilter);
  keys.forEach(function (value) {
    activeFilter[value] = [];
  })
  printFilter();
  // filterIntents();
  loaded("all");
}

function resetSessionFilter() {
  activeFilter.sessions = [];
  printFilter();
}

function resetDatesFilter() {
  activeFilter.dates = [];
  printFilter();
}

function resetIntentsFilter() {
  activeFilter.intents = [];
  printFilter();
}

function resetUsersFilter() {
  activeFilter.users = [];
  printFilter();
}

function resetChartFilter() {
  activeFilter.chart = [];
  printFilter();
}

document.addEventListener('readystatechange', function () {
  if (document.readyState === "complete") {
    init();
  }
});


function printFilter() {
  var keys = Object.keys(activeFilter);
  var str = "";
  keys.forEach(function (value) {
    if (activeFilter[value].toString() != "") str += `${sentenceCase(value)}: ${activeFilter[value].toString()}</br>`;
  })
  document.getElementById('filter').innerHTML = str.toString();
}

function sentenceCase(str) {
  if ((str === null) || (str === ''))
    return false;
  else
    str = str.toString();

  return str.replace(/\w\S*/g, function (txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(); });
}

function getJSON(id, table, func) {

  var json;
  if (id == "") {
    document.getElementById("tables").innerHTML = "No ID";
    return;
  }

  if (func == "JSON") {
    document.getElementById("tables").innerHTML = this.responseText;
    json = JSON.parse(jsonText);
    // //console.log(json);

  } 
   if (table == "all") {
    document.getElementById("numberOfUsers").innerHTML = "Users: " + json.users.length + "</br>";
    document.getElementById("numberOfIntents").innerHTML = "Intents: " + json.intents.length + "</br>";
    document.getElementById("numberOfSessions").innerHTML = "Sessions: " + json.sessions.length + "</br>";
    sankeyJSON = json;
    load(json);
    drawTable("intents", convertJson(json.intents), Object.keys(json.intents.values[0]));
    drawTable("sessions", convertJson(json.sessions), Object.keys(json.sessions.values[0]));
    drawTable("users", convertJson(json.users), Object.keys(json.users.values[0]));
    drawPieDiagram(json);
    // wordChart(json);
  } else if (table == "dates") {
    json = JSON.parse(datesText);
    calendarJSON = json;
    // //console.log(calendarJSON);
    document.getElementById("numberOfDates").innerHTML = "Dates: " + json.dates.length + "</br>";
    drawCalendar(json);
  }
}



function wordChart(json) {
  var sorter = {};
  var arr = [];

  for (var i = 0; i < json.intents.length; i++) {
    if (!sorter[json.intents.values[i].session_id]) sorter[json.intents.values[i].session_id] = [];
    sorter[json.intents.values[i].session_id][json.intents.values[i].session_step] = json.intents.values[i].display_name;
  }
  // for (var i = 0; i < sorter)
  var i = 0;
  var keys = Object.keys(sorter);
  keys.forEach(function (value) {
    sorter[value].forEach(function (value) {
      console.count(value);
      if (arr[i] == undefined) arr[i] = "Start";
      arr[i] = [arr[i] + "," + value];
    })
    i++;
  });

  // //console.log({ sorter }, arr)
}

