<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); /* insertView에서 메소트가 post여서  */
int idx=Integer.parseInt(request.getParameter("idx"));
int pageNo =  Integer.parseInt(request.getParameter("page"));
String subject =request.getParameter("subject");
String name =request.getParameter("name");
//String password =request.getParameter("password");
String content =request.getParameter("content");
//String ip =request.getRemoteAddr();


Freeboard dto = new Freeboard();
//dto.setIp(ip);
//dto.setName(name);
dto.setIdx(idx);
//dto.setPassword(password);
dto.setSubject(subject);
dto.setContent(content);



FreeboardDao dao= FreeboardDao.getInstance();
dao.update(dto);
//response.sendRedirect("updateAction.jsp?update=&idx="+idx);
response.sendRedirect("detailAction.jsp?update=&idx="+idx + "&page="+ pageNo);



%>