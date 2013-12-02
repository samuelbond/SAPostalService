/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TransactionRequiredException;
import javax.persistence.TypedQuery;

/**
 *
 * @author samuelbond
 */
@Stateless
public class Model {
    
    @PersistenceContext private EntityManager em;
    
    public void createSender( Users usr){
        em.persist(usr);
    }
    
    public void createAdmin(Admins adm){
        em.persist(adm);
    }
    
    public void createAddress(Addresses adr){
        em.persist(adr);
    }
    
    public Admins getAdmin(String email){
        return em.find(Admins.class, email);
    }
    
    public Transit getTransit(String pkId){
        return em.find(Transit.class, pkId);
    }
    
    
    public Transit getTransitWithTrackingCode(String Tcode){
        return em.createNamedQuery("Transit.findByTrackingCode", 
                Transit.class).setParameter("trackingCode", Tcode).getSingleResult();
    }
    
    public boolean updateSender(Users usr){
        try{
            em.merge(usr);
        }catch(Exception ex){
            return false;
        }
        return true;
    }
    
    public boolean createDestinations(Destinations ds){
        try{
            em.persist(ds);
        }catch(EntityExistsException|IllegalArgumentException| TransactionRequiredException ex){
            return false;
        }
        return true;
    }
    
    public boolean createTransit(Transit trnt){
        try{
            em.persist(trnt);
        }catch(EntityExistsException|IllegalArgumentException| TransactionRequiredException ex){
            return false;
        }
        return true;
    }
    
   public boolean updateTransit(Transit tn){
       try{
          em.merge(tn);
       }catch(Exception ex){
           ex.printStackTrace();
           return false;
       }
       return true;
   }
   
   
   public boolean updatePackageStatus(Pkstatus pks){
       try{
           em.merge(pks);
       }catch(Exception ex){
           ex.printStackTrace();
           return false;
       }
       return true;
   }
    
    public boolean createPackage(Packages pkg, Transit trn){
        try{
        em.persist(pkg);
        em.persist(trn);
        }catch(EntityExistsException|IllegalArgumentException| TransactionRequiredException ex){
            return false;
        }
        return true;
    }
    
    public List<Destinations> getDestinations(){
     List<Destinations> des =  em.createNamedQuery("Destinations.findAll", Destinations.class).getResultList();
     return des;
    }
  
    
    public List<Packages> getSenderPackage(Users sender){
        List<Packages> pk = 
                em.createNamedQuery("Packages.findByPackageSender", Packages.class)
                .setParameter("package_sender", sender).getResultList();
        return pk;
    }
    
    public List<Packages> getAllPackages(){
        List<Packages> pk = 
                em.createNamedQuery("Packages.findAll", Packages.class).getResultList();
        return pk;
    }
    
    
     public List<Pkstatus> getAllPackageStatus(){
        List<Pkstatus> pk = 
                em.createNamedQuery("Pkstatus.findAll", Pkstatus.class).getResultList();
        return pk;
    }
    
    public List<Addresses> getSenderAddress(String user){
        List<Addresses> adr = 
                em.createNamedQuery("Addresses.findByUser", Addresses.class).setParameter("user", new Users(user)).getResultList();
        return adr;
    }
    
    public Pkstatus getPackageStatus(int id){  
        return em.createNamedQuery("Pkstatus.findById", 
                Pkstatus.class).setParameter("id", id).getSingleResult();
    }
    
    
    public Users getSender(String email){
        return em.find(Users.class, email);
    }
    
    public boolean checkUser(String email, String pass){
     boolean value;
        try{
         TypedQuery<Users> query = 
           em.createNamedQuery("Users.findByUser&Password", Users.class).
                 setParameter("password", pass).setParameter("email", email);
                    query.getSingleResult(); 
                        value = true;
        }
        catch(NoResultException rsex){
            value = false;
        }
        catch(Exception ex){
            value = false;
        }
        return value;
    }
    
    
     public boolean checkAdmin(String email, String pass){
     boolean value;
        try{
         TypedQuery<Admins> query = 
           em.createNamedQuery("Admins.findByPassword&Email", Admins.class).
                 setParameter("password", pass).setParameter("email", email);
                    query.getSingleResult(); 
                        value = true;
        }
        catch(NoResultException rsex){
            value = false;
        }
        catch(Exception ex){
            value = false;
        }
        return value;
    }
    

}
