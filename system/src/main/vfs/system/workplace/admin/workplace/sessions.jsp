<%@ page import="org.opencms.workplace.tools.workplace.broadcast.*" %><% 

    CmsSessionsList wp = new CmsSessionsList(pageContext, request, response);
    wp.displayDialog();
%>