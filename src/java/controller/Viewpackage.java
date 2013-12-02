/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Addresses;
import model.Packages;
import model.Pkstatus;
import model.Transit;
import model.Users;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "Viewpackage", urlPatterns = {"/Viewpackage", "/viewpackage"})
public class Viewpackage extends HttpServlet {

   @EJB model.Model model;

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            
         if (session.getAttribute("user_id") != null) {
            
        String user =  session.getAttribute("user_id").toString();
        Users usr = model.getSender(user);
        List<Packages> pkList = model.getSenderPackage(usr);
        List<Pkstatus> pkStats = new ArrayList<>();
        List<Transit> pkTran = new ArrayList<>();
        for(Packages pk: pkList){
        Transit    tr = model.getTransit(pk.getPackageId());
        pkTran.add(tr);
        pkStats.add(tr.getStatus());
        }
        
        request.setAttribute("transit", pkTran);
        request.setAttribute("package", pkList);
        request.setAttribute("pkstatus", pkStats);
        request.setAttribute("sender", usr);
        request.getRequestDispatcher("package.jsp").forward(request, response);
        }
         else{
             response.sendRedirect("index");
         }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
