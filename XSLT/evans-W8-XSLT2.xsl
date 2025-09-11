<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
<xsl:output method="xhtml" html-version="5" omit-xml-declaration="no"
    include-content-type="no" indent="yes"/>
    
<xsl:template match="/">
    <html>
        <head>
            <title>Skyrim</title>
            <style>
                table, th, td {border: 1px solid black;}
            </style>
        </head>
        <body><!--This establishes the 2 tables with the row that contains table header -->
            <table>
               <tr><th>Table of Characters</th></tr>
               <tr>
                   <th>Name</th>
                   <th>Faction</th>
                   <th>Alignment</th>
               </tr>
               <xsl:apply-templates select="//cast/character"/>
            </table>
            <table>
                <tr><th>Table of Factions</th></tr>
                <tr>
                    <th>Name</th>
                    <th>Alignment</th>
                </tr>
                <xsl:apply-templates select="//cast/faction"/>
            </table>
        </body>
    </html>
</xsl:template>    
    <!--These are each the templates for the rows of the table that has the information we want 
    Apply templates to the @id attribute that contains the info within the respective elements in the template match attribute-->
    <xsl:template match="character">
            <tr>
                <td><xsl:apply-templates select="@id"/></td>
                <td><xsl:apply-templates select="@loyalty"/></td>
                <td><xsl:apply-templates select="@alignment"/></td>
            </tr>
    </xsl:template>
    
    <xsl:template match="faction">
            <tr>
                <td><xsl:apply-templates select="@id"/></td>
                <td><xsl:apply-templates select="@alignment"/></td>
            </tr>
    </xsl:template>
</xsl:stylesheet>