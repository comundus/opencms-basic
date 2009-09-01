<%@ page import="org.opencms.workplace.tools.accounts.*"  %><%

	// initialize info dialog
	CmsRoleOverviewDialog wpInfo = new CmsRoleOverviewDialog(pageContext, request, response);
	// perform the widget actions
	wpInfo.displayDialog(true);
	if (wpInfo.isForwarded()) {
		return;
	}
	// initialize list dialogs
	
	
	CmsRoleUsersList wpRoleUsers = new CmsRoleUsersList(pageContext, request, response);
	CmsNotRoleUsersList wpNotRoleUsers = new CmsNotRoleUsersList(pageContext, request, response);
	org.opencms.workplace.list.CmsTwoListsDialogsWOStart wpTwoLists = new org.opencms.workplace.list.CmsTwoListsDialogsWOStart(wpRoleUsers, wpNotRoleUsers);

	// perform the active list actions
	wpTwoLists.displayDialog(true);

	// write the content of widget dialog
	wpInfo.writeDialog();

	// write the content of list dialogs	
	wpTwoLists.writeDialog();   
%>
