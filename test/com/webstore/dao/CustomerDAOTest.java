package com.webstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.dao.CustomerDAO;
import com.webstore.entity.Customer;


public class CustomerDAOTest {
	
	private static CustomerDAO customerDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("Jan@gmail.com");
		customer.setFullname("Jan Belly");
		customer.setCity("Chennai");
		customer.setCountry("India");
		customer.setAddress("101 first avenue");
		customer.setPassword("secret1");
		customer.setPhone("1234568890");
		customer.setZipcode("600001");
		
		Customer savedCustomer = customerDAO.create(customer);
		
		assertTrue(savedCustomer.getCustomerId()>0);
	}

	@Test
	public void testGet() {
		Integer customerId = 1;
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}

	@Test
	public void testUpdateCustomer() {
		Integer customerId = 1;
		Customer customer = customerDAO.get(customerId);
		String fullname = "Tom cat";
		customer.setFullname(fullname);
		Customer updatedCustomer = customerDAO.update(customer);
		assertTrue(updatedCustomer.getFullname().equals(fullname));
	}
	
	@Test
	public void testDeleteCustomer() {
		Integer customerId = 1;
		customerDAO.delete(customerId);
		Customer customer = customerDAO.get(customerId);
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDAO.listAll();
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test
	public void testCount() {
		long totalCustomers = customerDAO.count();
		assertEquals(2, totalCustomers);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "tom@gmail.com";
		Customer customer = customerDAO.findByEmail(email);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginSuccess() {
		String email = "tom@gmail.com";
		String password = "secret";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginFail() {
		String email = "tom@gmail.com";
		String password = "secret1";
		
		Customer customer = customerDAO.checkLogin(email, password);
		assertNull(customer);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

}
