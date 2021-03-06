<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
    <a href="/web/app/pet/list" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">My Page</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          My Pet
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="/web/app/pet/list" class="link-dark rounded">마이펫</a></li>
            <li><a href="/web/app/pet/form" class="link-dark rounded">마이펫 등록</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="true">
          즐겨찾기
        </button>
        <div class="collapse show" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="/web/app/bookmark/list" class="link-dark rounded">병원 즐겨찾기</a></li>
            <li><a href="/web/app/mypage/mytownlist" class="link-dark rounded">나눔장터 게시글</a></li>
            <li><a href="/web/app/mypage/mytownlist" class="link-dark rounded">우리동네 게시글</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          Account
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="/web/app/member/detail" class="link-dark rounded">Profile</a></li>
            <li><a href="/web/app/qna/list" class="link-dark rounded">Q&A</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>