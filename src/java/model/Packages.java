/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author samuelbond
 */
@Entity
@Table(name = "packages")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Packages.findAll", query = "SELECT p FROM Packages p"),
    @NamedQuery(name = "Packages.findByPackageId", query = "SELECT p FROM Packages p WHERE p.packageId = :packageId"),
    @NamedQuery(name = "Packages.findByPackageName", query = "SELECT p FROM Packages p WHERE p.packageName = :packageName"),
    @NamedQuery(name = "Packages.findByPackageDescription", query = "SELECT p FROM Packages p WHERE p.packageDescription = :packageDescription"),
    @NamedQuery(name = "Packages.findByPackageSender", query = "SELECT p FROM Packages p WHERE p.packageSender = :package_sender"),
    @NamedQuery(name = "Packages.findByPackageReciever", query = "SELECT p FROM Packages p WHERE p.packageReciever = :packageReciever"),
    @NamedQuery(name = "Packages.findByPkrecieverAddress", query = "SELECT p FROM Packages p WHERE p.pkrecieverAddress = :pkrecieverAddress"),
    @NamedQuery(name = "Packages.findByPkrecieverCity", query = "SELECT p FROM Packages p WHERE p.pkrecieverCity = :pkrecieverCity"),
    @NamedQuery(name = "Packages.findByPkrecieverPhone", query = "SELECT p FROM Packages p WHERE p.pkrecieverPhone = :pkrecieverPhone"),
    @NamedQuery(name = "Packages.findByPkdateSent", query = "SELECT p FROM Packages p WHERE p.pkdateSent = :pkdateSent")})
public class Packages implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "package_id")
    private String packageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "package_name")
    private String packageName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "package_description")
    private String packageDescription;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "package_reciever")
    private String packageReciever;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "pk_recieverAddress")
    private String pkrecieverAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "pk_recieverCity")
    private String pkrecieverCity;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "pk_recieverPhone")
    private String pkrecieverPhone;
    @Basic(optional = false)
    @NotNull
    @Column(name = "pk_dateSent")
    @Temporal(TemporalType.DATE)
    private Date pkdateSent;
    @JoinColumn(name = "senders_address", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Addresses sendersAddress;
    @JoinColumn(name = "package_sender", referencedColumnName = "email")
    @ManyToOne(optional = false)
    private Users packageSender;
    @JoinColumn(name = "pk_recieverCountry", referencedColumnName = "dt_id")
    @ManyToOne(optional = false)
    private Destinations pkrecieverCountry;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "packages")
    private Transit transit;

    public Packages() {
    }

    public Packages(String packageId) {
        this.packageId = packageId;
    }

    public Packages(String packageId, String packageName, String packageDescription, String packageReciever, String pkrecieverAddress, String pkrecieverCity, String pkrecieverPhone, Date pkdateSent) {
        this.packageId = packageId;
        this.packageName = packageName;
        this.packageDescription = packageDescription;
        this.packageReciever = packageReciever;
        this.pkrecieverAddress = pkrecieverAddress;
        this.pkrecieverCity = pkrecieverCity;
        this.pkrecieverPhone = pkrecieverPhone;
        this.pkdateSent = pkdateSent;
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getPackageDescription() {
        return packageDescription;
    }

    public void setPackageDescription(String packageDescription) {
        this.packageDescription = packageDescription;
    }

    public String getPackageReciever() {
        return packageReciever;
    }

    public void setPackageReciever(String packageReciever) {
        this.packageReciever = packageReciever;
    }

    public String getPkrecieverAddress() {
        return pkrecieverAddress;
    }

    public void setPkrecieverAddress(String pkrecieverAddress) {
        this.pkrecieverAddress = pkrecieverAddress;
    }

    public String getPkrecieverCity() {
        return pkrecieverCity;
    }

    public void setPkrecieverCity(String pkrecieverCity) {
        this.pkrecieverCity = pkrecieverCity;
    }

    public String getPkrecieverPhone() {
        return pkrecieverPhone;
    }

    public void setPkrecieverPhone(String pkrecieverPhone) {
        this.pkrecieverPhone = pkrecieverPhone;
    }

    public Date getPkdateSent() {
        return pkdateSent;
    }

    public void setPkdateSent(Date pkdateSent) {
        this.pkdateSent = pkdateSent;
    }

    public Addresses getSendersAddress() {
        return sendersAddress;
    }

    public void setSendersAddress(Addresses sendersAddress) {
        this.sendersAddress = sendersAddress;
    }

    public Users getPackageSender() {
        return packageSender;
    }

    public void setPackageSender(Users packageSender) {
        this.packageSender = packageSender;
    }

    public Destinations getPkrecieverCountry() {
        return pkrecieverCountry;
    }

    public void setPkrecieverCountry(Destinations pkrecieverCountry) {
        this.pkrecieverCountry = pkrecieverCountry;
    }

    public Transit getTransit() {
        return transit;
    }

    public void setTransit(Transit transit) {
        this.transit = transit;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (packageId != null ? packageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Packages)) {
            return false;
        }
        Packages other = (Packages) object;
        if ((this.packageId == null && other.packageId != null) || (this.packageId != null && !this.packageId.equals(other.packageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Packages[ packageId=" + packageId + " ]";
    }
    
}
