<%@page import="java.sql.*"%>
<%@page import="test.web.common.DBCon"%>
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
	String chNum = request.getParameter("chNum");
	Connection con = DBCon.getCon();
	String sql = "SELECT CH_NUM,CH_NAME,CH_FOOT,CH_HEIGHT,CH_WEIGHT,CH_POSITION FROM CHELSEA_INFO WHERE CH_NUM";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,chNum);
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
%>
	<form action="/chelsea/chelsea-update-ok.jsp" method="POST" id="frm" >
		선수명 : <input type="text" name="CH_NAME" value="<%=rs.getString("CH_NAME")%>"><br>
		주발 : <input type="text" name="CH_FOOT" value="<%=rs.getString("CH_FOOT")%>"><br>
		키 : <input type="text" name="CH_HEIGHT" value="<%=rs.getString("CH_HEIGHT")%>"><br>
		몸무게 : <input type="text" name="CH_WEIGHT" value="<%=rs.getString("CH_WEIGHT")%>"><br>
		포지션 : <input type="text" name="CH_POSITION" value="<%=rs.getString("CH_POSITION")%>">
		<input type="hidden" name="chNum" value="<%=rs.getString("CH_NUM") %>">
		<button>선수등록</button>
		<button type="button" onclick="changeAction()">선수삭제</button>>
	</form>>
<script>
	function changeAction(){
		const frm = document.querySelector('#frm');
		frm.action='/chelsea/chelsea-delete-ok.jsp';
		frm.submit();
	}
</script>
<%
	}else{
%>
이미 삭제된 데이터입니다.<br>
<a href="chelsea/chelsea-list.jsp">선수리스트</a>>
<%
	}
%>
</body>
</html>