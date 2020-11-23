package com.cmarket.spring.oracleTest;
import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;

public class oracleTest {
	 
	 
	    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	    private static final String UID = "SEMIGAMES";
	    private static final String UPW = "SEMIGAMES";
	    
	    
	    @Autowired
		private ApplicationContext ctx;
	    
	    
	    @Test //test사용을 위한 어노테이션
	    public void connectTest() throws Exception {
	        Class.forName(DRIVER);
	        Connection conn = null;
	        try {
	            conn = DriverManager.getConnection(URL, UID, UPW);
	            System.out.println(conn);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if(conn != null) conn.close();
	        }
	    }
	    
	
}
