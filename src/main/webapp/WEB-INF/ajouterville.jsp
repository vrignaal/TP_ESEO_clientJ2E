<%--
L ABERGEMENT CLEMENCIAT	01001	01400	L ABERGEMENT CLEMENCIAT		46.1331001556	4.99858455549

  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 16/12/2022
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une ville</title>
    <style>
        <%@include file="utils/style.jsp"%>
    </style>
</head>
<header>
    <ul>
        <li><a onclick="window.location='http://localhost:8080/TP_ESEO/'"> Accueil </a></li>
        <li><a onclick="window.location='http://localhost:8080/TP_ESEO/CalculDistance'"> Calcul de distance </a></li>
        <li><a class="active" onclick="window.location='http://localhost:8080/TP_ESEO/AjouterVille'"> Ajouter une ville </a></li>
    </ul>
</header>
<body>
<br>
<br>
    <h2>Ajouter une ville</h2>
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
                           placeholder="Nom de la ville"
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
                           placeholder="Code postal"
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
                           placeholder="Code de l'insee"
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
                           id="libelleAcheminement"
                           class="form_input"
                           placeholder="Libelle Acheminement"
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
                           id="ligne5"
                           class="form_input"
                           placeholder="Ligne 5"
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
                           placeholder="Latitude"
                           class="form_input"
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
                           placeholder="Longitude"
                           class="form_input"
                           required
                    >
                </div>
            </div>
            <div class="row">
                <input type="submit" value="Valider l'ajout">
            </div>
        </form>
    </div>
</body>
</html>
