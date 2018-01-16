<#-- Define services -->
<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService")>

<#assign currentPlid = 0 />
<#assign currentPlidStr = "0" />
<#assign themeDisplay = request['theme-display']! />
<#if themeDisplay?has_content>
  <#assign plidStr = themeDisplay['plid']! />
  <#if plidStr?has_content>
      <#assign currentPlid = getterUtil.getLong(plidStr) />
      <#assign currentPlidStr = plidStr?string />
  </#if>
</#if>

<#-- Define some variables -->

<#if navItems.siblings?size gt 0>

  <nav class="block-navigation">
    <ul>
      <#list navItems.siblings as navItem>

        <#assign isCurrentPage = false />

        <#assign cssClass = "" />
        <#assign iconVal = navItem.icon.data />
        <#if iconVal != "none">
          <#assign cssClass = "ico" + " ico-" + iconVal />
        </#if>

        <#assign linkUrl = navItem.linkExternal.data />
        <#if linkUrl?has_content>
          <#if !(linkUrl?starts_with("http")) && !(linkUrl?starts_with("/"))>
            <#assign linkUrl = "//" + linkUrl />
          </#if>
        </#if>

        <#if linkUrl == "">
          <#if navItem.linkInternal.data ? has_content>
            <#assign linkUrl = navItem.linkInternal.getFriendlyUrl() />

            <#assign linkLayout = getLayoutFromLinkToPage(navItem.linkInternal) />
            <#if linkLayout?has_content>
              <#if linkLayout.getPlid() == currentPlid>
                <#assign isCurrentPage = true />
              </#if>
            </#if>
          </#if>
        </#if>

        <#if !isCurrentPage>
          <li class="${cssClass}">
            <a href="${linkUrl}">
              <span>
                ${navItem.data}
              </span>
            </a>
          </li>
        </#if>

      </#list>
    </ul>
  </nav>

</#if>

<#--
	Macro getLayoutFromLinkToPage
	Parameter linkToPage = an article structure element of the type LinkToPage
	Returns Layout
-->
<#function getLayoutFromLinkToPage linkToPage>

  <#local linkLayout = "" />

  <#if linkToPage.data?has_content>
  	<#local linkData = linkToPage.data?split("@") />

  	<#local linkLayoutId =  getterUtil.getLong(linkData[0]) />

  	<#local linkLayoutIsPrivate =  false />
  	<#if linkData[1] == "private">
  		<#local linkLayoutIsPrivate = true />
  	</#if>

  	<#local linkLayoutGroupId = getterUtil.getLong(linkData[2]) />

  	<#local linkLayout = layoutLocalService.getLayout(linkLayoutGroupId, linkLayoutIsPrivate, linkLayoutId) />

  </#if>

	<#return linkLayout />

</#function>
