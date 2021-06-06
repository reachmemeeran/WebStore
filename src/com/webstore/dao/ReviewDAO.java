package com.webstore.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.webstore.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements GenericDAO<Review> {

	@Override
	public Review create(Review review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}
	
	@Override
	public Review get(Object reviewId) {
		return super.find(Review.class, reviewId);
	}

	@Override
	public void delete(Object reviewId) {
		super.delete(Review.class, reviewId);
	}

	@Override
	public List<Review> listAll() {
		return super.findWithNamedQuery("Review.listAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Review.countAll");
	}
	
	public long countByItem(int itemId) {
		return super.countWithNamedQuery("Review.countByitem","itemId", itemId);
	}
	
	public long countByCustomer(int customerId) {
		return super.countWithNamedQuery("Review.countByCustomer", "customerId", customerId);
	}
	
	public Review findByCustomerAndItem(Integer customerId, Integer itemId) {
		Map<String,Object> parameters = new HashMap<>();
		parameters.put("customerId", customerId);
		parameters.put("itemId", itemId);
		
		List<Review> result = super.findWithNamedQuery("Review.findByCustomerAndItem", parameters);
		
		if(!result.isEmpty()) {
			return result.get(0);
		}
		
		return null;
	}
	
	public List<Review> listMostRecentReviews() {
		return super.findWithNamedQuery("Review.listAll", 0, 5);
	}

}
