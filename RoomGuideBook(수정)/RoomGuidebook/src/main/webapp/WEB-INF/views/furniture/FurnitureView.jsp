<%@page import="dto.LikeDTO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dto.ImageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page session="true"%>
<%@ page import="dto.ProductDTO"%>
<%@ page import="java.util.*"%>
<%@include file="../main/header.jsp"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

<head>
<title>RoomGuideBook_USER_PRODUCTDETAIL</title>
<link href="/resources/css/style.css" rel='stylesheet' type='text/css' />
<link href="/resources/css/details.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<!----//webfonts---->
<!----start-alert-scroller---->
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.easy-ticker.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
    </script>
<!----start-alert-scroller---->
<!-- start menu -->
<link href="/resources/css/megamenu.css" rel="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="/resources/js/megamenu.js"></script>
<script>$(document).ready(function () { $(".megamenu").megamenu(); });</script>
<script src="/resources/js/menu_jquery.js"></script>
<!-- //End menu -->
<!---slider---->
<link rel="stylesheet" href="/resources/css/slippry.css">
<script src="/resources/js/jquery-ui.js" type="text/javascript"></script>
<script src="/resources/js/scripts-f0e4e0c2.js" type="text/javascript"></script>
<script>
        jQuery('#jquery-demo').slippry({
            // general elements & wrapper
            slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
            // options
            adaptiveHeight: false, // height of the sliders adapts to current slide
            useCSS: false, // true, false -> fallback to js if no browser support
            autoHover: false,
            transition: 'fade'
        });
    </script>
<!---move-top-top---->
<script type="text/javascript" src="/resources/js/move-top.js"></script>
<script type="text/javascript" src="/resources/js/easing.js"></script>
<script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1200);
            });
        });
    </script>
<!---//move-top-top---->

</head>

<script>
	var result = '${registerCartResult}';
	if (result == "success") {
		if (confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
			window.location.href = "http://localhost:8080/getCartList";
		}
	} else if (result == "fail") {
		alert("해당 작업을 다시 시도해주시기 바랍니다.");
	}

	function openPopup() {
		//        productId = document.getElementById("productId");
		//        productName = document.getElementById("productName");
		//        console.log(productId.value);
		//        console.log(productName.value);
		//        window.open("/insertArrangeInfo, "배치정보입력", "width=450,height=500","resizable=no");

		//    	productId = document.getElementById("productId");
		//        productName = document.getElementById("productName");

		var title = "input";

		window.open("", title, "width=450,height=500", "resizable=no");

		var productInfo = document.productInfo;
		productInfo.target = title;
		productInfo.action = "insertArrangeInfo";
		productInfo.method = "post";
		productInfo.submit();
	}

	function addCart() {
		var myId = document.getElementsByName("memberId")[0].value;

		if (myId == ""
				|| myId == null
				|| myId == undefined
				|| (myId != null && typeof myId == "object" && !Object.keys(
						myId).length())) {
			alert("로그인이 필요한 요청입니다.");
		} else {
			var cartForm = document.cartForm;
			cartForm.action = "registerCart";
			cartForm.method = "post";
			cartForm.submit();
		}
	}

	function buy() {
		if (confirm("상품 구매 페이지로 이동하시겠습니까?")) {
			var buyForm = document.buyForm;
			buyForm.action = "getOrderView";
			buyForm.method = "post";
			buyForm.submit();
		}
	}
</script>

<body>

	<%-- <c:set var="myId" value="${sessionScope.member.id}"></c:set>
	<%
		ProductDTO product = (ProductDTO) request.getAttribute("product");
	ArrayList<ImageDTO> imageList = (ArrayList<ImageDTO>) request.getAttribute("image");

	pageContext.setAttribute("product", product);
	pageContext.setAttribute("mainImage", imageList.get(0));
    %> --%>

	<!---start-wrap---->
	<!---start-header---->
	<!-- <div class="header">
		<div class="top-header">
			<div class="wrap">
				<div class="top-header-left">
					<ul>
						-cart-tonggle-script--
						<script type="text/javascript">
                            $(function () {
                                var $cart = $('#cart');
                                $('#clickme').click(function (e) {
                                    e.stopPropagation();
                                    if ($cart.is(":hidden")) {
                                        $cart.slideDown("slow");
                                    } else {
                                        $cart.slideUp("slow");
                                    }
                                });
                                $(document.body).click(function () {
                                    if ($cart.not(":hidden")) {
                                        $cart.slideUp("slow");
                                    }
                                });
                            });
                        </script>
						-//cart-tonggle-script--
						<li><a class="cart" href="#"><span id="clickme"> </span></a></li>
						-start-cart-bag--
						<div id="cart">
							Your Cart is Empty <span>(0)</span>
						</div>
						-start-cart-bag--
						<li><a class="info" href="#"><span> </span></a></li>
					</ul>
				</div>
				<div class="top-header-center">
					<div class="top-header-center-alert-left">
						<h3>RGB : Room Guide Book</h3>
					</div>
					<div class="top-header-center-alert-right">
						<div class="vticker">
							<ul>
								<li>Welcome to RGB: Room Guide Book<label>-TEST</label></li>
							</ul>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="top-header-right">
					<ul>
						<li><a href="login.html">Login</a><span> </span></li>
						<li><a href="register.html">Join</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>

		--start-mid-head--
		<div class="mid-header">
			<div class="wrap">
				<div class="mid-grid-left">
					<form>
						<input type="text" placeholder="What Are You Looking for?" />
					</form>
				</div>
				<div class="mid-grid-right">
					<a class="logo" href="index.html"><span> </span></a>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		--//End-mid-head--

		--start-bottom-header--
		<div class="header-bottom">
			<div class="wrap">
				start header menu
				<ul class="megamenu skyblue">
					<li class="grid"><a class="color2" href="#">STORE</a>
						<div class="megapanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>거실가구</h4>
										<ul>
											<li><a href="products.html">소파</a></li>
											<li><a href="products.html">거실수납장/TV장</a></li>
											<br>
										</ul>
									</div>
									<div class="h_nav">
										<h4 class="top">학생/서재가구</h4>
										<ul>
											<li><a href="products.html">책상</a></li>
											<li><a href="products.html">책장</a></li>
											<br>
										</ul>
									</div>
								</div>

								<div class="col1">
									<div class="h_nav">
										<h4>침실가구</h4>
										<ul>
											<li><a href="products.html">침대</a></li>
											<li><a href="products.html">화장대</a></li>
											<li><a href="products.html">거울</a></li>
										</ul>
									</div>
									<div class="h_nav">
										<h4 class="top">수납가구</h4>
										<ul>
											<li><a href="products.html">수납장</a></li>
											<br>
											<br>
										</ul>
									</div>
								</div>

								<div class="col1">
									<div class="h_nav">
										<h4>드레스룸</h4>
										<ul>
											<li><a href="products.html">옷장</a></li>
											<li><a href="products.html">행거</a></li>
											<br>
										</ul>
									</div>
									<div class="h_nav">
										<h4 class="top">테이블</h4>
										<ul>
											<li><a href="products.html">좌식테이블</a></li>
											<br>
											<br>
										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>주방가구</h4>
										<ul>
											<li><a href="products.html">식탁</a></li>
											<li><a href="products.html">주방수납</a></li>
											<br>
										</ul>
									</div>
									<div class="h_nav">
										<h4 class="top">의자</h4>
										<ul>
											<li><a href="products.html">일반의자</a></li>
											<li><a href="products.html">좌식의자</a></li>
											<li><a href="products.html">스툴</a></li>
										</ul>
									</div>
								</div>


							</div>
						</div></li>
					<li class="active grid"><a class="color4" href="#">COMMUNITY</a></li>

					<li><a class="color8" href="#">OTHER</a>
						<div class="megapanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>회원관리</h4>
										<ul>
											<li><a href="#">회원정보 조회</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
				</ul>

			</div>
		</div>
	</div> -->
	<!----//End-bottom-header---->
	<!---//End-header---->

	<!--- start-content---->
	<div class="content details-page">
		<!---start-product-details--->
		<div class="product-details">
			<div class="wrap">
				<ul class="product-head">
					<li><a href=""> ${product.parentCategory} </a> <span>&nbsp;>&nbsp;</span></li>
					<li><a href=""> ${product.childCategory} </a></li>
					<div class="clear"></div>
				</ul>
				<!----details-product-slider--->
				<!-- Include the Etalage files -->
				<link rel="stylesheet" href="/resources/css/etalage.css">
				<script src="/resources/js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
                    jQuery(document).ready(function ($) {

                        $('#etalage').etalage({
                            thumb_image_width: 300,
                            thumb_image_height: 400,
                            source_image_width: 900,
                            source_image_height: 1000,
                            show_hint: true,
                            click_callback: function (image_anchor, instance_id) {
                                alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                            }
                        });
                        // This is for the dropdown list example:
                        $('.dropdownlist').change(function () {
                            etalage_show($(this).find('option:selected').attr('class'));
                        });

                    });
                        </script>
				<!----//details-product-slider--->
				<div class="details-left">
					<div class="details-left-slider">

						<!-- Slider -->
						<div class="slider">
							<!-- items -->
							<c:forEach var="imageList" items="${imageList}">
								<c:if test="${imageList.use eq '201' || imageList.use eq '202'}">
									<div class="slider_item">
										<img src="${imageList.path}">
									</div>
								</c:if>
							</c:forEach>
						</div>

						<script type="text/javascript">
                            const showing_class = "showing";
                            const firstSlide = document.querySelector(".slider_item:first-child");
                            function slide() {
                                const currentSlide = document.querySelector(".showing"); // showing 클래스가  있는 엘리먼트를 찾는다. 
                                if (currentSlide) {
                                    // 지금 shwoing 클래스를 가진 엘리먼트 다음 엘리먼트에 클래스를 추가 한다. 
                                    currentSlide.classList.remove("showing");
                                    const nextSlide = currentSlide.nextElementSibling;
                                    // 다음 엘리먼트가 있는지 없는지 체크 후 처리 
                                    if (nextSlide) {
                                        console.log(currentSlide);
                                        nextSlide.classList.add("showing");
                                    } else {//마지막이면(그다음 형제 엘리먼트가 없으니까) 첫 슬라이드에 추가 함.
                                        firstSlide.classList.add("showing");
                                    }

                                } else { // showing 클래스가 지정된 엘리먼트가 없으면 첫번째에 추가해 준다.(페이지 시작시)
                                    firstSlide.classList.add("showing");
                                }
                            }

                            slide();
                            setInterval(slide, 3500); // 1000은 1초 

                        </script>

					</div>
					<div class="details-left-info">
						<div class="details-right-head">
							<!--- 상품 이름 --->
							<h1>${product.name}</h1>

							<div class="product-more-details">
								<ul class="price-avl">
									<li><a>￦${product.price}</a></li>
								</ul>

								<p class="product-detail-info">
									Size : ${product.width} × ${product.length} × ${product.height}
									(cm) <br> ${product.info}
								</p>
								<hr>
								<Br>
								<div class="tempInfo">
									<ul>
										<li>
											<p>${product.name}&nbsp;&nbsp;
										</li>

										<li>
											<div class='ctrl'>
												<div class='ctrl__button ctrl__button--decrement'>&ndash;</div>

												<div class='ctrl__counter'>
													<input class='ctrl__counter-input' maxlength='10'
														type='text' value='0'>
													<div class='ctrl__counter-num'>0</div>
												</div>

												<div class='ctrl__button ctrl__button--increment'>+</div>
											</div>
										</li>
										<li>￦${product.price}
											</p>
										</li>
									</ul>
								</div>
								<!--- count Script-->
								<script>
                                    (function () {
                                        'use strict';

                                        function ctrls() {
                                            var _this = this;

                                            this.counter = 0;
                                            this.els = {
                                                decrement: document.querySelector('.ctrl__button--decrement'),
                                                counter: {
                                                    container: document.querySelector('.ctrl__counter'),
                                                    num: document.querySelector('.ctrl__counter-num'),
                                                    input: document.querySelector('.ctrl__counter-input')
                                                },
                                                increment: document.querySelector('.ctrl__button--increment')
                                            };

                                            this.decrement = function () {
                                                var counter = _this.getCounter();
                                                var nextCounter = (_this.counter > 0) ? --counter : counter;
                                                _this.setCounter(nextCounter);
                                            };

                                            this.increment = function () {
                                                var counter = _this.getCounter();
                                                var nextCounter = (counter < 9999999999) ? ++counter : counter;
                                                _this.setCounter(nextCounter);
                                            };

                                            this.getCounter = function () {
                                                return _this.counter;
                                            };

                                            this.setCounter = function (nextCounter) {
                                                _this.counter = nextCounter;
                                            };

                                            this.debounce = function (callback) {
                                                setTimeout(callback, 100);
                                            };

                                            this.render = function (hideClassName, visibleClassName) {
                                                _this.els.counter.num.classList.add(hideClassName);

                                                setTimeout(function () {
                                                    _this.els.counter.num.innerText = _this.getCounter();
                                                    _this.els.counter.input.value = _this.getCounter();
                                                    _this.els.counter.num.classList.add(visibleClassName);
                                                }, 100);

                                                setTimeout(function () {
                                                    _this.els.counter.num.classList.remove(hideClassName);
                                                    _this.els.counter.num.classList.remove(visibleClassName);
                                                }, 200);
                                            };

                                            this.ready = function () {
                                                _this.els.decrement.addEventListener('click', function () {
                                                    _this.debounce(function () {
                                                        _this.decrement();
                                                        _this.render('is-decrement-hide', 'is-decrement-visible');
                                                    });
                                                });

                                                _this.els.increment.addEventListener('click', function () {
                                                    _this.debounce(function () {
                                                        _this.increment();
                                                        _this.render('is-increment-hide', 'is-increment-visible');
                                                    });
                                                });

                                                _this.els.counter.input.addEventListener('input', function (e) {
                                                    var parseValue = parseInt(e.target.value);
                                                    if (!isNaN(parseValue) && parseValue >= 0) {
                                                        _this.setCounter(parseValue);
                                                        _this.render();
                                                    }
                                                });

                                                _this.els.counter.input.addEventListener('focus', function (e) {
                                                    _this.els.counter.container.classList.add('is-input');
                                                });

                                                _this.els.counter.input.addEventListener('blur', function (e) {
                                                    _this.els.counter.container.classList.remove('is-input');
                                                    _this.render();
                                                });
                                            };
                                        };

                                        // init
                                        var controls = new ctrls();
                                        document.addEventListener('DOMContentLoaded', controls.ready);
                                    })();
                                </script>
								<Br> <Br>
								<hr>

								<!-- <ul class="product-colors">
									<h3>available Colors</h3>
									<select>
										<option selected>Corlor1</option>
										<option>Corlor2</option>
										<option>Corlor3</option>
									</select>

									<div class="clear"></div>
								</ul> -->
								<br>

								<div class="buttonGroup">
									<form name="buyForm">
										<input type="hidden" name="productSum"
											value="${product.price}">
										<c:set var="price" value="${product.price}" />
										<c:choose>
											<c:when test="${price < 50000}">
												<input type="hidden" name="delevaryFee" value="2500">
												<input type="hidden" name="priceSum"
													value="${product.price+2500}">
											</c:when>
											<c:otherwise>
												<input type="hidden" name="delevaryFee" value="0">
												<input type="hidden" name="priceSum"
													value="${product.price}">
											</c:otherwise>
										</c:choose>
										<input type="hidden" name="productId" value="${product.id}">
									</form>

									<form name="cartForm">
										<!-- action = "/registerCart" method="post" -->
										<input type="hidden" name="memberId"
											value="${sessionScope.member.id}"> <input
											type="hidden" name="productId" value="${product.id}">
										<input type="hidden" name="count" value="1">
									</form>
									<button class="buttons" id="buyBtn" type="submit"
											onclick="buy();">Buy Now</button>
									<button onclick="addCart();" class="buttons" id="cartBtn">Add
										Cart</button>
									<button onclick="openPopup();" class="buttons" id="arrangeBtn">Arrange</button>
									<form name="productInfo">
										<input type="hidden" id="productId" name="productId"
											value="${product.id}" /> <input type="hidden"
											id="productName" name="productName" value="${product.name}" />
									</form>
								</div>
								<hr>


								<script>
                                    function openPopup() {
                                    	var title = "input";

                                		window.open("", title, "width=450,height=500", "resizable=no");

                                		var productInfo = document.productInfo;
                                		productInfo.target = title;
                                		productInfo.action = "insertArrangeInfo";
                                		productInfo.method = "post";
                                		productInfo.submit();
                                    }
                                </script>

							</div>
						</div>
					</div>

				</div>

				<div class="clear"></div>

				<div class="wrap">
					<div class="product-tinfo" style="text-align: center">
						<b2>====== Product Information ======</b2>
						<c:forEach var="imageList" items="${imageList}">
							<c:if test="${imageList.use eq '203'}">
								<img src="${imageList.path}">
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!---- start-bottom-grids---->
	<div class="bottom-grids">

		<div class="bottom-bottom-grids"></div>
	</div>
	<!---- //End-bottom-grids---->
	<!--- //End-content---->
	<!---start-footer---->
	<div class="footer">
		<div class="wrap">
			<div class="footer-left">
				<ul>
					<li><a href="#">RoomGuideBook</a> <span> </span></li>
				</ul>
			</div>

			<div class="clear"></div>
		</div>
	</div>
	<!---//End-footer---->
	<!---//End-wrap---->
</body>

</html>