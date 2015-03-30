<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<html>
   <script type="text/javascript">
   $(document).ready(function() {

     $('#textForm').submit(function(event) {
         event.preventDefault();

         var t = $('#text').val();
        $.post($('#textForm').attr("action"), {text:t},
            function(returnedData){
                 console.log(returnedData);
        });




     });

   });
   </script>
   <head>
        <title>Edit CD</title>
    </head>
    <body>
        <h1>Please fill in CD columns</h1>
        <form:form id="textForm" method="post" action="/getWordsCount">
            <input id="text"  value = ""/>
            <input type="submit" value="Update CD" />
		</form:form>
    </body>
</html>