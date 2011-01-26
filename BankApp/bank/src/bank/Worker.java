package bank;

public class Worker {
    public Worker() {
    }
    
  private Integer ident;
  private Integer przelozony;
  private String imie;
  private String nazwisko;
  private String stanowisko;
  private String passw;
  private String pensja;

    public void setIdent(Integer ident) {
        this.ident = ident;
    }

    public Integer getIdent() {
        return ident;
    }

    public void setPrzelozony(Integer przelozony) {
        this.przelozony = przelozony;
    }

    public Integer getPrzelozony() {
        return przelozony;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public String getImie() {
        return imie;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setStanowisko(String stanowisko) {
        this.stanowisko = stanowisko;
    }

    public String getStanowisko() {
        return stanowisko;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }

    public String getPassw() {
        return passw;
    }

    public void setPensja(String pensja) {
        this.pensja = pensja;
    }

    public String getPensja() {
        return pensja;
    }
}
