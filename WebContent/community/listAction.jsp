
<%@page import="dto.PageDto"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Freeboard"%>
<%@page import="java.util.List"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비지니스 로직을 처리하는 jsp 파일
	FreeboardDao dao = FreeboardDao.getInstance();
	//페이지 번호는 파라미터로 전달됩니다.
	 int pageNo;
	if(request.getParameter("page")==null) pageNo=1;
	else pageNo = Integer.parseInt(request.getParameter("page"));   //page=1,2,3,4,.....
			 
	
	//int pageNo=Integer.parseInt(request.getParameter("pageNo")); //pagoNo를 파라미터로 직접 url에 쓸때
	int pageSize =15;
	//int startNo=(pageNo-1)*pageSize;
	
	PageDto pageDto = new PageDto(pageNo,dao.getCount(),pageSize); //페이지처리에 필요한객체(값) 생성
	
	Map<String,Integer> map = new HashMap<>();
	map.put("pageSize",pageSize);
	map.put("startNo",pageDto.getStartNo());
	List<Freeboard> list = dao.getList(map);
	
	request.setAttribute("today", LocalDate.now());
	
	request.setAttribute("pageDto", pageDto);	//페이지처리에 필요한 값들
	request.setAttribute("blists", list);
	pageContext.forward("listView.jsp");
	//out.print(list);
%>