<%@ page import="org.opencms.workplace.tools.projects.*" %><% 

    CmsProjectsList wp = new CmsProjectsList(pageContext, request, response);
    wp.displayDialog();
%>