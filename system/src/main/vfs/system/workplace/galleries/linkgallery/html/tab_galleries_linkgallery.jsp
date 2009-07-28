<div id="galleries">
	<div id="galleryfolders"><div class="head"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_HL_AVAILABLE_0) %></div><div id="galleryfolderlist"></div></div>
	<div id="galleryitems">
		<div id="gallerybuttons">
			<button type="button" id="gallerynewlinkbutton" onclick="$('#gallerynewlink').click();"><%= wp.key(Messages.GUI_LINKGALLERY_BUTTON_NEWLINK_0) %></button><a href="#" class="thickbox" id="gallerynewlink"></a>
			<button type="button" onclick="showGalleryFolders();"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_BUTTON_SHOW_0) %></button>
			<button type="button" id="gallerypublishbutton" onclick="$('#gallerypublishlink').click();" disabled="disabled"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_BUTTON_PUBLISH_0) %></button><a href="#" class="thickbox" id="gallerypublishlink"></a>
	
		</div>
		<!-- fillItems() -->
		<div id="galleryitemlist"><p></p></div>	
		<div id="galleryiteminfo">
			<table cellspacing="0" cellpadding="0" border="0">
				<tbody>
				<tr>					
					<td  style="width: 14%;" class="iteminfoheadline" >				
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_HEADLINE_0) %>
					</td>
					<td style="width: 45%;" class="iteminfoheadline">
						<button id="galleryitemselectbutton" onclick="setActiveItem(galleryItems.markedItem, 'gallery', false);" type="button" title="<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_SELECT_0) %>">
							<img src="<%= org.opencms.workplace.CmsWorkplace.getSkinUri() %>buttons/apply.png" />
						</button>
						<button id="galleryitempreviewbutton" onclick="openPreview(galleryItems.markedItem, 'gallery');" type="button" title="<%= wp.key(Messages.GUI_BUTTON_PREVIEW_0) %>">
							<img src="<%= org.opencms.workplace.CmsWorkplace.getSkinUri() %>buttons/preview.png" />
						</button> 
						<button id="galleryitempublishbutton" onclick="publishItem(galleryItems.markedItem, 'gallery');" type="button" title="<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_PUBLISH_0) %>">
							<img src="<%= org.opencms.workplace.CmsWorkplace.getSkinUri() %>buttons/publish.png" />
						</button>
						
					</td>
					<td style="width: 40%;" colspan="2"  class="iteminfostate" >
						<span id="galleryitemstate"></span>
					</td> 
				</tr>
				<tr>
					<td  style="width: 14%;" class="galleryiteminfotitle">
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_TITLE_0) %>
					</td>
					<td style="width: 85%;" class="galleryiteminfotitle" colspan="3" ><div id="galleryitemtitlewrapper"><div id="galleryitemtitle"></div></div></td>
				</tr>
				<tr>
					<td style="width: 14%;" class="galleryiteminfolinkurl">
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_LINKTO_0) %>
					</td>
					<td style="width: 85%;" class="galleryiteminfolinkurl" colspan="3" ><div id="galleryitemlinkurlwrapper"><div id="galleryitemlinkurl"></div></div></td>
				</tr>
				<%if (wp.isModeEditor()) { %>	
				<tr> 
						<td id="linktargetname" style="width: 14%;">
							<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_TARGET_0) %>
						</td>
						<td style="width: 26%" colspan="3" >
							<select name="linktarget" id="gallerylinktarget" size="1" >
  								<option value="_self"><%= wp.key(Messages.GUI_INPUT_LINKTARGETSELF_0) %></option>
  								<option value="_blank"><%= wp.key(Messages.GUI_INPUT_LINKTARGETBLANK_0) %></option>
  								<option value="_top"><%= wp.key(Messages.GUI_INPUT_LINKTARGETTOP_0) %></option>
							</select>
						</td>
					
				</tr>		
				<% } %>
				</tbody>
			</table>
			<div id="dialogbuttons">
			 	<button id="galleryokbutton" type="button" onclick="setActiveItem(galleryItems.markedItem, 'gallery', false);"><%= wp.key(Messages.GUI_GALLERY_BUTTON_OK_0) %></button>
				<button type="button" id="gallerycancelbutton" onclick="window.close();"><%= wp.key(Messages.GUI_GALLERY_BUTTON_CANCEL_0) %></button>
			</div>
		</div> 	
	</div>	
</div> 