<%@ page import="
	org.opencms.workplace.tools.workplace.rfsfile.*,
	org.opencms.workplace.CmsDialog
"%><%	

	// initialize the workplace class
	CmsRfsFileDownloadDialog wp = new CmsRfsFileDownloadDialog(pageContext, request, response);
		
//////////////////// start of switch statement 

switch (wp.getAction()) {
    case CmsDialog.ACTION_CANCEL:

//////////////////// ACTION: cancel button pressed
      
        wp.actionCloseDialog();
        break;

//////////////////// ACTION: construct this page:

    case CmsDialog.ACTION_DEFAULT:
    default:
	wp.setParamAction(CmsDialog.DIALOG_CANCEL);

%><%= wp.htmlStart("administration/index.html") %>

<%= wp.bodyStart(null) %>
<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.getParamTitle()) %>

<form name="main" class="nomargin" action="<%= wp.getDialogUri() %>" method="post" onsubmit="submitAction('<%= CmsDialog.DIALOG_OK %>', null, 'main');">
<%= wp.paramsAsHidden() %>
<% if (wp.getParamFramename()==null) { %>
<input type="hidden" name="<%= CmsDialog.PARAM_FRAMENAME %>" value="">
<%  } %>


<%= wp.buildDownloadFileView() %>
<%= wp.dialogContentEnd() %>
<%= wp.dialogButtonsOkCancel() %>
<%= wp.buildDownloadScript() %>

</form>

<%= wp.dialogEnd() %>


<%= wp.bodyEnd() %>
<%= wp.htmlEnd() %>
<%
} 
//////////////////// end of switch statement 
%>