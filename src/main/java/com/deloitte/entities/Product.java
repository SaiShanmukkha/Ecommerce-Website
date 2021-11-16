package com.deloitte.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT_TB")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(length=10, name= "product_id")
	private int productId;
	@Column(name="name")
	private String productName;
	@Column(name= "image")
	private String productImage;
	@Column(name= "description")
	private String productDescription;
	@Column(name= "price")
	private Integer productPrice;
	@Column(name= "quantity")
	private Integer productQty;
	@Column(name= "discount")
	private Integer productDiscount;
	
	
	@ManyToOne
	private Category category;

	
	

	public Product(String productName, String productImage, String productDescription, Integer productPrice,
			Integer productQty, Integer productDiscount, Category category) {
		super();
		this.productName = productName;
		this.productImage = productImage;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productQty = productQty;
		this.productDiscount = productDiscount;
		this.category = category;
	}

	public Product() {
		super();
	}

	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductImage() {
		return productImage;
	}


	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}


	public String getProductDescription() {
		return productDescription;
	}


	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}


	public Integer getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}


	public Integer getProductQty() {
		return productQty;
	}


	public void setProductQty(Integer productQty) {
		this.productQty = productQty;
	}


	public Integer getProductDiscount() {
		return productDiscount;
	}


	public void setProductDiscount(Integer productDiscount) {
		this.productDiscount = productDiscount;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}
	
	public int getDiscountedPrice() {
		int d = (this.productPrice*this.productDiscount)/100;
		return (this.productPrice-d);
	}
	
}
