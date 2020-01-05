
package model;


public class Product {
    private String pId;
    private String pName;
    private int pPrice;
    private int ptQuant;
    
    public Product(String pId, String pName, int pPrice,int ptQuant) {
        this.pId = pId;
        this.pName = pName;
        this.pPrice = pPrice;
        this.ptQuant=ptQuant;
    }
    public Product()
    {
    	
    }
    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }
   

    public int getptQuant()
    {
    	return ptQuant;
    }

    public void setptQuant(int ptQuant){
    	this.ptQuant=ptQuant;
    }
    
}
