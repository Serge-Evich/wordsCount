<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<html>
   <script type="text/javascript">
   // Load the Visualization API and the piechart package.
   google.load('visualization', '1.0', {'packages':['corechart']});

   // Set a callback to run when the Google Visualization API is loaded.
  
   // Callback that creates and populates a data table,
   // instantiates the pie chart, passes in the data and
   // draws it.
   function drawChart(rows) {
	
	 var data = new google.visualization.DataTable();
	 data.addColumn('string', 'Word');
	 data.addColumn('number', 'Count');
	 
	 
	 var array=[];
	 $.each(rows, function(inx, value) {
		 array.push([inx, value]);
		 
	 }); 
	 console.log(array);
	 data.addRows(array);	 
	 
     // Create the data table.
    

     // Set chart options
     var options = {'title':'Words count',
                    'width':400,
                    'height':300};

     // Instantiate and draw our chart, passing in some options.
     var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
     chart.draw(data, options);
   }
   $(document).ready(function() {
       
        $('#textForm').submit(function(event) {
            event.preventDefault();
            var t = $('#text').val();
            $.post($('#textForm').attr("action"), {text:t},
                function(returnedData){
                    console.log(returnedData);
                    google.setOnLoadCallback(drawChart(returnedData));
                    

            });
        });
    });
   </script>

   <head>
        <title>Words count</title>
    </head>
    <body>
        <h1>Please fill in some text</h1>
        <form:form id="textForm" method="post" action="/getWordsCount">
            <textarea id="text"  value = ""></textarea>
            <input type="submit" value="Update" />
		</form:form>
		<div id="chart_div"></div>
    </body>
</html>