<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*"%>

    <%!
    	Connection con;
    	private boolean verifyUser(String userName, String password) {
    		try {
    			String sql = "select * form users where userName=? and passwd=?";
    			PreparedStatement ps = con.prepareStatement(sql);
    			ps.setString(1, userName);
    			ps.setString(2, password);
    			ResultSet rs = ps.executeQuery();
    			if(rs.next()) {
    				return true;
    			}
    		}
    		catch(Exception ex) {
    			ex.printStackTrace();
    		}
    		return false;
    	}
    %>
    
    <%
    	String userName = request.getParameter("userName");
    	String password = request.getParameter("password");
    	
    	
    	String driverClass = application.getInitParameter("dbDriver");
    	String url = application.getInitParameter("dbUrl");
    	String dbUserName = application.getInitParameter("dbUser");
    	String dbPassword = application.getInitParameter("dbPwd");
    	
    	try {
    		Class.forName(driverClass);
    	}
    	catch(Exception ex) {
    		ex.printStackTrace();
    	}
    	
    	con = DriverManager.getConnection(url, dbUserName, dbPassword);
    	application.setAttribute("connction", con);
    	boolean authFlag = verifyUser(userName, password);
    	
    	if(authFlag) {
    		session.setAttribute("user", userName);
    		response.sendRedirect("courses.jsp");
    	} else {
    		response.sendRedirect("error.jsp");
    	}
    %>
    