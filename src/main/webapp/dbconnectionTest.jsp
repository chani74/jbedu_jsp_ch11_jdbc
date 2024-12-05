<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
<%
	//1. 변수 4개 선언
	String driverName = "com.mysql.jdbc.Driver";	// MySQL JDBC 드라이버 이름
	String url = "jdbc:mysql://localhost:3306/abc_school"; 
	String username = "guest";
	String password = "a12345678";
	
	Connection conn = null ; //DB 와의 커넥션을 초기값 null 로 해서 생성
	
	try {
		//2.드라이버 로딩
		Class.forName(driverName); // mysql 드라이버를 불러오기
		//3. 연동
		conn = DriverManager.getConnection(url,username,password); // DB와 프로젝트간의 커넥션 생성
		//4. 사용
		out.println(">>연결성공 : "+conn);
	} catch(ClassNotFoundException e){
		out.println(">>연결실패 : 드라이버 복사 필요!");
	} catch(SQLException e ) {
		out.println(">>연결실패 : SQL 명령문 확인 필요");
		e.printStackTrace();
	} catch(Exception e ) {
		out.println(">>연결실패 : 오류 발생");
		e.printStackTrace();
	} finally {
		//5. 닫기 
		try {
			if(conn!=null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();;
		}
	}
	
%>
</body>
</html>