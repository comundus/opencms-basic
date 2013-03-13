<%@ page import = "
	org.opencms.jsp.CmsJspActionElement,
  	org.opencms.file.CmsObject,
	java.util.*,
	org.opencms.workplace.*,
	org.opencms.workplace.commons.*,
	org.opencms.workplace.editors.CmsDialogElements,				 											 							 
	org.opencms.workplace.tools.content.*
"%><%

	// initialize the CmsElementRename class
	CmsElementRename wp = new CmsElementRename(pageContext, request, response);
	
	String errorMessage = "";	
	//////////////////// start of switch statement 
	
switch (wp.getAction()) {

case CmsElementRename.ACTION_CANCEL:
case CmsElementRename.ACTION_REPORT_END:
//////////////////// ACTION: cancel button pressed

	wp.actionCloseDialog();

break;

case CmsElementRename.ACTION_CONFIRMED:
case CmsElementRename.ACTION_REPORT_BEGIN:
case CmsElementRename.ACTION_REPORT_UPDATE:
//////////////////// ACTION: clear history			
	
	boolean isValid = true;															
	if (wp.getAction() == CmsDialog.ACTION_CONFIRMED) {
		wp.validateParameters();
		errorMessage = wp.getErrorMessage();
		if (errorMessage.length()>0) {
			isValid = false;
		}
	}

	if (isValid) {
		wp.actionReport();
		break;
	}
					
	// wp.validateParameters();
	// errorMessage = wp.getErrorMessage();
	
	// if (errorMessage.length()==0) {
		// wp.actionReport();
		// break;
	// }


//////////////////// ACTION: show start dialog
case CmsElementRename.ACTION_DEFAULT:
default:

//////////////////// ACTION: show element rename dialog (default)

	wp.setParamAction(CmsDialog.DIALOG_CONFIRMED);

%><%= wp.htmlStart(null) %>
<%= wp.bodyStart("dialog", "onunload=\"top.closeTreeWin();\"") %>

<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.getParamTitle()) %>

<%= wp.dialogBlockStart(null) %>
<%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_RENAMEELEMENT_INFO_0) %><br>
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
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_RENAMEELEMENT_RESOURCE_0) %></td>
	<td class="maxwidth"><input name="<%= wp.PARAM_RESOURCE %>" type="text" value="<%=wp.getParamResource()==null?"":wp.getParamResource()%>" class="maxwidth" style="width: 99%"></td>
	<td><%=wp.button("javascript:top.openTreeWin('param_resource', true, 'main', '"+wp.PARAM_RESOURCE+"', document);", null, "folder", org.opencms.workplace.tools.content.Messages.GUI_BUTTON_SEARCH_0, 0)%></td>
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_RENAMEELEMENT_RECURSIVE_0) %></td>
	<td colspan="2" class="maxwidth"><input name="<%= wp.PARAM_RECURSIVE %>" type="checkbox" value="true"<%="true".equals(wp.getParamRecursive())?" checked":""%>></td>    
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_TEMPLATE_0) %></td>
	<td colspan="2" class="maxwidth"><%= wp.buildSelectTemplates("name=\"" + wp.PARAM_TEMPLATE + "\" size=\"1\"") %></td>
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_LANG_0) %></td>
	<td colspan="2" class="maxwidth"><%= wp.buildSelectLocales("name=\"" + wp.PARAM_LOCALE + "\" size=\"1\"") %></td>
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_RENAMEELEMENT_OLDVALUE_0) %></td>
	<td colspan="2" class="maxwidth"><input name="<%= wp.PARAM_OLD_ELEMENT %>" type="text" value="<%=wp.getParamOldElement()==null?"":wp.getParamOldElement()%>" class="maxwidth" style="width: 99%"></td>
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_RENAMEELEMENT_NEWVALUE_0) %></td>
	<td colspan="2" class="maxwidth"><input name="<%= wp.PARAM_NEW_ELEMENT %>" type="text" value="<%=wp.getParamNewElement()==null?"":wp.getParamNewElement()%>" class="maxwidth" style="width: 99%"></td>
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_RENAMEELEMENT_VALIDATENEWELEMENT_0)  %></td>
	<td colspan="2" class="maxwidth"><input name="<%= wp.PARAM_VALIDATE_NEW_ELEMENT %>" type="checkbox" value="true"<%="true".equals(wp.getParamValidateNewElement()) || wp.getParamValidateNewElement() == null?" checked":""%>></td>    
</tr>
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(org.opencms.workplace.tools.content.Messages.GUI_INPUT_RENAMEELEMENT_REMOVEEMPTYELEMENTS_0) %></td>
	<td colspan="2" class="maxwidth"><input name="<%= wp.PARAM_REMOVE_EMPTYELEMENTS %>" type="checkbox" value="true"<%="true".equals(wp.getParamRemoveEmptyElements())?" checked":""%>></td>    
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