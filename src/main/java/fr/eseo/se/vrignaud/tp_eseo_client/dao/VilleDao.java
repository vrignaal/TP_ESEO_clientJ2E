package fr.eseo.se.vrignaud.tp_eseo_client.dao;

import fr.eseo.se.vrignaud.tp_eseo_client.model.Ville;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;

public interface VilleDao {
    ArrayList<Ville> recupererToutesVilles();
    ArrayList<Ville> recupererVille(String codeVille);
    void supprimerVille(String codeVille);
    void modifierVille(Ville ville) throws URISyntaxException, IOException, InterruptedException;
    void ajouterVille(Ville ville) throws URISyntaxException, IOException, InterruptedException;
}
