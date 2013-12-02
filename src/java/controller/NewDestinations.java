/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import helper.HashString;
import helper.RandomGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Destinations;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "NewDestinations", urlPatterns = {"/NewDestinations", "/newdestinations"})
public class NewDestinations extends HttpServlet {

    @EJB model.Model model;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String desName = request.getParameter("name");
        String duration = request.getParameter("duration");
        String id = (new RandomGenerator(5)).generate();
        
        if(model.createDestinations(new Destinations(id, desName, duration)))
        {
        request.setAttribute("action", "Destination added successfully");    
        }
        else{
          request.setAttribute("msg", "An error occured while trying to add destination");  
        }
        response.sendRedirect("account");
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
