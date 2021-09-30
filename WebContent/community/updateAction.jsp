<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");

int idx= Integer.parseInt(request.getParameter("idx")); 
int pageNo =  Integer.parseInt(request.getParameter("page"));
/* String subject =request.getParameter("subject");
String content =request.getParameter("content"); */

FreeboardDao dao= FreeboardDao.getInstance();
Freeboard dto= dao.getOne(idx);


request.setAttribute("page", pageNo);
request.setAttribute("bean", dto);
pageContext.forward("updateView.jsp");






%>