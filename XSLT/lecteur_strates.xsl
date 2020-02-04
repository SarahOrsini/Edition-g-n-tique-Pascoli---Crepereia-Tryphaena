<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <!-- test avec variables : variables inutiles -->
    <!-- ajout de mise en forme (localisation des éléments sur la page -->

    <xsl:output method="html"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>




    <xsl:template match="tei:TEI">
        <html>
            <head>
                <title>Crepereia Tryphaena : chronological edition</title>
                <link rel="stylesheet" href="CT_css.css"/>
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"/>
                <script type="text/javascript" src="CT_Draft_1_script.js"/><!-- numéro du brouillon à changer -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"/>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"/>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"/>
            </head>

            <body>
                <h1>Crepereia Typhaena : chronological edition</h1>
                <h2>
                    <xsl:for-each select="//tei:titleStmt/tei:title">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </h2>


                <div class="container-fluid"> <!-- organisation de 2 colonnes : une de 4, une de 8 -->
                    <div class="row">
                        <div class="col-lg-4"><!-- navigation = colonne de 4 -->
                            <div id="navigation" style="position:sticky;top:100px">
                                <xsl:for-each select="//tei:change">
                                    <li>
                                        <button>
                                            <!-- préparation de la table des boutons -->
                                            <xsl:attribute name="onclick">
                                                <xsl:text>affichage(</xsl:text>
                                                <xsl:value-of select="position() + 1"/>
                                                <xsl:text>)</xsl:text>
                                                <!-- extrait le rang de chaque change en ajoutant 1, comme on l'attend dans le java script, où 1 est stricement inférieur à 2 etc -->
                                            </xsl:attribute>

                                            <xsl:value-of select="@xml:id"/>
                                        </button>
                                        <xsl:apply-templates/>
                                    </li>
                                </xsl:for-each>
                                <div>
                                    <li>
                                        <button onclick="change('+')">+</button>
                                    </li>
                                    <li>
                                        <button onclick="change('-')">-</button>
                                    </li>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-8"><!-- texte = colonne de 8 -->
                            <div id="texte">
                                <xsl:apply-templates select="tei:text"/>
                                

                            </div>
                        </div>
                    </div>
                </div>

            </body>
        </html>
    </xsl:template>



    <xsl:template match="//tei:div">
        <!-- mise en forme et position des div -->
        <div>
            <xsl:if test="@rend">
                <xsl:attribute name="style">

                    <xsl:value-of select="@rend"/>

                </xsl:attribute>

            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!--
    <xsl:template match="//tei:metamark"><!-\-positionner les metamark, couleur encre -\->
        
        
            
            <span><xsl:apply-templates/></span>
        
       
        
    </xsl:template>
    -->
    
 
    
    
    
    <xsl:template match="//tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="//tei:lg">
        <span>
            <xsl:apply-templates/>
        </span>
        <br/>
    </xsl:template>
    
    <xsl:template match="//tei:l">
        <xsl:apply-templates/><br/> 
    </xsl:template>
    
    <xsl:template match="//tei:lb">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="//tei:del">
        <s>
            <xsl:apply-templates/>
        </s>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'capital']">
        <span style="font-variant:small-caps;font-size:120%">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <xsl:template match="//*[@change]">
        <!-- module pour créer des span avec le numéro de campagne. Doit être placé à la fin sinon toute la mise en page saute -->
        <span>
            <xsl:attribute name="class">
                <!-- class = s1, s2, s3 et pas s1a, s1b, s1c -->
                <xsl:text>s</xsl:text>
                
                <xsl:variable name="sName" select="@change/substring-after(., '#')"/>
                <!-- variable qui nous permet d'enlever le # des @change -->
                
                <xsl:number select="//tei:change[@xml:id = $sName]"/>
                <!-- numérote les tei:change du header qui correspondent aux @change du texte -->
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>







    










</xsl:stylesheet>
