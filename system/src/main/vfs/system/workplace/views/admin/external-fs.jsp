<%@ page session="false" import="
	org.opencms.jsp.*,
	org.opencms.workplace.administration.*,
	org.opencms.workplace.tools.*
"%><%

	CmsJspActionElement jsp = new CmsJspActionElement(pageContext, request, response);
	CmsAdminFrameset wp = new CmsAdminFrameset(jsp);

%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
   <head>
      <meta http-equiv="content-type" content="text/html; charset=<%= wp.getEncoding() %>">
      <title>External Administration View</title>
   </head>

   <frameset rows="24,*,24" border="0" frameborder="0" framespacing="0">
      <frame <%= wp.getFrameSource("admin_head", jsp.link("admin-close.jsp") + "?" + wp.allParamsAsRequest()) %> noresize scrolling="no">
<%  if (!wp.withMenu()) { %>
         <frame <%= wp.getFrameSource("admin_content", jsp.link("admin-main.jsp") + "?" + wp.allParamsAsRequest()) %> noresize scrolling="no">
<%  } else { %>
	<frameset cols="212,*" border="0" frameborder="0" framespacing="0">
		<frame <%= wp.getFrameSource("admin_menu", jsp.link("admin-menu.jsp") + "?" + wp.allParamsAsRequest()) %> frameborder="0" border="0" noresize scrolling="auto">
		<frame <%= wp.getFrameSource("admin_content", jsp.link(CmsToolManager.VIEW_JSPPAGE_LOCATION) + "?" + wp.allParamsAsRequest()) %> frameborder="0" border="0" framespacing="0" marginheight="7" marginwidth="7" noresize scrolling="auto">
	</frameset>
<%  } %>
      <frame <%= wp.getFrameSource("admin_foot", jsp.link("/system/workplace/views/top_foot.jsp")) %> noresize scrolling="no">
   </frameset>
</html>