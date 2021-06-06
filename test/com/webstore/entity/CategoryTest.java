package com.webstore.entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.webstore.entity.Category;

public class CategoryTest {

	public static void main(String[] args) {
		Category newCat = new Category("Advanced Java");

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ItemStoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		
		entityManager.getTransaction().begin();
		
		entityManager.persist(newCat);
		
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();
		
		System.out.println("A user object was persisted");
	}

}
