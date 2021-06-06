package com.webstore.controller.frontend.shoppingcart;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.controller.frontend.shoppingcart.ShoppingCart;
import com.webstore.dao.ItemDAO;
import com.webstore.entity.Item;

public class ShoppingCartTest {
	
	private static ShoppingCart cart;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		cart = new ShoppingCart();
		Item item = new Item(1);
		item.setPrice(10);
		
		cart.addItem(item);
		cart.addItem(item);
	}
	
	@Test
	public void testAddItem() {
		
		Map<Item, Integer> items = cart.getItems();
		int quantity = items.get(new Item(1));
		
		assertEquals(2, quantity);
	}
	
	@Test
	public void testRemoveItem() {
		cart.removeItem(new Item(1));
		
		assertTrue(cart.getItems().isEmpty());
	}
	
	@Test
	public void testRemoveItem2() {
		Item item2 = new Item(2);
		cart.addItem(item2);
		
		cart.removeItem(new Item(2));
		
		assertNull(cart.getItems().get(item2));
	}
	
	@Test
	public void testGetTotalQuantity() {
		Item item3 = new Item(3);
		cart.addItem(item3);
		cart.addItem(item3);
		cart.addItem(item3);
		
		assertEquals(5, cart.getTotalQuantity());
	}

	@Test
	public void testGetTotalAmount1() {
		ShoppingCart cart = new ShoppingCart();
		assertEquals(0.0f, cart.getTotalAmount(),0.0f);
	}
	
	@Test
	public void testGetTotalAmount2() {
		assertEquals(20.0f, cart.getTotalAmount(),0.0f);
	}
	
	@Test
	public void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Item item1 = new Item(1);
		Item item2 = new Item(2);
		
		cart.addItem(item1);
		cart.addItem(item2);
		
		int[] itemIds = {1,2};
		int[] quantities = {3,4};
		
		cart.updateCart(itemIds, quantities);
		
		assertEquals(7, cart.getTotalQuantity());
	}
	
	@Test
	public void testClear() {
		cart.clear();
		assertEquals(0, cart.getTotalQuantity());
	}
}
