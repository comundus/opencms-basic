<%@ page import="org.opencms.workplace.tools.modules.CmsExportpointsList" %><% 

    CmsExportpointsList wp = new CmsExportpointsList(pageContext, request, response);
    wp.displayDialog();
%>
