<%@ page import="org.opencms.workplace.tools.accounts.*" %><%

	// initialize the widget dialog
	CmsUserOverviewDialog wpWidget = new CmsUserOverviewDialog(pageContext, request, response);
	// perform the widget actions   
	wpWidget.displayDialog(true);
	if (wpWidget.isForwarded()) {
		return;
	}
	// initialize the list dialog
	CmsShowUserGroupsList wpList = new CmsShowUserGroupsList(wpWidget.getJsp());

	CmsShowUserRolesList wpRolesList = new CmsShowUserRolesList(wpWidget.getJsp());
	// perform the list actions 
	wpList.displayDialog(true);
	wpRolesList.displayDialog(true);
	// write the content of widget dialog
	wpWidget.writeDialog();
	// write the content of list dialog
	wpList.writeDialog();
	wpRolesList.writeDialog();
%>