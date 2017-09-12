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

            <#if navItem.linkInternal.data == currentPlidStr>
              <#assign isCurrentPage = true />
            </#if>


          </#if>
        </#if>

        <#-- Logic for isCurrentPage not working. Needs to be updated. -->
        <#assign isCurrentPage = false />

        <#if !isCurrentPage>
          <li class="${cssClass}">
            <a href="${linkUrl}">
              <span>
                <#--
                ${navItem.data} (${navItem.linkInternal.getLayoutId()?string} vs ${currentPlidStr})
                ${navItem.data} (${navItem.linkInternal.getLayoutType()} vs ${currentPlidStr})
                -->
                <#--
                <#assign attrMap = navItem.linkInternal.getAttributes() />
                <#assign attributesString = "" />
                <#list attrMap?keys as attr>
                  <#assign attributesString = attributesString + ", " + attrMap[attr] />
                </#list>
                -->
                <#--
                ${navItem.data} (${navItem.linkInternal.getLayoutGroupId()})
                -->
                ${navItem.data}
              </span>
            </a>
          </li>
        </#if>

      </#list>
    </ul>
  </nav>

</#if>
