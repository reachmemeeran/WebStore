package com.webstore.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.webstore.entity.Users;

public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("meeran2@gmail.com");
		user1.setFullName("Meeran2f");
		user1.setPassword("meeran2p");
		
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ItemStoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(user1);
		
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("A user object was persisted");
	}

}
