/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.fatec.ads.poo;

/**
 *
 * @author Luan
 */
public class Horarios {

  private int hora, minutos, segundos;

  public Horarios(int hora, int minutos, int segundos) {
  
    if (segundos >= 0 && segundos <= 60) {
      this.segundos = segundos;
    } else {
      this.segundos = 0;
    }
    if (minutos >= 0 && minutos <= 60) {
      this.minutos = minutos;
    } else {
      this.minutos = 0;
    }
    if (hora >= 0 && hora <= 24) {
      this.hora = hora;
    } else {
      this.hora = 0;
    }
  }

  public int getSegundos() {
    return segundos;
  }

  public void setSegundos(int segundos) {
    this.segundos = segundos;
  }

  public int getMinutos() {
    return minutos;
  }

  public void setMinutos(int minutos) {
    this.minutos = minutos;
  }

  public int getHora() {
    return hora;
  }

  public void setHora(int hora) {
    this.hora = hora;
  }

  public String retornaHorario() {
    return this.hora + ":" + this.minutos + ":" + this.segundos;
  }
}
