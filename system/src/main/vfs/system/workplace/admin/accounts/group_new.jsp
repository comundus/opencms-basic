<%@ page import="org.opencms.workplace.tools.accounts.*"%><%

	// initialize the workplace class
	CmsEditGroupDialog wp = new CmsEditGroupDialog(pageContext, request, response);
    // this class is used for editing groups too.  	
    wp.setOnlineHelpUriCustom("/accounts/groups/edit/");
	// perform the dialog action	
	wp.displayDialog();
%>