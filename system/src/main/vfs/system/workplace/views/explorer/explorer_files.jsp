<%@ page import="
	org.opencms.workplace.*,
	org.opencms.workplace.explorer.*,
	org.opencms.jsp.*"
%><%
	CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	CmsExplorer wp = new CmsExplorer(cms);
	
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=<%= wp.getEncoding() %>">
<script type="text/javascript">
<%

if (request.getParameter("reload") != null) {
	CmsJspActionElement jsp = new CmsJspActionElement(pageContext, request, response);
	CmsFrameset wp2 = new CmsFrameset(jsp);
    // reload only the first time
	%>top.body.location.href = '<%=wp2.getStartupUri()%>';<%
}
	String files = wp.getFileList();
	// System.err.println(files);
	out.println(files);
%>
</script>
</head>

<body onload="initialize();">
</body>

</html>