<%@ page import="org.opencms.jsp.*, org.opencms.util.*, org.opencms.workplace.galleries.*" session="false" %>
<%	
	
	// initialize action element for link substitution
	CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	
	A_CmsGallery wp = A_CmsGallery.createInstance(cms);
	
	String params = "?" + wp.paramsAsRequest();
	
 %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
	<title><%= wp.getKeyTitle() %></title>
	<script type="text/javascript">
	var cssPath = "";
	<%

	if (CmsStringUtil.isNotEmpty(wp.getParamCssPath())) {
		%>	cssPath = "<%= cms.link(wp.getParamCssPath()) %>";<%
	}

	%>
	</script>
</head>

<frameset rows="<%=wp.getHeadFrameSetHeight()%>,*" framespacing="0">
    <frame <%= wp.getFrameSource("gallery_fs", cms.link("gallery_fs_head.jsp" + params)) %> style="border-bottom: 1px solid Window;">
    <frame <%= wp.getFrameSource("preview_fs", cms.link("gallery_fs_preview.jsp" + params)) %> style="border-top: 1px solid Window;">    
</frameset>
</html>