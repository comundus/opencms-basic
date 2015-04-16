<%@ page import="
	org.opencms.workplace.*,
	org.opencms.jsp.*
"%><%

    CmsJspActionElement jsp = new CmsJspActionElement(pageContext, request, response);
    CmsDialog wp = new CmsDialog(jsp);
    
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">

<html>
  <head>
    <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=<%= wp.getEncoding() %>">
    <title><%= wp.key("label.wptitle") %> <%= wp.getSettings().getUser().getName() %>@<%= request.getServerName() %></title>
  </head>
  
  <frameset rows="57,*" border="0" frameborder="0" framespacing="0">
    <frame <%= wp.getFrameSource("tool_title", jsp.link("tool-title.jsp") + "?" + wp.allParamsAsRequest()) %> frameborder="0" border="0" noresize scrolling="no">
    <frame <%= wp.getFrameSource("tool_content", jsp.link(wp.getAdminTool().getHandler().getLink()) + "?" + wp.allParamsAsRequest()) %> frameborder="0" border="0" framespacing="0" marginheight="7" marginwidth="7" noresize scrolling="auto">
  </frameset>
</html>
