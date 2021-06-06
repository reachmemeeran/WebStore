package com.webstore.entity;

import static org.junit.Assert.assertEquals;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import com.webstore.entity.Item;
import com.webstore.entity.Review;

public class RatingTest {

	@Test
	public void testAverageRating1() {
		Item item = new Item();
				
		Set<Review> reviews = new HashSet<>();
		Review review1 = new Review();
		review1.setRating(5);
		reviews.add(review1);
		
		item.setReviews(reviews);
		
		float averageRating = item.getAverageRating();
		
		assertEquals(5.0, averageRating,0.0);
	}
	
	@Test
	public void testAverageRating2() {
		Item item = new Item();
		
		float averageRating = item.getAverageRating();
		
		assertEquals(0.0, averageRating,0.0);
	}

	@Test
	public void testAverageRating3() {
		Item item = new Item();
		
		Set<Review> reviews = new HashSet<>();
		Review review1 = new Review();
		review1.setRating(5);
		reviews.add(review1);
		
		Review review2 = new Review();
		review2.setRating(4);
		reviews.add(review2);
		
		Review review3 = new Review();
		review3.setRating(3);
		reviews.add(review3);
		
		item.setReviews(reviews);
		
		float averageRating = item.getAverageRating();
		
		assertEquals(4.0, averageRating,0.0);
	}
	
	@Test
	public void testRatingString1(){
		float averageRating = 0.0f;
		Item item = new Item();
		String actual = item.getRatingString(averageRating);
		
		String expected = "off,off,off,off,off";
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testRatingString2(){
		float averageRating = 5.0f;
		Item item = new Item();
		String actual = item.getRatingString(averageRating);
		
		String expected = "on,on,on,on,on";
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testRatingString3(){
		float averageRating = 3.0f;
		Item item = new Item();
		String actual = item.getRatingString(averageRating);
		
		String expected = "on,on,on,off,off";
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testRatingString4(){
		float averageRating = 4.5f;
		Item item = new Item();
		String actual = item.getRatingString(averageRating);
		
		String expected = "on,on,on,on,half";
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testRatingString5(){
		float averageRating = 3.6f;
		Item item = new Item();
		String actual = item.getRatingString(averageRating);
		
		String expected = "on,on,on,half,off";
		
		assertEquals(expected, actual);
	}

}
