package classes.vo;

public class Food {
    private String name;
    private String style;
    private Double price;
    private int stock;
    private String path;

    public Food() {
    }

    public Food(String name, String style, Double price, int stock, String path) {
        this.name = name;
        this.style = style;
        this.price = price;
        this.stock = stock;
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
