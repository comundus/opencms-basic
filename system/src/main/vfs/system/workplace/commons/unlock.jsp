<%@ page import="org.opencms.workplace.*" %><%	

	// initialise the JSP action element
	org.opencms.jsp.CmsJspActionElement cms = new org.opencms.jsp.CmsJspActionElement(pageContext, request, response);
	
	// initialize the workplace class
	CmsDialogSelector wp = new CmsDialogSelector(cms, CmsDialogSelector.DIALOG_LOCK);
	
	cms.include(wp.getSelectedDialogUri(), null, request.getParameterMap());
	
%>