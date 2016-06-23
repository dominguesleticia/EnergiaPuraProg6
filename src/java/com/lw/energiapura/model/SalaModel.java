/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lw.energiapura.model;

/**
 *
 * @author Leticia
 */
public class SalaModel {
    
    private int numSala;
    private int andar;
    private String bloco;

    public SalaModel() {
    }

    public SalaModel(int _numSala, int _andar, String _bloco) {
        this.numSala = _numSala;
        this.andar = _andar;
        this.bloco = _bloco;
    }

    public int getNumSala() {
        return numSala;
    }

    public void setNumSala(int numSala) {
        this.numSala = numSala;
    }

    public int getAndar() {
        return andar;
    }

    public void setAndar(int andar) {
        this.andar = andar;
    }

    public String getBloco() {
        return bloco;
    }

    public void setBloco(String bloco) {
        this.bloco = bloco;
    }    
}
