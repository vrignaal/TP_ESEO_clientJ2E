<%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 23/11/2022
  Time: 08:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.model.Ville" %>
<%@ page import="java.util.ArrayList" %>

<html>
    <head>
        <title>CalculDistance</title>
        <style>
            <%@include file="utils/style.jsp"%>
        </style>
    </head>
    <header>
        <ul>
            <li><a onclick="window.location='http://localhost:8080/TP_ESEO/'"> Accueil </a></li>
            <li><a class="active" onclick="window.location='http://localhost:8080/TP_ESEO/CalculDistance'"> Calcul de distance </a></li>
            <li><a onclick="window.location='http://localhost:8080/TP_ESEO/AjouterVille'"> Ajouter une ville </a></li>
        </ul>
    </header>
    <body>
        <br>
        <br>
        <%
            ArrayList<Ville> villeArrayList = (ArrayList<Ville>) request.getAttribute("listeVilles");
            String nomVilleA = (String) request.getAttribute("nomVilleA");
            String nomVilleB = (String) request.getAttribute("nomVilleB");
            String distance = (String) request.getAttribute("distance");
        %>
        <h2>Calcul de Distance</h2>
        <p>Calcul de la distance entre deux villes</p>

        <% if(nomVilleA == null) { %>
            <form method="post" action="CalculDistance" >
                <label for="selectVilleA">Choisir une ville</label>
                <select id="selectVilleA" class="form_input" name="selectVilleA">
                    <% for (Ville ville:
                            villeArrayList) {
                    %>
                        <option><%  out.println(ville.getNomCommune()); %></option>
                    <% } %>
                </select>

                <label for="selectVilleB">Choisir une ville</label>
                <select id="selectVilleB" class="form_input" name="selectVilleB">
                    <% for (Ville ville:
                            villeArrayList) {
                    %>
                    <option><%  out.println(ville.getNomCommune()); %></option>
                    <% } %>
                </select>
                <input type="submit" value="Calculer la distance">
            </form>
        <%} else {%>
        <section id="resultat_calcul">
            <p> La distance entre <% out.println(nomVilleA);%> et <% out.println(nomVilleB);%> est de <strong><% out.println(distance);%></strong> km.</p>
            <input type="button" value="Sélectionner d'autres villes" onclick="window.location='http://localhost:8080/TP_ESEO/CalculDistance'">
        </section>
        <%}%>
    </body>
</html>
