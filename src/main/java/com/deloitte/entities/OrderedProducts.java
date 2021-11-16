package com.deloitte.entities;


import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ORDER_PRODUCTS_DB")
public class OrderedProducts {

      public OrderedProducts()
      {
           
      }
      
      @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      private int id;
      
      private int discountedPrice;
      
      private int quantity;
      
      @ManyToOne
      @JoinColumn(name="ORDER_ID",nullable = false,foreignKey = @ForeignKey(name = "ORDER_DETAILS"))
      private Order order;
      
      @ManyToOne
      @JoinColumn(name="PRODUCT_ID",nullable = false,foreignKey = @ForeignKey(name = "PRODUCT_DETAILS"))
      private Product product;
      
      
      
      

      public OrderedProducts(int id, int discountedPrice, int quantity, Order order, Product product) {
		super();
		this.id = id;
		this.discountedPrice = discountedPrice;
		this.quantity = quantity;
		this.order = order;
		this.product = product;
	}

	public int getId() {
           return id;
      }

      public void setId(int id) {
           this.id = id;
      }

      public int getDiscountedPrice() {
           return discountedPrice;
      }

      public void setDiscountedPrice(int discountedPrice) {
           this.discountedPrice = discountedPrice;
      }

      public int getQuantity() {
           return quantity;
      }

      public void setQuantity(int quantity) {
           this.quantity = quantity;
      }

      public Order getOrder() {
           return order;
      }

      public void setOrder(Order order) {
           this.order = order;
      }

      public Product getProduct() {
           return product;
      }

      public void setProduct(Product product) {
           this.product = product;
      }

      @Override
      public String toString() {
           return "OrderProducts [id=" + id + ", discountedPrice=" + discountedPrice + ", quantity=" + quantity
                      + ", order=" + order + ", product=" + product + "]";
      }
}
