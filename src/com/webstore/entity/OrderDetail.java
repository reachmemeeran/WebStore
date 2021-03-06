package com.webstore.entity;
// Generated 27-Nov-2020, 6:52:12 AM by Hibernate Tools 5.2.12.Final

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * OrderDetail generated by hbm2java
 */
@Entity
@Table(name = "order_detail", catalog = "webstoredb")
@NamedQueries({
	@NamedQuery(name = "OrderDetail.countByItem", query = "SELECT COUNT(*) FROM OrderDetail od WHERE od.item.itemId=:itemId"),
	@NamedQuery(name = "OrderDetail.bestSelling", query = "SELECT od.item FROM OrderDetail od GROUP by od.item.itemId "
			+ "ORDER BY SUM(od.quantity) DESC")
})

public class OrderDetail implements java.io.Serializable {

	private OrderDetailId id = new OrderDetailId();
	private Item item;
	private Order order;
	private int quantity;
	private float subtotal;	

	public OrderDetail() {
	}

	public OrderDetail(OrderDetailId id) {
		this.id = id;
	}

	public OrderDetail(OrderDetailId id, Item item, Order order, int quantity, float subtotal) {
		this.id = id;
		this.item = item;
		this.order = order;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}

	@EmbeddedId

	@AttributeOverrides({ @AttributeOverride(name = "orderId", column = @Column(name = "order_id", nullable = false)),
			@AttributeOverride(name = "itemId", column = @Column(name = "item_id", nullable = false))})
	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "item_id", insertable = false, updatable = false, nullable = false)
	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
		this.id.setItem(item);
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", insertable = false, updatable = false, nullable = false)
	public Order getItemOrder() {
		return this.order;
	}

	public void setItemOrder(Order order) {
		this.order = order;
		this.id.setItemOrder(order);
	}
	
	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "subtotal", nullable = false, precision = 12, scale = 0)
	public float getSubtotal() {
		return this.subtotal;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}	

}