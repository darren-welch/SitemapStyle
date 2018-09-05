<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.1"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>
          Sitemap
         
        </title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
      </head>
      
      <body class="container">
        <header class="text-center my-5">
            <h1 class="text-primary">Sitemap</h1>
        </header>
        <xsl:apply-templates/>
        <footer class="text-center mb-3">
          created by <a href="https://darrenwelch.co.uk" target="_blank" title="Darren Welch">darrenwelch</a>
        </footer>
      </body>
    </html>
  </xsl:template>



  <xsl:template match="sitemap:urlset">
    
        <table class="table table-striped table-bordered" cellspacing="0">
          <thead class="bg-info text-white">
            <tr>
              <th scope="col" style="width:8rem">
                <xsl:value-of select="count(sitemap:url)"/> URLs
              </th>
              <th scope="col">URL</th>
              <xsl:if test="sitemap:url/sitemap:lastmod">
                <th scope="col" style="6rem;">Last Modified</th>
              </xsl:if>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="sitemap:url">
              <tr scope="row">
                <xsl:variable name="loc">
                  <xsl:value-of select="sitemap:loc"/>
                </xsl:variable>
                <xsl:variable name="pno">
                  <xsl:value-of select="position()"/>
                </xsl:variable>
                <td>
                  <xsl:value-of select="$pno"/>
                </td>
                <td>
                  <p>
                    <a href="{$loc}" class="link blue">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </p>
                </td>
                
                <xsl:if test="sitemap:lastmod">
                  <td class="text-red">
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="dateTime" select="sitemap:lastmod" />
                    </xsl:call-template>
                    
                  </td>
                </xsl:if>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      
  </xsl:template>
  <xsl:template name="formatDate">
    <xsl:param name="dateTime" />
    <xsl:variable name="date" select="substring-before($dateTime, 'T')" />
    <xsl:variable name="year" select="substring-before($date, '-')" />
    <xsl:variable name="month" select="substring-before(substring-after($date, '-'), '-')" />
    <xsl:variable name="day" select="substring-after(substring-after($date, '-'), '-')" />
    <xsl:value-of select="concat($year, '/', $month, '/', $day)" />
  </xsl:template>

 

</xsl:stylesheet>
