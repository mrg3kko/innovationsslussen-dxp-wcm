<div class="spot-box spot-box-${skin.data}">

  <#if heading.data?has_content>
    <h3>${heading.data}</h3>
  </#if>
  <p>${textContent.data}</p>

  <#assign linkUrl = linkText.linkExternal.data />
  <#if linkUrl?has_content>
    <#if !(linkUrl?starts_with("http")) && !(linkUrl?starts_with("/"))>
      <#assign linkUrl = "//" + linkUrl />
    </#if>
  </#if>

  <#if linkUrl = "">
    <#if linkText.linkInternal.data?has_content>
      <#assign linkUrl = linkText.linkInternal.getFriendlyUrl() />
    </#if>
  </#if>

  <#if linkUrl?has_content>
    <div class="link-wrap">
      <a class="link-btn link-btn-link" href="${linkUrl}">
        <span>${linkText.data}</span>
      </a>
    </div>
  </#if>

</div>
