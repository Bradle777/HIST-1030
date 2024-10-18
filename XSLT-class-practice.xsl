<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:template match="/"> <!-- match `/` means match the root element -->
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Hamlet</title>
            </head>
            <body>
                <h1>Hamlet</h1>
                <p><xsl:apply-templates select="//body/div/div/sp"/>
                    
                </p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="sp">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>