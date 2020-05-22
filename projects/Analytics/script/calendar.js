
function filterDates(date) {
  date = new Date(date);
  date.setDate(date.getDate()+1);
  var str = date.getFullYear() +"-"+ (format(parseInt(date.getMonth())+1)) +"-"+ format(parseInt(date.getDate()));
  filter("dates",str);
  load(sankeyJSON);
  loadSessions();
  loadIntents();
  loadChart();
  }


  function drawCalendar(json) {
    // console.count("calendar");
    // //console.log(json);
    var dataTable = new google.visualization.DataTable();
    dataTable.addColumn({ type: "date", id: "Date" });
    dataTable.addColumn({ type: "number", id: "Calls" });
    var data = json ? convertToDates(json.dates.values): [
          [new Date(2020, 3, 13), 37032],
          [new Date(2020, 3, 14), 38024],
          [new Date(2020, 3, 15), 38024],
          [new Date(2020, 3, 16), 38108],
          [new Date(2020, 3, 17), 38229],
          [new Date(2020, 9, 4), 38177],
          [new Date(2020, 9, 5), 38705],
          [new Date(2020, 9, 12), 38210],
          [new Date(2020, 9, 13), 38029],
          [new Date(2020, 9, 19), 38823],
          [new Date(2020, 9, 23), 38345],
          [new Date(2020, 9, 24), 38436],
          [new Date(2020, 9, 30), 38447],
        ];
    dataTable.addRows(data);
  
    var chart = new google.visualization.Calendar(document.getElementById("calendar"));
  
    var options = {
      title: "Test App Calls",
      height: 200,
      width: 1000,
  allowHtml: true,

      calendar: {
        focusedCellColor: {
          stroke: "#d3362d",
          strokeOpacity: 1,
          strokeWidth: 1,
        },
        noDataPattern: {
          backgroundColor: "#76a7fa",
          color: "#a0c3ff",
        },
        cellColor: {
          backgroundColor: "#76a7fa",
          color: "#a0c3ff",
        },
      },
    };
  
    chart.draw(dataTable, options);
    google.visualization.events.addListener(chart, "select", function () {
      var sel = chart.getSelection();
      if (sel.length) {
        if (typeof sel[0].row !== "undefined") {
          console.log(new Date(sel[0].date))
          filterDates(new Date(sel[0].date));
        }
      }
    });
  }
  

  // Helper Functions
  function format(num){
    num = num.toString()
    if (num.length<2) return 0+num;
    return num
  }

  function convertToDates(arr) {
    var data = [];
    if (arr.length == 0) return null;
    for (var i = 0; i < arr.length; i++) {
      var date = new Date(arr[i][0]);
      date.setDate(date.getDate()+1);
      data[i] = [date, arr[i][1]];
    }
    // //console.log("Dates:", data)
    return data;
  }
  