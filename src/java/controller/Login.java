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
import model.Users;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "Login", urlPatterns = {"/Login", "/login"})
public class Login extends HttpServlet {
@EJB model.Model login;
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String logout = request.getParameter("logout");
        
        if(logout == null && session.getAttribute("user_id") == null){
        request.setAttribute("notUser", "true");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        else if(session.getAttribute("user_id") != null && logout == null){
            response.sendRedirect("Account");
        }
        else{
            if(session.getAttribute("user_id") != null)
            session.removeAttribute("user_id");
            if(session.getAttribute("admin_id") != null)
               session.removeAttribute("admin_id");
            request.setAttribute("notUser", "true");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Users usr = new Users();
        usr.setPassword(password);
        password = usr.getPassword();
        
        if(login.checkUser(email, password)){
        HttpSession session = request.getSession();
        session.setAttribute("user_id", email);
        response.sendRedirect("Account");
        }
        else if(login.checkAdmin(email, password)){
         HttpSession session = request.getSession();
        session.setAttribute("admin_id", email);
        response.sendRedirect("Account");   
        }
        else{
        request.setAttribute("error", "Your email or password is wrong, please check your details and try again");
        request.setAttribute("errorhead", "Wrong email or password !");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
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
