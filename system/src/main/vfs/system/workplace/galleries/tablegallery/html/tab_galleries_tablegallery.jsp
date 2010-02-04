<div id="galleries">
	<div id="galleryfolders"><div class="head"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_HL_AVAILABLE_0) %></div><div id="galleryfolderlist"></div></div>
	<div id="galleryitems">
		<div id="gallerybuttons">
			<button type="button" id="galleryuploadbutton" onclick="$('#galleryitemuploadlink').click();"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_BUTTON_UPLOAD_0) %></button><a href="#" class="thickbox" id="galleryitemuploadlink"></a>
			<button type="button" onclick="showGalleryFolders();"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_BUTTON_SHOW_0) %></button>
			<button type="button" id="gallerypublishbutton" onclick="$('#gallerypublishlink').click();" disabled="disabled"><%= wp.key(Messages.GUI_GALLERY_GALLERIES_BUTTON_PUBLISH_0) %></button><a href="#" class="thickbox" id="gallerypublishlink"></a>
		</div>
		<!-- fillItems() -->
		<div id="galleryitemlist"><p></p></div>	
		<div id="galleryiteminfo">
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td style="width: 59%;" colspan="2" class="iteminfoheadline">
							
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_HEADLINE_0) %>
						<button id="galleryitemselectbutton" onclick="setActiveItem(galleryItems.markedItem, 'gallery', false);" type="button" title="<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_SELECT_0) %>">
							<img src="<%= org.opencms.workplace.CmsWorkplace.getSkinUri() %>buttons/apply.png" />
						</button>
						<button id="galleryitempublishbutton" onclick="publishItem(galleryItems.markedItem, 'gallery');" type="button" title="<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_PUBLISH_0) %>">
							<img src="<%= org.opencms.workplace.CmsWorkplace.getSkinUri() %>buttons/publish.png" />
						</button>
					</td>
					<td style="width: 40%;" colspan="2" class="iteminfostate">
						<span id="galleryitemstate"></span>
					</td>
				</tr>
				<tr>
					<td style="width: 14%;" class="galleryiteminfotitle">
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_TITLE_0) %>
					</td>
					<td style="width: 85%;" class="galleryiteminfotitle" colspan="3"><div id="galleryitemtitlewrapper"><div id="galleryitemtitle"></div></div></td>
				</tr>
				<tr>
					<td style="width: 14%;">
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_NAME_0) %>
					</td>
					<td id="galleryitemname" style="width: 45%;"></td>
					<td>
						<%= wp.key(Messages.GUI_GALLERY_ITEMDETAIL_DATE_MODIFIED_0) %>
					</td>
					<td id="galleryitemdm">&nbsp;</td>
				</tr>
			</table>
		</div> 	
	</div>	
</div> 