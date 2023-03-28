package com.ezen.todaytable.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.todaytable.dto.Paging;
import com.ezen.todaytable.dto.ProcessImgVO;
import com.ezen.todaytable.dto.RecipeFormVO;
import com.ezen.todaytable.dto.ReplyVO;
import com.ezen.todaytable.service.RecipeService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class RecipeController {

	@Autowired
	RecipeService rs;
	
	
	@RequestMapping("/recipeDetailView")
	public ModelAndView recipeDetailView(@RequestParam("rnum") int rnum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser = (HashMap<String, Object>) session.getAttribute("loginUser");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rnum", rnum);
		if(session.getAttribute("loginUser") == null) paramMap.put("id", "none");
		else paramMap.put("id", (String) loginUser.get("ID"));
		// System.out.println("id : " + (String) paramMap.get("ID"));
		
		
		// 1. recipe 전달받는 cursor
		paramMap.put("ref_cursor1", null);
		// 2. 재료 정보
		paramMap.put("ref_cursor2", null);
		paramMap.put("ref_cursor3", null);
		// 3. processImages 
		paramMap.put("ref_cursor4", null);
		// 4. 댓글 리스트
		paramMap.put("ref_cursor5", null);
		// 5. 좋아요 여부
		paramMap.put("likeyn", null);
		// 6. 신고 여부
		paramMap.put("reportyn", null);
		
		rs.recipeDetailView(paramMap);
		
		System.out.println("likeyn : " + paramMap.get("likeyn"));
		System.out.println("reportyn : " + paramMap.get("reportyn"));
		
		ArrayList<HashMap<String, Object>> ingArray = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor2"); 
		System.out.println("전달된 paramMap의 ingArray : " + paramMap.get("ref_cursor2"));
		ArrayList<HashMap<String, Object>> qtyArray = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor3"); 
		System.out.println("전달된 paramMap의 qtyArray : " + paramMap.get("ref_cursor3"));
		
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor1");
		mav.addObject("recipeVO", list.get(0));
		// mav.addObject("Ings", paramMap.get("exArray"));
		mav.addObject("ingArray", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor2"));
		mav.addObject("qtyArray", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor3"));
		mav.addObject("processImgs", (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor4"));
		System.out.println("processImgs : " + (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor4"));
		mav.addObject("replyList", (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor5"));
		mav.addObject("rnum", paramMap.get("rnum"));
		mav.addObject("likeyn", paramMap.get("likeyn"));
		mav.addObject("reportyn", paramMap.get("reportyn"));
		mav.setViewName("recipe/recipeDetail");
		return mav;
	}
	
	@RequestMapping("/recipeDetailWithoutView")
	public ModelAndView recipeDetailWithoutView(@RequestParam("rnum") int rnum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser = (HashMap<String, Object>) session.getAttribute("loginUser");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rnum", rnum);
		// System.out.println("loginUser : " + loginUser);
		if(session.getAttribute("loginUser") == null) paramMap.put("id", "none");
		else paramMap.put("id", (String) loginUser.get("ID"));
		// System.out.println("id : " + (String) loginUser.get("ID"));
		
		// 1. recipe 전달받는 cursor
		paramMap.put("ref_cursor1", null);
		// 2. 재료 정보
		paramMap.put("ref_cursor2", null);
		paramMap.put("ref_cursor3", null);
		// 3. processImages 
		paramMap.put("ref_cursor4", null);
		// 4. 댓글 리스트
		paramMap.put("ref_cursor5", null);
		// 5. 좋아요 여부
		paramMap.put("likeyn", null);
		// 6. 신고 여부
		paramMap.put("reportyn", null);
		
		rs.recipeDetailWithoutView(paramMap);
		
		System.out.println("likeyn : " + paramMap.get("likeyn"));
		System.out.println("reportyn : " + paramMap.get("reportyn"));
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor1");
		mav.addObject("recipeVO", list.get(0));
		mav.addObject("ingArray", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor2"));
		mav.addObject("qtyArray", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor3"));
		mav.addObject("processImgs", (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor4"));
		mav.addObject("replyList", (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor5"));
		mav.addObject("rnum", paramMap.get("rnum"));
		mav.addObject("likeyn", paramMap.get("likeyn"));
		mav.addObject("reportyn", paramMap.get("reportyn"));
		mav.setViewName("recipe/recipeDetail");
		return mav;
		
	}
	
	@RequestMapping("/deleteRecipe")
	public String deleteRecipe(@RequestParam("rnum") int rnum, HttpServletRequest request) {
		String url = "redirect:/recipeCategory?status=recipe&page=1";
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) url = "member/loginForm";
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rnum", rnum);
		rs.deleteRecipe(paramMap);
		return url;
	}
	
	@RequestMapping("/recipeForm")
	public String recipeForm(HttpServletRequest request) {
		String url = "recipe/recipeForm";
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) url = "member/loginForm";
		return url;
	}
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="thumbnailUp", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> thumbnailUp(Model model, HttpServletRequest request) {
		String path = context.getRealPath("/imageRecipe");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
			result.put("STATUS", 1);
			result.put("FILENAME", multi.getFilesystemName("timg") );
			System.out.println("thumbnail의 이름 : " + multi.getFilesystemName("timg") );
		} catch (IOException e) { e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="processImgUp", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> processImgUp(Model model, HttpServletRequest request) {
		String path = context.getRealPath("/imageRecipe");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
			result.put("STATUS", 1);
			result.put("FILENAME", multi.getFilesystemName("processImg") );
			System.out.println("processImg의 이름 : " + multi.getFilesystemName("processImg") );
		} catch (IOException e) { e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="editImg", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> editImg(Model model, HttpServletRequest request) {
		String path = context.getRealPath("/imageRecipe");
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
			result.put("STATUS", 1);
			result.put("FILENAME", multi.getFilesystemName("editImg") );
			System.out.println("processImg의 이름 : " + multi.getFilesystemName("editImg") );
		} catch (IOException e) { e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/writeRecipe", method=RequestMethod.POST)
	public ModelAndView writeRecipe(
			@ModelAttribute("rvo") @Valid RecipeFormVO recipeformvo, BindingResult result, 
			HttpServletRequest request, 
			@RequestParam("count") int count) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		mav.setViewName("recipe/recipeForm");
		if(result.getFieldError("subject") != null) {
			mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
			System.out.println("message : " + result.getFieldError("subject").getDefaultMessage());
		}
		else if(result.getFieldError("content") != null)
			mav.addObject("message", result.getFieldError("content").getDefaultMessage());
		else if(result.getFieldError("thumbnail") != null) {
			System.out.println(result.getFieldError("thumbnail").getDefaultMessage());
			mav.addObject("message", result.getFieldError("thumbnail").getDefaultMessage());
		}
		else if(result.getFieldError("checkIng") != null)
			mav.addObject("message", result.getFieldError("checkIng").getDefaultMessage());
		else if(result.getFieldError("processDetail1") != null)
			mav.addObject("message", result.getFieldError("processDetail1").getDefaultMessage());
		else {
		paramMap.put("id", recipeformvo.getId());
		// paramMap.put("nick", recipeformvo.getNick());
		paramMap.put("subject", recipeformvo.getSubject());
		paramMap.put("content", recipeformvo.getContent());
		paramMap.put("cookingtime", recipeformvo.getCookingTime());
		if(recipeformvo.getThumbnail() == null || recipeformvo.getThumbnail().equals("null"))
			paramMap.put("thumbnail", "imageRecipe/emptyTimg.jpg");
		else
		paramMap.put("thumbnail", "imageRecipe/"+recipeformvo.getThumbnail());
		paramMap.put("checkIng", recipeformvo.getCheckIng());
		paramMap.put("type", recipeformvo.getType());
		paramMap.put("theme", recipeformvo.getTheme());
		paramMap.put("ing", recipeformvo.getIng());
		System.out.println("컨트롤러로 도착한 ing : " + recipeformvo.getIng());
		paramMap.put("count", count);
		
		// processImgs와 processDetail들의 수는 미정이어서 우선 request.getParameter 사용
		ArrayList<ProcessImgVO> processList = new ArrayList<ProcessImgVO>();
		for(int i=0; i<count; i++) {
			ProcessImgVO pvo = new ProcessImgVO();
			String fileName = request.getParameter("processImg"+(i+1));
			System.out.println("fileName : " + fileName);
			if( (fileName==null) || (fileName.equals("")) || (fileName.equals("null"))) 
				pvo.setLinks("imageRecipe/cookingTimer.png");
			else 
				pvo.setLinks("imageRecipe/" + fileName);
			pvo.setIseq(i+1);
			String detail = request.getParameter("processDetail"+ (i+1));
			if(detail == null || detail.equals("")) {
				System.out.println("detail이 null인 경우 : " + detail);
				pvo.setDescription("요리 과정을 입력하지 않았어요.");
			}
			else {
				System.out.println(detail);
				pvo.setDescription(detail);
			}
			processList.add(pvo);
		}
		
		paramMap.put("processList", processList);
		paramMap.put("max_rnum", null);
		
		// paramMap.put("lastTagId", 0);
		// paramMap.put("max_rnum", null);
		rs.insertRecipe(paramMap);
		rs.insertProcessIng(paramMap);
		System.out.println("processIng 성공");
		mav.setViewName("redirect:/recipeCategory?status=recipe&page=1");
		}
		return mav;
	}
	
	@RequestMapping("/recipeUpdateForm")
	public ModelAndView recipeUpdateForm(HttpServletRequest request, @RequestParam("rnum") int rnum) {
		ModelAndView mav = new ModelAndView();
		String url = "recipe/recipeUpdateForm";
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) url = "member/loginForm";
		else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("rnum", rnum);
			// 1. recipe 전달받는 cursor
			paramMap.put("ref_cursor1", null);
			// 2. 재료 정보
			paramMap.put("ref_cursor2", null);
			paramMap.put("ref_cursor3", null);
			// 3. processImages 
			paramMap.put("ref_cursor4", null);
			
			rs.getRecipeForUpdate(paramMap);
			
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor1");
			mav.addObject("recipeVO", list.get(0));
			mav.addObject("ingArray", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor2"));
			mav.addObject("qtyArray", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor3"));
			mav.addObject("processImgs", (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor4"));
			// mav.addObject("rnum", paramMap.get("rnum"));
		}
		
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/updateRecipe", method=RequestMethod.POST)
	public ModelAndView updateRecipe(@ModelAttribute @Valid RecipeFormVO recipeformvo, BindingResult result, 
			HttpServletRequest request, @RequestParam("count") int count) {
		ModelAndView mav = new ModelAndView();
		
		// System.out.println("id : " + recipeformvo.getId() + "rnum : " + recipeformvo.getRnum() + "thumbnail : " + recipeformvo.getThumbnail());
		// System.out.println("request.getParameter : " + request.getParameter("id"));
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if(result.getFieldError("subject") != null) {
			mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
			System.out.println("message : " + result.getFieldError("subject").getDefaultMessage());
		}
		else if(result.getFieldError("content") != null)
			mav.addObject("message", result.getFieldError("content").getDefaultMessage());
		else if(result.getFieldError("thumbnail") != null)
			mav.addObject("message", result.getFieldError("thumbnail").getDefaultMessage());
		else if(result.getFieldError("checkIng") != null)
			mav.addObject("message", result.getFieldError("checkIng").getDefaultMessage());
		else {
		paramMap.put("id", recipeformvo.getId());
		// paramMap.put("nick", recipeformvo.getNick());
		paramMap.put("subject", recipeformvo.getSubject());
		paramMap.put("content", recipeformvo.getContent());
		paramMap.put("cookingtime", recipeformvo.getCookingTime());
		paramMap.put("thumbnail", recipeformvo.getThumbnail());
		paramMap.put("checkIng", recipeformvo.getCheckIng());
		paramMap.put("type", recipeformvo.getType());
		paramMap.put("theme", recipeformvo.getTheme());
		paramMap.put("count", count);
		paramMap.put("rnum", recipeformvo.getRnum());
		// processImgs와 processDetail들의 수는 미정이어서 우선 request.getParameter 사용
		ArrayList<ProcessImgVO> processList = new ArrayList<ProcessImgVO>();
		for(int i=0; i<count; i++) {
			ProcessImgVO pvo = new ProcessImgVO();
			String fileName = request.getParameter("processImg"+(i+1));
			// if(fileName==null || fileName.equals(""))
			if(fileName.equals("imageRecipe/null") || fileName.equals("imageRecipe/"))
				pvo.setLinks("imageRecipe/cookingTimer.png");
			else pvo.setLinks(fileName);
			System.out.println("fileName : " + fileName);
			pvo.setIseq(i+1);
			String detail = request.getParameter("processDetail"+ (i+1));
			if(detail == null || detail.equals("")) {
				System.out.println("detail이 null인 경우 : " + detail);
				pvo.setDescription("요리 과정을 입력하지 않았어요.");
			}
			else {
				System.out.println(detail);
				pvo.setDescription(detail);
			}
			processList.add(pvo);
		}
		
		paramMap.put("processList", processList);
		// paramMap.put("max_rnum", null);
		
		// paramMap.put("lastTagId", 0);
		rs.updateRecipe(paramMap);
		// rs.updateProcessIng(paramMap);
		mav.setViewName("redirect:/recipeDetailWithoutView?rnum="+recipeformvo.getRnum());
		
		}
		return mav;
	}
	
	@RequestMapping("/recipeList")
	public ModelAndView recipeList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
			
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ref_cursor", null);
		paramMap.put("request", request);
		rs.goRecipeList( paramMap );
		
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
		// System.out.println("list.get(0) rnum 확인용 : " + list.get(0));
		for(HashMap<String, Object> rvo: list) { // 확인용
			
			System.out.println("recipeList 확인용 : " + rvo.get("RNUM"));
		}
		
		paramMap.put("replyCountList", null);
		rs.getReplyCount(paramMap);
		/*
		for(Integer replycnt : (ArrayList<Integer>) paramMap.get("replyCountList")) { // 확인용
			System.out.println("replycnt : " + replycnt);
		}
		*/
		mav.addObject("recipeList", (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor"));
		mav.addObject("paging", (Paging) paramMap.get("paging"));
		mav.addObject("key", (String) paramMap.get("key"));
		mav.addObject("condition", (String) paramMap.get("condition"));
		mav.addObject("total",  Integer.parseInt(String.valueOf(paramMap.get("total"))));
		mav.addObject("replyCountList", (ArrayList<Integer>) paramMap.get("replyCountList"));
		mav.setViewName("recipe/recipeList");
		return mav;
	}
	
	/* 댓글 달기 ajax => 실패
	@ResponseBody
	@RequestMapping(value="/addReply", method=RequestMethod.POST)
	public HashMap<String, Object> addreply(
			@ModelAttribute("replyVO") @Valid ReplyVO replyVO, 	BindingResult result,
			// @RequestParam("rnum") int rnum,
			// @RequestParam("reply") String reply,
			HttpServletRequest request, Model model
			) {
		
			System.out.println("addReply 도착");
			// 로그인 확인은 jsp에서(로그인되지 않은 유저는 alert("로그인 후 댓글 등록이 가능합니다.");)
			HttpSession session = request.getSession();
			HashMap<String, Object> loginUser 
			= (HashMap<String, Object>)session.getAttribute("loginUser");
			
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			if(replyVO.getRnum()==null) System.out.println("rnum이 넘어오지 않았어요");
			
			String reply = request.getParameter("reply");
			paramMap.put("id", loginUser.get("ID"));
			paramMap.put("rnum", replyVO.getRnum());
			paramMap.put("reply", reply );
			paramMap.put("replyseq", 0); // 방금 넣은 댓글의 번호를 담아옴
			
			try {
				rs.addReply( paramMap );
				resultMap.put("STATUS", 1);
				resultMap.put("ID", loginUser.get("ID"));
				resultMap.put("CONTENT", reply);
				// resultMap.put("replydate", ??);
				// jsp에서 표시 : <jsp:useBean id="now" class="java.util.Date"/>    
				// <fmt:formatDate value="${now}" dateStyle="long"/>
				// <fmt:formatDate value="${now}" pattern="dd-MM-yyyy HH:mm:ss a z" />
				
				// jsp 표시 : id, content, replydate, 삭제 버튼
				resultMap.put("REPLYSEQ", Integer.parseInt(String.valueOf(paramMap.get("replyseq"))));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		return resultMap;
	}
	*/
	
	@RequestMapping("/recipeCategory")
	public ModelAndView recipeCategory(
			@RequestParam("status") String status,
			// @RequestParam("page") int page,
			@RequestParam(value="kind", required=false) String kind,
			HttpServletRequest request
			) {
		System.out.println("컨트롤러에 도착한 kind : " + kind);
		if(kind==null) kind= "0";
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> paramMap = new HashMap<>();
		
		/*
		if(kind != null) // 카테고리 필터를 통해 전송된 값이 존재
			paramMap.put("kind", kind);
		*/
		
		paramMap.put("kind", Integer.parseInt(kind));
		paramMap.put("ref_cursor", null);	// 카테고리에 해당하는 레시피vo 를 가져올 커서
		paramMap.put("replyCountList", null);
		paramMap.put("request", request);
		
		// 레시피 키라는 이름으로 웹페이지에서 status 라고 넘긴 값을 전송합니다. 이것을 이용해서 sql문에 접근합니다.
		paramMap.put("recipekey", status);
		rs.getCategory( paramMap );
		System.out.println("getCategory까지 성공");
		rs.getReplyCount(paramMap);
		System.out.println("getReplyCount까지 성공");
		ArrayList<HashMap<String , Object>> recipeCategory
		= (ArrayList<HashMap<String , Object>>) paramMap.get("ref_cursor");
		ArrayList<HashMap<String, Object>> replyCountList
		= (ArrayList<HashMap<String , Object>>) paramMap.get("replyCountList");
		
		//RecipeVO rvo = (RecipeVO)recipeCategory.get(0);
		
		for(HashMap<String, Object> recipe : recipeCategory) { // null 확인용
			System.out.println(recipe);
		}
		
		mav.addObject("RecipeCategory", recipeCategory);
		mav.addObject("replyCountList", replyCountList);
		// mav.addObject("total", recipeCategory.size());
		mav.addObject("total", Integer.parseInt(String.valueOf(paramMap.get("total"))));
		mav.addObject("status", status);
		mav.addObject("paging", (Paging) paramMap.get("paging"));
		mav.addObject("kind", kind);
		
		mav.setViewName("recipe/recipeCategory");
		
		return mav;
		
	}
	
	
	@RequestMapping("/recipeFavoriteAndRec")
	public ModelAndView recipeFavoriteAndRec(
			// @RequestParam("page") int page,
			HttpServletRequest request, 
			@RequestParam("kind") int kind) {
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> paramMap = new HashMap<>();
		// paramMap.put("ref_cursor2", null); // 관리자 추천
		// paramMap.put("ref_cursor", null); 	// 단골레시피 상위권
		paramMap.put("rec_cursor", null);// 
		paramMap.put("kind", kind);
		paramMap.put("replyCountList", null); // 댓글 갯수
		paramMap.put("request", request);
		
		rs.recipeFavoriteAndRec( paramMap );
		rs.getReplyCount(paramMap);
		
		ArrayList<HashMap<String , Object>> recipeList
			= (ArrayList<HashMap<String , Object>>) paramMap.get("ref_cursor");
		ArrayList<HashMap<String, Object>> replyCountList
		= (ArrayList<HashMap<String , Object>>) paramMap.get("replyCountList");
		
		// mav.addObject("recommandList", recommandList);
		// mav.addObject("favoriteList", favoriteList);
		mav.addObject("recipeList", recipeList);
		mav.addObject("replyCountList", replyCountList);
		mav.addObject("paging", (Paging) paramMap.get("paging"));
		mav.addObject("kind", kind);
		
		mav.setViewName("recipe/recipeFavoriteAndRec");
		return mav;
	}
	
	
	@RequestMapping("/addReply")
	public ModelAndView addreply(
			@ModelAttribute("replyVO") @Valid ReplyVO replyVO, 	BindingResult result,
			@RequestParam("rnum") int rnum,
			@RequestParam("reply") String reply,
			HttpServletRequest request, RedirectAttributes re
			) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null ) {
			mav.setViewName("member/login");
		}else {
			if(result.getFieldError("reply")!=null) {
				re.addFlashAttribute("replyMessage", result.getFieldError("reply").getDefaultMessage());
				mav.setViewName("redirect:/recipeDetailWithoutView?rnum="+rnum);
				// mav.addObject("replyMessage", result.getFieldError("reply").getDefaultMessage());
				System.out.println("replyMessage : " + result.getFieldError("reply").getDefaultMessage());
			}
			else {
				HashMap<String, Object> paramMap = new HashMap<>();
				paramMap.put("id", loginUser.get("ID"));
				paramMap.put("rnum", rnum );
				paramMap.put("reply", reply );
				
				rs.addReply( paramMap );
				System.out.println("addReply 성공");
				mav.setViewName("redirect:/recipeDetailWithoutView?rnum="+rnum);
			}
			
		}
		return mav;
	}
	
	/** 덧글 삭제 버튼이 로그인을 했을 때, 덧글 작성자의 아이디와 같을 때만 뜨기 때문에 
	 * 로그인을 했는지, 로그인한 아이디와 덧글 작성자의 아이디가 같은지 유효성 검사는 넘겨도 된다.
	 * */
	
	@RequestMapping("/deleteReply")
	public String deleteReply(
			@RequestParam("rnum") int rnum,
			@RequestParam("replyseq") int replyseq
			) {
		rs.deleteReply(replyseq);
		return "redirect:/recipeDetailWithoutView?rnum="+rnum;
	}
	
	@RequestMapping("/likeRecipe")
	public String likeRecipe(
			@RequestParam("rnum") int rnum,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null ) {
			return "member/login";
		}else {
			
			// 좋아요 세팅에 필요한건 rnum과 id
			// 우선 좋아요를 누른 사람이 이 게시물에 좋아요를 누른적이 있는지 없는지 검사해야함.
			// 분기가 완전히 갈리는데,
			// 그 게시물에 좋아요를 한적이 없는 유저라면 Like는 Y로, Favorite는 N으로 insert가 이루어져야한다.
			// 좋아요를 한적이 있는 유저라면 그때부터는 like, favorite Y, N 바꾸기만 하면 된다.
			// 전부 데이터베이스에서만 왔다갔다 하기 때문에 아웃변수를 잡아줄 필요는 없다.
			
			// 위의 작업이 다 끝난 후에 recipe-page에 해당 rnum의 총 좋아요 갯수를 업데이트한다.
			HashMap<String, Object> paramMap = new HashMap<>();
			paramMap.put("id", loginUser.get("ID"));
			paramMap.put("rnum", rnum );
			rs.likeRecipe(paramMap);
		}
		return "redirect:/recipeDetailWithoutView?rnum="+rnum;
	}
	
	@RequestMapping("/reportRecipe")
	public String reportRecipe(
			@RequestParam("rnum") int rnum,
			HttpServletRequest request
			) {
		String url = "";
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
		= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null ) {
			url = "member/login";
			
		}else {
			HashMap<String, Object> paramMap = new HashMap<>();
			paramMap.put("id", loginUser.get("ID"));
			paramMap.put("rnum", rnum );
			rs.reportRecipe(paramMap);
			System.out.println("레시피 신고 또는 신고 취소 완료");
			url = "redirect:/recipeDetailWithoutView?rnum="+rnum;
		}
		
		return url;
	}
	
	
	
}
