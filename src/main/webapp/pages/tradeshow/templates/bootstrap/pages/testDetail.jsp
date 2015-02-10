<%
response.setCharacterEncoding("UTF-8");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", -1);
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
 
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<div id="custom-toolbar" class="btn-toolbar " role="toolbar">
  <div  class="btn-group"><button id="addBtnDetail"  class="btn btn-default " type="button" data-toggle="modal" data-target="#addNewTestModal" > <span class="glyphicon glyphicon-plus"></span> Add </button> </div>
</div>
 <div id="statusbar" class="alert alert-success alert-dismissible" role="alert" style="display:none">
	  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
 </div>

<table data-testId="${id}" id="test-table" data-toggle="table" data-url="${id}/data" data-toolbar="#custom-toolbar" data-click-to-select="true" data-height="400" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true">
    <thead>
    <tr>
        <th data-field="radio" data-radio="true"></th>
        <th data-field="cTestsId"  data-visible="true" >ID </th>
        <th data-field="name" data-align="center" data-sortable="true" >Question Name</th>
        <th data-field="category" data-align="center" data-sortable="true">Options</th>
        <th data-field="action" data-align="center" data-sortable="true" data-formatter="operateFormatter" data-events="operateEvents" >Action</th>
    </tr>
    </thead>
</table> 




   <!-- Modal  for adding new Settings -->
<div class="modal fade" id="addNewTestModal" tabindex="-1" role="dialog" aria-labelledby="addNewTestLabel" aria-hidden="true" data-toggle="validator" >
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="addNewTestLabel">Add New Test </h4>
      </div>
<!--       <div class="modal-body" id="editModal"> </div> -->
      <div class="modal-body" >
				<form  id="ajaxform" role="form" method="post"  action="<c:url value="/tests/add" > </c:url>"
				data-bv-message="This value is not valid"
    			data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
   				data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
    			data-bv-feedbackicons-validating="glyphicon glyphicon-refresh"
    			data-bv-excluded=":disabled" >
				<div class="row">
					  <div class="col-xs-24 col-md-12"> 
					  	  <div class="form-group">
						    <input type="hidden" class="form-control" id="testid" name ="cTestsId" >
						  </div>
						  <div class="form-group">
						    <label for="name">Question</label>
						    <input type="text" class="form-control" id="testName" name ="question" placeholder="Question" 
						    data-bv-notempty="true"
                			data-bv-notempty-message="The test name is required and cannot be empty" 
                			data-bv-excluded=":disabled" >
						  </div>
						  <div class='dynamicOption'>
						  <div class="form-group">
						    <label for="category">Option</label>
						    <input type="text" class="form-control" id="category" name="category" placeholder="Option" 
						    data-bv-notempty="false"
						    data-bv-excluded=":disabled">
						  </div>
						  <div class="checkbox">
						    <label>
						      <input type="checkbox"> isCorrect ?
						    </label>
						  </div>
						   <div class="form-group">
						    <label for="explanation">Explanation</label>
						    <input type="text" class="form-control" id="category" name="explanation" placeholder="brief explanation" 
						    data-bv-notempty="false"
						    data-bv-excluded=":disabled">
						  </div>
						  </div>
						  
				  </div>
					 
				</div>
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<div class="form-group"  align="center">
							     <button id="saveFormBtn" type=submit class="btn btn-primary btn-lg" >Save</button> 
					    </div>
					</div>
					<div class="col-xs-12 col-md-6" align="center">
						<div class="form-group">
								 <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Cancel</button>
					    </div>
				   </div>
      			     
				</div>
			</form>	
      </div>
    </div>
  </div>
</div>   


 <link href="<c:url value="/resources/css/bootstrap-table.css" />" rel="stylesheet">
 <script src="<c:url value="/resources/js/bootstrap-table.js" />"></script>
 <script src="<c:url value="/resources/js/certifier-test.js" />"></script>
 
 
 

    