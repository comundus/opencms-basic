<%@ page import="org.opencms.workplace.commons.*" %><%	

	// initialize the workplace class
	CmsCopy wp = new CmsCopy(pageContext, request, response);
	
//////////////////// start of switch statement 
	
switch (wp.getAction()) {

case CmsCopy.ACTION_CANCEL:
//////////////////// ACTION: cancel button pressed

	wp.actionCloseDialog();

break;


case CmsCopy.ACTION_COPY:
case CmsCopy.ACTION_CONFIRMED:		
case CmsCopy.ACTION_WAIT:

//////////////////// ACTION: main copy action (with optional confirm / wait screen)

	wp.actionCopy();

break;


case CmsCopy.ACTION_DEFAULT:
default:

//////////////////// ACTION: show copy dialog (default)

	wp.setParamAction("copy");

%><%= wp.htmlStart("help.explorer.contextmenu.copy") %>
<%= wp.bodyStart("dialog", "onunload=\"top.closeTreeWin();\"") %>

<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.getParamTitle()) %><%
boolean includeFiles = true;
if (wp.isMultiOperation()) { 
	includeFiles = false; %>
	<%@ include file="includes/multiresourcelist.txt" %><%
} else { %>
	<%@ include file="includes/resourceinfo.txt" %><%
} %>

<form name="main" action="<%= wp.getDialogUri() %>" method="post" class="nomargin" onsubmit="return submitAction('<%= wp.DIALOG_OK %>', null, 'main');">

<%= wp.paramsAsHidden() %>
<input type="hidden" name="<%= wp.PARAM_FRAMENAME %>" value="">

<%= wp.dialogSpacer() %>
<%= wp.buildRadioCopyMode() %>
<%= wp.dialogSpacer() %>

<table border="0" width="100%">
<tr>
	<td style="white-space: nowrap;" unselectable="on"><%= wp.key(Messages.GUI_COPY_TO_0) %></td>
	<td class="maxwidth"><input name="<%= wp.PARAM_TARGET %>" type="text" value="" class="maxwidth"></td>
	<td><input name="selectfolder" type="button" value="<%= wp.key(Messages.GUI_LABEL_SEARCH_0) %>" onClick="top.openTreeWin('copy', <%= includeFiles %>);" class="dialogbutton" style="min-width: 60px;">
</tr>
<%--
<tr>
	<td colspan="2" style="white-space: nowrap;" unselectable="on"><input name="<%= wp.PARAM_KEEPRIGHTS %>" type="checkbox" value="true">&nbsp;<%= wp.key(Messages.GUI_COPY_KEEP_PERMISSIONS_0) %></td>    
</tr>
--%>
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