<div class="hero-carousel-ctn">
	<div class="hero-carousel">
  	<#list slides.siblings as slide>

			<#assign linkUrl = slide.linkText.linkExternal.data />
			<#if linkUrl?has_content>
				<#if !(linkUrl?starts_with("http")) && !(linkUrl?starts_with("/"))>
					<#assign linkUrl = "//" + linkUrl />
				</#if>
			</#if>

			<#if linkUrl = "">
				<#if slide.linkText.linkInternal.data?has_content>
					<#assign linkUrl = slide.linkText.linkInternal.getFriendlyUrl() />
				</#if>
			</#if>

			<div class="slide">

        <div class="content-area-wrap">
          <div class="container-fluid">
            <div class="content-area ${slide.infoblockPosition.data}">
              <h2>${slide.data}</h2>
  	    			<p>${slide.textContent.data}</p>
  	    			<a class="link-btn link-btn-link" href="${linkUrl}">
  							<span>${slide.linkText.data}</span>
  						</a>
            </div>
          </div>
        </div>

        <img src="${slide.image.data}" alt="${slide.data}" />

			</div>

  	</#list>
	</div>

</div>
