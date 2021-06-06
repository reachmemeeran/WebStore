package com.webstore.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.webstore.entity.Item;

public class ItemDAO extends JpaDAO<Item> implements GenericDAO<Item> {

	public ItemDAO() {
	}

	@Override
	public Item create(Item item) {
		item.setLastUpdateTime(new Date());
		return super.create(item);
	}

	@Override
	public Item update(Item item) {
		item.setLastUpdateTime(new Date());
		return super.update(item);
	}

	@Override
	public Item get(Object itemId) {
		return super.find(Item.class, itemId);
	}

	@Override
	public void delete(Object itemId) {
		super.delete(Item.class, itemId);
	}

	@Override
	public List<Item> listAll() {
		return super.findWithNamedQuery("Item.findAll");
	}

	public Item findByTitle(String title) {
		List<Item> result = super.findWithNamedQuery("Item.findByTitle","title",title);
		
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public List<Item> listByCategory(int categoryId){
		return super.findWithNamedQuery("Item.findByCategory","catId",categoryId);
	}
	
	public List<Item> listFirstCategory(){
		return super.findWithNamedQuery("Item.listFirstCategory",0,4);
	}
	
	public List<Item> listNewItems(){
		return super.findWithNamedQuery("Item.listNew",0,4);
	}
	
	public List<Item> search(String keyword){
		return super.findWithNamedQuery("Item.search","keyword",keyword);
	}
	
	@Override
	public long count() {
		return super.countWithNamedQuery("Item.countAll");
	}

	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Item.countByCategory","catId",categoryId);
	}
	
	public List<Item> listBestSellingItems() {
		return super.findWithNamedQuery("OrderDetail.bestSelling", 0, 4);
	}
	
	public List<Item> listMostFavoredItems() {
		List<Item> mostFavoredItems = new ArrayList<>();
		
		List<Object[]> result = super.findWithNamedQueryObjects("Review.mostFavoredItems", 0, 4);
		System.out.println("result --> "+result.size());
		
		if (!result.isEmpty()) {
			for (Object[] elements : result) {
				Item item = (Item) elements[0];
				mostFavoredItems.add(item);
			}
		} 
		
		System.out.println("mostFavoredItems --> "+mostFavoredItems.size());
		
		return mostFavoredItems;
	}
}
