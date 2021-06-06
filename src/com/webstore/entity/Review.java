package com.webstore.entity;
// Generated 27-Nov-2020, 6:52:12 AM by Hibernate Tools 5.2.12.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * Review generated by hbm2java
 */
@Entity
@Table(name = "review", catalog = "webstoredb")
@NamedQueries({
	@NamedQuery(name = "Review.listAll", query = "Select r from Review r Order by r.reviewTime DESC"),
    @NamedQuery(name = "Review.countAll", query = "Select COUNT(*) from Review r"),
    @NamedQuery(name = "Review.countByItem", query = "SELECT COUNT(b) FROM Review r JOIN " + 
                 "Item b ON r.item.itemId = b.itemId AND b.itemId = :itemId"),
    @NamedQuery(name = "Review.countByCustomer", query = "SELECT COUNT(r.reviewId) FROM Review r WHERE r.customer.customerId =:customerId"),
    @NamedQuery(name = "Review.findByCustomerAndItem", query = "SELECT r FROM Review r WHERE r.customer.customerId = :customerId"
    + " AND r.item.itemId =:itemId"),
    @NamedQuery(name = "Review.mostFavoredItems", query = "SELECT r.item, COUNT(r.item.itemId) AS ReviewCount, AVG(r.rating) as AvgRating FROM Review r "
			+ "GROUP BY r.item.itemId HAVING AVG(r.rating) >= 4.0 "
			+ "ORDER BY ReviewCount DESC, AvgRating DESC") 
})
public class Review implements java.io.Serializable {

	private int reviewId;
	private Item item;
	private Customer customer;
	private int rating;
	private String headline;
	private String comment;
	private Date reviewTime;

	public Review() {
	}

	public Review(int reviewId, Item item, Customer customer, int rating, String headline, String comment,
			Date reviewTime) {
		this.reviewId = reviewId;
		this.item = item;
		this.customer = customer;
		this.rating = rating;
		this.headline = headline;
		this.comment = comment;
		this.reviewTime = reviewTime;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "review_id", unique = true, nullable = false)
	public int getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "item_id", nullable = false)
	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", nullable = false)
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(name = "rating", nullable = false)
	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	@Column(name = "headline", nullable = false, length = 128)
	public String getHeadline() {
		return this.headline;
	}

	public void setHeadline(String headline) {
		this.headline = headline;
	}

	@Column(name = "comment", nullable = false, length = 500)
	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "review_time", nullable = false, length = 19)
	public Date getReviewTime() {
		return this.reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	@Transient
	public String getStars() {
		String result = "";
		
		int numberOfStartsOn = (int) rating;
		
		for(int i=1; i<=numberOfStartsOn; i++) {
			result += "on,";
		}
		
		int next = numberOfStartsOn +1 ;
		
		for(int j= next; j<=5; j++) {
			result += "off,";
		}
		
		return result.substring(0,result.length()-1);
	}
}
