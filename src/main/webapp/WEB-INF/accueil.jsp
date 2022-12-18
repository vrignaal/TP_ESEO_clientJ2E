<%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 22/11/2022
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="fr.eseo.se.vrignaud.tp_eseo_client.model.Ville" %>
<%@ page import="java.util.ArrayList" %>

<html>
    <head>
        <title>Accueil</title>

        <!-- Inclure jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Inclure DataTables -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/datatables.min.css"/>

        <style>
            <%@include file="utils/style.jsp"%>
        </style>
    </head>
    <nav>
        <ul>
            <li><a class="active" onclick="window.location='http://localhost:8080/TP_ESEO/'"> Accueil </a></li>
            <li><a onclick="window.location='http://localhost:8080/TP_ESEO/CalculDistance'"> Calcul de distance </a></li>
            <li><a onclick="window.location='http://localhost:8080/TP_ESEO/AjouterVille'"> Ajouter une ville </a></li>
        </ul>
    </nav>
    <body>
    <br>
    <br>
        <%
            ArrayList<Ville> villeArrayList = (ArrayList<Ville>) request.getAttribute("listeVilles");
        %>
        <h1>TP_ESEO - Partie client J2E</h1>
        <h2>UE Technologie Web et Intégration Continue</h2>
        <h3>
            Liste des villes :
        </h3>

        <table id="villesTable">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Code postal</th>
                    <th>Code commune</th>
                    <th>Libelle acheminement</th>
                    <th>Ligne 5</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th><i>supprimer</i></th>
                    <th><i>modifier</i></th>
                </tr>
            </thead>
            <tbody>
                <% for (Ville ville:
                        villeArrayList) {
                %>
                <tr>
                    <td><%  out.println(ville.getNomCommune()); %></td>
                    <td><%  out.println(ville.getCodePostal()); %></td>
                    <td><%  out.println(ville.getCodeCommune()); %></td>
                    <td><%  out.println(ville.getLibelleAcheminement());%></td>
                    <td><%  out.println(ville.getLigne5());%></td>
                    <td><%  out.println(ville.getCoordonnees().getLatitude());%></td>
                    <td><%  out.println(ville.getCoordonnees().getLongitude());%></td>
                    <td><a href="<%=application.getContextPath()%>/SupprimerVille?codeCommuneInsee=<%out.println(ville.getCodeCommune());%>" onclick="SupprimerVille()">Supprimer</a></td>
                    <td><a href="<%=application.getContextPath()%>/ModifierVille?codeCommuneInsee=<%out.println(ville.getCodeCommune());%>">Modifier</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <script>
            $(document).ready(function() {
                $('#villesTable').DataTable( {
                    "language":
                        {
                            "decimal":        "",
                            "emptyTable":     "Pas de données",
                            "info":           "Afficher _START_ à _END_ de _TOTAL_ entrées",
                            "infoEmpty":      "Afficher 0 a 0 de 0 entrées",
                            "infoFiltered":   "(filtré de _MAX_ entrées)",
                            "infoPostFix":    "",
                            "thousands":      ",",
                            "lengthMenu":     "Afficher _MENU_ entrées",
                            "loadingRecords": "Chargement...",
                            "processing":     "Process...",
                            "search":         "Recherche:",
                            "zeroRecords":    "Aucun résultat trouvé",
                            "paginate": {
                                "first":      "Début",
                                "last":       "Fin",
                                "next":       "Suivant",
                                "previous":   "Précédent"
                            },
                            "aria": {
                                "sortAscending":  ": activer pour trier en ordre ascendant",
                                "sortDescending": ": activer pour trier en ordre descendant"
                            }
                        }
                } );
            } );
        </script>
        <%@include file="utils/script.jsp"%>
    </body>
</html>
