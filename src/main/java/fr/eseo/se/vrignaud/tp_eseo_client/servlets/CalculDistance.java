package fr.eseo.se.vrignaud.tp_eseo_client.servlets;

import fr.eseo.se.vrignaud.tp_eseo_client.dao.VilleDao;
import fr.eseo.se.vrignaud.tp_eseo_client.dao.VilleDaoImpl;
import fr.eseo.se.vrignaud.tp_eseo_client.model.CalculDistanceVille;
import fr.eseo.se.vrignaud.tp_eseo_client.model.Ville;
import fr.eseo.se.vrignaud.tp_eseo_client.utils.ConsolColor;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "CalculDistance", value = "/CalculDistance")
public class CalculDistance extends HttpServlet {
    private final VilleDao villeDao = new VilleDaoImpl();
    private final ArrayList<Ville> villeArrayList = villeDao.recupererToutesVilles();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "CalculDistance.doGet" + ConsolColor.RESET);

        request.setAttribute("listeVilles", villeArrayList);

        this.getServletContext().getRequestDispatcher("/WEB-INF/calculdistance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "CalculDistance.doPost" + ConsolColor.RESET);

        String nomVilleA = request.getParameter("selectVilleA");
        String nomVilleB = request.getParameter("selectVilleB");

        request.setAttribute("nomVilleA",nomVilleA);
        request.setAttribute("nomVilleB",nomVilleB);

        Ville villeA = new Ville();
        Ville villeB = new Ville();
        String distance = "";


        for (Ville v :
                villeArrayList) {
            if (v.getNomCommune().equals(nomVilleA)) {
                villeA = v;
            }
            else if (v.getNomCommune().equals(nomVilleB)) {
                villeB = v;
            }
        }

        if (nomVilleA.equals(nomVilleB)){
            distance = "0";
        } else {
            distance = CalculDistanceVille.calculDistance(villeA, villeB);
        }


        System.out.println(ConsolColor.YELLOW + "villeA = " + villeA + ConsolColor.RESET);
        System.out.println(ConsolColor.YELLOW + "villeB = " + villeB + ConsolColor.RESET);
        System.out.println(ConsolColor.YELLOW + "distance = " + distance + ConsolColor.RESET);

        request.setAttribute("distance", distance);

        doGet(request, response);
    }
}
