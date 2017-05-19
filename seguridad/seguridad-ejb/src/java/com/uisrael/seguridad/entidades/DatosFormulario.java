/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "datos_formulario", catalog = "seguridad", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DatosFormulario.findAll", query = "SELECT d FROM DatosFormulario d")
    , @NamedQuery(name = "DatosFormulario.findById", query = "SELECT d FROM DatosFormulario d WHERE d.id = :id")
    , @NamedQuery(name = "DatosFormulario.findByOrden", query = "SELECT d FROM DatosFormulario d WHERE d.orden = :orden")
    , @NamedQuery(name = "DatosFormulario.findByNombre", query = "SELECT d FROM DatosFormulario d WHERE d.nombre = :nombre")
    , @NamedQuery(name = "DatosFormulario.findByDescripcion", query = "SELECT d FROM DatosFormulario d WHERE d.descripcion = :descripcion")
    , @NamedQuery(name = "DatosFormulario.findByEstado", query = "SELECT d FROM DatosFormulario d WHERE d.estado = :estado")
    , @NamedQuery(name = "DatosFormulario.findByFecha", query = "SELECT d FROM DatosFormulario d WHERE d.fecha = :fecha")
    , @NamedQuery(name = "DatosFormulario.findByValor", query = "SELECT d FROM DatosFormulario d WHERE d.valor = :valor")})
public class DatosFormulario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    private BigInteger orden;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String nombre;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String descripcion;
    private Boolean estado;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 6, scale = 2)
    private BigDecimal valor;
    @JoinColumn(name = "tipo", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Codigos tipo;
    @OneToMany(mappedBy = "apartado", fetch = FetchType.LAZY)
    private List<DatosFormulario> datosFormularioList;
    @JoinColumn(name = "apartado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private DatosFormulario apartado;
    @JoinColumn(name = "formulario", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Formulario formulario;
    @JoinColumn(name = "respuesta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Respuesta respuesta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "datosFormulario", fetch = FetchType.LAZY)
    private List<ExaDatos> exaDatosList;

    public DatosFormulario() {
    }

    public DatosFormulario(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigInteger getOrden() {
        return orden;
    }

    public void setOrden(BigInteger orden) {
        this.orden = orden;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public Codigos getTipo() {
        return tipo;
    }

    public void setTipo(Codigos tipo) {
        this.tipo = tipo;
    }

    @XmlTransient
    public List<DatosFormulario> getDatosFormularioList() {
        return datosFormularioList;
    }

    public void setDatosFormularioList(List<DatosFormulario> datosFormularioList) {
        this.datosFormularioList = datosFormularioList;
    }

    public DatosFormulario getApartado() {
        return apartado;
    }

    public void setApartado(DatosFormulario apartado) {
        this.apartado = apartado;
    }

    public Formulario getFormulario() {
        return formulario;
    }

    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

    @XmlTransient
    public List<ExaDatos> getExaDatosList() {
        return exaDatosList;
    }

    public void setExaDatosList(List<ExaDatos> exaDatosList) {
        this.exaDatosList = exaDatosList;
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
        if (!(object instanceof DatosFormulario)) {
            return false;
        }
        DatosFormulario other = (DatosFormulario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.DatosFormulario[ id=" + id + " ]";
    }
    
}
