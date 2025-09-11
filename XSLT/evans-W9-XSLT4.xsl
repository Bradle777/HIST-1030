<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Sonnets</title>
                <link rel="stylesheet" type="text/css" href=""/>
                <!-- In case I wanted to style it better, color etc. -->
            </head>
            <body>            
                <h1>The Sonnets of Shakespeare</h1>
                <h2>Table of Contents</h2>
                <ul>
                    <xsl:apply-templates mode="toc"/>
                </ul>
                <!-- creates unordered list and the mode specifies which template to apply -->
                <xsl:apply-templates mode="sonnets"/>
            </body>
        </html>
    </xsl:template>
    <!--=========Creates full sonnet text in HTML=========-->
    <xsl:template match="sonnet" mode="sonnets">
        <section>
        <h2><a id="{@number}"><xsl:apply-templates select="@number"/></a></h2>
        <!-- element a with @href and @id creates a link location for table of contents links-->
        <p>
            <xsl:apply-templates mode="sonnets"/>
        </p>
        </section>
    </xsl:template>
    
    <xsl:template match="line" mode="sonnets">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::line">
            <br/>
        </xsl:if>
        <!-- xsl:if, if value is true, apply enclosed text -->
    </xsl:template>
    <!-- =======The toc mode is tied to the mode in <ul> creating a table of contents ============ -->
    <xsl:template match="sonnet" mode="toc">
        <li>
            <xsl:apply-templates select="line[1]"/>
            <a href="#{@number}"> <!-- element a provides a link tied to each sonnet in the file -->
                <strong><xsl:apply-templates select="@number"/></strong>.</a>
            
                <!-- toc value should be a linked roman numeral and the line number 1 of each sonnet -->
        </li>
    </xsl:template>
  
    
</xsl:stylesheet>