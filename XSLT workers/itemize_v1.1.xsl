<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xsi xlink xml" version="2.0"
    xmlns:math="http://exslt.org/math" extension-element-prefixes="math"
    xmlns:adms="http://www.w3.org/ns/adms#" xmlns:cc="http://creativecommons.org/ns#"
    xmlns:crm="http://www.cidoc-crm.org/rdfs/cidoc_crm_v5.0.2_english_label.rdfs#"
    xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcat="http://www.w3.org/ns/dcat#"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:doap="http://usefulinc.com/ns/doap#"
    xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:mets="http://www.loc.gov/METS/" xmlns:mods="http://www.loc.gov/mods/v3"
    xmlns:odrl="http://www.w3.org/ns/odrl/2/" xmlns:ore="http://www.openarchives.org/ore/terms/"
    xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdaGr2="http://rdvocab.info/ElementsGr2/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:svcs="http://rdfs.org/sioc/services#"
    xmlns:wgs84="http://www.w3.org/2003/01/geo/wgs84_pos#"
    xmlns:wgs84_pos="http://www.w3.org/2003/01/geo/wgs84_pos#"
    xmlns:xalan="http://xml.apache.org/xalan" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:repox="http://repox.ist.utl.pt">
    
    <xsl:output encoding="UTF-8" indent="yes"/>

    <!--<xsl:param name="output" select="'/Users/mymymy/Code/+dev/test data/output/'"/>-->
    <xsl:param name="output" select="'/home/pierre/Code/Jupyter/Pyton/smugglr-test/output/'"/>
    <xsl:param name="children" select="/rdf:RDF/ore:aggregates"/>

    <!-- ROOT MATCH -->
    <xsl:template match="/">
        <xsl:for-each select="$children">
            <xsl:call-template name="itemize"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="itemize">
        
            <xsl:variable name="uri" select="translate(ore:Proxy/dc:identifier, ' ', '_')"/>
            <xsl:variable name="ns"/>
            <xsl:variable name="fullOutput" select="concat($output, $uri)"/>
            <xsl:result-document href="{$fullOutput}.xml" method="xml">
                <xsl:element name="rdf:RDF">
                    <xsl:copy-of select="namespace::*"/>
                    <xsl:copy-of select="*"/>
                </xsl:element>
            </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
