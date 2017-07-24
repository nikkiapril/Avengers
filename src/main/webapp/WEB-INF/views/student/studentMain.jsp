<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!-- Content -->

<div class="panel-body">
	<!-- 개인정보 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">개인정보</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;">
				<img src="http://placehold.it/150x75">
			</div>
		</div>
	</div>
	<!-- 수강현황 -->
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">수강 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;"></div>
		</div>
	</div>
	<!-- 상담현황 -->
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">상담 현황</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 260px;"></div>
		</div>
	</div>
	<!-- 개인일정 -->
	<div class="col-md-2">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color: #2196F3;">
				<h4 class="panel-title" style="color: #ffffff;">개인 일정</h4>
			</div>
			<!-- 내용 -->
			<div class="panel-body" style="height: 285px;"></div>
		</div>
	</div>
	<!-- 게시판 -->
	<div class="col-md-10">

		<ul id="tabs-demo4" class="nav nav-tabs nav-tabs-v3" role="tablist"
			style="padding-top: 0; font-size: 15px;">
			<li role="presentation" class="active"><a
				href="#tabs-demo4-area1" id="tabs-demo4-1" role="tab"
				data-toggle="tab" aria-expanded="true">학교공지</a></li>
			<li role="presentation" class=""><a href="#tabs-demo4-area2"
				role="tab" id="tabs-demo4-2" data-toggle="tab" aria-expanded="true">학과공지</a>
			</li>
			<li role="presentation"><a href="#tabs-demo4-area3"
				id="tabs-demo4-3" role="tab" data-toggle="tab" aria-expanded="true">포털소식</a>
			</li>
			<li role="presentation"><a href="#tabs-demo4-area4"
				id="tabs-demo4-4" role="tab" data-toggle="tab" aria-expanded="true">학과공지</a>
			</li>
		</ul>


		<div id="tabsDemo4Content" class="tab-content tab-content-v3">


			<!-- 학교공지 -->
			<div role="tabpanel" class="tab-pane fade active in"
				id="tabs-demo4-area1" aria-labelledby="tabs-demo4-area1"
				style="height: 290px;">
				<p>학교공지</p>

				<c:choose>
					<c:when test="${not empty univNoticeList}">
						<c:forEach var="univNoticeList" items="${univNoticeList }">
							<tr>
								<td>번호:${univNoticeList.board_num}</td>
								<td><a
									href="<%=request.getContextPath()%>/student/helpDesk/univStudNoticeList">제목:${univNoticeList.board_title}</a></td>
								<td>내용:${univNoticeList.board_cont}</td>
								<td>작성일:${univNoticeList.board_date}</td>
								<td>작성자:${univNoticeList.board_writer}</td>
								<br>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2" style="text-align: center;">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>



				</c:choose>



			</div>


			<!-- 학과공지 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area4"
				aria-labelledby="tabs-demo4-area4" style="height: 290px;">
				
				
				
				

				<div class="col-md-10" id="commonRightSide">
					<script type="text/javascript">
						//페이지 이동
						function fn_movePage(val) {
							jQuery("input[name=pageNo]").val(val);
							jQuery("form[name=frm]").attr("method", "post");
							jQuery("form[name=frm]").attr("action", "")
									.submit();
						}
						//검색 버튼
						function fn_search() {
							if (jQuery("#searchS").val() == "") {
								return;
							} else {
								jQuery("input[name=searchFiled]").val(
										jQuery("#searchS").val());
							}
							var searchValue = jQuery("#searchI").val();
							jQuery("input[name=searchValue]").val(searchValue);

							jQuery("input[name=pageNo]").val("1");
							jQuery("form[name=frm]").attr("method", "post");
							jQuery("form[name=frm]").attr("action", "")
									.submit();
						}
					</script>



					<div class="col-md-10" id="commonRightSide" style="margin-left: 0px; margin-right: 0px; float: left;">
						<div class="col-md-12">
							<div class="panel">

								<div class="panel-body">
									<div class="responsive-table">
										<div class="row">
											<div class="col-sm-6"
												style="width: 50px; height: 0px; flaot: right;">
												<div class="dataTables_length"
													id="datatables-example_length" style="margin-bottom: 0px;">

												</div>
											</div>
										</div>


										<form name="frm">
											<input type="hidden" name="pageNo" />
											<!-- //페이지 번호 -->
											<input type="hidden" name="searchFiled"
												value="${pageVO.searchFiled }" />
											<!-- //검색조건 -->
											<input type="hidden" name="searchValue"
												value="${pageVO.searchValue }" />
											<!-- //검색어 -->

											<!-- 테이블시작 -->
											<div class="row">
												<div class="col-sm-12">
													<table id="datatables-example"
														class="table table-striped table-bordered dataTable no-footer"
														width="100%" cellspacing="0" role="grid"
														aria-describedby="datatables-example_info"
														style="width: 100%; text-align: center;">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending"
																	style="width: 110px; text-align: center;">번호</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width: 370px; text-align: center;">제목</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 277px; text-align: center;">날짜</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 116px; text-align: center;">작성자</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 220px; text-align: center;">첨부파일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 176px; text-align: center;">게시판분류</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 176px; text-align: center;">조회수</th>
															</tr>
														</thead>
														<c:choose>
															<c:when test="${not empty deptNoticeList}">
																<c:forEach var="deptNoticeList"
																	items="${deptNoticeList }">
																	<tbody>
																		<tr role="row" class="odd">
																			<td>${deptNoticeList.board_num}</td>
																			<td><a
																				href="${pageContext.request.contextPath}/student/helpDesk/deptStudDetail?board_num=${deptNoticeList.board_num}&board_count=${deptNoticeList.board_count}&pageNo=${pageVO.pageNo}">
																					${deptNoticeList.board_title} </a></td>
																			<td>${deptNoticeList.board_date}</td>
																			<td>${deptNoticeList.board_writer}</td>
																			<td>${deptNoticeList.board_af}</td>
																			<td>${deptNoticeList.board_bc}</td>
																			<td>${deptNoticeList.board_count}</td>
																		</tr>
																	</tbody>
																</c:forEach>
													</table>
												</div>
											</div>
											<div class="row"></div>
											<!-- 페이징처리 -->
											<div class="dataTables_paginate paging_simple_numbers"
												id="datatables-example_paginate" style="text-align: center;">
												<ul class="pagination">
													<li class="paginate_button previous disabled"
														id="datatables-example_previous"><c:if
															test="${pageVO.pageNo != 1}">
															<a href="javascript:fn_movePage(${pageVO.prevPageNo})"
																aria-controls="datatables-example" data-dt-idx="0"
																tabindex="0"> 이전페이지</a>
														</c:if></li>

													<c:if test="${pageVO.pageNo != 0}">

														<li class="paginate_button active"><c:if
																test="${pageVO.pageNo > pageVO.pageBlock}">
																<a href="javascript:fn_movePage(${pageVO.firstPageNo})"
																	aria-controls="datatables-example" data-dt-idx="1"
																	tabindex="0">[첫 페이지]</a>
															</c:if></li>



														<li class="paginate_button next disabled"
															id="datatables-example_next"><c:forEach var="i"
																begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}"
																step="1">
																<c:choose>
																	<c:when test="${i eq pageVO.pageNo}">
																		<a href="javascript:fn_movePage(${i})"
																			aria-controls="datatables-example" data-dt-idx="2"
																			tabindex="0">${i}</a>
																	</c:when>
																	<c:otherwise>
																		<a href="javascript:fn_movePage(${i})"
																			aria-controls="datatables-example" data-dt-idx="2"
																			tabindex="0">${i}</a>
																	</c:otherwise>
																</c:choose>
															</c:forEach></li>

														<li class="paginate_button next disabled"
															id="datatables-example_next"><c:if
																test="${pageVO.pageNo != pageVO.finalPageNo }">
																<a href="javascript:fn_movePage(${pageVO.nextPageNo})"
																	aria-controls="datatables-example" data-dt-idx="2"
																	tabindex="0">다음페이지</a>
															</c:if></li>

														<li class="paginate_button next disabled"
															id="datatables-example_next"><c:if
																test="${pageVO.endPageNo < pageVO.finalPageNo }">
																<a href="javascript:fn_movePage(${pageVO.finalPageNo})"
																	aria-controls="datatables-example" data-dt-idx="2"
																	tabindex="0">마지막페이지</a></li>
													</c:if>
													</c:if>

												</ul>
											</div>
										</form>
									</div>


									</c:when>


									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>
				</div>



			</div>

			<!-- 포털소식 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area3"
				aria-labelledby="tabs-demo4-area3" style="height: 290px;">


				<div class="col-md-10" id="commonRightSide">
					<script type="text/javascript">
						//페이지 이동
						function fn_movePage(val) {
							jQuery("input[name=pageNo]").val(val);
							jQuery("form[name=frm]").attr("method", "post");
							jQuery("form[name=frm]").attr("action", "")
									.submit();
						}
						//검색 버튼
						function fn_search() {
							if (jQuery("#searchS").val() == "") {
								return;
							} else {
								jQuery("input[name=searchFiled]").val(
										jQuery("#searchS").val());
							}
							var searchValue = jQuery("#searchI").val();
							jQuery("input[name=searchValue]").val(searchValue);

							jQuery("input[name=pageNo]").val("1");
							jQuery("form[name=frm]").attr("method", "post");
							jQuery("form[name=frm]").attr("action", "")
									.submit();
						}
					</script>



					<div class="col-md-10" id="commonRightSide"
						style="margin-left: 0px; margin-right: 0px; float: left;">
						<div class="col-md-12">
							<div class="panel">

								<div class="panel-body">
									<div class="responsive-table">
										<div class="row">
											<div class="col-sm-6"
												style="width: 50px; height: 0px; flaot: right;">
												<div class="dataTables_length"
													id="datatables-example_length" style="margin-bottom: 0px;">

													<!-- 									<div style="width: 700px; float: right; text-align: right; margin-bottom: 0px; margin-top: 0px;"> -->
													<!-- 									</div> -->
												</div>
											</div>
										</div>


										<form name="frm">
											<input type="hidden" name="pageNo" />
											<!-- //페이지 번호 -->
											<input type="hidden" name="searchFiled"
												value="${pageVO.searchFiled }" />
											<!-- //검색조건 -->
											<input type="hidden" name="searchValue"
												value="${pageVO.searchValue }" />
											<!-- //검색어 -->

											<!-- 테이블시작 -->
											<div class="row">
												<div class="col-sm-12">
													<table id="datatables-example"
														class="table table-striped table-bordered dataTable no-footer"
														width="100%" cellspacing="0" role="grid"
														aria-describedby="datatables-example_info"
														style="width: 100%; text-align: center;">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending"
																	style="width: 110px; text-align: center;">번호</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width: 370px; text-align: center;">제목</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 277px; text-align: center;">날짜</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 116px; text-align: center;">작성자</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 220px; text-align: center;">첨부파일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 176px; text-align: center;">게시판분류</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 176px; text-align: center;">조회수</th>
															</tr>
														</thead>
														<c:choose>
															<c:when test="${not empty portalNoticeList}">
																<c:forEach var="portalNoticeList" items="${portalNoticeList }"  end="4">
																	<tbody>
																		<tr role="row" class="odd">
																			<td>${portalNoticeList.board_num}</td>
																			<td><a
																				href="${pageContext.request.contextPath}/student/helpDesk/portalStudDetail?board_num=${portalNoticeList.board_num}&board_count=${portalNoticeList.board_count}&pageNo=${pageVO.pageNo}">
																					${portalNoticeList.board_title} </a></td>
																			<td>${portalNoticeList.board_date}</td>
																			<td>${portalNoticeList.board_writer}</td>
																			<td>${portalNoticeList.board_af}</td>
																			<td>${portalNoticeList.board_bc}</td>
																			<td>${portalNoticeList.board_count}</td>
																		</tr>
																	</tbody>
																</c:forEach>
													</table>
												</div>
											</div>
											<div class="row"></div>
											<!-- 페이징처리 -->
										</form>
									</div>


									</c:when>


									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>
				</div>



			</div>
			<!-- 학과공지 -->
			<div role="tabpanel" class="tab-pane fade" id="tabs-demo4-area4"
				aria-labelledby="tabs-demo4-area4" style="height: 290px;">
				
				
				
				

				<div class="col-md-10" id="commonRightSide">
					<script type="text/javascript">
						//페이지 이동
						function fn_movePage(val) {
							jQuery("input[name=pageNo]").val(val);
							jQuery("form[name=frm]").attr("method", "post");
							jQuery("form[name=frm]").attr("action", "")
									.submit();
						}
						//검색 버튼
						function fn_search() {
							if (jQuery("#searchS").val() == "") {
								return;
							} else {
								jQuery("input[name=searchFiled]").val(
										jQuery("#searchS").val());
							}
							var searchValue = jQuery("#searchI").val();
							jQuery("input[name=searchValue]").val(searchValue);

							jQuery("input[name=pageNo]").val("1");
							jQuery("form[name=frm]").attr("method", "post");
							jQuery("form[name=frm]").attr("action", "")
									.submit();
						}
					</script>



					<div class="col-md-10" id="commonRightSide" style="margin-left: 0px; margin-right: 0px; float: left;">
						<div class="col-md-12">
							<div class="panel">

								<div class="panel-body">
									<div class="responsive-table">
										<div class="row">
											<div class="col-sm-6"
												style="width: 50px; height: 0px; flaot: right;">
												<div class="dataTables_length"
													id="datatables-example_length" style="margin-bottom: 0px;">

												</div>
											</div>
										</div>


										<form name="frm">
											<input type="hidden" name="pageNo" />
											<!-- //페이지 번호 -->
											<input type="hidden" name="searchFiled"
												value="${pageVO.searchFiled }" />
											<!-- //검색조건 -->
											<input type="hidden" name="searchValue"
												value="${pageVO.searchValue }" />
											<!-- //검색어 -->

											<!-- 테이블시작 -->
											<div class="row">
												<div class="col-sm-12">
													<table id="datatables-example"
														class="table table-striped table-bordered dataTable no-footer"
														width="100%" cellspacing="0" role="grid"
														aria-describedby="datatables-example_info"
														style="width: 100%; text-align: center;">
														<thead>
															<tr role="row">
																<th class="sorting_asc" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Name: activate to sort column descending"
																	aria-sort="ascending"
																	style="width: 110px; text-align: center;">번호</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Position: activate to sort column ascending"
																	style="width: 370px; text-align: center;">제목</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Office: activate to sort column ascending"
																	style="width: 277px; text-align: center;">날짜</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Age: activate to sort column ascending"
																	style="width: 116px; text-align: center;">작성자</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Start date: activate to sort column ascending"
																	style="width: 220px; text-align: center;">첨부파일</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 176px; text-align: center;">게시판분류</th>
																<th class="sorting" tabindex="0"
																	aria-controls="datatables-example" rowspan="1"
																	colspan="1"
																	aria-label="Salary: activate to sort column ascending"
																	style="width: 176px; text-align: center;">조회수</th>
															</tr>
														</thead>
														<c:choose>
															<c:when test="${not empty deptNoticeList}">
																<c:forEach var="deptNoticeList"
																	items="${deptNoticeList }">
																	<tbody>
																		<tr role="row" class="odd">
																			<td>${deptNoticeList.board_num}</td>
																			<td><a
																				href="${pageContext.request.contextPath}/student/helpDesk/deptStudDetail?board_num=${deptNoticeList.board_num}&board_count=${deptNoticeList.board_count}&pageNo=${pageVO.pageNo}">
																					${deptNoticeList.board_title} </a></td>
																			<td>${deptNoticeList.board_date}</td>
																			<td>${deptNoticeList.board_writer}</td>
																			<td>${deptNoticeList.board_af}</td>
																			<td>${deptNoticeList.board_bc}</td>
																			<td>${deptNoticeList.board_count}</td>
																		</tr>
																	</tbody>
																</c:forEach>
													</table>
												</div>
											</div>
											<div class="row"></div>
											<!-- 페이징처리 -->
											<div class="dataTables_paginate paging_simple_numbers"
												id="datatables-example_paginate" style="text-align: center;">
												<ul class="pagination">
													<li class="paginate_button previous disabled"
														id="datatables-example_previous"><c:if
															test="${pageVO.pageNo != 1}">
															<a href="javascript:fn_movePage(${pageVO.prevPageNo})"
																aria-controls="datatables-example" data-dt-idx="0"
																tabindex="0"> 이전페이지</a>
														</c:if></li>

													<c:if test="${pageVO.pageNo != 0}">

														<li class="paginate_button active"><c:if
																test="${pageVO.pageNo > pageVO.pageBlock}">
																<a href="javascript:fn_movePage(${pageVO.firstPageNo})"
																	aria-controls="datatables-example" data-dt-idx="1"
																	tabindex="0">[첫 페이지]</a>
															</c:if></li>



														<li class="paginate_button next disabled"
															id="datatables-example_next"><c:forEach var="i"
																begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}"
																step="1">
																<c:choose>
																	<c:when test="${i eq pageVO.pageNo}">
																		<a href="javascript:fn_movePage(${i})"
																			aria-controls="datatables-example" data-dt-idx="2"
																			tabindex="0">${i}</a>
																	</c:when>
																	<c:otherwise>
																		<a href="javascript:fn_movePage(${i})"
																			aria-controls="datatables-example" data-dt-idx="2"
																			tabindex="0">${i}</a>
																	</c:otherwise>
																</c:choose>
															</c:forEach></li>

														<li class="paginate_button next disabled"
															id="datatables-example_next"><c:if
																test="${pageVO.pageNo != pageVO.finalPageNo }">
																<a href="javascript:fn_movePage(${pageVO.nextPageNo})"
																	aria-controls="datatables-example" data-dt-idx="2"
																	tabindex="0">다음페이지</a>
															</c:if></li>

														<li class="paginate_button next disabled"
															id="datatables-example_next"><c:if
																test="${pageVO.endPageNo < pageVO.finalPageNo }">
																<a href="javascript:fn_movePage(${pageVO.finalPageNo})"
																	aria-controls="datatables-example" data-dt-idx="2"
																	tabindex="0">마지막페이지</a></li>
													</c:if>
													</c:if>

												</ul>
											</div>
										</form>
									</div>


									</c:when>


									<c:otherwise>
										<tr>
											<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
										</tr>
									</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>
				</div>



			</div>



		</div>



	</div>
</div>