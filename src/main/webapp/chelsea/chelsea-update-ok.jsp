<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String chNum = request.getParameter("chNum");
	String chName = request.getParameter("chName");
	String chFoot = request.getParameter("chFoot");
	String chHeight = request.getParameter("chHeight");
	String chWeight= request.getParameter("chWeight");
	String chPosition= request.getParameter("chPosition");
	
	Connection con = DBCon.getCon();
	
	String sql = "UPDATE CHELSEA_INFO\n"
			+ "SET CH_NAME=?,\n"
			+ "CH_FOOT=?,\n"
			+ "CH_HEIGHT=?,\n"
			+ "CH_WEIGHT=?,\n"
			+ "CH_POSITION=?,\n"
			+ "WHERE CH_NUM=?";
	PreparedStatement ps = con.prepareSatatement(sql);
	ps.setString(1,chName);
	ps.setString(2,chFoot);
	ps.setString(3,chHeight);
	ps.setString(4,chWeight);
	ps.setString(5,chPosition);
	ps.setString(6,chNum);

	int result = ps.excuteUpdate();
	
	if(result==1){
		%>
		<script>
			alert('수정성공!');
			location.href='/chelsea/chelsea-view.jsp=chNum=<%=chNum%>';
		</script>
	}
											
</body>
</html>