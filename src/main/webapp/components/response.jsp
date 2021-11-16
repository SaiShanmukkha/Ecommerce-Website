<%
   String success = (String) session.getAttribute("success");
   String warning = (String) session.getAttribute("warning");
   
    if(success != null){   
%>
	<!-- display the message with needed styling -->
	
	<div class="alert alert-success alert-dismissable fade show" role="alert">
		<strong><%=success%></strong>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  		  <span aria-hidden="true">&times;</span>
 		</button>
	</div>
	
<%
	session.removeAttribute("success");

    } else if (warning != null ){
%>

	<!-- display the message with needed styling -->

	<div class="alert alert-warning alert-dismissable fade show" role="alert">
		<strong><%=warning%></strong>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  		  <span aria-hidden="true">&times;</span>
 		</button>
	</div>

<%
	session.removeAttribute("warning");    
    }
%>
