<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchResult {
	border: 1px solid red;
	width: 800px;
	height:600px;
	}
</style>
<script src ="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#searchBtn').click(function() {
			
			let date = $('#searchDate').val()
			date = date.split('-').join('')
			//console.log(date)
			
			$.ajax({
				type: 'get',
				url:'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
				data: {
					key: '29728e17bb44d448cb4e0bfaafd2788c',
					targetDt:date,
					itemPerPage:3
				}, 
				datatype :'jsonp'
				,success: callback
				, error: function(){
					alert('실패')
				
				}
			})
		})
	})
	function callback(data){
		$('#searchResult').empty()
		let list = data.boxOfficeResult.dailyBoxOfficeList
		for (let i=0; i<list.length;i++){
			let movie = list[i]
			let rank = movie.rank
			let movieNm = movie.movieNm
			let audiAcc = movie.audiAcc
			
			//console.log(rank, movieNm, audiAcc)
			//$('#searchResult').append('<hr>')
			$('#searchResult').append('<h4>'+rank +'위</h4>')
			$('#searchResult').append('<strong>'+ movieNm +'</strong>(누적관객수 : ' + audiAcc + '명)')
			$('#searchResult').append('<hr>')
		}
	}
	
</script>
</head>
<body>
	<h2>일별 박스오피스 순위 조회</h2>
	검색일 : <input type ="date" id = "searchDate">
	<button id="searchBtn">검색</button>
	<br>
	<h4>검색결과</h4>
	<div id = "searchResult"></div>
</body>
</html>