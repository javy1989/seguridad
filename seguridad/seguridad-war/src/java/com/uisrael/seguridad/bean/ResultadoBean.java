/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.bean;

import com.plancurricular.utilitarios.Pantalla;
import com.uisrael.seguridad.entidades.DetalleExamen;
import com.uisrael.seguridad.entidades.Examen;
import com.uisrael.seguridad.servicios.ExamenFacade;
import com.uisrael.seguridad.utilidades.MostrarMensaje;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import javax.faces.bean.ViewScoped;
import javax.servlet.http.HttpServletRequest;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.BarChartSeries;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.HorizontalBarChartModel;

/**
 *
 * @author desarrollo
 */
@ManagedBean(name = "resultado")
@ViewScoped
public class ResultadoBean {

    @EJB
    private ExamenFacade ejbExamen;

    private Examen examen;
    private Pantalla pantallaResultado = new Pantalla();
    private CartesianChartModel indicadores;
    private BarChartModel barModel;
    private HorizontalBarChartModel horizontalBarModel;
    public ResultadoBean() {
    }

    @PostConstruct
    private void init() {
        HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
        if (request.getParameter("cod") != null) {
            String codigo = request.getParameter("cod");
            examen = ejbExamen.buscarExamenPorCodigo(codigo);
            if (examen != null) {
                pantallaResultado.insertar();
                createBarModels();
            } else {
                MostrarMensaje.fatal("Informacion", "Codigo de examen incorrecto");
            }
        }
    }

    private void createBarModels() {
        createBarModel();
        createHorizontalBarModel();
    }

    private void createBarModel() {
        barModel = initBarModel();

        barModel.setTitle("Bar Chart");

        Axis xAxis = barModel.getAxis(AxisType.X);

        Axis yAxis = barModel.getAxis(AxisType.Y);
        yAxis.setMin(0);
        yAxis.setMax(100);
        xAxis.setMin(0);
        xAxis.setMax(10);
    }

    private BarChartModel initBarModel() {
        BarChartModel model = new BarChartModel();

        ChartSeries series1 = new ChartSeries();
        for (DetalleExamen detalle : examen.getDetalleExamenList()) {
            series1.set(detalle.getFormularioApartado().getApartado().getNombre(), detalle.getValor());
        }

        model.addSeries(series1);

        model.setExtender("skinBar");
        return model;
    }

    private void createHorizontalBarModel() {
        horizontalBarModel = new HorizontalBarChartModel();

        ChartSeries chart;
        for (DetalleExamen detalle : examen.getDetalleExamenList()) {
            chart=new ChartSeries();
            chart.setLabel(detalle.getFormularioApartado().getApartado().getNombre());
            chart.set(detalle.getFormularioApartado().getApartado().getCodigo(), detalle.getValor());
            horizontalBarModel.addSeries(chart);
        }

        horizontalBarModel.setTitle("Resultados de Apartados");
        horizontalBarModel.setLegendPosition("e");
        horizontalBarModel.setStacked(true);

        Axis xAxis = horizontalBarModel.getAxis(AxisType.X);
        xAxis.setLabel("Porcentaje");
        xAxis.setMin(0);
        xAxis.setMax(100);

        Axis yAxis = horizontalBarModel.getAxis(AxisType.Y);
        yAxis.setLabel("Apartados");
    }

    
    public String cssProgress(float value) {
        String css = "progressrojo";
        if (value > 30 & value <= 60) {
            css = "progresstomate";
        }
        if (value > 60 & value <= 80) {
            css = "progresstomateverde";
        }
        if (value > 80 & value <= 100) {
            css = "progressverde";
        }

        return css;
    }

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
    }

    public Pantalla getPantallaResultado() {
        return pantallaResultado;
    }

    public void setPantallaResultado(Pantalla pantallaResultado) {
        this.pantallaResultado = pantallaResultado;
    }

    public CartesianChartModel getIndicadores() {
        return indicadores;
    }

    public void setIndicadores(CartesianChartModel indicadores) {
        this.indicadores = indicadores;
    }

    public BarChartModel getBarModel() {
        return barModel;
    }

    public void setBarModel(BarChartModel barModel) {
        this.barModel = barModel;
    }

    public HorizontalBarChartModel getHorizontalBarModel() {
        return horizontalBarModel;
    }

    public void setHorizontalBarModel(HorizontalBarChartModel horizontalBarModel) {
        this.horizontalBarModel = horizontalBarModel;
    }

    
}
