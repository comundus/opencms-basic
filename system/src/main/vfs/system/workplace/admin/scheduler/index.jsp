<%@ page import="org.opencms.workplace.tools.scheduler.CmsSchedulerList" %><% 

    CmsSchedulerList wp = new CmsSchedulerList(pageContext, request, response);
    wp.displayDialog();
%>
