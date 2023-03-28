package com.ezen.todaytable.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.todaytable.dao.IMainDao;
import com.ezen.todaytable.dao.IMemberDao;
import com.ezen.todaytable.dao.IRecipeDao;
import com.ezen.todaytable.dto.Paging;

@Service
public class MainService {
	
	@Autowired
	RecipeService rs;

	@Autowired
	IMainDao maindao;
	
	@Autowired
	IMemberDao mdao;
	
	@Autowired
	IRecipeDao rdao;
	
	
	
	public void getRecipeBanner(HashMap<String, Object> paramMap) {
		rdao.getRecipeBannerList(paramMap);
	}



	public void getMyRecipeListttable(HashMap<String, Object> paramMap) {

		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpSession session = request.getSession();
		if (request.getParameter("first") != null) {
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

//        String key = "";
//        if(request.getParameter("key")!=null) {
//           session.setAttribute("key", request.getParameter("key"));
//           key = request.getParameter("key");
//        } else if (session.getAttribute("key")!=null){
//        	key = (String)session.getAttribute("key");
//        } else session.removeAttribute("key");

		Paging paging = new Paging();
		paging.setPage(page);
		paramMap.put("cnt", 0);
//        paramMap.put("key", key);
		rdao.getMIFAllCount(paramMap);
		int count = Integer.parseInt(paramMap.get("cnt") + "");
		paging.setTotalCount(count);
		paging.paging();

		paramMap.put("startNum", paging.getStartNum());
		paramMap.put("endNum", paging.getEndNum());
		paramMap.put("paging", paging);
		rdao.getMyRecipeListttable(paramMap);
	}



	public void getMyInterestttable(HashMap<String, Object> paramMap) {
		
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpSession session = request.getSession();
		if (request.getParameter("first") != null) {
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

//        String key = "";
//        if(request.getParameter("key")!=null) {
//           session.setAttribute("key", request.getParameter("key"));
//           key = request.getParameter("key");
//        } else if (session.getAttribute("key")!=null){
//        	key = (String)session.getAttribute("key");
//        } else session.removeAttribute("key");

		Paging paging = new Paging();
		paging.setPage(page);
		paramMap.put("cnt", 0);
//        paramMap.put("key", key);
		rdao.getMIFAllCount(paramMap);
		int count = Integer.parseInt(paramMap.get("cnt") + "");
		paging.setTotalCount(count);
		paging.paging();

		paramMap.put("startNum", paging.getStartNum());
		paramMap.put("endNum", paging.getEndNum());
		paramMap.put("paging", paging);
		rdao.getMyInterestttable(paramMap);
	}



	public void getMyFavoritettable(HashMap<String, Object> paramMap) {
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpSession session = request.getSession();
		if (request.getParameter("first") != null) {
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

//        String key = "";
//        if(request.getParameter("key")!=null) {
//           session.setAttribute("key", request.getParameter("key"));
//           key = request.getParameter("key");
//        } else if (session.getAttribute("key")!=null){
//        	key = (String)session.getAttribute("key");
//        } else session.removeAttribute("key");

		Paging paging = new Paging();
		paging.setPage(page);
		paramMap.put("cnt", 0);
//        paramMap.put("key", key);
		rdao.getMIFAllCount(paramMap);
		int count = Integer.parseInt(paramMap.get("cnt") + "");
		paging.setTotalCount(count);
		paging.paging();

		paramMap.put("startNum", paging.getStartNum());
		paramMap.put("endNum", paging.getEndNum());
		paramMap.put("paging", paging);
		rdao.getMyFavoritttable(paramMap);
	}



	public void getMIFListtable(HashMap<String, Object> paramMap) {
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpSession session = request.getSession();
		if (request.getParameter("first") != null) {
			session.removeAttribute("page");
//			session.removeAttribute("key");
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

//        String key = "";
//        if(request.getParameter("key")!=null) {
//           session.setAttribute("key", request.getParameter("key"));
//           key = request.getParameter("key");
//        } else if (session.getAttribute("key")!=null){
//        	key = (String)session.getAttribute("key");
//        } else session.removeAttribute("key");

		Paging paging = new Paging();
		paging.setDisplayPage(5);
		paging.setDisplayRow(5);
		paging.setPage(page);
		paramMap.put("cnt", 0);
//        paramMap.put("key", key);
		rdao.getMIFAllCount(paramMap);
		int count = Integer.parseInt(paramMap.get("cnt") + "");
		System.out.println("cnt:"+count);
		paging.setTotalCount(count);
		paging.paging();
		


		paramMap.put("startNum", paging.getStartNum());
		paramMap.put("endNum", paging.getEndNum());
		paramMap.put("paging", paging);
		rdao.getMIFListtable(paramMap);
	}



	public void getFavoriteList(HashMap<String, Object> paramMap) {
		rdao.getFavoriteList(paramMap);
	}

	public void changeFuseyn(int rnum, String id) {

		rdao.changeFuseyn(rnum,id);
		
	}



	public void changeFuseyn(HashMap<String, Object> paramMap) {
		rdao.changeFuseyn(paramMap);	
		}




	


		


}
