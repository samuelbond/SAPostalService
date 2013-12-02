/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import helper.RandomGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Addresses;
import model.Users;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "Register", urlPatterns = {"/Register", "/register"})
public class Register extends HttpServlet {

@EJB model.Model model;
private HttpSession session;  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        
         if(session.getAttribute("user_id") == null){
        request.setAttribute("notUser", "true");
        request.getRequestDispatcher("/register.jsp").forward(request, response);
         }
         else{
             response.sendRedirect("Account");
         }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String pass = request.getParameter("password1");
        RandomGenerator rmg = new RandomGenerator(5);
        boolean check = false;
    
        Users us = model.getSender(email);
        if(us == null)
        {
            check = true;
        }
        else
        {
        request.setAttribute("error", "The user already exist, please check your email and try again");
        request.setAttribute("errorhead", "User already exist");
        }       
        
        if(check){
        Users usr = new Users();
        usr.setName(name);
        usr.setCountry(country);
        usr.setPassword(pass);
        usr.setEmail(email);
        usr.setDateCreated(new Date());
        usr.setLastModified(new Date());
        usr.setPhone(phone);
        Addresses adrs = new Addresses();
        adrs.setCity(city);
        adrs.setAddress(address);
        adrs.setUser(usr);
        try{
        model.createSender(usr);
        model.createAddress(adrs);
        request.setAttribute("msghead", "Your Account was created");
        request.setAttribute("msg", "Congratulations your registration was successful");
        }
        catch(Exception ex){
         String str = "An error has occured please check your fields and try again";
         request.setAttribute("error", str);
         request.setAttribute("errorhead", "Registration Failed");
            System.err.println("Error occured");
        }
        }
        
        request.getRequestDispatcher("/register.jsp").forward(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
