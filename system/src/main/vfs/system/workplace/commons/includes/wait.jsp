<%@ page import="
	org.opencms.workplace.*
" %><%
	
	// get workplace class from request attribute
	CmsDialog wp = CmsDialog.initCmsDialog(pageContext, request, response);
	wp.setParamAction(CmsDialog.DIALOG_WAIT);

%><%= wp.htmlStart() %>

<script language="JavaScript">
function submitForm() {
	if (true == <%= wp.isSubElement() %>) {
		document.forms["main"].submit();
	}
}
</script>

<%= wp.bodyStart("dialog", "onload='submitForm();'") %>

<table border="0" cellpadding="0" cellspacing="0" align="center" style="margin-top: 100px;">
<tr>
	<td style="font-size: 14px;"><%= wp.key(org.opencms.workplace.commons.Messages.GUI_MESSAGE_WAIT_0)%></td>
</tr>
</table>

<form name="main" action="<%= wp.getDialogUri() %>" method="post">
<%= wp.paramsAsHidden() %>
</form>

<%= wp.bodyEnd() %>
<%= wp.htmlEnd() %>