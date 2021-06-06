package com.webstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.webstore.dao.ReviewDAO;
import com.webstore.entity.Item;
import com.webstore.entity.Customer;
import com.webstore.entity.Review;

public class ReviewDAOTest {

	private static ReviewDAO reviewDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		
		Item item = new Item();
		item.setItemId(10);
		
		Customer customer = new Customer();
		customer.setCustomerId(12);
		
		review.setItem(item);
		review.setCustomer(customer);
		
		review.setHeadline("Vow Item");
		review.setRating(5);
		review.setComment("I have just read this item. Very good. you must give it a try. Just an excellent item it is ");
		
		Review savedReview = reviewDAO.create(review);
		
		assertTrue(savedReview.getReviewId()>0);
	}

	@Test
	public void testGet() {
		Integer reviewId=1;
		Review review = reviewDAO.get(reviewId);
		assertNotNull(review);
	}

	@Test
	public void testUpdateReview() {
		Integer reviewId=1;
		Review review = reviewDAO.get(reviewId);
		review.setHeadline("Excellent Item");
		Review updatedReview = reviewDAO.update(review);
		
		assertEquals(review.getHeadline(), updatedReview.getHeadline());
	}
	
	@Test
	public void testDeleteObject() {
		Integer reviewId=2;
		reviewDAO.delete(reviewId); 
		
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReview = reviewDAO.listAll();
		
		for(Review review : listReview) {
			System.out.println(review.getReviewId()+" - "+ review.getItem().getTitle()
					+" - "+ review.getCustomer().getFullname() +" - "+ review.getHeadline());
		}
		assertTrue(listReview.size()>0);
	}

	@Test
	public void testCount() {
		long totalReviews = reviewDAO.count();
		System.out.println("totalReview: "+totalReviews);
		assertTrue(totalReviews >0 );
	}
	
	@Test
	public void testFindByCustomerAndItemNotFound() {
		Integer customerId = 100;
		Integer itemId = 500;
		
		Review result = reviewDAO.findByCustomerAndItem(customerId, itemId);
		
		assertNull(result);
	}
	
	@Test
	public void testFindByCustomerAndItemFound() {
		Integer customerId = 15;
		Integer itemId = 10;
		
		Review result = reviewDAO.findByCustomerAndItem(customerId, itemId);
		
		System.out.println("review customer" + result.getItem().getTitle());
		
		assertNotNull(result);
	}

}
