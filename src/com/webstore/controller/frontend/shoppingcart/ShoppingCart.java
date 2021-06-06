package com.webstore.controller.frontend.shoppingcart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.webstore.entity.Item;

public class ShoppingCart {
	private Map<Item, Integer> cart = new HashMap<>();
	
	public void addItem(Item item) {
		if(cart.containsKey(item)) {
			Integer quantity = cart.get(item)+1;
			cart.put(item, quantity);
		} else {
			cart.put(item, 1);
		}
	}
	
	public void removeItem(Item item) {
		cart.remove(item);
	}
	
	public int getTotalQuantity() {
		int total = 0;
		
		Iterator<Item> iterator = cart.keySet().iterator();
		
		while (iterator.hasNext()) {
			Item next = iterator.next();
			Integer quantity = cart.get(next);
			total += quantity;
		}
		
		return total;
	}
	
	public float getTotalAmount() {
		float total = 0.0f;
		
		Iterator<Item> iterator = cart.keySet().iterator();
		
		while (iterator.hasNext()) {
			Item item = iterator.next();
			Integer quantity = cart.get(item);
			double subTotal = quantity* item.getPrice();
			total += subTotal;
		}
		
		return total;
	}
	
	public void updateCart(int[] itemIds, int[] quantities) {
		for(int i=0; i< itemIds.length; i++) {
			Item key = new Item(itemIds[i]);
			Integer value = quantities[i];
			cart.put(key, value);
		}
	}
	
	public void clear() {
		cart.clear();
	}
	
	public int getTotalItems() {
		return cart.size();
	}
	
	public Map<Item,Integer> getItems(){
		return this.cart;
	}
}
