<%@ page import="org.opencms.workplace.tools.modules.CmsModulesDependenciesList" %><% 

    CmsModulesDependenciesList wp = new CmsModulesDependenciesList(pageContext, request, response);
    wp.displayDialog();
%>
