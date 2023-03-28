package com.ezen.todaytable.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.todaytable.dao.IAdminDao;
import com.ezen.todaytable.dto.AdminVO;
import com.ezen.todaytable.dto.Paging;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;
	//회원목록
	public void getAdminMemberList(HashMap<String, Object> paramMap) {
		 HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
	      HttpSession session = request.getSession();   
	      
	      if(request.getParameter("first")!=null) {
	         session.removeAttribute("page");
	         session.removeAttribute("key");
	      }
	      
	      int page = 1;
	      if (request.getParameter("page") != null) {
	         page = Integer.parseInt(request.getParameter("page"));
	         session.setAttribute("page", page);
	      } else if (session.getAttribute("page") != null) {
	         page = (Integer) session.getAttribute("page");
	      } else {
	         session.removeAttribute("page");
	      }
	      
	      String key="";
	      if (request.getParameter("key") != null) {
	         key = request.getParameter("key");
	         session.setAttribute("key", key);
	      } else if (session.getAttribute("key") != null) {
	         key = (String) session.getAttribute("key");
	      } else {
	         session.removeAttribute("key");
	      }
	      
	      // 페이징 객체 생성
	      Paging paging = new Paging();
	      paging.setPage(page);
	      HashMap<String, Object> cntMap = new HashMap<String, Object>();
	      cntMap.put("cnt", 0);
	      cntMap.put("tableName", 2); 
	      cntMap.put("key", key); 
	      adao.adminGetAllCount(cntMap);
	      int count = (Integer) cntMap.get("cnt"+""); 
	      paging.setTotalCount(count);
	      paging.paging();
	      
	      paramMap.put("key", key);
	      paramMap.put("startNum", paging.getStartNum() );
	      paramMap.put("endNum", paging.getEndNum() );
	      adao.getAdminMemberList(paramMap);
	      
	      paramMap.put("paging", paging);
	      
		
	}
	//휴면회원전환
	public void adminSleepMem(String[] id) {
		
		for(String useid : id) {
			System.out.println(useid);
			adao.adminSleepMem(useid);
		}
		
	}
	//회원디테일
	public void getAdminMemDetail(HashMap<String, Object> paramMap) { 
		adao.getAdminMemDetail(paramMap);
	}
	//Qna게시글 목록
	public void getAdminQnaList(HashMap<String, Object> paramMap) {
		HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
	      HttpSession session = request.getSession();   
	      
	      if(request.getParameter("first")!=null) {
	         session.removeAttribute("page");
	         session.removeAttribute("key");
	      }
	      
	      int page = 1;
	      if (request.getParameter("page") != null) {
	         page = Integer.parseInt(request.getParameter("page"));
	         session.setAttribute("page", page);
	      } else if (session.getAttribute("page") != null) {
	         page = (Integer) session.getAttribute("page");
	      } else {
	         session.removeAttribute("page");
	      }
	      
	      String key="";
	      if (request.getParameter("key") != null) {
	         key = request.getParameter("key");
	         session.setAttribute("key", key);
	      } else if (session.getAttribute("key") != null) {
	         key = (String) session.getAttribute("key");
	      } else {
	         session.removeAttribute("key");
	      }
	      
	      // 페이징 객체 생성
	      Paging paging = new Paging();
	      paging.setPage(page);
	      paramMap.put("cnt", 0);
	      paramMap.put("tableName", 4); 
	      paramMap.put("key", key); 
	      adao.adminGetAllCount(paramMap);
	      int count = (Integer) paramMap.get("cnt"+""); 
	      paging.setTotalCount(count);
	      paging.paging();
	      
	      paramMap.put("startNum", paging.getStartNum() );
	      paramMap.put("endNum", paging.getEndNum() );
	      adao.getAdminQnaList(paramMap);
	      
	      paramMap.put("paging", paging);
		
	}
	//Qna게시글삭제
	public void adminDeleteQna(int[] num) {
		
		for(int qseq: num) {
			adao.adminDeleteQna(qseq);
		}
		
	}
	//Qna디테일
	public void getAdminQnaDetail(HashMap<String, Object> paramMap) {
		adao.getAdminQnaDetail(paramMap);
		
	}
	//Qna답변
	public void adminSaveReply(int qseq,String replyQna) {
		adao.adminSaveReply(qseq,replyQna);
		
	}
	//댓글리스트
	public void getAdminReplyList(HashMap<String, Object> paramMap) {
		
		HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
	      HttpSession session = request.getSession();   
	      
	      if(request.getParameter("first")!=null) {
	         session.removeAttribute("page");
	         session.removeAttribute("key");
	      }
	      
	      int page = 1;
	      if (request.getParameter("page") != null) {
	         page = Integer.parseInt(request.getParameter("page"));
	         session.setAttribute("page", page);
	      } else if (session.getAttribute("page") != null) {
	         page = (Integer) session.getAttribute("page");
	      } else {
	         session.removeAttribute("page");
	      }
	      
	      String key="";
	      if (request.getParameter("key") != null) {
	         key = request.getParameter("key");
	         session.setAttribute("key", key);
	      } else if (session.getAttribute("key") != null) {
	         key = (String) session.getAttribute("key");
	      } else {
	         session.removeAttribute("key");
	      }
	      
	      // 페이징 객체 생성
	      Paging paging = new Paging();
	      paging.setPage(page);
	      HashMap<String, Object> cntMap = new HashMap<String, Object>();
	      cntMap.put("cnt", 0);
	      cntMap.put("tableName", 3); 
	      cntMap.put("key", key); 
	      adao.adminGetAllCount(cntMap);
	      int count = (Integer) cntMap.get("cnt"+""); 
	      paging.setTotalCount(count);
	      paging.paging();
	      
	      paramMap.put("key", key);
	      paramMap.put("startNum", paging.getStartNum() );
	      paramMap.put("endNum", paging.getEndNum() );
	      adao.getAdminReplyList(paramMap);
	      
	      paramMap.put("paging", paging);
		
	}
	//댓글삭제
	public void adminDeleteReply(int[] num) {
		
		for(int replyseq: num) {
			adao.adminDeleteReply(replyseq);
		}
		
	}
	//대쉬보드 카운트 목록조회(이중배열 값에 따라 반환값 틀림)
	public void adminGetCounts(HashMap<String, Object> paramMap) {
		adao.adminGetCounts(paramMap);
	}
	
	//어드민로그인(admins테이블 id로 조회한 행)
	public void getAdminList(HashMap<String, Object> paramMap) {		
		adao.getAdminList(paramMap);
	}
	//대쉬보드 (베스트 조회 레시피, 최근 댓글 (3개씩))
	public void adminDashList(HashMap<String, Object> paramMap) {
		adao.adminDashList(paramMap);
		
	}
	//레시피리스트
	public void getAdminRecipeList(HashMap<String, Object> paramMap) {
		HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
	      HttpSession session = request.getSession();   
	      
	      if(request.getParameter("first")!=null) {
	         session.removeAttribute("page");
	         session.removeAttribute("key");
	      }
	      
	      int page = 1;
	      if (request.getParameter("page") != null) {
	         page = Integer.parseInt(request.getParameter("page"));
	         session.setAttribute("page", page);
	      } else if (session.getAttribute("page") != null) {
	         page = (Integer) session.getAttribute("page");
	      } else {
	         session.removeAttribute("page");
	      }
	      
	      String key="";
	      if (request.getParameter("key") != null) {
	         key = request.getParameter("key");
	         session.setAttribute("key", key);
	      } else if (session.getAttribute("key") != null) {
	         key = (String) session.getAttribute("key");
	      } else {
	         session.removeAttribute("key");
	      }
	      
	      // 페이징 객체 생성
	      Paging paging = new Paging();
	      paging.setPage(page);
	      HashMap<String, Object> cntMap = new HashMap<String, Object>();
	      cntMap.put("cnt", 0);
	      cntMap.put("tableName", 1); 
	      cntMap.put("key", key); 
	      adao.adminGetAllCount(cntMap);
	      int count = (Integer) cntMap.get("cnt"+""); 
	      paging.setTotalCount(count);
	      paging.paging();
	      
	      paramMap.put("key", key);
	      paramMap.put("startNum", paging.getStartNum() );
	      paramMap.put("endNum", paging.getEndNum() );
	      adao.getAdminRecipeList(paramMap);
	      
	      paramMap.put("paging", paging);
		
	}
	//어드민 추천기능 활성화
	public void adminChangeRecommend(String[] rnum) {
		for(String arnum : rnum) {
			System.out.println(arnum);
			adao.adminChangeRecommend(arnum);
		}
		
	}
	public void getAdminPickRecipeList(HashMap<String, Object> paramMap) {
		HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
	      HttpSession session = request.getSession();   
	      
	      if(request.getParameter("first")!=null) {
	         session.removeAttribute("page");
	         session.removeAttribute("key");
	      }
	      
	      int page = 1;
	      if (request.getParameter("page") != null) {
	         page = Integer.parseInt(request.getParameter("page"));
	         session.setAttribute("page", page);
	      } else if (session.getAttribute("page") != null) {
	         page = (Integer) session.getAttribute("page");
	      } else {
	         session.removeAttribute("page");
	      }
	      
	      String key="";
	      if (request.getParameter("key") != null) {
	         key = request.getParameter("key");
	         session.setAttribute("key", key);
	      } else if (session.getAttribute("key") != null) {
	         key = (String) session.getAttribute("key");
	      } else {
	         session.removeAttribute("key");
	      }
	      
	      // 페이징 객체 생성
	      Paging paging = new Paging();
	      paging.setPage(page);
	      HashMap<String, Object> cntMap = new HashMap<String, Object>();
	      cntMap.put("cnt", 0);
	      cntMap.put("tableName", 5); 
	      cntMap.put("key", key); 
	      adao.adminGetAllCount(cntMap);
	      int count = (Integer) cntMap.get("cnt"+""); 
	      paging.setTotalCount(count);
	      paging.paging();
	      
	      paramMap.put("key", key);
	      paramMap.put("startNum", paging.getStartNum() );
	      paramMap.put("endNum", paging.getEndNum() );
	      adao.getAdminPickRecipeList(paramMap);
	      
	      paramMap.put("paging", paging);
		
	}
	//레시피삭제
	public void adminDeleteRecipe(int[] rnum) {
		
		for(int rnum1: rnum) {
			adao.adminDeleteRecipe(rnum1);
		}
		
	}
	//공지사항 리스트
	public void getnoticeList(HashMap<String, Object> paramMap) {
		HttpServletRequest request = (HttpServletRequest)paramMap.get("request");
	      HttpSession session = request.getSession();   
	      
	      if(request.getParameter("first")!=null) {
	         session.removeAttribute("page");
	         session.removeAttribute("key");
	      }
	      
	      int page = 1;
	      if (request.getParameter("page") != null) {
	         page = Integer.parseInt(request.getParameter("page"));
	         session.setAttribute("page", page);
	      } else if (session.getAttribute("page") != null) {
	         page = (Integer) session.getAttribute("page");
	      } else {
	         session.removeAttribute("page");
	      }
	      
	      String key="";
	      if (request.getParameter("key") != null) {
	         key = request.getParameter("key");
	         session.setAttribute("key", key);
	      } else if (session.getAttribute("key") != null) {
	         key = (String) session.getAttribute("key");
	      } else {
	         session.removeAttribute("key");
	      }
	      
	      // 페이징 객체 생성
	      Paging paging = new Paging();
	      paging.setPage(page);
	      HashMap<String, Object> cntMap = new HashMap<String, Object>();
	      cntMap.put("cnt", 0);
	      cntMap.put("tableName", 6); 
	      cntMap.put("key", key); 
	      adao.adminGetAllCount(cntMap);
	      int count = (Integer) cntMap.get("cnt"+""); 
	      paging.setTotalCount(count);
	      paging.paging();
	      
	      paramMap.put("key", key);
	      paramMap.put("startNum", paging.getStartNum() );
	      paramMap.put("endNum", paging.getEndNum() );
	      adao.getnoticeList(paramMap);
	      
	      paramMap.put("paging", paging);
		
	}
	//공지사항 디테일
	public void getNoticeDetail(HashMap<String, Object> paramMap) {
		adao.getNoticeDetail(paramMap);
		
	}
	//공지사항 글작성
	public void insertNotice(AdminVO adminvo) {
		adao.insertNotice(adminvo);
		
	}
	//공지사항 삭제
	public void adminDeleteNotice(int[] num) {
		
		for(int aseq:num) {
			adao.adminDeleteNotice(aseq);
		}
		
	}
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

