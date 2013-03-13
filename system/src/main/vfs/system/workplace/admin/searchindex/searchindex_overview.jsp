<%@ page import="org.opencms.jsp.CmsJspActionElement, org.opencms.workplace.tools.searchindex.*, org.opencms.workplace.CmsWidgetDialog, org.opencms.workplace.list.*" %>
<% 
  CmsJspActionElement actionElement = new CmsJspActionElement(pageContext, request, response);
  CmsWidgetDialog wpWidget = new CmsOverviewSearchIndexDialog(actionElement);

  // perform the widget actions   
  wpWidget.displayDialog(true);
  if (wpWidget.isForwarded()) {
    return;
  }
  A_CmsListDialog wpList = new CmsSearchIndexSourceList(actionElement);
      
  // perform the list actions 
  wpList.displayDialog(true);
  // write the content of widget dialog
  wpWidget.writeDialog();
  // write the content of list dialog
  wpList.writeDialog();
%>
