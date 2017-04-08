<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <!DOCTYPE html>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <html>
            <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

            <body>
                <h2>Hello World!</h2>
                <c:forEach var="c" items="${route_list}" varStatus="i">
                    <table>
                        <td>${c.pointName}<input type="checkbox" name="pointName" value="${c.id }" />
                        </td>
                    </table>
                </c:forEach>
                <input type="button" onclick="getData()" name="Submit" value="Assign Bus">
                <script>function getData(){
                	var points=new Array;
                	var point="";
                	$("input:checkbox[name=pointName]:checked").each(function(){
                	   point=point+","+$(this).val();
                	});
                	
                	console.log(point);
                	$.ajax({ 
                	    url:"/assign",    
                	    type:"GET", 
                	    contentType: "application/json; charset=utf-8",
                	    data: "points="+point.substr(1), //Stringified Json Object
                	    async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
                	    cache: false,    //This will force requested pages not to be cached by the browser          
                	    processData:false, //To avoid making query String instead of JSON
                	    success: function(resposeJsonObject){
                	        // Success Message Handler
                	    }
                	});
                	
                }</script>
            </body>

            </html>
