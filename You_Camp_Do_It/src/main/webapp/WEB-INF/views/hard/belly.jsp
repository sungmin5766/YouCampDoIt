<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<style>

	#content_1 {
        display: flex;
        justify-content: center;
        align-items: center;
        
        font-weight: 700;
        height: 100px;
        background-color: white;
        width: 1900px;
        
        
    }

    .reserve_wrap a {
        text-decoration: none;
        font-size: 18px;
        color: #333;
        padding: 10px 20px;
        margin-right: 20px;
        border-bottom: 3px solid transparent;
    }

    .reserve_wrap a:nth-child(2) {
        color: #f7b500;
        border-bottom: 3px solid #f7b500;
    }

    .reserve_wrap a:hover {
        color: #f7b500;
    }
    
        body {
        
        margin: 0;
        padding: 0;
        background-color: #ffffff;
        color: #333;
        width: 1900px;
        
    }

    .container {
        max-width: 1200px;
        margin: 40px auto;
        padding: 20px;
    }

    .image-section {
        width: 100%;
        height: 500px;
        overflow: hidden;
        position: relative;
        border-radius: 10px;
        
        margin-bottom: 50px;
        margin-top: 50px;
    }

    .image-section img {
    	
    }


    .info-section {
        display: flex;
        margin-top: 20px;
        gap: 20px;
    }

    .info-section {
        display: flex;
        margin-top: 20px;
        gap: 20px;
    }

    .info-left {
        flex: 1;
        text-align: center;
        border-right: 1px solid #e4e4e4;
    }

    .info-left .label {
        background-color: #5e5d43;
        border-radius: 50%;
        width: 50px;
        height: 50px;
        line-height: 50px;
        display: inline-block;
        font-size: 16px;
        font-weight: bold;
        color: white;
    }

    .info-left h2 {
        font-size: 24px;
        margin: 10px 0;
    }

    .info-left .navigation {
        margin-top: 20px;
    }

    .info-left .navigation button {
        background-color: #5e5d43;
        border: none;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        margin: 0 5px;
        cursor: pointer;
        transition: all 0.3s ease;
        color: white;
    }

    .info-left .navigation button:hover {
        background-color: #bbb;
    }

    .info-right {
        flex: 3;
        
        
    }

    .info-right p {
        line-height: 1.6;
        margin-bottom: 20px;
        margin-right: 70px;
    }

    .info-right ul {
        list-style: none;
        padding: 0;
    }

    .info-right ul li {
        margin-bottom: 5px;
        font-size: 16px;
    }

    .info-right .tags {
        margin-top: 20px;
    }

    .info-right .tags span {
        display: inline-block;
        background-color: #f8f8f8;
        color: #666;
        font-size: 14px;
        padding: 5px 10px;
        margin-right: 5px;
        border-radius: 15px;
        border: 1px solid #ddd;
    }
    
    .tags span:hover {
	    background-color: #fdd835; /* 호버 시 강조 색상 */
	    color: #fff;
	    transition: all 0.3s ease;
	}
    
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div id="content_1">
        <div class="reserve_wrap">
            <a href="forest.ha">포레스트</a>
            <a href="belly.ha">밸리</a>
            <a href="sky.ha">스카이</a>
            <a href="stone.ha">스톤</a>
            <a href="etc.ha">기타시설안내</a>
        </div>
    </div>
    
    <div class="container">
	    <div class="image-section" style="margin-top: 0px;">
	        
	            <img src="resources/images/hard/belly/belly1.jpg" alt="캠핑장 이미지 1">
	            
	    </div>
	    
	    <hr>
	    <div class="image-section">
	        
	            <img src="resources/images/hard/belly/belly2.jpg" alt="캠핑장 이미지 2">
	            
	    </div>
	    
	    <div class="info-section">
	        <div class="info-left">
	            <div class="label">2구역</div>
	            <h2>밸리</h2>
	            
	        </div>
	        <div class="info-right">
	            <p>계곡과 가장 가까운 밸리는 계곡을 즐기기에 가장 좋은 구역이다. 관리동과 화장실이 근처에 있어 편리하고
				조용히 자연을 감상하시길 원하시는 분들께 추천한다</p>
	            <ul>
	                <li><strong>사이트 &nbsp;&nbsp;&nbsp;&nbsp;</strong> 파쇄석 15개, 면적: 1번~10번 (6m x 9m)</li>
	                <li><strong>시설 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong> 남/여 화장실, 남/여 샤워실, 취사장</li>
	            </ul>
	            <div class="tags">
	                <span>#숲속</span>
	                <span>#물소리</span>
	                <span>#밤나무</span>
	                <span>#힐링스팟</span>
	                <span>#계곡</span>
	                <span>#가까이에</span>
	                <span>#편한캠핑장</span>
	            </div>
	        </div>
	    </div>
	    
	    <div class="image-section" >
	        
	            <img src="resources/images/hard/belly/belly3.jpg" alt="캠핑장 이미지 3">
	            
	    </div>
	    
	    <hr>
	    <div class="image-section">
	        
	            <img src="resources/images/hard/belly/belly4.jpg" alt="캠핑장 이미지 4">
	            
	    </div>
	</div>
    
    
    
    <jsp:include page="../common/footer.jsp" />
    
    
    
    
    

</body>
</html>