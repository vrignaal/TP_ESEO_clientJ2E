package fr.eseo.se.vrignaud.tp_eseo_client.servlets;

import fr.eseo.se.vrignaud.tp_eseo_client.dao.VilleDao;
import fr.eseo.se.vrignaud.tp_eseo_client.dao.VilleDaoImpl;
import fr.eseo.se.vrignaud.tp_eseo_client.model.Ville;
import fr.eseo.se.vrignaud.tp_eseo_client.utils.ConsolColor;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Accueil", value = "/")
public class Accueil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "Accueil.doGet" + ConsolColor.RESET);

        VilleDao villeDao = new VilleDaoImpl();
        ArrayList<Ville> villeArrayList = villeDao.recupererToutesVilles();
        request.setAttribute("listeVilles", villeArrayList);

        this.getServletContext().getRequestDispatcher("/WEB-INF/accueil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "Accueil.doPost" + ConsolColor.RESET);

    }
}
