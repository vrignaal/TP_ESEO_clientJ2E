package fr.eseo.se.vrignaud.tp_eseo_client.utils;

public class ApiUrl {
    // commande pour récuperer toutes les villes de la BDD
    public final static String URL_RECUP_TOUTES_VILLES = "http://localhost:8181/rechercherVille";

    // commande pour récuperer une ville en fonction de son code postal
    public final static String URL_RECUP_VILLE_CODE = "http://localhost:8181/rechercherVille?codeCommune="; // besoin d'ajouter un code postal

    // commande pour ajouter une ville
    public final static String URL_AJOUT_VILLE = "http://localhost:8181/ajouterVille";

    // commande pour supprimer une ville
    public final static String URL_SUPPR_VILLE = "http://localhost:8181/supprimerVille?codeCommune="; // besoin d'ajouter un code postal

    // commande pour modifier une ville
    public final static String URL_MODIF_VILLE = "http://localhost:8181/modifierVille";

}
