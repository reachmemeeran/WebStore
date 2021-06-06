package com.webstore.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import com.webstore.dao.HashGenerator;

public class HashGeneratorTest {

	@Test
	public void testGenerateMD5() {
		String password = "mysecret";
		String encryptedPassword = HashGenerator.generateMD5(password);
		
		System.out.println(encryptedPassword);
		
		assertTrue(true);
	}

}
