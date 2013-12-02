/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "UserAccount", urlPatterns = {"/UserAccount", "/useraccount"})
public class UserAccount extends HttpServlet {

    @EJB model.Model model;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session = request.getSession();
        String name = request.getParameter("fname");
        String phone = request.getParameter("phone");
        String country = request.getParameter("country");
        String userid = request.getParameter("userid");
        Users sn = model.getSender(userid);
        sn.setName(name);
        sn.setPhone(phone);
        sn.setCountry(country);
        model.updateSender(sn);
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
