<%@ page import="
    org.opencms.file.CmsPropertyDefinition,
    org.opencms.main.OpenCms,
	org.opencms.workplace.CmsDialog,
	org.opencms.workplace.commons.CmsSecure,
    org.opencms.workplace.commons.Messages
" %><%
        
        // initialize the workplace class
        CmsSecure wp = new CmsSecure(pageContext, request, response);
        boolean displayForm = true;

// perform the users submitted action

switch(wp.getAction()) {


case CmsSecure.ACTION_CHSECEXP:

//////////////////// ACTION: main change secure and export action

        wp.actionChangeSecureExport();
break;


case CmsDialog.ACTION_CANCEL:

//////////////////// ACTION: cancel button pressed

        wp.actionCloseDialog();

break;


case CmsDialog.ACTION_LOCKS_CONFIRMED:

//////////////////// ACTION: show security and export settings dialog (default)
wp.setParamAction("secure");

%>

<%= wp.htmlStart("help.explorer.contextmenu.secure") %>

<style type="text/css">
  #tablelabel {
    padding-right:20px;
    horizontal-align:middle;
  }

  table {
    border:0;
  }
</style>

<script type="text/javascript">

  // validate that the export/secure and internal property are  not checked at the same time
  // account for the fact that some inputs might not exist
  function checkNoIntern() {
    checkedExportOrSecure = false;
    if (document.secure.elements['secure'] !=null && document.secure.elements['secure'][0].checked) {
      checkedExportOrSecure = true;
    }
    if (document.secure.elements['export'] !=null && document.secure.elements['export'][0].checked) {
      checkedExportOrSecure = true;
    }
    if (document.secure.elements['intern'] != null && document.secure.elements['intern'].checked && checkedExportOrSecure) {
      alert("<%= wp.key(Messages.GUI_SECURE_EXPORTED_NOT_INTERN_0) %>");
      document.secure.elements['intern'].checked = false;
    }
  }

  function checkNoSecureNorExport() {

    if (document.secure.elements['intern'] != null && document.secure.elements['intern'].checked) {
      checkedExportOrSecure = true;
      if (document.secure.elements['secure'] !=null && document.secure.elements['secure'][0].checked) {
        checkedExportOrSecure = true;
        document.secure.elements['secure'][0].checked = false;
        document.secure.elements['secure'][1].checked = true;
      }
      if (document.secure.elements['export'] !=null && document.secure.elements['export'][0].checked) {
        checkedExportOrSecure = true;
        document.secure.elements['export'][0].checked = false;
        document.secure.elements['export'][1].checked = true;  
      }
      if (checkedExportOrSecure) {
        alert("<%= wp.key(Messages.GUI_SECURE_INTERN_NO_EXPORT_0) %>");
      }
    }

  }
</script>


  <%= wp.bodyStart("dialog") %>
  <%= wp.dialogStart() %>

  <form name="secure" class="nomargin" action="<%= wp.getDialogUri() %>" method="post" onsubmit="return submitAction('<%= CmsDialog.DIALOG_OK %>', null, 'secure');" id="secure">
  
    <%= wp.paramsAsHidden() %>

    <%= wp.dialogContentStart(wp.getParamTitle()) %>
    
    <input type="hidden" name="<%= CmsDialog.PARAM_FRAMENAME %>" value=""> 
    
    <%@ include file="includes/resourceinfo.txt" %>
    <%= wp.dialogSpacer() %>

    <%= wp.dialogBlockStart(wp.key(Messages.GUI_SECURE_ONLINE_ADDRESS_0)) %>
    <%= wp.getResourceUrl() %>
    <%= wp.dialogBlockEnd() %>
    <%= wp.dialogSpacer() %>

    <%= wp.dialogBlockStart(wp.key(Messages.GUI_SECURE_INTERN_SETTINGS_0)) %>
    <table>

      <tr>
      
      <% 
      // display secure dialog, if there exists a secure server for the current site
      if(OpenCms.getSiteManager().getCurrentSite(wp.getCms()).hasSecureServer()) { 
      %>

        <td style="white-space:nowrap;"><%= wp.key(Messages.GUI_SECURE_0) %>&nbsp;</td>
        <td>
          <%= wp.buildRadio(CmsPropertyDefinition.PROPERTY_SECURE) %>
        </td>

      <% } else { %>
        <td colspan="2">

          <%= wp.key(Messages.GUI_SECURE_NO_SERVER_0) %>

        </td>
      <% } %>
      </tr>


      <%  // folders can not be marked as intern
      if(!wp.resourceIsFolder()) { %>
      
      <tr>
        <td style="white-space:nowrap;"><%= wp.key(Messages.GUI_PERMISSION_INTERNAL_0) %>&nbsp;</td>
        <td class="maxwidth" style="padding-left: 5px;">
          <input type="checkbox" id="intern" name="intern" value="true" style="text-align:left" onclick="checkNoSecureNorExport()" <%= Boolean.valueOf(wp.readInternProp()).booleanValue() ? "checked=\"checked\"" : "" %>>
          </td>
         
      </tr>
      
    <% } %>      

    </table>

    <%= wp.dialogBlockEnd() %>

    <% 
       // display export-part of the dialog only if export is enabled
       if(OpenCms.getStaticExportManager().isStaticExportEnabled() && wp.showExportSettings()) { 
    %>
	
    <%= wp.dialogSpacer() %>
    <%= wp.dialogBlockStart(wp.key(Messages.GUI_SECURE_EXPORT_SETTINGS_0)) %>

    <table border="0">

    <%  if (wp.exportUserHasReadPermission()) { %>
      <tr>
        <td style="white-space:nowrap;"><%= wp.key(Messages.GUI_SECURE_EXPORT_0) %>&nbsp;</td>
        <td>
          <%= wp.buildRadio(CmsPropertyDefinition.PROPERTY_EXPORT) %>
        </td>
      </tr>
    <% } else { %>
      <%= wp.key(Messages.GUI_SECURE_EXPORTUSER_NO_PERMISSION_0) %>
    <% } if(wp.resourceIsFolder()) { %>
      <tr>
        <td style="white-space:nowrap;"><%= wp.key(Messages.GUI_SECURE_EXPORTNAME_0) %>&nbsp;</td>

        <td class="maxwidth" style="padding-left: 5px;">
          <input type="text" id="exportname" name="exportname" class="maxwidth" value="<%= wp.readProperty(CmsPropertyDefinition.PROPERTY_EXPORTNAME) %>">
        </td>
      </tr>
      <% } %>

    </table>

    <%= wp.dialogBlockEnd() %>

    <% } %>

    <%= wp.dialogContentEnd() %> 
    <%= wp.dialogButtonsOkCancel() %></p>

    </form>

    <%= wp.dialogEnd() %>
    <%= wp.bodyEnd() %>
    <%= wp.htmlEnd() %>

<% 
   break;

case CmsDialog.ACTION_DEFAULT:
default:
%>
<%= wp.buildLockDialog() %>
<% } 
//////////////////// end of switch statement 
%>
