package bank;

import java.sql.Date;

public class Transakcja {
    public Transakcja() {
    }

    Integer ident;
    String Rachunek_numer;
    double wartosc;
    String kierunek;
    String tytul;
    String RachunekPrzeciwst;
    String nazwa;
    String adres;
    String miejscowosc;
    Date wykonana;

    public void setIdent(Integer ident) {
        this.ident = ident;
    }

    public Integer getIdent() {
        return ident;
    }

    public void setRachunek_numer(String Rachunek_numer) {
        this.Rachunek_numer = Rachunek_numer;
    }

    public String getRachunek_numer() {
        return Rachunek_numer;
    }

    public void setWartosc(double wartosc) {
        this.wartosc = wartosc;
    }

    public double getWartosc() {
        return wartosc;
    }

    public void setKierunek(String kierunek) {
        this.kierunek = kierunek;
    }

    public String getKierunek() {
        return kierunek;
    }

    public void setTytul(String tytul) {
        this.tytul = tytul;
    }

    public String getTytul() {
        return tytul;
    }

    public void setRachunekPrzeciwst(String RachunekPrzeciwst) {
        this.RachunekPrzeciwst = RachunekPrzeciwst;
    }

    public String getRachunekPrzeciwst() {
        return RachunekPrzeciwst;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getAdres() {
        return adres;
    }

    public void setMiejscowosc(String miejscowosc) {
        this.miejscowosc = miejscowosc;
    }

    public String getMiejscowosc() {
        return miejscowosc;
    }

    public void setWykonana(Date wykonana) {
        this.wykonana = wykonana;
    }

    public Date getWykonana() {
        return wykonana;
    }
}
