<%@ page session="false" import= "
	org.opencms.jsp.*, 
	org.opencms.workplace.galleries.*
"%><%	

	// initialize action element for link substitution
	CmsJspActionElement cms = new CmsJspActionElement(pageContext, request, response);
	
	// get gallery instance
	A_CmsGallery wp = A_CmsGallery.createInstance(cms);
	
 %><%= wp.htmlStart(null) %>

	<link rel="stylesheet" type="text/css" href="<%=wp.getCssPath()%>">		
	<script type="text/javascript">
	<!--
		function refresh() {
			try {
				var field_id = top.gallery_fs.gallery_head.document.list.<%= A_CmsGallery.PARAM_FIELDID %>.value;
				var dialogmode = top.gallery_fs.gallery_head.document.list.<%= A_CmsGallery.PARAM_DIALOGMODE %>.value;
				var previewUri = top.gallery_fs.gallery_head.previewUri;
				if (top.gallery_fs.gallery_head.action == "deleteResource") {
					top.preview_fs.gallery_buttonbar.location.href="<%=wp.getJsp().link("gallery_buttonbar.jsp")%>";
					top.preview_fs.gallery_preview.location.href="<%=wp.getJsp().link("gallery_preview.jsp")%>";
				}
				if (previewUri != null) {
			  		top.preview_fs.gallery_buttonbar.location.href="<%=wp.getJsp().link("gallery_buttonbar.jsp")%>?<%= A_CmsGallery.PARAM_FIELDID %>="+field_id+"&<%= A_CmsGallery.PARAM_DIALOGMODE %>="+dialogmode+"&resourcepath="+previewUri;
			  		top.preview_fs.gallery_preview.location.href="<%=wp.getJsp().link("gallery_preview.jsp")%>?resourcepath="+previewUri;
				}
			} catch(e) {

			}
		}
		
		function preview(uri) {
			top.gallery_fs.gallery_head.previewUri = uri;
			var dialogmode = top.gallery_fs.gallery_head.document.forms['list'].<%= A_CmsGallery.PARAM_DIALOGMODE %>.value;
			top.preview_fs.gallery_buttonbar.location.href="<%=wp.getJsp().link("gallery_buttonbar.jsp")%>?<%= A_CmsGallery.PARAM_FIELDID %>=<%= wp.getParamFieldId() %>&<%= A_CmsGallery.PARAM_DIALOGMODE %>="+dialogmode+"&resourcepath="+uri;
			top.preview_fs.gallery_preview.location.href="<%=wp.getJsp().link("gallery_preview.jsp")%>?resourcepath="+uri;					
		}												
	//-->
	</script>
</head>

<body class="dialog" unselectable="on" onload="refresh();">
<%= wp.buildGalleryItems() %>
</body>
<%= wp.htmlEnd() %>