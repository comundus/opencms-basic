<%@ page import="
	org.opencms.workplace.tools.searchindex.*,
	org.opencms.workplace.CmsWidgetDialog,
	org.opencms.workplace.list.*
"%><%     
	// initialize index view
    CmsWidgetDialog wp = new CmsOverviewSearchIndexDialog(pageContext, request, response);
	// perform the widget actions
	wp.displayDialog(true);
	if (wp.isForwarded()) {
		return;
	}
	// initialize list dialogs
	A_CmsListDialog wpAddSource = new CmsSearchIndexSourceAddList(pageContext, request, response);
	A_CmsListDialog wpRemoveSource = new CmsSearchIndexSourceRemoveList(pageContext, request, response);
	// the double-list
        CmsTwoListsDialogsWOStart wpTwoLists = new CmsTwoListsDialogsWOStart(wpRemoveSource, wpAddSource);
	// perform the active list actions
	wpTwoLists.displayDialog(true);
	// write the content of widget dialog
	wp.writeDialog();
	// write the content of list dialogs
	wpTwoLists.writeDialog();   
%>