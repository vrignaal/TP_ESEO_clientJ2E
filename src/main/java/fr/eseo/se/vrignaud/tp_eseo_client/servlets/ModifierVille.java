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
import java.util.ArrayList;

@WebServlet(name = "ModifierVille", value = "/ModifierVille")
public class ModifierVille extends HttpServlet {
    private final VilleDao villeDao = new VilleDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "ModifierVille.doGet" + ConsolColor.RESET);

        String codeCommuneInseeVilleAModifier = request.getParameter("codeCommuneInsee");

        ArrayList<Ville> villeAModifier = villeDao.recupererVille(codeCommuneInseeVilleAModifier);

        System.out.println(ConsolColor.YELLOW + "codeVille = " + codeCommuneInseeVilleAModifier + ConsolColor.RESET);
        System.out.println(ConsolColor.YELLOW + "villeAModifier = " + villeAModifier.get(0) + ConsolColor.RESET);

        request.setAttribute("codeCommuneInsee", codeCommuneInseeVilleAModifier);
        request.setAttribute("villeAModifier", villeAModifier.get(0));

        this.getServletContext().getRequestDispatcher("/WEB-INF/modifierville.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "ModifierVille.doPost" + ConsolColor.RESET);
        //required
        String nomCommune = request.getParameter("nomCommune");
        //required
        String codePostal = request.getParameter("codePostal");
        //required
        String codeCommune = request.getParameter("codeCommune");
        //!required
//        String libelleAcheminement = "";
//        if (request.getParameter("libelleAcheminement") != null) {
//            libelleAcheminement = request.getParameter("libelleAcheminement");
//        }

        String libelleAcheminement = request.getParameter("libelleAcheminement");

        //!required
//        String ligne5 = "";
//        if (request.getParameter("ligne5") != null) {
//            ligne5 = request.getParameter("ligne5");
//        }
        String ligne5 = request.getParameter("ligne5");
        //required
        String latitude = request.getParameter("latitude");
        //required
        String longitude = request.getParameter("longitude");

        Ville villeModifiee = new Ville(nomCommune, codePostal, codeCommune, libelleAcheminement, ligne5, new Coordonnees(latitude, longitude));

        try {
            villeDao.modifierVille(villeModifiee);
        } catch (InterruptedException | URISyntaxException e) {
            e.printStackTrace();
        }

        ArrayList<Ville> villeModif = villeDao.recupererVille(codeCommune);
        request.setAttribute("villeModifiee", villeModif.get(0));

        System.out.println(ConsolColor.YELLOW + "villeModifiee = " + villeModif  + ConsolColor.RESET);


        this.getServletContext().getRequestDispatcher("/WEB-INF/villemodifiee.jsp").forward(request, response);
    }
}
