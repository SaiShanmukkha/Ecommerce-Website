package com.deloitte.entities;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_tb")
public class Order {
	Order() {

	}

	@Id
	@Column(length = 30, name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int order_id;

	@Column(name = "orderNbr", length = 30)
	private String orderNbr;

	@Column(length = 10, name = "userId")
	private int userId;

	@Column(name = "orderDate")
	private Date orderdate;

	public Order(int order_id, String orderNbr, int userId, Date orderdate) {
		super();
		this.order_id = order_id;
		this.orderNbr = orderNbr;
		this.userId = userId;
		this.orderdate = orderdate;
	}

	public Order(String orderNbr, int userId, Date orderdate) {
		super();
		this.orderNbr = orderNbr;
		this.userId = userId;
		this.orderdate = orderdate;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getOrderNbr() {
		return orderNbr;
	}

	public void setOrderNbr(String orderNbr) {
		this.orderNbr = orderNbr;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", orderNbr=" + orderNbr + ", userId=" + userId + ", orderdate="
				+ orderdate + "]";
	}
	
	
	

}
