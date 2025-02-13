<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/views/common/topNavigation.jsp" %>
<jsp:include page="/WEB-INF/views/common/nav.jsp"/>
<head>
    <title>product review save</title>
    <style>
        /* 썸네일 이미지 스타일 */
        .thumbnail {
            max-width: 200px;
            max-height: 200px;
            margin-top: 10px;
        }
        .contentset{
            min-height: calc(100vh - 30px);
            padding-top: 100px;
        }
    </style>
</head>

<body>
<div class="contentset">
<div class="container mt-5">
    <h1>리뷰 수정</h1>

    <%-- 스프링 폼을 통해 유효성검사 실행--%>
    <%--@elvariable id="productReviewSaveDTO" type="kr.co.chunjaeshop.product_review.dto.ProductReviewSaveDTO"--%>
    <form:form modelAttribute="productReviewSaveDTO" action="/product/review/update?reviewIdx=${reviewIdx}"
               method="post" enctype="multipart/form-data">

        <div class="mb-3">
            <form:hidden path="reviewIdx" />

            <label for="reviewStar" class="form-label">별점</label>
            <form:select class="form-select" path="reviewStar">
                <form:option value="">별점 선택</form:option>
                <form:option value="1">★☆☆☆☆</form:option>
                <form:option value="2">★★☆☆☆</form:option>
                <form:option value="3">★★★☆☆</form:option>
                <form:option value="4">★★★★★</form:option>
                <form:option value="5">★★★★★</form:option>
            </form:select>
        </div>
        <div>
                <%--바인딩 에러 출력하는곳 ( 에러가없을경우 표시되지않고 있을경우 span으로 출력)--%>
            <form:errors path="reviewStar" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <label for="reviewContent" class="form-label">리뷰 내용</label>
            <form:textarea class="form-control" path="reviewContent" rows="3" placeholder="리뷰 내용을 입력하세요" />
        </div>
        <div>
            <form:errors path="reviewContent" cssClass="text-danger"/>
        </div>
        <div class="mb-3">
            <label for="reviewImg" class="form-label">리뷰 사진</label>
            <form:input type="file" class="form-control" path="reviewImg" multiple="multiple"/>
        </div>
        <div>
            <form:errors path="reviewImg" cssClass="text-danger"/>
        </div>

        <div class="mb-3">
            <label for="reviewImg" class="form-label"></label>
            <img id="reviewImgPreview" class="thumbnail" />
        </div>
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="reset" class="btn btn-primary">초기화</button>

    </form:form>

    <script>
        // 파일 선택 시 이미지 미리보기 기능을 구현하는 자바스크립트
        function previewImage(input, targetId) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var targetElement = document.getElementById(targetId);
                targetElement.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
        document.getElementById('reviewImg').onchange = function () {
            previewImage(this, 'reviewImgPreview');
        };
    </script>
</div>
</div>
</body>
</html>