package com.webstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.dao.UserDAO;
import com.webstore.entity.Users;

public class UserDAOTest {

	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setupClass() throws Exception {
		userDAO = new UserDAO();
	}

	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("admin@webstore.com");
		user1.setFullName("Meeran Mohamed");
		user1.setPassword("admin");
		
		user1 = userDAO.create(user1);
		
		assertTrue(user1.getUserId()>0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldNotSet() {
		Users user1 = new Users();
		user1 = userDAO.create(user1);

	}
	
	@Test
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(22);
		user.setEmail("meeran11@gmail.com");
		user.setFullName("Meeran11 f");
		user.setPassword("SECRET");
		
		userDAO.update(user);
		String expected = "SECRET";
		String actual = user.getPassword();
		assertEquals(expected, actual);
	}
	
	@Test
	public void testGetUsersFound() {
		Integer userId=19;
		Users user = userDAO.get(userId);
		if (user != null){
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}
	
	@Test
	public void testGetUsersNotFound() {
		Integer userId=1;
		Users user = userDAO.get(userId);
		if (user != null){
			System.out.println(user.getEmail());
		}
		assertNull(user);
	}
	
	@Test
	public void testDeleteUser() {
		Integer userId=25;
		userDAO.delete(userId);
		Users user = userDAO.get(userId);
		assertNull(user);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistUser() {
		Integer userId=5;
		userDAO.delete(userId);
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		for(Users user: listUsers) {
			System.out.println(user.getEmail());
		}
		assertTrue(listUsers.size()>0);
	}
	
	@Test
	public void testCountAll() {
		long totalUsers = userDAO.count();
		System.out.println(totalUsers);
		assertEquals(6, totalUsers);
	}
	
	@Test
	public void testCheckLoginSuccess() {
		String email="meeran2@gmail.com";
		String password = "meeran2p";
		boolean loginResult = userDAO.checkLogin(email, password);
		assertTrue(loginResult);
	}
	
	@Test
	public void testCheckLoginFail() {
		String email="meeran232@gmail.com";
		String password = "meeran2p";
		boolean loginResult = userDAO.checkLogin(email, password);
		assertFalse(loginResult);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "meeran2@gmail.com";
		Users user = userDAO.findByEmail(email);
		assertNotNull(user);
	}


	@AfterClass
	public static void tearDownClass() throws Exception {
		userDAO.close();
	}
}
