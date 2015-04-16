<%@ page import="

	org.opencms.workplace.*,
	org.opencms.workplace.tools.modules.*

"%><%	

	// initialize the workplace class
	CmsModulesDelete wp = new CmsModulesDelete(pageContext, request, response);
		
//////////////////// start of switch statement 

	
switch (wp.getAction()) {

case CmsDialog.ACTION_CANCEL:
//////////////////// ACTION: cancel button pressed

	wp.actionCloseDialog();

break;


//////////////////// ACTION: other actions handled outside of this JSP
case CmsDialog.ACTION_CONFIRMED:

	wp.actionReport();

break;
//////////////////// ACTION: show start dialog
case CmsDialog.ACTION_DEFAULT:
default:

	wp.setParamAction(CmsDialog.DIALOG_CONFIRMED);

%><%= wp.htmlStart() %>

<%= wp.bodyStart("dialog", "") %>

<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.getParamTitle()) %>

<form name="main" action="<%= wp.getDialogUri() %>" method="post" class="nomargin" onsubmit="return submitAction('<%= CmsDialog.DIALOG_OK %>', null, 'main');">
<%= wp.paramsAsHidden() %>
<input type="hidden" name="<%= CmsDialog.PARAM_FRAMENAME %>" value="">

<%= wp.key(org.opencms.workplace.tools.modules.Messages.GUI_MODULES_LIST_ACTION_DELETE_CONF_0) %>


<%= wp.dialogContentEnd() %>
<%= wp.dialogButtonsOkCancel() %>

</form>

<%= wp.dialogEnd() %>
<%= wp.bodyEnd() %>
<%= wp.htmlEnd() %>
<%
} 
//////////////////// end of switch statement 
%>