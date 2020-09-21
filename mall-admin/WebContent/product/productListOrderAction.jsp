<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		이미 product id 로 정렬 되어 있으니까
		
		1. product id 정렬은
		한번 누르면 desc 내림차순
		두번 누르면 asc 오름차순
		
		2. 나머지는 처음은 자신을 기준으로 해야하니까.
		한번 누르면 asc 오름차순
		두번 누르면 desc 내림차순
		세번 누르면 처음처럼
		
		count로 해야하는데 전역변수가 없고 있다해도 모르기 때문에 
		 -> 새로 db table [count] 만들어서 
		1) 저장시키고 
		2) 불러오고 
		3) 비교하고 
		4) 초기화
		 하고 처리해보자 
	*/
%>