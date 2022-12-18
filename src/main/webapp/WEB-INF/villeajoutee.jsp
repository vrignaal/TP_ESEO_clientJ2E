<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.model.Ville" %><%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 16/12/2022
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Ville Ajoutée</title>
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
    <%
      String codeVilleAjoutee = request.getParameter("codeCommuneInsee");
      request.setAttribute("codeVilleAjoutee", codeVilleAjoutee);
      Ville villeAjoutee = (Ville) request.getAttribute("villeAjoutee");
    %>
    <h2>Ajout d'une ville</h2>
    <p>La ville a été ajoutée.</p>
    <h4>Les informations sont : </h4>
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
          <td><% out.println(villeAjoutee.getNomCommune()); %></td>
          <td><% out.println(villeAjoutee.getCodeCommune()); %></td>
          <td><% out.println(villeAjoutee.getCodePostal()); %></td>
          <td><% out.println(villeAjoutee.getLibelleAcheminement()); %></td>
          <td><% out.println(villeAjoutee.getLigne5()); %></td>
          <td><% out.println(villeAjoutee.getCoordonnees().getLatitude()); %></td>
          <td><% out.println(villeAjoutee.getCoordonnees().getLongitude()); %></td>
        </tr>
      </tbody>
    </table>
  </body>
</html>
