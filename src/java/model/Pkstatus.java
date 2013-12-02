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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "pkstatus")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pkstatus.findAll", query = "SELECT p FROM Pkstatus p"),
    @NamedQuery(name = "Pkstatus.findById", query = "SELECT p FROM Pkstatus p WHERE p.id = :id"),
    @NamedQuery(name = "Pkstatus.findByStatus", query = "SELECT p FROM Pkstatus p WHERE p.status = :status")})
public class Pkstatus implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "status")
    private String status;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "status")
    private Collection<Transit> transitCollection;

    public Pkstatus() {
    }

    public Pkstatus(Integer id) {
        this.id = id;
    }

    public Pkstatus(Integer id, String status) {
        this.id = id;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Transit> getTransitCollection() {
        return transitCollection;
    }

    public void setTransitCollection(Collection<Transit> transitCollection) {
        this.transitCollection = transitCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pkstatus)) {
            return false;
        }
        Pkstatus other = (Pkstatus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Pkstatus[ id=" + id + " ]";
    }
    
}
