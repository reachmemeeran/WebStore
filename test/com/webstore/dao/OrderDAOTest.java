package com.webstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.dao.OrderDAO;
import com.webstore.entity.Item;
import com.webstore.entity.Order;
import com.webstore.entity.Customer;
import com.webstore.entity.OrderDetail;

public class OrderDAOTest {

	private static OrderDAO orderDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateItemOrder() {
		Order order = new Order();
		Customer customer = new Customer();
		customer.setCustomerId(7);
		
		order.setCustomer(customer);
		order.setRecipientName("Meeran");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 South Street, New York, USA");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
		
		Item item = new Item(2);
		orderDetail.setItem(item);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(81.9f);
		orderDetail.setItemOrder(order);

		orderDetails.add(orderDetail);
		order.setOrderDetails(orderDetails);
		Order savedOrder = orderDAO.create(order);
		
		assertTrue(savedOrder != null && savedOrder.getOrderDetails().size() > 0);
	}

	@Test
	public void testCreateItemOrder2() {
		Order order = new Order();
		Customer customer = new Customer();
		customer.setCustomerId(13);
		
		order.setCustomer(customer);
		order.setRecipientName("Meeran");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 South Street, Saigon, Vietnam");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail1 = new OrderDetail();
		
		Item item1 = new Item(7);
		orderDetail1.setItem(item1);
		orderDetail1.setQuantity(2);
		orderDetail1.setSubtotal(57.58f);
		orderDetail1.setItemOrder(order);

		orderDetails.add(orderDetail1);

		order.setOrderDetails(orderDetails);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() > 0);
	}
	
	@Test
	public void testUpdateItemOrderShippingAddress() {
		Integer orderId = 8;
		Order order = orderDAO.get(orderId);
		order.setShippingAddress("New Shipping Address");
		
		orderDAO.update(order);
		
		Order updatedOrder = orderDAO.get(orderId);
		assertEquals(order.getShippingAddress(), updatedOrder.getShippingAddress());
	}

	@Test
	public void testUpdateItemOrderDetail() {
		Integer orderId = 8;
		Order order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getItem().getItemId() == 9) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(122.85f);
			}
			
		}
				
		orderDAO.update(order);

		int expectedQuantity = 3;
		float expectedSubtotal = 122.85f;
		
		int actualQuantity = 0;
		float actualSubtotal = 0.0f;
		
		iterator = order.getOrderDetails().iterator();
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getItem().getItemId() == 9) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
			
		}
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
	}
	
	@Test
	public void testGet() {
		Integer orderId = 8;
		Order order = orderDAO.get(orderId);
		System.out.println(order.getRecipientName());
		System.out.println(order.getRecipientPhone());
		System.out.println(order.getShippingAddress());
		System.out.println(order.getStatus());
		System.out.println(order.getTotal());
		System.out.println(order.getPaymentMethod());
	
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId = 9;
		Integer customerId = 99;
		
		Order order = orderDAO.get(orderId, customerId);
		
		assertNull(order);
	}

	@Test
	public void testGetByIdAndCustomerNotNull() {
		Integer orderId = 9;
		Integer customerId = 13;
		
		Order order = orderDAO.get(orderId, customerId);
		
		assertNotNull(order);
	}

	@Test
	public void testDeleteOrder() {
		int orderId = 6;
		orderDAO.delete(orderId);
		
		Order order = orderDAO.get(orderId);
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<Order> listOrders = orderDAO.listAll();
		
		for(Order order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFullname() + 
					" - " + order.getStatus());
			for(OrderDetail detail : order.getOrderDetails()) {
				Item item = detail.getItem();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + item.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		
		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testListByCustomerNoOrders() {
		Integer customerId = 99;
		List<Order> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	
	@Test
	public void testListByCustomerHaveOrders() {
		Integer customerId = 15;
		List<Order> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.size() > 0);
	}
	
	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(2, totalOrders);
	}

	@Test
	public void testListMostRecentSales() {
		List<Order> recentOrders = orderDAO.listMostRecentSales();
		
		assertEquals(3, recentOrders.size());
	}
}