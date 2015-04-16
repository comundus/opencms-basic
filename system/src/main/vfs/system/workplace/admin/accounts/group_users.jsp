<%@ page import="org.opencms.workplace.tools.accounts.*"  %><%@page import="org.opencms.main.*" %><%

	// initialize info dialog
	CmsGroupOverviewDialog wpInfo = new CmsGroupOverviewDialog(pageContext, request, response);
	// perform the widget actions
	wpInfo.displayDialog(true);
	if (wpInfo.isForwarded()) {
		return;
	}
	// initialize list dialogs
	CmsGroupUsersList wpGroupUsers = new CmsGroupUsersList(pageContext, request, response, OpenCms.getWorkplaceManager().supportsLazyUserLists());
	CmsNotGroupUsersList wpNotGroupUsers = new CmsNotGroupUsersList(pageContext, request, response, OpenCms.getWorkplaceManager().supportsLazyUserLists());
	org.opencms.workplace.list.CmsTwoListsDialogsWOStart wpTwoLists = new org.opencms.workplace.list.CmsTwoListsDialogsWOStart(wpGroupUsers, wpNotGroupUsers);
	// perform the active list actions
	wpTwoLists.displayDialog(true);
	// write the content of widget dialog
	wpInfo.writeDialog();
	// write the content of list dialogs
	wpTwoLists.writeDialog();   
%>