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

@WebServlet(name = "SupprimerVille", value = "/SupprimerVille")
public class SupprimerVille extends HttpServlet {
    private final VilleDao villeDao = new VilleDaoImpl();
    private Ville ville;

    public SupprimerVille() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "SupprimerVille.doGet" + ConsolColor.RESET);

        String codeVille = request.getParameter("codeCommuneInsee");
        System.out.println(ConsolColor.YELLOW + "codeVille = " + codeVille + ConsolColor.RESET);

        ArrayList<Ville> ville = villeDao.recupererVille(codeVille);
        System.out.println(ConsolColor.YELLOW + "ville = " + ville + ConsolColor.RESET);

        villeDao.supprimerVille(codeVille);

        request.setAttribute("codeVilleSupprimee", codeVille);
        request.setAttribute("villeSupprimee", ville.get(0));

        this.getServletContext().getRequestDispatcher("/WEB-INF/supprimerville.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(ConsolColor.YELLOW + "SupprimerVille.doPost" + ConsolColor.RESET);

    }
}

