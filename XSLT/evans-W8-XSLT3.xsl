<?xml version="1.0" encoding="UTF-8"?>
<!-- improved in class -->
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
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Skyrim</title>
                <link rel="stylesheet" type="text/css" href="evans-W8-XSLT3.css"/>
            </head>
            <body>            
                <xsl:apply-templates/> 
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="skyrim">  <!-- This removes  the forematter, as we only care about the main boyd text -->
        <xsl:apply-templates select="* except cast"/>
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="paragraph/*" mode="paragraph">
        <span class="{name()}">
            <xsl:apply-templates mode="paragraph"/>
        </span>
    </xsl:template>
    
    <xsl:template match="faction">
        <span id="{@ref}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>