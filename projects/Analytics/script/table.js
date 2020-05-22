var tables = {};
var tablesData = {};
var sessionData = {};
const STEP_COL = 5;
const DISPLAY_NAME_COL = 4;
const SESSION_ID_COL = 2;
const DATE_COL = 5;
const USER_COL = 1;

var tableOptions = {
  showRowNumber: false,
  width: "100%",
  height: "300",
  allowHtml: true,
  page: "enable",
  pageSize: 100,
  paginingButtons: "auto"
};


// Loading/Filtering Data
function loadIntents() {
  var view = new google.visualization.DataView(tablesData.intents)
  var show = [], hide = [];
  var total = 0;
  for (var i = 0; i < tablesData.intents.getNumberOfRows(); i++) {
    // //console.log(tablesData.intents.getValue(i,SESSION_ID_COL));
    if ((activeFilter.users.length == 0 || activeFilter.users.includes(tablesData.intents.getValue(i, 1))) &&
      (activeFilter.sessions.length == 0 || activeFilter.sessions.includes(tablesData.intents.getValue(i, SESSION_ID_COL))) &&
      (activeFilter.dates.length == 0 || includesDate(tablesData.intents.getValue(i, DATE_COL)))) {
      total++;
      show.push(i);
    }
    else
      hide.push(i)
  }
  view.hideRows(hide);
  view.setRows(show);
  tables.intents.draw(view, tableOptions);
  document.getElementById("numberOfIntents").innerHTML = "Intents: " + total + "</br>";

}

function loadSessions() {
  var view = new google.visualization.DataView(tablesData['sessions'])
  var show = [], hide = [];
  var total = 0;
  for (var i = 0; i < tablesData.sessions.getNumberOfRows(); i++) {
    if ((activeFilter.users.length == 0 || activeFilter.users.includes(tablesData.sessions.getValue(i, 1))) &&
      (activeFilter.dates.length == 0 || includesDate(tablesData.sessions.getValue(i, 5)))) {
      sessionData[total] = tablesData.sessions.getValue(i, 0);
      total++;
      show.push(i);
    }
    else
      hide.push(i)
  }
  view.hideRows(hide);
  view.setRows(show);
  document.getElementById("numberOfSessions").innerHTML = "Sessions: " + total + "</br>";
  tables.sessions.draw(view, tableOptions);
}


function loadDates() {
  // //console.log("dates");
  var users = "";
  if (activeFilter.users.length != 0)
    activeFilter.users.forEach(function (value) {
      if (users.length == 0) users = value + " ";
      else
        users += `|| user_id = ${value} `;
    })
  else users = "all";
  // //console.log({ users });
  getJSON(users, "dates", "JSON");
}

function loadChart() {
  drawPieDiagram(sankeyJSON);
}

// Parsing Json to make data compatible format for google api
function convertJson(json) {
  var arr = [];
  var keys = Object.keys(json.values[0]);
  // //console.log(keys);
  // //console.log(json);
  for (var i = 0; i < json.values.length; i++) {
    arr.push([]);
    // for (j in keys){
    // //console.log(j);
    keys.forEach(function (value) {
      arr[i].push(json.values[i][value].toString());
    });
    // }
  }
  return arr;
}

function parseChart(json) {
  var arr = {};
  json.intents.values.forEach(function (value) {
    if (!arr[(value.display_name)]) {
      // //console.log(activeFilter.users.includes(value.user_id.toString()), activeFilter.users,(value.user_id))
      arr[value.display_name] = 0;
    }

    // if (activeFilter.users.includes(value.user_id)) console.count(true);
    if (!activeFilter.chart.includes(value.display_name) &&
      (activeFilter.users.length == 0 || activeFilter.users.includes(value.user_id.toString())) &&
      // (activeFilter.sessions.length==0 || activeFilter.sessions.includes(value.session_id)) &&
      (activeFilter.dates.length == 0 || includesDate(value.datetime))
    ) {
      // //console.log(value)
      arr[value.display_name]++;
    }
    // //console.log();
  });
  //console.log(arr);
  var keys = Object.keys(arr);
  var data = [];
  var i = 0;
  keys.forEach(function (value) {
    data[i++] = [value, arr[value]];
  });
  return data
}

function filterIntents() {
  // Declare variables 
  var input, filter, table, tr, td, i, txtValue, filterStep;
  input = selectedNode.toString().substring(selectedNode.indexOf(".") + 1).trim();
  filterStep = selectedNode.toString().substring(0, selectedNode.indexOf("."));
  filter = input;
  table = document.getElementById("intentsTable");
  tr = table.getElementsByTagName("tr");
  //console.log(filter);
  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[5];
    step = tr[i].getElementsByTagName("td")[4];
    if (td && step) {
      txtValue = td.textContent || td.innerText;
      step = step.textContent || step.innerText;
      if (txtValue.indexOf(filter) > -1 && step == filterStep) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

// Building filter
function filterUser(id) {
  filter("users", id);
  active = [];
  resetSessionFilter();
  resetIntentsFilter();
  resetDatesFilter();
  loadSessions();
  loadIntents();
  loadDates();
  loadChart();
  load(sankeyJSON);
}

function filterSession(id) {
  filter("sessions", id);
  resetIntentsFilter();
  active = [];
  loadIntents();
  loadChart();
  load(sankeyJSON);
}


// Chart
function drawPieDiagram(json) {
  var data = new google.visualization.DataTable();
  var info = parseChart(json) || [
    ['Mushrooms', 1],
    ['Onions', 1],
    ['Olives', 2],
    ['Zucchini', 2],
    ['Pepperoni', 1]
  ]
  var total = 0;
  info.forEach(function (value) {
    total += value[1];
  })
  document.getElementById("pieTotal").innerHTML = "Total: " + total;
  data.addColumn('string', 'Intent');
  data.addColumn('number', 'Occurances');
  data.addRows(info);

  // Set options for pie chart.
  var options = {
    // title: 'User Intents',
    width: 400,
    height: 300
  };

  // Instantiate and draw the chart for Sarah's pizza.
  var chart = new google.visualization.PieChart(document.getElementById('pieChart'));

  chart.draw(data, options);

  var barchart_options = {
    // title: 'User Intents',
    width: 400,
    height: 300,
    legend: 'none'
  };
  var barchart = new google.visualization.BarChart(document.getElementById('barChart'));
  barchart.draw(data, barchart_options);

  var table = new google.visualization.Table(document.getElementById("table"));
  table.draw(data, tableOptions);


  google.visualization.events.addListener(table, "sort", function () {
    //console.log("sorting")
    barchart.draw(data, barchart_options);
  })

  google.visualization.events.addListener(chart, "select", function () {
    var sel = chart.getSelection()[0];
    if (sel) {
      if (typeof sel.row !== "undefined") {
        filter("chart", data.getValue(sel.row, 0));
        loadChart();
        // //console.log()
      }
    }
  });
}

google.charts.load("current", { packages: ["sankey", "calendar", "table","corechart"] });
google.charts.setOnLoadCallback(drawTable);

// Tables
function drawTable(div, info, keys) {
  info = info || [
    ["Mike", "$10,000", "true"],
    ["Jim", "$8,000", "false"],
    ["Alice", "$12,500", "true"],
    ["Bob", "$7,000", "true"],
  ];
  //console.log("drawTable", div, info, keys);
  var data = new google.visualization.DataTable();
  keys.forEach(function (value) {
    data.addColumn("string", value);
  });

  data.addRows(info);
  //console.log(data);

  var table = new google.visualization.Table(document.getElementById(div));
  tables[div] = table;
  tablesData[div] = data;
  table.draw(data, tableOptions);
  if (activeFilter.sessions.length == 0) loadIntents();
  // else filterIntentWithSessions();

  google.visualization.events.addListener(table, "select", function () {
    var sel = table.getSelection()[0];
    if (sel) {
      if (typeof sel.row !== "undefined") {
        var value = data.getValue(sel.row, 0);
        if (div == 'users') {
          filterUser(value);
          showSelect(div, activeFilter.users, 0)
        }
        if (div == 'sessions') {
          // tablesData[div]
          //console.log(sessionData);
          if (!sessionData[0])
            filterSession(data.getValue(sel.row, 0));
          else filterSession(sessionData[sel.row]);
          showSelect(div, activeFilter.sessions, 0)
        }
        // alert("You selected row " + data.getValue(sel.row, 0) +div);
        //console.log(div);
        showSelect(div, sel.row);
      }
    }
  });

}

function showSelect(div, filter, cell) {
  var table = document.getElementById(div).firstElementChild.firstElementChild.firstElementChild;
  for (var i = 0, row; row = table.rows[i]; i++) {
    if (table.rows[i].cells[cell] == undefined) break;
    if (table.rows[i].style.color == "blue") table.rows[i].style.color = "black"

    if (filter.includes((table.rows[i].cells[cell].innerHTML))) {
      //console.log(table.rows[i].cells[cell]);
      table.rows[i].style.color = "blue"
    }
  }
}

// Helper Functions
function reloadTables() {
  loadSessions();
  loadIntents();
  loadDates();
}

function includesDate(date) {
  var x = false;
  activeFilter.dates.forEach(function (value) {
    if (compareDate(date, value)) {
      x = true;
    }
  });
  return x;
}

function compareDate(date, textDate) {
  return !textDate.localeCompare(date.toString().substring(0, 10).trim())
}

function dateString(date) {
  var str = date.getFullYear() + "-" + date.getMonth() + 1 + "-" + date.getDate();
  return str
}