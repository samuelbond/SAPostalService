/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author samuelbond
 */
@Entity
@Table(name = "destinations")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Destinations.findAll", query = "SELECT d FROM Destinations d"),
    @NamedQuery(name = "Destinations.findByDtId", query = "SELECT d FROM Destinations d WHERE d.dtId = :dtId"),
    @NamedQuery(name = "Destinations.findByDtName", query = "SELECT d FROM Destinations d WHERE d.dtName = :dtName"),
    @NamedQuery(name = "Destinations.findByDtDuration", query = "SELECT d FROM Destinations d WHERE d.dtDuration = :dtDuration")})
public class Destinations implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "dt_id")
    private String dtId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 150)
    @Column(name = "dt_name")
    private String dtName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "dt_duration")
    private String dtDuration;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pkrecieverCountry")
    private Collection<Packages> packagesCollection;

    public Destinations() {
    }

    public Destinations(String dtId) {
        this.dtId = dtId;
    }

    public Destinations(String dtId, String dtName, String dtDuration) {
        this.dtId = dtId;
        this.dtName = dtName;
        this.dtDuration = dtDuration;
    }

    public String getDtId() {
        return dtId;
    }

    public void setDtId(String dtId) {
        this.dtId = dtId;
    }

    public String getDtName() {
        return dtName;
    }

    public void setDtName(String dtName) {
        this.dtName = dtName;
    }

    public String getDtDuration() {
        return dtDuration;
    }

    public void setDtDuration(String dtDuration) {
        this.dtDuration = dtDuration;
    }

    @XmlTransient
    public Collection<Packages> getPackagesCollection() {
        return packagesCollection;
    }

    public void setPackagesCollection(Collection<Packages> packagesCollection) {
        this.packagesCollection = packagesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dtId != null ? dtId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Destinations)) {
            return false;
        }
        Destinations other = (Destinations) object;
        if ((this.dtId == null && other.dtId != null) || (this.dtId != null && !this.dtId.equals(other.dtId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Destinations[ dtId=" + dtId + " ]";
    }
    
}
