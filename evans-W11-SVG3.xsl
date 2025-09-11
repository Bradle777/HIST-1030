<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- ================================================================ -->
    <!-- Stylesheet variables (preset)                                    -->
    <!-- ================================================================ -->
    <!-- number of pixels vertical for the Y axis -->
    <xsl:variable name="max_height" as="xs:double" select="500"/>
    <!-- default spacing variable -->
    <xsl:variable name="spacing" as="xs:double" select="100"/>
    <!-- number of pixels horizontal for X axis -->
    <xsl:variable name="max_width" as="xs:double" select="($spacing) * count(//election)"/>
      
    
    <!-- ================================================================ -->
    <!-- Templates                                                        -->
    <!-- ================================================================ -->
    <xsl:template match="/">
        <svg height="{$max_height + 200}" width="{$max_width + 250}"
            viewBox="-100 -{$max_height + 100} {$max_width + 200} {$max_height + 200}">
            <!--increased the viewbox in the negative x direction to make room for the y axis label --> 
            
            <!-- ==================================================== -->
            <!-- Create per-election bubbles and vertical ruling      -->
            <!-- ==================================================== -->
            <xsl:apply-templates select="//election"/>
            <!-- ==================================================== -->
            <!-- Create horizontal ruling with labels                 -->
            <!-- ==================================================== -->
          
            <!-- This creates the main graph title-->
            <text x="{-40 + ($max_width div 10)}" y="-{$max_height + 50}" style="font-size:25;font-weight:bolder;">Candidates' Electoral and Popular Votes</text>
            <xsl:for-each select="0 to 5">
                <xsl:variable name="ruling_height" as="xs:double" select=". div 5 * $max_height"/>
                <line x1="0" x2="{$max_width}" y1="-{$ruling_height}" y2="-{$ruling_height}" style="stroke:black;stroke-width:1;"/>
                <!-- Creates electoral vote labels on the y axis -->
                <text y="-{$ruling_height}" x="-50"><xsl:value-of select="$ruling_height"/></text>
                <text x="-50" y="-{$max_height div 2}" transform="rotate(270 -30,-{$max_height div 2.5})" style="font-size:20;font-weight:bold;">Electoral College Votes</text>
            </xsl:for-each>       
        </svg>
        
    </xsl:template>
    
    <xsl:template match="election">
        <!-- ============================================================ -->
        <!-- Template variables                                           -->
        <!-- ============================================================ -->
        
        <xsl:variable name="xpos" as="xs:double" select="((position() -1) * $spacing) + ($spacing div 2)"/>        
        <line x1="{$xpos}" x2="{$xpos}" y1="15" y2="-{$max_height}" style="stroke:black;stroke-width:1;"/>
        
        <!-- ============================================================ -->
        <!-- Create bubbles                                               -->
        <!-- ============================================================ -->
        <xsl:apply-templates>
            <xsl:with-param name="xpos" as="xs:double" select="$xpos"/>
        </xsl:apply-templates>
        <!-- ============================================================ -->
        <!-- Create vertical ruling line and label                        -->
        <!-- ============================================================ -->
        
        <!-- Creates year labels on the x axis -->
        <xsl:variable name="year" as="xs:integer" select="@year"/>
        <text x="{$xpos + -18}" y="40" ><xsl:value-of select="@year"/></text>
        <text x="{$max_width div 2.5}" y="70" style="font-size:20;font-weight:bold;">Election Year</text>
                
    </xsl:template>
    <xsl:template match="candidate">
        <!-- ============================================================ -->
        <!-- Process individual candidates                                -->
        <!-- ============================================================ -->
        
        <!--<xsl:variable name="xpos" as="xs:double" select="(count(preceding::election) * $spacing) + ($spacing div 2)"/>-->
        <xsl:param name="xpos" as="xs:double" required="yes"/>
        <xsl:variable name="ypos" as="xs:double" select="@electoral_votes"/>
        <xsl:variable name="area" as="xs:double" select="@popular_percentage * 130"/>
        
        <xsl:variable name="circle_color" as="xs:string">
            <xsl:choose> <!-- Creates changing colors depending on party-->
                <xsl:when test="(@party='Republican')">red</xsl:when>
                <xsl:when test="(@party='Democrat')">blue</xsl:when>
                <xsl:otherwise>green</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <circle cx="{$xpos}" cy="-{$ypos}" r="{math:sqrt($area div math:pi())}" fill="{$circle_color}" opacity="0.6"/>
       
        <circle cx="{$xpos}" cy="-{$ypos}" r="2" style="fill:black;"/><!--Creates a dot at the center-->   
        
      
        <!-- FOURTH CHALLENGE: IN-CLASS CODE HERE (inner circle, outer circle) -->
        
        
        <!-- FIFT CHALLENGE: IN-CLASS CODE HERE (bubble color if statements) -->
        
   
    </xsl:template>
</xsl:stylesheet>


