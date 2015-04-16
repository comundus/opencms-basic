<%@ page import="org.opencms.workplace.tools.accounts.*" %><%     

	// initialize info dialog
	CmsUserOverviewDialog wpInfo = new CmsUserOverviewDialog(pageContext, request, response);
	// perform the widget actions 
	wpInfo.displayDialog(true);
	if (wpInfo.isForwarded()) {
		return;
	}
	// initialize list dialogs
	CmsUserGroupsList wpUserGroups = new CmsUserGroupsList(pageContext, request, response);
	CmsNotUserGroupsList wpNotUserGroups = new CmsNotUserGroupsList(pageContext, request, response);
	org.opencms.workplace.list.CmsTwoListsDialogsWOStart wpTwoLists = new org.opencms.workplace.list.CmsTwoListsDialogsWOStart(wpUserGroups, wpNotUserGroups);
	// perform the active list actions
	wpTwoLists.displayDialog(true);

	// write the content of widget dialog
	wpInfo.writeDialog();
	// write the content of list dialog
	wpTwoLists.writeDialog();   
%>