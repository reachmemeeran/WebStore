package com.webstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.dao.CategoryDAO;
import com.webstore.entity.Category;

public class CategoryDAOTest {

	
	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}

	@Test
	public void testCreateCategory() {
		Category newCat = new Category("Health3");
		Category category = categoryDAO.create(newCat);
		assertTrue(category!=null && category.getCategoryId()>0);
	}

	@Test
	public void testUpdateCategory() {
		Category cat = new Category("Java Core");
		cat.setCategoryId(11);
		
		Category category = categoryDAO.update(cat);
		assertEquals(cat.getName(), category.getName());
	}

	@Test
	public void testGet() {
		Integer catId = 2;
		Category cat =categoryDAO.get(catId);
		
		assertNotNull(cat);
	}

	@Test
	public void testDeleteCategory() {
		Integer catId = 29;
		categoryDAO.delete(catId);
		
		Category cat =categoryDAO.get(catId);
		assertNull(cat);
	}

	@Test
	public void testListAll() {
		List<Category> listCategory  = categoryDAO.listAll();
		assertTrue(listCategory.size()>0);
	}

	@Test
	public void testCount() {
		Integer categoryId=11;
		Category category = categoryDAO.get(categoryId);
		if (category != null){
			System.out.println(category.getName());
		}
		assertNotNull(category);
	}

	@Test
	public void testFindByName() {
		String name = "Java";
		Category category = categoryDAO.findByName(name);
		
		assertNotNull(category);
	}
}
