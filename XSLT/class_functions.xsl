<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:sleep="http://sleep.bactriana.org"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="text"/>
    <xsl:function name="sleep:median" as="xs:double">
        <xsl:param name="values" as="xs:double+"/>
        <xsl:variable name="count" select="count($values)" as="xs:integer"/>
        <xsl:variable name="sorted_input" select="sort($values)" as="xs:double+"/>
        <xsl:choose>
            <xsl:when test="$count mod 2 = 0">
                <xsl:variable name="halfway" select="$count div 2"/> <!-- div would return fractions, idiv returns whole numbers -->
                <xsl:value-of select="$sorted_input[position() = ($halfway, $halfway + 1)] => avg()"/> <!-- space around operators is a generally good idea -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$sorted_input[$count idiv 2 +1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:template match="/">
        <xsl:value-of select="sleep:median((3,9,7,1,13,27,31))"/>
    </xsl:template>
    
</xsl:stylesheet>