<%@ page import="org.opencms.workplace.tools.modules.CmsModulesList" %><% 

    CmsModulesList wp = new CmsModulesList(pageContext, request, response);
    wp.displayDialog();
%>
