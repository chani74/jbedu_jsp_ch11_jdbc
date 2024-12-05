<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>abc School 회원가입 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String hakbun = request.getParameter("hakbun");

	String strSQL = "select * from student ";
	strSQL += " where hakbun = "+hakbun+" " ;



	//1. 변수 4개 선언
	String driverName = "com.mysql.jdbc.Driver";	// MySQL JDBC 드라이버 이름
	String url = "jdbc:mysql://localhost:3306/abc_school"; 
	String username = "root";
	String password = "12345";
	
	Connection conn = null ; //DB 와의 커넥션을 초기값 null 로 해서 생성
	Statement stmt = null ;
	ResultSet rs = null ; 
	
	
	try {
		//2.드라이버 로딩
		Class.forName(driverName); // mysql 드라이버를 불러오기
		//3. 연동
		conn = DriverManager.getConnection(url,username,password); // DB와 프로젝트간의 커넥션 생성
		stmt = conn.createStatement();
		//4. 사용
		
		rs = stmt.executeQuery(strSQL);

		while ( rs.next()) {
			
			hakbun = rs.getInt("hakbun");
			String name = rs.getString("name"); 
			int grade = rs.getInt("grade");
			String Address = rs.getString("address");
		
			if (name.equals(null)) {
				out.println("검색하신 학번은 없는 학번입니다.");
			} else {
				out.println(hakbun + " / " + name + " / " + grade + " / " +Address);
			}
		}
		
		
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
			if(rs!=null)						
				rs.close();				
			if(stmt!=null)						
				stmt.close();				
			if(conn!=null)						
				conn.close();				
		} catch (SQLException e) {
			e.printStackTrace();;
		}
	}
	
%>
</body>
</html>