/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author samuelbond
 */
@Entity
@Table(name = "transit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Transit.findAll", query = "SELECT t FROM Transit t"),
    @NamedQuery(name = "Transit.findByPackageId", query = "SELECT t FROM Transit t WHERE t.packageId = :packageId"),
    @NamedQuery(name = "Transit.findByTrackingCode", query = "SELECT t FROM Transit t WHERE t.trackingCode = :trackingCode"),
    @NamedQuery(name = "Transit.findByProgress", query = "SELECT t FROM Transit t WHERE t.progress = :progress")})
public class Transit implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "package_id")
    private String packageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "tracking_code")
    private String trackingCode;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "transit_history")
    private String transitHistory;
    @Basic(optional = false)
    @NotNull
    @Column(name = "progress")
    private int progress;
    @JoinColumn(name = "status", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Pkstatus status;
    @JoinColumn(name = "package_id", referencedColumnName = "package_id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Packages packages;

    public Transit() {
    }

    public Transit(String packageId) {
        this.packageId = packageId;
    }

    public Transit(String packageId, String trackingCode, String transitHistory, int progress) {
        this.packageId = packageId;
        this.trackingCode = trackingCode;
        this.transitHistory = transitHistory;
        this.progress = progress;
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public String getTrackingCode() {
        return trackingCode;
    }

    public void setTrackingCode(String trackingCode) {
        this.trackingCode = trackingCode;
    }

    public String getTransitHistory() {
        return transitHistory;
    }

    public void setTransitHistory(String transitHistory) {
        this.transitHistory = transitHistory;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public Pkstatus getStatus() {
        return status;
    }

    public void setStatus(Pkstatus status) {
        this.status = status;
    }

    public Packages getPackages() {
        return packages;
    }

    public void setPackages(Packages packages) {
        this.packages = packages;
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
        if (!(object instanceof Transit)) {
            return false;
        }
        Transit other = (Transit) object;
        if ((this.packageId == null && other.packageId != null) || (this.packageId != null && !this.packageId.equals(other.packageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Transit[ packageId=" + packageId + " ]";
    }
    
}
