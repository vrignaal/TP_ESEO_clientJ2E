package fr.eseo.se.vrignaud.tp_eseo_client.model;

import java.text.DecimalFormat;

public class CalculDistanceVille {
    private static final int RAYON_TERRE = 6371;

    public static String calculDistance(Ville villeA, Ville villeB) {
        double distance;

        // donnees
        double longVilleA = degre2rad(Double.parseDouble(villeA.getCoordonnees().getLongitude()));
        double latVilleA = degre2rad(Double.parseDouble(villeA.getCoordonnees().getLatitude()));
        double longVilleB = degre2rad(Double.parseDouble(villeB.getCoordonnees().getLongitude()));
        double latVilleB = degre2rad(Double.parseDouble(villeB.getCoordonnees().getLatitude()));

        // calcul distance
        distance = Math.acos(Math.sin(longVilleA)*Math.sin(longVilleB)+Math.cos(longVilleA)*Math.cos(longVilleB)*Math.cos(latVilleA-latVilleB)) * RAYON_TERRE;

        // format
        DecimalFormat format = new DecimalFormat();
        format.setMaximumFractionDigits(1);

        return format.format(distance);
    }

    private static double degre2rad(double value) {
        return value * Math.PI / 180;
    }
}
