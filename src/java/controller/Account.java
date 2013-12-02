/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import helper.RandomGenerator;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Addresses;
import model.Admins;
import model.Destinations;
import model.Model;
import model.Packages;
import model.Pkstatus;
import model.Transit;
import model.Users;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "Account", urlPatterns = {"/Account", "/account"})
public class Account extends HttpServlet {

    @EJB
    Model model;
    private HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();

        if (session.getAttribute("user_id") != null) {

            String user = session.getAttribute("user_id").toString();
            Users usr = model.getSender(user);
            request.setAttribute("user", usr);
            String url = request.getParameter("send");
            if(url != null && url.equals("ship")){
                List adr = model.getSenderAddress(usr.getEmail());
            request.setAttribute("address", adr);
            request.setAttribute("destination", model.getDestinations());
            request.getRequestDispatcher("sendpackage.jsp").forward(request, response);   
            }
            else{
            request.getRequestDispatcher("account.jsp").forward(request, response);
            }
        }
        else if(session.getAttribute("admin_id") != null){
            String adUser = session.getAttribute("admin_id").toString();
            Admins adm = model.getAdmin(adUser);
            request.setAttribute("admin", adm);
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sendPackage = request.getParameter("sendpackage");
        session = request.getSession();
            String user = session.getAttribute("user_id").toString();
            Users usr = model.getSender(user);
            request.setAttribute("user", usr);
            String address; 
            address = request.getParameter("address");
            String city;
            city = request.getParameter("city");
            
            if(address != null){
                String msg = null;
                String error = null; 
                Addresses adr = new Addresses();
                adr.setAddress(address);
                adr.setCity(city);
                adr.setUser(usr);
                try{
                    model.createAddress(adr);
                    msg = "<div class=\"alert alert-success\">\n" +
"    <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n" +
"    <h4>New Address has been added</h4>\n" +
"    New address added successfully\n" +
"    </div>    ";
                }catch(Exception ex){
                 msg = null;
                 error = "<div class=\"alert alert-error\">\n" +
"    <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n" +
"    <h4>An Error has Occured</h4>\n" +
"    Failed to add new address\n" +
"    </div>";  
                }
                
                if(msg != null){
                   request.setAttribute("msg", msg);
                }else{
                    request.setAttribute("error", error);
                }
               request.getRequestDispatcher("account.jsp").forward(request, response); 
            }
            
        if(sendPackage != null){
            String pkName = request.getParameter("pk_name");
            String pkDesc = request.getParameter("pk_desc");
            String senderAddress = request.getParameter("sender_address");
            String rcName = request.getParameter("pk_rec");
            String rcPhone = request.getParameter("pk_phone");
            String rcAddr = request.getParameter("pk_addr");
            String rcCity = request.getParameter("pk_city");
            String rcCountry = request.getParameter("pk_country");
            String sender = request.getParameter("userid");
            RandomGenerator rand = new RandomGenerator(5);
            RandomGenerator rand2 = new RandomGenerator(8);
            String track = rand2.generate();
            String pkId = rand.generate();
            Packages pk = new Packages(pkId, pkName, pkDesc, rcName, rcAddr, rcCity, rcPhone, new Date());
            pk.setPackageSender(new Users(sender));
            pk.setSendersAddress(new Addresses(Integer.parseInt(senderAddress)));
            pk.setPkrecieverCountry(new Destinations(rcCountry));
            Transit tran = new Transit(pkId, track, "Package collected and ready for sending", 10);
            tran.setStatus(new Pkstatus(1));
            tran.setPackages(pk);
            if(model.createPackage(pk,tran)){
                request.setAttribute("action", "Your package was sent successfully");
                request.setAttribute("trackcode", track);
            }
            else{
              request.setAttribute("msg", "An error occured while trying to send your package");  
            }
            
            List adr = model.getSenderAddress(usr.getEmail());
            request.setAttribute("address", adr);
            request.setAttribute("destination", model.getDestinations());
            request.getRequestDispatcher("sendpackage.jsp").forward(request, response);  
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
    }
}
