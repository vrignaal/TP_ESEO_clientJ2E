package fr.eseo.se.vrignaud.tp_eseo_client.servlets;

import fr.eseo.se.vrignaud.tp_eseo_client.dao.VilleDao;
import fr.eseo.se.vrignaud.tp_eseo_client.dao.VilleDaoImpl;
import fr.eseo.se.vrignaud.tp_eseo_client.model.Coordonnees;
import fr.eseo.se.vrignaud.tp_eseo_client.model.Ville;
import fr.eseo.se.vrignaud.tp_eseo_client.utils.ConsolColor;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.net.URISyntaxException;

@WebServlet(name = "AjouterVille", value = "/AjouterVille")
public class AjouterVille extends HttpServlet {
    private final VilleDao villeDao = new VilleDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "AjouterVille.doGet" + ConsolColor.RESET);
        this.getServletContext().getRequestDispatcher("/WEB-INF/ajouterville.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "AjouterVille.doPost" + ConsolColor.RESET);

        //required
        String nomCommune = request.getParameter("nomCommune");
        //required
        String codePostal = request.getParameter("codePostal");
        //required
        String codeCommune = request.getParameter("codeCommune");
        //!required
        String libelleAcheminement = "";
        if (request.getParameter("libelleAcheminement") != null) {
            libelleAcheminement = request.getParameter("libelleAcheminement");
        }
        //!required
        String ligne5 = "";
        if (request.getParameter("ligne5") != null) {
            ligne5 = request.getParameter("ligne5");
        }
        //required
        String latitude = request.getParameter("latitude");
        //required
        String longitude = request.getParameter("longitude");

        Ville villeAjoutee = new Ville(nomCommune, codePostal, codeCommune, libelleAcheminement, ligne5, new Coordonnees(latitude, longitude));

        try {
            villeDao.ajouterVille(villeAjoutee);
        } catch (URISyntaxException | InterruptedException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("villeAjoutee",villeDao.recupererVille(codeCommune).get(0));
        this.getServletContext().getRequestDispatcher("/WEB-INF/villeajoutee.jsp").forward(request, response);
    }
}
