<%@ page import="org.opencms.workplace.tools.accounts.CmsUsersList" %><% 

    CmsUsersList wp = new CmsUsersList(pageContext, request, response);
    wp.displayDialog();
%>