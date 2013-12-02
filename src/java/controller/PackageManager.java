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
import model.Packages;
import model.Pkstatus;
import model.Transit;

/**
 *
 * @author samuelbond
 */
@WebServlet(name = "PackageManager", urlPatterns = {"/PackageManager", "/packagemanager"})
public class PackageManager extends HttpServlet {

  @EJB model.Model model;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = request.getParameter("show");
        String url2 = request.getParameter("update");
        if(url != null){
        List<Packages> pkList = model.getAllPackages();
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
        request.getRequestDispatcher("packageviewer.jsp").forward(request, response);
        }
        else if(url2 != null){
            HttpSession session = request.getSession();
            Transit tn = model.getTransit(url2);
            session.setAttribute("transit", tn);
            request.setAttribute("data", tn);
            request.setAttribute("package", url2);
            request.setAttribute("allstats", model.getAllPackageStatus());
            request.getRequestDispatcher("updatepackage.jsp").forward(request, response);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String history = request.getParameter("trahist");
        int progress = Integer.parseInt(request.getParameter("progress"));
        int status = Integer.parseInt(request.getParameter("status"));
        String pkId = request.getParameter("pkd");
        String tcode = request.getParameter("tcode");
        Transit trn = model.getTransit(pkId);
        trn.setProgress(progress);
        trn.setTransitHistory(history);
        trn.setStatus(new Pkstatus(status));
            if(model.updateTransit(trn)){
                request.setAttribute("action", "Package Transit updated successfully");
            }
            else{
            request.setAttribute("msg", "An error occured while trying to update transit details");     
            }
        
        
        List<Packages> pkList = model.getAllPackages();
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
        request.getRequestDispatcher("packageviewer.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
