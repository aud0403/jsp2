<%@page import="dao.CommentDao"%>
<%@page import="dto.Comment"%>
<%@page import="java.util.List"%>
<%@page import="dto.Freeboard"%>
<%@page import="dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	FreeboardDao dao = FreeboardDao.getInstance();
	Freeboard bean = dao.getOne(idx);
	
	//bean 객체로 참조하고 있는값은 detailView.jsp 에게 전달하고 브라우저에 출력하도록 합니다.
	
	 CommentDao cdao = CommentDao.getInstance();
	 cdao.updateCountAll(idx);
	List<Comment> cmts = cdao.getComment(idx);
	 request.setAttribute("cmtlist", cmts);
	
	String update =request.getParameter("update");
	if(update!=null) request.setAttribute("update", "y");

	request.setAttribute("page", pageNo);
	request.setAttribute("bean", bean);
	pageContext.forward("detailView.jsp");
%>