<%@ page import="org.opencms.workplace.tools.accounts.*" %><%@page import="org.opencms.main.*" %><%

	// initialize the widget dialog
	CmsGroupOverviewDialog wpWidget = new CmsGroupOverviewDialog(pageContext, request, response);
	// perform the widget actions   
	wpWidget.displayDialog(true);
	if (wpWidget.isForwarded()) {
		return;
	}
	// initialize the list dialog
	CmsShowGroupUsersList wpList = new CmsShowGroupUsersList(wpWidget.getJsp(),OpenCms.getWorkplaceManager().supportsLazyUserLists());
	// perform the list actions 
	wpList.displayDialog(true);
	// write the content of widget dialog
	wpWidget.writeDialog();
	// write the content of list dialog
	wpList.writeDialog();
%>