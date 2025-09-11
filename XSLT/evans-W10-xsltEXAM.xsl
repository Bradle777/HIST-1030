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
                <title><xsl:apply-templates select="//metaData/title" mode="cover"/></title>
                <link rel="stylesheet" type="text/css" href="evans-W10-xsltExam.css"/>
                <!-- link to my css file -->
            </head>
            <body>
                <!-- the cover mode is for all the stuff that would be on a cover page -->
                <h1><xsl:apply-templates select="//metaData/title" mode="cover"/></h1>
                <h2>
                    <xsl:apply-templates select="//author" mode="cover"/><br/>
                    <xsl:apply-templates select="//editor" mode="cover"/>
                </h2>
                <h3>Table of Contents</h3>
                <ul>
                    <xsl:apply-templates select="descendant::story" mode="toc"> <!--mode for everything I used to make the table of contents-->
                        <xsl:sort/><!-- sorting all the stories in alphabetical order -->
                    </xsl:apply-templates>                     
                </ul>
                <xsl:apply-templates select="//story" mode="texts"/><!-- mode for everything I used to make the main body of texts -->
            </body>
        </html>
    </xsl:template>    
    
<!-- ===============Sets up Table of Contents============ -->    
    <xsl:template match="story" mode="toc">
        <li>
            <a href="#{title}"><xsl:apply-templates select="title" mode="toc"/></a>
        </li><!--linked the toc to the story titles-->
    </xsl:template>
    
<!-- ===============Sets up all the texts =============== -->
    <xsl:template match="book/story" mode="texts">
        <section><xsl:apply-templates mode="texts"/></section><br/>
    </xsl:template>
    <xsl:template match="p" mode="texts">
        <p><xsl:apply-templates mode="texts"/></p>
    </xsl:template>
    <xsl:template match="story/title" mode="texts">
        <strong id="{.}"><xsl:apply-templates mode="texts"/></strong>
    </xsl:template><!-- linked the toc to the story titles -->
    <xsl:template match="origin" mode="texts">
        <i><xsl:apply-templates mode="texts"/></i>
    </xsl:template>
    
</xsl:stylesheet>