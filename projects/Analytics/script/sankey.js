
function trace(json) {
  var arr = []
  var keys = Object.keys(json)
  // //console.log(keys);
  for (var i = 0; i < keys.length; i++) {
    arr.push([json[keys[i]][0], json[keys[i]][1], json[keys[i]][2]])
  }
  // //console.log({ arr });
  drawChart(arr)
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

function findNextStep(json, current) {
  // var nextStep = current.session_step + 1 + ". Exit";
  for (var i = 0; i < json.intents.length; i++) {
    var j = json.intents.values[i];
    if (current.session_id == j.session_id && j.session_step == current.session_step + 1) {
      // //console.log(j);
      if (showAll  || active.includes(current.session_step + '. ' + current.display_name)) //|| activeFilter.sessions.length != 0
        return j.session_step + '. ' + j.display_name;
    }
  }
  return 0;
}

function load(json) {
  // //console.log({json});
  var arr = {}

  for (var i = 0; i < json.intents.length; i++) {
    // if (activeFilter.sessions != "all")
    var j = json.intents.values[i]
    var currentStep = j.session_step + '. ' + j.display_name
    if (currentStep.substring(0, 1) == 0 && !active.includes(currentStep)) active.push(currentStep)
    var nextStep = findNextStep(json, j)
    // if (nextStep == 0) nextStep = "End";

    if (
      nextStep != 0 && 
      (activeFilter.users.length == 0 || activeFilter.users.includes(j.user_id.toString())) &&
      (activeFilter.sessions.length == 0 || activeFilter.sessions.includes(j.session_id.toString())) &&
      (activeFilter.dates.length == 0 || includesDate(j.datetime))
      ) {
      if (undefined == arr[currentStep + '-' + nextStep]) {
        arr[currentStep + '-' + nextStep] = []
        arr[currentStep + '-' + nextStep][0] = currentStep
        arr[currentStep + '-' + nextStep][1] = nextStep
        arr[currentStep + '-' + nextStep][2] = 1
      } else {
        arr[currentStep + '-' + nextStep][2] = arr[currentStep + '-' + nextStep][2] + 1
      }
    }
  }
  // //console.log("Load", arr);
  trace(arr)
}

google.charts.setOnLoadCallback(drawChart)

function drawChart(arr) {
  // drawCalendar();
  // //console.log(arr);
  // draw(arr)
  // var colors = ['#a6cee3', '#b2df8a', '#fb9a99', '#fdbf6f', '#cab2d6', '#ffff99', '#1f78b4', '#33a02c'];
  arr = arr || [
    ['A', 'X', 5],
    ['A', 'Y', 7],
    ['A', 'Z', 6],
    ['B', 'X', 2],
    ['B', 'Y', 9],
    ['B', 'Z', 4]
  ]

  var data = new google.visualization.DataTable()
  data.addColumn('string', 'From')
  data.addColumn('string', 'To')
  data.addColumn('number', 'Weight')

  data.addRows(arr)
  // Sets chart options.
  var options = {
    // width: arr.length * 20,
    width: 800,
    height: 500,
    sankey: {
      node: {
        labelPadding: 8,
        nodePadding: 15,
        interactivity: true,
        width: 8,
        colorNode: 'unique',
        label: {
          fontName: 'Sans-serif',
          fontSize: 10,
          color: '#292929',
          bold: true
        }
      },
      link: {
        interactivity: true
        // colorMode: 'gradient',
        // colors: colors,
      }
    }
  }
  // document.getElementById("sankeyTotal").innerHTML = "Total: " + data.getNumberOfColumns()
  document.getElementById("sankeyTotalNodes").innerHTML = "Total: " + data.getNumberOfRows()

  // Instantiates and draws our chart, passing in some options.
  var chart = new google.visualization.Sankey(
    document.getElementById('sankey_basic')
  )
  chart.draw(data, options)

  google.visualization.events.addListener(chart, 'select', function () {
    var sel = chart.getSelection()
    if (sel.length) {
      if (typeof sel[0].row !== 'undefined') {
        // alert('You selected link "' +data.getValue(sel[0].row, 0) +'->' +data.getValue(sel[0].row, 1) +'". Value=' +data.getValue(sel[0].row, 2))
      } else if (sel[0].name) {
        // alert('You selected node "' + sel[0].name + '"');
        if (selectedNode == sel[0].name) {
          unselect = true
          selectedNode = null
          // document.getElementById(sel[0].name).style.color = "black";


          // table = document.getElementById('intents')
          // tr = table.getElementsByTagName('tr')
          // for (i = 0; i < tr.length; i++) {
          //   tr[i].style.display = ''
          // }
        } else {
          selectedNode = sel[0].name
          active.push(selectedNode)
          // document.getElementById(sel[0].name).style.color = "blue";
          filter("intents", selectedNode.toString());
          // filterIntents()
          // getJSON('all', 'all', 'JSON')
          load(sankeyJSON)
          // loaded(activeFilter.users)
        }
      }
    }
  })
}

var sankey = d3.sankeyLeft()

// Attempted different API
function convert(arr) {
  var data = []
  if (arr.length == 0) return null
  for (var i = 0; i < arr.length; i++) {
    data[i] = {
      from: arr[i][0],
      to: arr[i][1],
      weight: arr[i][2]
    }
  }
  return data
}

function draw(arr) {
  // console.count("draw");
  document.getElementById('container').innerHTML = ''
  //creating the data
  var data = convert(arr) || [{
      from: 'Solar Light',
      to: 'Shade',
      weight: 110
    },
    {
      from: 'Shade',
      to: null,
      weight: 60
    },
    {
      from: 'Shade',
      to: 'Facade',
      weight: 40
    },
    {
      from: 'Facade',
      to: null,
      weight: 30
    },
    {
      from: 'Facade',
      to: 'Interior Lighting',
      weight: 20
    }
  ]
  //calling the Sankey function
  var sankey_chart = anychart.sankey(data)
  // sankey_chart.nodeAlign("left");
  sankey_chart.title('d3 Sankey Diagram ')

  sankey_chart.container('container')
  //initiating drawing the Sankey diagram
  sankey_chart.draw()
}