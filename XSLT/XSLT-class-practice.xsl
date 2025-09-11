<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="#all"
    version="3.0">

<xsl:variable name="barWidth" as="xs:double" select="100"/><!-- Double means a number with a decimal -->
<xsl:variable name="spacing" as="xs:double" select="$barWidth div 4"/><!-- $ goes to the earlier variable and keeps the spacing constant as a fcn of barwidth-->
<xsl:variable name="yScale" as="xs:double" select="5"/>
<xsl:variable name="maxHeight" as="xs:double" select="$yScale * 100"/>
<xsl:variable name="maxWidth" as="xs:double" select="($barWidth + $spacing) * $candidates"/>
<xsl:variable name="candidates" as="xs:integer" select="count(//stooge)"/>

<xsl:template match="/">
   <svg height="1000" width="1000" viewBox="0, -500, 500, 500">
       <polyline points="0,-{$maxHeight} 0,0 {$maxWidth},0" style="stroke:black;stroke-width:2;fill:none;" />
   </svg> 
</xsl:template>
<xsl:template match="stooge">
    <xsl:variable name="x-pos" as="xs:double" select="$spacing +(count(preceding-sibling::stooge)) * ($barWidth + $spacing)"/>
    <xsl:variable name="barHeight" as="xs:double" select=". * $yScale"/>
    
    <rect x="{$x-pos}" y="-{$barHeight}" width="{$barWidth}" height="{$barHeight}"/>
</xsl:template>
</xsl:stylesheet>