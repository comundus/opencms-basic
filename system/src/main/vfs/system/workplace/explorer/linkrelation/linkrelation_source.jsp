<%@ page import="org.opencms.workplace.commons.CmsResourceLinkRelationList" %><%	
%><%@ page import="org.opencms.jsp.CmsJspActionElement" %><%	
%><%@ page import="org.opencms.workplace.commons.CmsResourceInfoDialog" %><%	
	// initialize the widget dialog
	CmsResourceInfoDialog wpWidget = new CmsResourceInfoDialog(pageContext, request, response);
	// perform the widget actions   
	wpWidget.displayDialog(true);
	if (wpWidget.isForwarded()) {
		return;
	}
	// initialize the list dialog
	CmsResourceLinkRelationList wpList = new CmsResourceLinkRelationList(new CmsJspActionElement(pageContext, request, response), false);
	// perform the list actions 
	wpList.displayDialog(true);
	if (wpList.isForwarded()) {
		return;
	}
	// write the content of widget dialog
	wpWidget.writeDialog();
	// write the content of list dialog
	wpList.writeDialog();
%>