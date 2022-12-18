<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.model.Ville" %><%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 14/12/2022
  Time: 17:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Modifier une ville</title>
        <style>
            <%@include file="utils/style.jsp"%>
        </style>
    </head>
    <header>
        <ul>
            <li><a class="active" onclick="window.location='http://localhost:8080/TP_ESEO/'"> Accueil </a></li>
            <li><a onclick="window.location='http://localhost:8080/TP_ESEO/CalculDistance'"> Calcul de distance </a></li>
            <li><a onclick="window.location='http://localhost:8080/TP_ESEO/AjouterVille'"> Ajouter une ville </a></li>
        </ul>
    </header>
    <body>
    <%
        Ville ville = (Ville) request.getAttribute("villeAModifier");
    %>
    <h2>Modification de la ville <%out.println(ville.getNomCommune());%></h2>
    <div class="form_container">
        <form method="post">
            <div class="row">
                <div class="col-25">
                    <label for="nomCommune">Nom ville</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="nomCommune"
                           id="nomCommune"
                           value="<%out.println(ville.getNomCommune());%>"
                           class="form_input"
                           required
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="codePostal">Code Postal</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="codePostal"
                           id="codePostal"
                           value="<%out.println(ville.getCodePostal());%>"
                           class="form_input"
                           required
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="codeCommune">Code Commune</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="codeCommune"
                           id="codeCommune"
                           value="<%out.println(ville.getCodeCommune());%>"
                           class="form_input"
                           required
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="libelleAcheminement">Libelle Acheminement</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="libelleAcheminement"
                           class="form_input"
                           id="libelleAcheminement"
                           value="<%out.println(ville.getLibelleAcheminement());%>"
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="ligne5">Ligne 5</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="ligne5"
                           class="form_input"
                           id="ligne5"
                           value="<%out.println(ville.getLigne5());%>"
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="latitude">Latitude</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="latitude"
                           id="latitude"
                           class="form_input"
                           value="<%out.println(ville.getCoordonnees().getLatitude());%>"
                           required
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="longitude">Longitude</label>
                </div>
                <div class="col-75">
                    <input type="text"
                           name="longitude"
                           id="longitude"
                           value="<%out.println(ville.getCoordonnees().getLongitude());%>"
                           class="form_input"
                           required
                    >
                </div>
            </div>
            <div class="row">
                <input type="submit" value="Valider les modifications">
            </div>
        </form>
    </div>
</body>
</html>
