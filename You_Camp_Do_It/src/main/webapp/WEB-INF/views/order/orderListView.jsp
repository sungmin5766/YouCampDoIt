<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 내역</title>
    <style>
        .order-outer{
			margin-top: 0; /* 상단 여백 제거 */
		    padding-top: 0; /* 내부 여백 제거 */
		    background-color: #f8f8f8; /* 배경색 유지 */
		}

        /* 헤더 스타일 */
        .order-header {
		    margin: 0; /* 외부 여백 제거 */
		    padding: 0; /* 내부 여백 제거 */
		    display: flex;
		    justify-content: center; /* 가로 중앙 정렬 */
		    align-items: center; /* 세로 중앙 정렬 */
		    height: 100px; /* 높이 유지 */
		    box-sizing: border-box;
		    background-color: white;
		    font-size: 24px; /* 글씨 크기 추가 */
		    font-weight: bold; /* 글씨 굵기 추가 */
		    color: #333; /* 텍스트 색상 */
		}

        .order-header-wrap a {
            text-decoration: none;
            font-size: 18px;
            color: #333;
            padding: 10px 20px;
            margin-right: 20px;
            border-bottom: 3px solid transparent;
        }

        .order-header-wrap a:first-child {
            color: #f7b500;
            border-bottom: 3px solid #f7b500;
        }

        .order-header-wrap a:hover {
            color: #f7b500;
        }

        /* 컨테이너 */
        .container {
            max-width: 1000px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .sort-order-button {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            gap: 10px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .sort-order-button button {
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            background-color: #fff;
        }

        .sort-order-button button:hover {
            background-color: #f9f9f9;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }

        .order-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 4px;
        }

        .item-details {
            flex-grow: 1;
            margin-left: 20px;
        }

        .item-details h3 {
            margin: 0 0 5px;
            font-size: 16px;
            color: #333;
        }

        .item-details p {
            margin: 0;
            font-size: 14px;
            color: #777;
        }

        .item-price {
            text-align: right;
            margin-bottom: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .button-group {
            text-align: right;
        }

        .button-group button {
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            background-color: #fff;
        }

        .button-group button:hover {
            background-color: #f9f9f9;
        }

        /* 상태 정보 */
        .status {
            font-size: 14px;
            color: green;
            margin-top: 5px;
        }
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

    <div class="order-outer">

        <div class="order-header">
            <div class="order-header-wrap">
                <a href="">결제내역</a>
            </div>
        </div>

        <div class="container">
            <!-- 주문 정보 -->
            <div class="sort-order-button">
                <button>전체</button>
                <button>예약 결제내역</button>
                <button>용품 결제내역</button>
                <button>취소 / 환불내역</button>
            </div>

            <!-- 주문 섹션 -->
            <div class="order-section">
                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>캠핑용 접이식 의자</h3>
                        <p>옵션: 블랙</p>
                        <span class="status">결제완료</span>
                    </div>
                    <div>
                        <div class="item-price">39,800원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>캠핑용 초경량 텐트</h3>
                        <p>옵션: 2인용 / 블루</p>
                        <span class="status">취소 요청</span>
                    </div>
                    <div>
                        <div class="item-price">149,000원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>캠핑용 LED 랜턴</h3>
                        <p>옵션: 충전식</p>
                        <span class="status">환불 완료</span>
                    </div>
                    <div>
                        <div class="item-price">29,700원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>캠핑용 방수 매트</h3>
                        <p>옵션: 대형 / 그린</p>
                        <span class="status">결제완료</span>
                    </div>
                    <div>
                        <div class="item-price">49,000원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>캠핑용 접이식 테이블</h3>
                        <p>옵션: 알루미늄 / 4인용</p>
                        <span class="status">취소요청</span>
                    </div>
                    <div>
                        <div class="item-price">79,800원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>휴대용 가스버너</h3>
                        <p>옵션: 블랙</p>
                        <span class="status">환불완료</span>
                    </div>
                    <div>
                        <div class="item-price">32,000원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>캠핑용 아이스박스</h3>
                        <p>옵션: 20L / 화이트</p>
                        <span class="status">결제완료</span>
                    </div>
                    <div>
                        <div class="item-price">59,900원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>

                <div class="order-item">
                    <img src="https://via.placeholder.com/100" alt="상품 이미지">
                    <div class="item-details">
                        <h3>휴대용 충전식 랜턴</h3>
                        <p>옵션: 고광량</p>
                        <span class="status">결제완료</span>
                    </div>
                    <div>
                        <div class="item-price">24,500원</div>
                        <div class="button-group">
                            <button>주문 취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<br>
    </div>

	<jsp:include page="../common/footer.jsp" />
    
</body>
</html>