<#setting locale=locale>

<#assign page = themeDisplay.getLayout() />
<#assign group_id = page.getGroupId() />
<#assign company_id = themeDisplay.getCompanyId() />

<#--
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService")>

<#assign blogsPortletId = "33" />
<#assign blogsPagePlid = portalUtil.getPlidFromPortletId(group_id, page.isPrivateLayout(), blogsPortletId) />
<#assign blogsLayout = layoutLocalService.getLayout(blogsPagePlid) />

<#assign blogPageFriendlyUrl = blogsLayout.getFriendlyURL(locale) />
<#assign blogEntryFriendlyUrlPrefix = "/-/blogs/" />
-->

<div class="blogs-box-listing content-box">

  <h2>
    Nyhetsblogg
  </h2>

  <div class="content-box-bd">

    <#if entries?has_content>
      <div class="news-items">
        <#list entries as entry>

  				<#assign assetRenderer = entry.getAssetRenderer() />
  				<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />

  				<#if assetLinkBehavior != "showFullContent">
  					<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
  				</#if>

          <#--
          <#assign viewURL = blogPageFriendlyUrl + blogEntryFriendlyUrlPrefix + assetRenderer.getUrlTitle() />
          -->

          <div class="entry-item">
            <a href="${viewURL}">
              <div class="entry-content">
                ${htmlUtil.escape(entry.getTitle())} &raquo;
              </div>
              <div class="entry-date">
                ${dateUtil.getDate(entry.getPublishDate(), "dd MMM", locale)}
              </div>
            </a>
          </div>

        </#list>
      </div>
    </#if>

  </div>

  <#--
  <div class="more-link-wrap">
    <a href="${blogPageFriendlyUrl}" class="more-link">Fler blogginl&auml;gg &raquo;</a>
  </div>
  -->

</div>

<#function ellipsis myString maxChars>
  <#if myString?length gt maxChars>
    <#return myString?substring(0, maxChars) + "..." />
  <#else>
    <#return myString />
  </#if>
</#function>
