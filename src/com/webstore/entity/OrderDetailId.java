package com.webstore.entity;
// Generated 27-Nov-2020, 6:52:12 AM by Hibernate Tools 5.2.12.Final

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * OrderDetailId generated by hbm2java
 */
@Embeddable
public class OrderDetailId implements java.io.Serializable {

	private Item item;
	private Order order;
	
	public OrderDetailId() {
	}


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "item_id", insertable = false, updatable = false, nullable = false)
	public Item getItem() {
    	return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;	
    }
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", insertable = false, updatable = false, nullable = false) 
    public Order getItemOrder() {
    	return this.order;
    }
    
    public void setItemOrder(Order order) {
    	this.order = order;
    }
    
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((item == null) ? 0 : item.hashCode());
		result = prime * result + ((order == null) ? 0 : order.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailId other = (OrderDetailId) obj;
		if (item == null) {
			if (other.item != null)
				return false;
		} else if (!item.equals(other.item))
			return false;
		if (order == null) {
			if (other.order != null)
				return false;
		} else if (!order.equals(other.order))
			return false;
		return true;
	}

}