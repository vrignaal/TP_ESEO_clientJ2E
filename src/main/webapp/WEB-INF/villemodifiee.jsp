<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.model.Ville" %><%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 14/12/2022
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ville Modifiée</title>
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
    String codeVilleModifiee = request.getParameter("codeCommuneInsee");

    request.setAttribute("codeVilleModifiee", codeVilleModifiee);

    Ville villeModifiee = (Ville) request.getAttribute("villeModifiee");
%>
<h2>Suppression d'une ville</h2>
<p>La ville avec le code commune INSEE : <% out.println(codeVilleModifiee);%> a bien été modifiée.</p>
<h4>Les nouvelles informations sont : </h4>
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
        <td><% out.println(villeModifiee.getNomCommune()); %></td>
        <td><% out.println(villeModifiee.getCodeCommune()); %></td>
        <td><% out.println(villeModifiee.getCodePostal()); %></td>
        <td><% out.println(villeModifiee.getLibelleAcheminement()); %></td>
        <td><% out.println(villeModifiee.getLigne5()); %></td>
        <td><% out.println(villeModifiee.getCoordonnees().getLatitude()); %></td>
        <td><% out.println(villeModifiee.getCoordonnees().getLongitude()); %></td>
    </tr>
    </tbody>
</table>
</body>
</html>
