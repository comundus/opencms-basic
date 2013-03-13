<%@ page import = "
	org.opencms.jsp.CmsJspActionElement,
	org.opencms.file.CmsObject,
	java.util.*,
	org.opencms.workplace.*,
	org.opencms.workplace.commons.*,
	org.opencms.workplace.editors.CmsDialogElements,				 											 							 
	org.opencms.workplace.tools.content.*
" %><%
	
	// Initialize action element
	CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);

	CmsObject cmsObject= cms.getCmsObject();

	// initialize the CmsMergePages class
	CmsMergePages wp = new CmsMergePages(cmsObject, pageContext, request, response);
	
	String errorMessage = "";	
	//////////////////// start of switch statement 
	
switch (wp.getAction()) {

case CmsMergePages.ACTION_CANCEL:
case CmsMergePages.ACTION_REPORT_END:
//////////////////// ACTION: cancel button pressed

	wp.actionCloseDialog();

break;

case CmsMergePages.ACTION_CONFIRMED:
case CmsMergePages.ACTION_REPORT_BEGIN:
case CmsMergePages.ACTION_REPORT_UPDATE:
//////////////////// ACTION: clear history			
	
	boolean isValid = true;															
	if (wp.getAction() == CmsDialog.ACTION_CONFIRMED) {
		wp.validateParameters(cmsObject);
		errorMessage = wp.getErrorMessage();
		if (errorMessage.length()>0) {
			isValid = false;
		}
	}

	if (isValid) {
		wp.actionReport();
		break;
	}



//////////////////// ACTION: show start dialog
case CmsMergePages.ACTION_DEFAULT:
default:

//////////////////// ACTION: show merge pages dialog (default)

	wp.setParamAction(CmsDialog.DIALOG_CONFIRMED);

%><%= wp.htmlStart(null) %>
<%= wp.bodyStart("dialog", "onunload=\"top.closeTreeWin();\"") %>

<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.getParamTitle()) %>

<%= wp.dialogBlockStart(null) %>
<%= wp.key( org.opencms.workplace.tools.content.Messages.GUI_INPUT_MERGEPAGES_INFO_0) %><br>
<%= wp.dialogBlockEnd() %>
<%= wp.dialogSpacer() %>

<form name="main" action="<%= wp.getDialogUri() %>" method="post" class="nomargin" onsubmit="return submitAction('<%= wp.DIALOG_OK %>', null, 'main');">
<input type="hidden" name="action" value="<%=wp.getParamAction()%>">
<input type="hidden" name="reportcontinuekey" value="">
<input type="hidden" name="framename" value="admin_content">
<input type="hidden" name="title" value="<%=wp.getParamTitle()%>">
<input type="hidden" name="dialogtype" value="<%=wp.DIALOG_TYPE%>">
<input type="hidden" name="threadhasnext" value="">
<input type="hidden" name="reporttype" value="extended">

<input type="hidden" name="<%= CmsDialog.PARAM_FRAMENAME %>" value="admin_content">

<% if(errorMessage.length()>0) { %>
<%= wp.dialogBlockStart(null) %>
<table border="0" cellpadding="4" cellspacing="0">
	<tr>
		<td style="vertical-align: middle;"><img src="<%=wp.getSkinUri() %>commons/error.png" border="0"></td>
		<td style="vertical-align: middle;"><%= errorMessage %></td> 
	</tr> 
</table>
<%= wp.dialogBlockEnd() %>
<% } %>

<table border="0" width="100%">
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_MERGEPAGES_FOLDER1_0)%></td>
	<td class="maxwidth"><input name="<%= wp.PARAM_FOLDER1 %>" type="text" value="<%=wp.getParamFolder1()==null?"":wp.getParamFolder1()%>" class="maxwidth" style="width: 99%"></td>
	<td><%=wp.button("javascript:top.openTreeWin('param_folder1', true, 'main', '"+wp.PARAM_FOLDER1+"', document);", null, "folder", org.opencms.workplace.tools.content.Messages.GUI_BUTTON_SEARCH_0, 0)%></td>
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_MERGEPAGES_FOLDER2_0)%></td>
	<td class="maxwidth"><input name="<%= wp.PARAM_FOLDER2 %>" type="text" value="<%=wp.getParamFolder2()==null?"":wp.getParamFolder2()%>" class="maxwidth" style="width: 99%"></td>
	<td><%=wp.button("javascript:top.openTreeWin('param_folder2', true, 'main', '"+wp.PARAM_FOLDER2+"', document);", null, "folder", org.opencms.workplace.tools.content.Messages.GUI_BUTTON_SEARCH_0, 0)%></td>
</tr>

</table>

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