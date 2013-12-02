/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Transit;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "TrackPackage", urlPatterns = {"/TrackPackage", "/trackpackage"})
public class TrackPackage extends HttpServlet {

    @EJB model.Model model;
    private HttpSession session;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        if(session.getAttribute("user_id") != null){
            request.setAttribute("isUser", "true");
        }
        if(session.getAttribute("user_id") == null){
           
            request.setAttribute("notUser", "true");
        }
       request.getRequestDispatcher("/track.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        if(session.getAttribute("user_id") != null){
            request.setAttribute("isUser", "true");
        }
        if(session.getAttribute("user_id") == null){
           
            request.setAttribute("notUser", "true");
        }
       String tcode = request.getParameter("trackingcode");
     
       Transit trn = model.getTransitWithTrackingCode(tcode);
       request.setAttribute("status", trn.getStatus().getStatus());
       request.setAttribute("history", trn.getTransitHistory());
       request.setAttribute("progress", trn.getProgress());
       request.getRequestDispatcher("/trackpackage.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
