<#assign namespace = request["portlet-namespace"]!>

<div class="event">
    <h1>${eventName.data}</h1>

      <div class="row">
        <div class="col-md-8">
          <div class="column-content">

            <div class="meta-wrap">
                <#if dateStart.data?has_content>
                  <#assign dateString = dateStart.data?date("yyyy-MM-dd") />

                  <#if dateStart.dateEnd.data?has_content>
                    <#assign dateString = dateString + " - " + dateStart.dateEnd.data?date("yyyy-MM-dd") />
                </#if>
                <div class="meta-item date">
                  <i class="icon-calendar"></i> ${dateString}
                </div>
              </#if>
              <#if timeStart.data?has_content>
                <#assign timeString = timeStart.data />
                <#if timeStart.timeEnd.data?has_content>
                  <#assign timeString = timeString + " - " + timeStart.timeEnd.data />
                </#if>
                <div class="meta-item time">
                  <i class="icon-time"></i> ${timeString}
                </div>
              </#if>
              <#if location.data?has_content>
                <#assign locationString = location.data />
                <#if location.locationStreetaddress.data?has_content>
                  <#assign locationString = locationString + ", " + location.locationStreetaddress.data />
                </#if>
                <#if location.locationCity.data?has_content>
                  <#assign locationString = locationString + ", " + location.locationCity.data />
                </#if>
                <div class="meta-item location">
                  <i class="icon-map-marker"></i> ${locationString}
                </div>
              </#if>
            </div>

            <#if intro.data?has_content>
              <p class="intro">
                ${intro.data}
              </p>
            </#if>
            <div class="content">
              ${textContent.data}
            </div>


          </div>
        </div>
        <div class="col-md-4">
          <div class="column-content">
            <#if registerURL.data?has_content>
              <div class="signup">
                <a class="link-btn link-btn-filled link-btn-link" href="${registerURL.data}" target="_BLANK">
                  <span>Anm&auml;l dig h&auml;r</span>
                </a>
              </div>

              <#assign showMap = (location.data?has_content) />

              <#if showMap>
                <div class="map-container" data-title="${location.data}" data-streetaddress="${location.locationStreetaddress.data}" data-zipcode="${location.locationZipcode.data}" data-city="${location.locationCity.data}"></div>
              </#if>

            </#if>
          </div>
        </div>
      </div>

</div>
