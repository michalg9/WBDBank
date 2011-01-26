package bank;

public class Client {
    public Client(){
    }
    
    private Integer ident;
    private String nazwa;
    private String miejscowosc;
    private String kodPoczt;
    private String adres;
    private String typ;
    private String info;

    public void setIdent(Integer ident) {
        this.ident = ident;
    }

    public Integer getIdent() {
        return ident;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setMiejscowosc(String miejscowosc) {
        this.miejscowosc = miejscowosc;
    }

    public String getMiejscowosc() {
        return miejscowosc;
    }

    public void setKodPoczt(String kodPoczt) {
        this.kodPoczt = kodPoczt;
    }

    public String getKodPoczt() {
        return kodPoczt;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getAdres() {
        return adres;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public String getTyp() {
        return typ;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getInfo() {
        return info;
    }
}
