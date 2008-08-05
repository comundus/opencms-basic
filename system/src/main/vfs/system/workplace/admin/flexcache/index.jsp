<%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %><%@ page import="
	org.opencms.i18n.*,
	org.opencms.cache.*,
	org.opencms.flex.*,
	org.opencms.main.*,
	org.opencms.workplace.CmsDialog,
	org.opencms.jsp.CmsJspActionElement,
	java.util.*"  
%><%
	CmsJspActionElement jsp = new CmsJspActionElement(pageContext, request, response);
	CmsDialog wp = new CmsDialog(jsp);
	// Added functionality to use localized message bundles 
	((CmsMultiMessages)wp.getMessages()).addMessages(org.opencms.workplace.tools.cache.Messages.get().getBundle(wp.getLocale()));
        
	if (wp.getAction()==CmsDialog.ACTION_CANCEL) {
		/////////////////// ACTION: cancel button pressed: redirect to closelink
		wp.actionCloseDialog();
		return;
	}        
%>
<%= wp.htmlStart("administration/index.html") %>
<%= wp.bodyStart(null) %>

<%= wp.dialogStart() %>
<%= wp.dialogContentStart(wp.key("flexcache.admin.heading")) %>
<%
    int sizeEntries = 0;
    int sizeKeys = 0;
    CmsFlexCache cache = null;
    org.opencms.file.CmsObject cms = null;
    int maxCacheByteSize = 0;
    int avgCacheByteSize = 0;
    int currentCacheByteSize = 0;
    CmsLruCache entryLruCache = null;
    
    out = pageContext.getOut();
	
    CmsFlexController controller = (CmsFlexController)request.getAttribute(CmsFlexController.ATTRIBUTE_NAME);

    cache = controller.getCmsCache();
    cms = wp.getCms();
    
    // get the label texts for the submit buttons
    String label_1 = wp.key("flexcache.admin.label1");
    String label_2 = wp.key("flexcache.admin.label2");
    String label_5 = wp.key("flexcache.admin.label5");
    String label_6 = wp.key("flexcache.admin.label6");
    String label_7 = wp.key("flexcache.admin.label7");
    String label_8 = wp.key("flexcache.admin.label8");
    String label_9 = wp.key("flexcache.admin.label9");
    String label_3 = wp.key("flexcache.admin.label3");
    String label_4 = wp.key("flexcache.admin.label4");
    String label_10 = wp.key("flexcache.admin.label10");
	
    String action = CmsEncoder.decode(request.getParameter("action"));

    if (action != null) {
        if (label_1.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_ENTRIES))));
        } else if (label_2.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_ALL))));
        } else if (label_6.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_ONLINE_ALL))));
        } else if (label_5.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_ONLINE_ENTRIES))));
        } else if (label_8.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_OFFLINE_ALL))));
        } else if (label_7.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_OFFLINE_ENTRIES))));
        } else if (label_9.equals(action)) {
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_PURGE_JSP_REPOSITORY, new HashMap(0)));
            OpenCms.fireCmsEvent(new CmsEvent(I_CmsEventListener.EVENT_FLEX_CACHE_CLEAR, Collections.singletonMap("action", new Integer(CmsFlexCache.CLEAR_ENTRIES))));
        }
    }

    if (cache != null) {
        sizeEntries = cache.size();
        sizeKeys = cache.keySize();

        entryLruCache = cache.getEntryLruCache();

        if (entryLruCache!=null) {
            maxCacheByteSize = entryLruCache.getMaxCacheCosts();
            avgCacheByteSize = entryLruCache.getAvgCacheCosts();
            currentCacheByteSize = entryLruCache.getObjectCosts();
        }
    }
%>

<blockquote>

<table border="0" cellpadding="3" cellspacing="0">
<tr>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.variants_size") %></b></td>
	<td class="wizardbig" align="right"><font color="red"><b><%=sizeEntries%></b></font></td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.keys") %></b></td>
	<td class="wizardbig" align="right"><font color="red"><b><%=sizeKeys%></b></font></td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.variants_maxsize") %></b></td>
	<td class="wizardbig" align="right"><font color="red"><b><%=maxCacheByteSize%></b></font></td>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.bytes") %></b></td>
</tr>
<tr>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.variants_avgsize") %></b></td>
	<td class="wizardbig" align="right"><font color="red"><b><%=avgCacheByteSize%></b></font></td>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.bytes") %></b></td>
</tr>
<tr>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.variants_cursize") %></b></td>
	<td class="wizardbig" align="right"><font color="red"><b><%=currentCacheByteSize%></b></font></td>
	<td class="wizardbig"><b><%= wp.key("flexcache.admin.bytes") %></b></td>
</tr>
</table>

</blockquote>

<form id="cache1" action="<%=wp.getDialogUri()%>" method="POST" >
<table border="0" cellpadding="3" cellspacing="0">
<tr>
    <td><input type="submit" name="action" value="<%= label_10 %>"></td>
</tr>
</table>
</form>


<h2><%= wp.key("flexcache.admin.clear_options") %></h2>

<form id="cache2" action="<%=wp.getDialogUri()%>" method="POST" >
<table border="0" cellpadding="3" cellspacing="0">
<tr>
	<td><input type="submit" name="action" value="<%= label_1 %>"></td>
	<td><input type="submit" name="action" value="<%= label_2 %>"></td>
</tr>
</table>
<%
    if (cache.cacheOffline()) {
%>
<h3><%= wp.key("flexcache.admin.clear_options2") %></h3>
<table border="0" cellpadding="3" cellspacing="0">
<tr>
	<td><b><%= wp.key("flexcache.admin.online") %></b> <%= wp.key("flexcache.admin.cache") %></td>
	<td><b><%= wp.key("flexcache.admin.offline") %></b> <%= wp.key("flexcache.admin.cache") %></td>
</tr>
<tr>
	<td><input type="submit" name="action" value="<%= label_5 %>"></td>
	<td><input type="submit" name="action" value="<%= label_7 %>"></td>
</tr><tr>
	<td><input type="submit" name="action" value="<%= label_6 %>"></td>
	<td><input type="submit" name="action" value="<%= label_8 %>"></td>
</tr>

</table>
<%
    }
%>

<h2><%= wp.key("flexcache.admin.jsp_options") %></h2>

<table border="0" cellpadding="3" cellspacing="0">
<tr>
    <td><input type="submit" name="action" value="<%= label_9 %>"></td>
</tr>
</table>

<h2><%= wp.key("flexcache.admin.cached_resources") %></h2>

<table border="0" cellpadding="3" cellspacing="0">
<tr>
    <td><input type="submit" name="action" value="<%= label_3 %>"></td>
    <td><input type="submit" name="action" value="<%= label_4 %>"></td>
</tr>
</table>
</form>

<%
    if ((action != null) && (cache != null)) {
        if (label_3.equals(action) || label_4.equals(action)) {

            boolean showall = false;
            if (label_4.equals(action)) {
                showall = true;
                out.write("<h1>"+wp.key("flexcache.admin.cached_keys_variants")+"</h1>");
            } else {
                out.write("<h1>"+wp.key("flexcache.admin.cached_keys")+"</h1>");
            }

            Set set = cache.getCachedResources(cms);

            if (cache.cacheOffline()) {
                List online = new ArrayList();
                List offline = new ArrayList();
                Iterator i = set.iterator();
                while(i.hasNext()) {
                    String resource = (String)i.next();
                    if (resource.endsWith(CmsFlexCache.CACHE_OFFLINESUFFIX)) {
                        offline.add(resource);
                    } else {
                        online.add(resource);
                    }
                }
                Collections.sort(offline);
                Collections.sort(online);

                out.write("<h2>"+wp.key("flexcache.admin.online")+"</h2>");
                i = online.iterator();
                while(i.hasNext()) {
                    String resource = (String)i.next();
                    out.write(wp.key("flexcache.admin.resource")+": <b>" + resource + "</b> &nbsp; "+wp.key("flexcache.admin.key")+": " + cache.getCachedKey(resource, cms) + "<br>");
                    if (showall) {
                        Set variations = cache.getCachedVariations(resource, cms);
                        if (variations.size() > 0) {
	                        List outlist = new ArrayList();
                            for(Iterator j = variations.iterator(); j.hasNext(); outlist.add(j.next())) {
                                // noop
                            }
                            Collections.sort(outlist);
                            Iterator s = outlist.iterator();
                            while (s.hasNext()) {
                                String v = (String)s.next();
                                out.write("&nbsp; &nbsp; &nbsp; &nbsp; "+wp.key("flexcache.admin.variant")+": " + v + "<br>");
                            }
                        }
                    }
                }
                if (online.size() == 0) out.write(wp.key("flexcache.admin.err_online"));

                out.write("<h2>"+wp.key("flexcache.admin.offline")+"</h2>");
                i = offline.iterator();
                while(i.hasNext()) {
                    String resource = (String)i.next();
                    out.write(wp.key("flexcache.admin.resource")+": <b>" + resource + "</b> &nbsp; "+wp.key("flexcache.admin.key")+": " + cache.getCachedKey(resource, cms) + "<br>");
                    if (showall) {
                        Set variations = cache.getCachedVariations(resource, cms);
                        if (variations.size() > 0) {
	                        List outlist = new ArrayList();
                            for(Iterator j = variations.iterator(); j.hasNext(); outlist.add(j.next())) {
                                // noop
                            }
                            Collections.sort(outlist);
                            Iterator s = outlist.iterator();
                            while (s.hasNext()) {
                                String v = (String)s.next();
                                out.write("&nbsp; &nbsp; &nbsp; &nbsp; "+wp.key("flexcache.admin.variant")+": " + v + "<br>");
                            }
                        }
                    }
                }
                if (offline.size() == 0) out.write(wp.key("flexcache.admin.err_offline"));

            } else {
          		List online = new ArrayList();
          		online.addAll(set);
        		Collections.sort(online);
        		
                Iterator i = online.iterator();
                while(i.hasNext()) {
                    String resource = (String)i.next();
                    out.write(wp.key("flexcache.admin.resource")+": <b>" + resource + "</b> &nbsp; "+wp.key("flexcache.admin.key")+": " + cache.getCachedKey(resource, cms) + "<br>");
                    if (showall) {
                        Set variations = cache.getCachedVariations(resource, cms);
                        if (variations.size() > 0) {
	                        List outlist = new ArrayList();
                            for(Iterator j = variations.iterator(); j.hasNext(); outlist.add(j.next())) {
                                // noop
                            }
                            Collections.sort(outlist);
                            Iterator s = outlist.iterator();
                            while (s.hasNext()) {
                                String v = (String)s.next();
                                out.write("&nbsp; &nbsp; &nbsp; &nbsp; "+wp.key("flexcache.admin.variant")+": " + v + "<br>");
                            }
                        }
                    }
                }
                if (set.size() == 0) out.write(wp.key("flexcache.admin.err_empty"));
            }
        }
    }
%>

<%= wp.bodyEnd() %>
<%= wp.htmlEnd() %>
