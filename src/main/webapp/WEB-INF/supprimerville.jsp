<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.model.Ville" %>
<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.utils.ConsolColor" %><%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 23/11/2022
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Supprimer Ville</title>
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
        String codeVilleSupprimee = request.getParameter("codeCommuneInsee");

        request.setAttribute("codeVilleSupprimee", codeVilleSupprimee);

        Ville villeSupprimee = (Ville) request.getAttribute("villeSupprimee");
    %>
    <h2>Suppression d'une ville</h2>
    <p>La ville avec le code commune INSEE : <% out.println(codeVilleSupprimee);%> a bien été supprimée.</p>
    <h4>Les informations supprimées sont : </h4>
    <table style="width:100%">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Code commune</th>
                <th>Code postal</th>
                <th>Libelle acheminement</th>
                <th>Ligne 5</th>
                <th>Latitude</th>
                <th>Longitude</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><% out.println(villeSupprimee.getNomCommune()); %></td>
                <td><% out.println(villeSupprimee.getCodeCommune()); %></td>
                <td><% out.println(villeSupprimee.getCodePostal()); %></td>
                <td><% out.println(villeSupprimee.getLibelleAcheminement()); %></td>
                <td><% out.println(villeSupprimee.getLigne5()); %></td>
                <td><% out.println(villeSupprimee.getCoordonnees().getLatitude()); %></td>
                <td><% out.println(villeSupprimee.getCoordonnees().getLongitude()); %></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
