<%@ page import="
	org.opencms.util.*,
	org.opencms.workplace.*,
	org.opencms.workplace.editors.*,
	com.bayer.copylanguage.*
"%><%	

	// initialize the workplace class
	CmsDialogCopyLanguage wp = new CmsDialogCopyLanguage(pageContext, request, response);
	
//////////////////// start of switch statement 
	
switch (wp.getAction()) {

case CmsDialogCopyLanguage.ACTION_UPDATE_LANGUAGES:

//////////////////// ACTION: copy the values of the current language to the selected languages

	wp.actionUpdateLanguages();
			// this.elemName = "<= wp.getChangeElement() >";
			// this.elemLocale = "<= wp.getElementLocale() >";
%>

	<html><head>
	<script type="text/javascript">
		function closeAction() {
			window.opener.parent.frames[0].location.reload();
			window.close();
			
		}
		var closeObj = new closeAction();
		if (window.opener.popupCloseAction) {
			window.opener.popupCloseAction(closeObj);
		}
		window.close();
	</script>
	</head></html>

<%
break;

case CmsDialog.ACTION_DEFAULT:
default:

//////////////////// ACTION: show initial template dialog (default)

	wp.setParamAction(CmsDialogCopyLanguage.DIALOG_UPDATE_LANGUAGES);

%><%= wp.htmlStart(null, wp.key(org.opencms.workplace.editors.Messages.GUI_EDITOR_DIALOG_COPYLANGUAGE_TITLE_0)) %>
<script type="text/javascript">
<!--

function resizeWindow() {
	var wantedHeight = document.body.offsetHeight + 20;
	if (wantedHeight > screen.availHeight) {
		wantedHeight = screen.availHeight;
	}
	window.resizeTo(document.body.offsetWidth + 10, wantedHeight);
}

var elems = new Array();

function registerElement(elemName, isEnabled) {
	var i = elems.length; 
	elems[i] = new Object();
	elems[i]["name"] = elemName;
	elems[i]["enabled"] = isEnabled;
}

//-->
</script>
<%= wp.bodyStart("dialog") %>

<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.getParamTitle()) %>

<form name="main" action="<%= wp.getDialogUri() %>" method="post" class="nomargin" onsubmit="return submitAction('<%= CmsDialog.DIALOG_OK %>', null, 'main');">

<%= wp.paramsAsHidden() %>
<input type="hidden" name="<%= CmsDialog.PARAM_FRAMENAME %>" value="">

<p><%= wp.key(org.opencms.workplace.editors.Messages.GUI_EDITOR_DIALOG_COPYLANGUAGE_HEADLINE_1, new Object[]{wp.getElementLocale().getDisplayName(wp.getLocale())})%></p>
<%= wp.buildLanguageList() %>
<p><%= wp.key(org.opencms.workplace.editors.Messages.GUI_EDITOR_DIALOG_COPYLANGUAGE_WARNING_0) %></p>
<%= wp.dialogContentEnd() %>
<%= wp.dialogButtonsOkCancel(null, " onclick=\"window.close()\"") %>

</form>

<%= wp.dialogEnd() %>
<%= wp.bodyEnd() %>
<%
if (Boolean.valueOf(wp.getParamIsPopup()).booleanValue()) {
    // this is a popup window
	%><script type="text/javascript">
<!--
resizeWindow();
//-->
</script>
<%
} 
%>
<%= wp.htmlEnd() %>
<%
} 
//////////////////// end of switch statement 
%>