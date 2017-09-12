<#-- Define some variables -->
<#assign wrapCssClass = "info-tiles-wrap" />

<#assign wrapCssClass = wrapCssClass + " " + styling.skin.data />

<#if styling.adjustTopPortletMargin.data == "true">
  <#assign wrapCssClass = wrapCssClass + " adjust-top-portlet-margin" />
</#if>
<#if styling.adjustTopContentMargin.data == "true">
  <#assign wrapCssClass = wrapCssClass + " adjust-top-content-margin" />
</#if>


<div class="${wrapCssClass}">

    <div class="info-tiles-ctn">
        <div class="row">

        <#assign columnCssClass = "col-md-12" />

        <#if tiles.siblings?size = 2>
            <#assign columnCssClass = "col-md-6" />
        <#elseif tiles.siblings?size = 3>
            <#assign columnCssClass = "col-md-4" />
        </#if>

        <#list tiles.siblings as tile>
            <#-- Only display 3 tiles --->
            <#if tile_index lte 2>

              <#assign linkUrl = tile.linkText.linkExternal.data />
              <#if linkUrl?has_content>
                <#if !(linkUrl?starts_with("http")) && !(linkUrl?starts_with("/"))>
                  <#assign linkUrl = "//" + linkUrl />
                </#if>
              </#if>

        			<#if linkUrl == "">

                <#if tile.linkText.linkInternal.data?has_content>
                  <#assign linkUrl = tile.linkText.linkInternal.getFriendlyUrl() />
                </#if>

        			</#if>
                <div class="tile ${columnCssClass}">
                    <div class="tile-content">
                      <h2>${tile.data}</h2>
                      <p>
                          ${tile.textContent.data}
                      </p>
                      <#if linkUrl?has_content>
                        <a class="link-btn link-btn-link" href="${linkUrl}">
                          <span>${tile.linkText.data}</span>
                        </a>
                      </#if>
                    </div>
                </div>
            </#if>
        </#list>

        </div>
    </div>
</div>
