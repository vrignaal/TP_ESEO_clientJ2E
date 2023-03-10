<%--
  Created by IntelliJ IDEA.
  User: AlfredVRIGNAUD
  Date: 23/11/2022
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>

body {
    font-family: arial, sans-serif;
    margin: 0;
    background-color: #f2f2f2;
}

<%-- Barre de navigation --%>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    padding-left: 50;
    overflow: hidden;
    background-color: #333;
    position: fixed;
    top: 0;
    width: 100%;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color: #04AA6D;
}

<%-- Calcul de distance --%>

<%--Formulaire--%>
.form_input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.form_container {
    border-radius: 5px;
    padding: 20px;
}