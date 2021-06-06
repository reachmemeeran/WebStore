package com.webstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.dao.ItemDAO;
import com.webstore.entity.Item;
import com.webstore.entity.Category;

public class ItemDAOTest {
	
	private static ItemDAO itemDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		itemDAO = new ItemDAO();
	}

	@Test
	public void testCreateItem() throws ParseException, IOException {
		Item newItem = new Item();
		
		Category category = new Category("Advanced Java");
		category.setCategoryId(2);
		newItem.setCategory(category );
		
		newItem.setTitle("Effective Java (2nd Edition)");
		newItem.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newItem.setPrice(38.87f);
		
		String imagePath="C:\\Me Support\\ecommerce project\\dummy-data-items\\items\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newItem.setImage(imageBytes);
		
		Item createdItem = itemDAO.create(newItem);
		
		assertTrue(createdItem.getItemId()>0);
		
	}
	
	@Test
	public void testCreateSecondItem() throws ParseException, IOException {
		Item newItem = new Item();
		
		Category category = new Category("Java Frameworks");
		category.setCategoryId(4);
		newItem.setCategory(category );
		
		newItem.setTitle("Play Framework Essentials");
		newItem.setDescription("An intuitive guide to creating easy-to-build scalable web applications using the Play framework\r\n"
				+ "About This Item\r\n"
				+ "Master the complexity of designing a modern and scalable Web application by leveraging the Play framework stack\r\n"
				+ "The key concepts of the framework are illustrated with both Scala and Java code examples\r\n"
				+ "A step-by-step guide with code examples based on a sample application built from the ground up, providing the practical skills required to develop Scala- or Java-based applications.\r\n"
				+ "Who This Item Is For\r\n"
				+ "This item targets Java and Scala developers who already have some experience in web development and who want to master Play framework quickly and efficiently. This item assumes you have a good level of knowledge and understanding of efficient Java and Scala code.\r\n"
				+ "");
		newItem.setPrice(29.99f);
		
		
		String imagePath="C:\\Me Support\\ecommerce project\\dummy-data-for-items\\dummy-data-for-items\\Item 11 - Play Framework Essentials.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newItem.setImage(imageBytes);
		
		Item createdItem = itemDAO.create(newItem);
		
		assertTrue(createdItem.getItemId()>0);
		
	}
	
	@Test
	public void testUpdateItem() throws ParseException, IOException {
		Item existItem = new Item();
		existItem.setItemId(1);
		
		Category category = new Category("Java Core");
		category.setCategoryId(1);
		existItem.setCategory(category );
		
		existItem.setTitle("Effective Java (2nd Edition)");
		existItem.setDescription("New coverage of generics, enums, annotations, autoboxing");
		existItem.setPrice(40f);
		
		
		String imagePath="C:\\Me Support\\ecommerce project\\dummy-data-items\\items\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existItem.setImage(imageBytes);
		
		Item updatedItem = itemDAO.update(existItem);
		
		assertEquals(updatedItem.getTitle(), "Effective Java (2nd Edition)");
		
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteItemFail() {
		Integer itemId=10;
		itemDAO.delete(itemId);
		//assertTrue(true);
	}
	
	@Test
	public void testDeleteItemSuccess() {
		Integer itemId=1;
		itemDAO.delete(itemId);
		assertTrue(true);
	}
	
	@Test
	public void testGetItemFail() {
		Integer itemId=99;
		Item item = itemDAO.get(itemId);
		assertNull(item);
	}
	
	@Test
	public void testGetItemSuccess() {
		Integer itemId=2;
		Item item = itemDAO.get(itemId);
		assertNotNull(item);
	}
	
	@Test
	public void testListAll() {
		List<Item> listItems = itemDAO.listAll();
		for(Item item: listItems) {
			System.out.println(item.getTitle());
		}
		//assertTrue(listItems.size()>0);
		assertFalse(listItems.isEmpty());
	}
	
	@Test
	public void testFindByTitleNotExists() {
		String title ="No Item with this title";
		Item item = itemDAO .findByTitle(title);
		
		assertNull(item);
	}
	
	@Test
	public void testFindByTitleExists() {
		String title ="Effective Java (2nd Edition)";
		Item item = itemDAO .findByTitle(title);
		System.out.println(item.getPrice());
		assertNotNull(item);
	}
	
	@Test
	public void testCountAll() {
		long totalitem = itemDAO.count();
		System.out.println(totalitem);
		assertEquals(2, totalitem);
	}
	
	@Test
	public void testSearchItemByTitle() {
		String keyword="Java";
		List<Item> result = itemDAO.search(keyword);
		
		assertEquals(6, result.size());
	}
	
	@Test
	public void testSearchItemByAuthor() {
		String keyword="Brian";
		List<Item> result = itemDAO.search(keyword);
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testSearchItemBydescription() {
		String keyword="Sun Microsystems";
		List<Item> result = itemDAO.search(keyword);
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testListByCategory() {
		int categoryId=1;
		List<Item> listItems = itemDAO.listByCategory(categoryId);
		
		assertTrue(listItems.size()>0);
	}
	
	@Test
	public void testListNewItems() {
		List<Item> listNewItems = itemDAO.listNewItems();
		
		for(Item aItem : listNewItems) {
			System.out.println(aItem.getTitle() );
		}
		//assertTrue(listNewItems.size()>0);
		assertEquals(4,listNewItems.size());
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		itemDAO.close();
	}
	
}
