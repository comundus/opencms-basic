<%@ page import="org.opencms.workplace.tools.content.check.*" %><% 

    CmsContentCheckFilesDialog wp = new CmsContentCheckFilesDialog(pageContext, request, response);
    wp.displayDialog();
%>