package com.webstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webstore.dao.CustomerDAO;
import com.webstore.dao.HashGenerator;
import com.webstore.dao.OrderDAO;
import com.webstore.dao.ReviewDAO;
import com.webstore.entity.Customer;

public class CustomerServices extends CommonUtility {
	
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}
	
	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();		
		request.setAttribute("listCustomer", listCustomer);
		forwardToPage("customer_list.jsp", message, request, response);
	}
	
	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}
	
	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		
		if (existCustomer != null) {
			String message = "Could not create new customer: the email "
					+ email + " is already registered by another customer.";
			listCustomers(message);
			
		} else {
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);
			
			String message = "New customer has been created successfully.";
			listCustomers(message);
			
		}
		
	}
	
	private void updateCustomerFieldsFromForm(Customer customer) {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		
		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}
		
		customer.setFullname(fullname);
		
		if (password != null & !password.isEmpty()) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			customer.setPassword(encryptedPassword);				
		}		
		
		customer.setPhone(phone);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setZipcode(zipcode);
		customer.setCountry(country);		
	}

 	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);
		String message = "";
		
		if (existCustomer != null) {
			message = "Could not register. The email "
					+ email + " is already registered by another customer.";
		} else {
			
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);			
			customerDAO.create(newCustomer);
			
			message = "You have registered successfully! Thank you.<br/>"
					+ "<a href='login'>Click here</a> to login";			
		}
		
		showMessageFrontend(message, request, response);
	}	
	
	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer == null) {
			String message = "Could not find customer with ID " + customerId;
			showMessageBackend(message, request, response);
		} else {
			// set password as null to make the password is left blank by default
			// if left blank, the customer's password won't be updated
			// this is to work with the encrypted password feature
			customer.setPassword(null);
			request.setAttribute("customer", customer);		
			forwardToPage("customer_form.jsp", request, response);			
		}		
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		
		Customer customerByEmail = customerDAO.findByEmail(email);
		String message = null;
		
		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message = "Could not update the customer ID " + customerId
					+ "because there's an existing customer having the same email.";
			
		} else {
			
			Customer customerById = customerDAO.get(customerId);
			updateCustomerFieldsFromForm(customerById);
			
			customerDAO.update(customerById);
			
			message = "The customer has been updated successfully.";
		}
		
		listCustomers(message);
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer != null) {
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount =reviewDAO.countByCustomer(customerId);
			
			if (reviewCount > 0) {
				String message = "Could not delete customer with ID " + customerId
						+ " because he/she posted reviews for items.";
				showMessageBackend(message, request, response);
			} else {
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countByCustomer(customerId);
				
				if (orderCount > 0) {
					String message = "Could not delete customer with ID " + customerId 
							+ " because he/she placed orders.";
					showMessageBackend(message, request, response);
				} else {
					customerDAO.delete(customerId);			
					String message = "The customer has been deleted successfully.";
					listCustomers(message);
				}
			}
		} else {
			String message = "Could not find customer with ID " + customerId + ", "
					+ "or it has been deleted by another admin";
			showMessageBackend(message, request, response);
		}
		
	}

	public void showLogin() throws ServletException, IOException {
		forwardToPage("frontend/login.jsp", request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = customerDAO.checkLogin(email, password);
		
		if (customer == null) {
			String message = "Login failed. Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();
			
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			
			Object objRedirectURL = session.getAttribute("redirectURL");
			
			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {
				showCustomerProfile();
			}
		}
	}
	
	public void showCustomerProfile() throws ServletException, IOException {
		forwardToPage("frontend/customer_profile.jsp", request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		forwardToPage("frontend/edit_profile.jsp", request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromForm(customer);
		customerDAO.update(customer);
		
		showCustomerProfile();
		
	}
}
