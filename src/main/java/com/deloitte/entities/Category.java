package com.deloitte.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CATEGORY_TB")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 10, name = "categoryId")
	private int categoryId;
	@Column(length = 100, name = "title")
	private String title;
	@Column(length = 500, name = "description")
	private String description;
	@OneToMany
	private List<Product> products = new ArrayList<Product>();

	public Category(int categoryId, String title, String description, List<Product> products) {
		super();
		this.categoryId = categoryId;
		this.title = title;
		this.description = description;
		this.products = products;
	}

	public Category(String title, String description, List<Product> products) {
		super();
		this.title = title;
		this.description = description;
		this.products = products;
	}

	public Category(String title, String description) {
		super();
		this.title = title;
		this.description = description;
	}

	public Category() {
		super();
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public List<Product> getProducts() {
		return products;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", title=" + title + ", description=" + description
				+ ", products=" + products + "]";
	}

}
