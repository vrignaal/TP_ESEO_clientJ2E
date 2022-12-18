package fr.eseo.se.vrignaud.tp_eseo_client.dao;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import fr.eseo.se.vrignaud.tp_eseo_client.model.Ville;
import fr.eseo.se.vrignaud.tp_eseo_client.utils.ConsolColor;
import fr.eseo.se.vrignaud.tp_eseo_client.utils.Converter;
import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;

import static fr.eseo.se.vrignaud.tp_eseo_client.utils.ApiUrl.*;

public class VilleDaoImpl
        implements VilleDao {

    private final Converter converter = new Converter();
    private final ObjectMapper mapper = new ObjectMapper();
    private JSONArray jsonArray;


    /**
     * Recupere toutes les villes
     * @return liste de toutes les villes
     */
    @Override
    public ArrayList<Ville> recupererToutesVilles() {
        System.out.println(ConsolColor.BLUE + "VilleDaoImpl.recupererToutesVilles" + ConsolColor.RESET);

        ArrayList<Ville> villeArrayList = new ArrayList<>();

        try {
            jsonArray = converter.readJsonFromUrl(URL_RECUP_TOUTES_VILLES);
            villeArrayList = mapper.readValue(jsonArray.toString(), new TypeReference<ArrayList<Ville>>() {
            });

            // System.out.println(ConsolColor.BLUE + "VilleDaoImpl.recupererToutesVilles:"+ villeArrayList.toString() + ConsolColor.RESET);

        } catch (JSONException | IOException e) {
            System.out.println(ConsolColor.RED + "VilleDaoImpl.recupererToutesVilles:" + e.getMessage() + ConsolColor.RESET);
        }

        return villeArrayList;
    }

    /**
     * Recupere une ville en fonction de son code
     * @param codeVille - code de la ville voulue
     * @return ville
     */
    @Override
    public ArrayList<Ville> recupererVille(String codeVille) {
        System.out.println(ConsolColor.BLUE + "VilleDaoImpl.recupererVille" + ConsolColor.RESET);

        ArrayList<Ville> villeArrayList = new ArrayList<>();

        try {
            jsonArray = converter.readJsonFromUrl(URL_RECUP_VILLE_CODE + codeVille);
            villeArrayList = mapper.readValue(jsonArray.toString(), new TypeReference< ArrayList<Ville>>() {
            });
            System.out.println(ConsolColor.BLUE + "VilleDaoImpl.recupererVille:" + villeArrayList.get(0).toString() + ConsolColor.RESET);
        } catch (JSONException | IOException e) {
            System.out.println(ConsolColor.RED + "VilleDaoImpl.recupererVille:" + e.getMessage() + ConsolColor.RESET);
        }

        return villeArrayList;
    }

    /**
     * Supprime une ville en fonction de son code
     * @param codeVille - code de la ville à supprimer
     */
    @Override
    public void supprimerVille(String codeVille) {
        System.out.println(ConsolColor.BLUE + "VilleDaoImpl.supprimerVille" + ConsolColor.RESET);

        try {
            URL url = new URL(URL_SUPPR_VILLE + codeVille);
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setRequestMethod("DELETE");
            httpURLConnection.setRequestProperty("Accept", "application/json");

            if (httpURLConnection.getResponseCode() != 200) {
                throw new RuntimeException(ConsolColor.RED + "Failed: HTTP code error " + httpURLConnection.getResponseCode());
            }

            httpURLConnection.disconnect();
        } catch (IOException e) {
            System.out.println(ConsolColor.RED + "VilleDaoImpl.supprimerVille:" + e.getMessage() + ConsolColor.RESET);
        }
    }

    /**
     * Modifie une ville
     * @param ville - nouvelle ville
     * @throws URISyntaxException
     * @throws IOException
     * @throws InterruptedException
     */
    @Override
    public void modifierVille(Ville ville) throws URISyntaxException, IOException, InterruptedException {
        System.out.println(ConsolColor.BLUE + "VilleDaoImpl.modifierVille" + ConsolColor.RESET);
        System.out.println(ConsolColor.BLUE + "villeAModifier = " + ville + ConsolColor.RESET);
        String requestBody = "{\r\n"
                + "    \"nomCommune\": \""+ville.getNomCommune()+"\",\r\n"
                + "    \"codePostal\": \""+ville.getCodePostal()+"\",\r\n"
                + "    \"codeCommune\": \""+ville.getCodeCommune()+"\",\r\n"
                + "    \"libelleAcheminement\": \""+ville.getLibelleAcheminement()+"\",\r\n"
                + "    \"ligne5\": \""+ville.getLigne5()+"\",\r\n"
                + "    \"coordonnees\": {\r\n"
                + "        \"latitude\" : \""+ville.getCoordonnees().getLatitude()+"\",\r\n"
                + "        \"longitude\" : \""+ville.getCoordonnees().getLongitude()+"\"\r\n"
                + "    }\r\n"
                + "}";
        System.out.println(ConsolColor.BLUE + requestBody + ConsolColor.RESET);

        var request = HttpRequest.newBuilder()
                .uri(new URI(URL_MODIF_VILLE))
                .header("Content-type", "application/json")
                .PUT(HttpRequest.BodyPublishers.ofString(requestBody))
                .build();

        var client = HttpClient.newHttpClient();

        client.send(request, HttpResponse.BodyHandlers.ofString());
    }

    /**
     * Ajoute une ville
     * @param ville - nouvelle ville
     * @throws URISyntaxException
     * @throws IOException
     * @throws InterruptedException
     */
    @Override
    public void ajouterVille(Ville ville) throws URISyntaxException, IOException, InterruptedException {
        System.out.println(ConsolColor.BLUE + "VilleDaoImpl.ajouterVille" + ConsolColor.RESET);
        System.out.println(ConsolColor.BLUE + "villeAAjouter = " + ville + ConsolColor.RESET);
        String requestBody = "{\r\n"
                + "    \"nomCommune\": \""+ville.getNomCommune()+"\",\r\n"
                + "    \"codePostal\": \""+ville.getCodePostal()+"\",\r\n"
                + "    \"codeCommune\": \""+ville.getCodeCommune()+"\",\r\n"
                + "    \"libelleAcheminement\": \""+ville.getLibelleAcheminement()+"\",\r\n"
                + "    \"ligne5\": \""+ville.getLigne5()+"\",\r\n"
                + "    \"coordonnees\": {\r\n"
                + "        \"latitude\" : \""+ville.getCoordonnees().getLatitude()+"\",\r\n"
                + "        \"longitude\" : \""+ville.getCoordonnees().getLongitude()+"\"\r\n"
                + "    }\r\n"
                + "}";
        System.out.println(ConsolColor.BLUE + requestBody + ConsolColor.RESET);

        var request = HttpRequest.newBuilder()
                .uri(new URI(URL_AJOUT_VILLE))
                .header("Content-type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                .build();

        var client = HttpClient.newHttpClient();

        client.send(request, HttpResponse.BodyHandlers.ofString());
    }
}