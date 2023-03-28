package com.ezen.todaytable.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.todaytable.dto.MemberVO;
import com.ezen.todaytable.dto.Paging;
import com.ezen.todaytable.service.MainService;
import com.ezen.todaytable.service.RecipeService;

@Controller
public class MainController {
	
	@Autowired
	MainService ms;
	
	@Autowired
	RecipeService rs;
	
	@RequestMapping("/")
	public ModelAndView main(HttpSession session) {
		session.removeAttribute("refer");
		ModelAndView mav = new ModelAndView();
		
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("recipekey", "recipe");
		paramMap.put("ref_cursor", null);
		paramMap.put("ref_cursor3", null);
		
		rs.recipeCategory(paramMap);
		ms.getRecipeBanner(paramMap);
		
		ArrayList<HashMap<String , Object>> allList
			= (ArrayList<HashMap<String , Object>>) paramMap.get("ref_cursor");
		ArrayList<HashMap<String , Object>> bannerList
			= (ArrayList<HashMap<String , Object>>) paramMap.get("ref_cursor3");
		
		mav.addObject("allList", allList);
		mav.addObject("bannerList", bannerList);
		
		mav.setViewName("index");
		return mav;
	}
	
	
	@RequestMapping("/announcement")
	public String announcement() {
		return "main/announcement";
	}
	
	@RequestMapping("/ourstory")
	public String ourstory() {
		return "main/ourstory";
	}
	
	@RequestMapping("/privatePolicy")
	public String privatePolicy() {
		return "main/privatePolicy";
	}
	
	@RequestMapping("/terms")
	public String terms() {
		return "main/terms";
	}
	
	@RequestMapping("/myPageView")
	public String myPageView() {
		return "mypage/mypage";
	}

	@RequestMapping("/myRecipeList")
	public ModelAndView myRecipeListForm(HttpServletRequest request,Model model,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("member/loginForm");
		} else {

			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id",loginUser.get("ID") );
			paramMap.put("request",request );
			paramMap.put("ref_cursor", null);
			paramMap.put("tableName", 1);

			ms.getMIFListtable(paramMap);
			
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			
			for(HashMap<String, Object> rvo: list) { // 확인용
				System.out.println("recipeList 확인용 : " + rvo.get("RNUM"));
				paramMap.put("replyCountList", null);
				rs.getReplyCount(paramMap);
			}
			mav.addObject("replyCountList", (ArrayList<Integer>) paramMap.get("replyCountList"));
			mav.addObject("paging", (Paging) paramMap.get("paging"));
			// mav.addObject("key", (String)paramMap.get("key"));
			mav.addObject("myRecipeList", list);

			mav.setViewName("mypage/myRecipeList");
		}

		return mav;
	}
	
	@RequestMapping("/interestView")
	public ModelAndView interestView(HttpServletRequest request,Model model,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if (loginUser == null) {
			mav.setViewName("member/loginForm");
		} else {

			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id",loginUser.get("ID") );
			paramMap.put("request",request );
			paramMap.put("ref_cursor", null);
			paramMap.put("tableName", 2);

			ms.getMIFListtable(paramMap);

			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			for(HashMap<String, Object> rvo: list) { // 확인용
				System.out.println("recipeList 확인용 : " + rvo.get("RNUM"));
				paramMap.put("replyCountList", null);
				rs.getReplyCount(paramMap);
			}
			mav.addObject("replyCountList", (ArrayList<Integer>) paramMap.get("replyCountList"));
			mav.addObject("paging", (Paging) paramMap.get("paging"));
			// mav.addObject("key", (String)paramMap.get("key"));
			mav.addObject("ylist", list);

			mav.setViewName("mypage/interest");
		}

		return mav;
	}
	
	@RequestMapping("/favoriteView")
	public ModelAndView favoriteView(HttpServletRequest request,Model model,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("member/loginForm");
		} else {

			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id",loginUser.get("ID") );
			paramMap.put("request",request );
			paramMap.put("ref_cursor", null);
			paramMap.put("tableName", 3);

			ms.getMIFListtable(paramMap);

			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			for(HashMap<String, Object> rvo: list) { // 확인용
				System.out.println("recipeList 확인용 : " + rvo.get("RNUM"));
				paramMap.put("replyCountList", null);
				rs.getReplyCount(paramMap);
			}
			mav.addObject("replyCountList", (ArrayList<Integer>) paramMap.get("replyCountList"));
			mav.addObject("paging", (Paging) paramMap.get("paging"));
			// mav.addObject("key", (String)paramMap.get("key"));
			mav.addObject("fflist", list);

			mav.setViewName("mypage/favorite");
		}

		return mav;
	}
	
		@RequestMapping(value="/changeFuseyn")
	public String changeFuseyn(
			@RequestParam("rnum") int [] rnum,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
			
		if( loginUser == null ) {
			return "member/login"; 
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			for (int rnum1: rnum) {
				paramMap.put("rnum", rnum1);
				paramMap.put("id", loginUser.get("ID"));
				ms.changeFuseyn(paramMap);
			}

		}
		return "redirect:/interestView";
		
	}
	
	@RequestMapping(value="/myRecipeDelete")
	public String myRecipeDelete(
			@RequestParam("rnum") int [] rnum,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
			
		if( loginUser == null ) {
			return "member/login"; 
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			for (int rnum1: rnum) {
				paramMap.put("rnum", rnum1);
				paramMap.put("id", loginUser.get("ID"));
				rs.deleteRecipe(paramMap);
			}

		}
		return "redirect:/myRecipeList";
		
	}
	
	
	
}
