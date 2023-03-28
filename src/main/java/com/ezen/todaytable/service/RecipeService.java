package com.ezen.todaytable.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.todaytable.dao.IRecipeDao;
import com.ezen.todaytable.dto.Paging;
import com.ezen.todaytable.dto.ProcessImgVO;

@Service
public class RecipeService {

	@Autowired
	IRecipeDao rdao;


	public void recipeCategory(HashMap<String, Object> paramMap) {
		rdao.recipeCategory( paramMap );
	}
	
	public void recipeDetailView(HashMap<String, Object> paramMap) {
		// 조회수 증가
		rdao.addRecipeView(paramMap);
		// * 아래 4개의 과정을 하나의 프로시저로
		rdao.getRecipe(paramMap);
		// recipe 조회
		// 재료 조회
		// 상세과정 조회
		// 댓글 리스트 조회
		
		
	}

	public void recipeDetailWithoutView(HashMap<String, Object> paramMap) {
		rdao.getRecipe(paramMap);
	}
	
	public void deleteRecipe(HashMap<String, Object> paramMap) {
		rdao.deleteRecipe(paramMap);
	}

	public void recipeFavoriteAndRec(HashMap<String, Object> paramMap) {
		// 기존 : rdao.recipeFavoriteAndRec(paramMap);
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpSession session = request.getSession();
		
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		}else if(session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
		
		Paging paging = new Paging();
		paging.setDisplayPage(10);
		paging.setDisplayRow(12);
		paging.setPage(page);
		
		HashMap<String, Object> cntMap = new HashMap<String, Object>();
		cntMap.put("cnt", 0);
		if(Integer.parseInt(String.valueOf(paramMap.get("kind")))==1) // 관리자 리스트를 선택했다면
			cntMap.put("recipekey", "adminRec");
		else cntMap.put("recipekey", "favorite");
		cntMap.put("kind", 0); // 임의의 값 넣어줌
		rdao.getRecipeCounts(cntMap); 
		int count = Integer.parseInt(String.valueOf(cntMap.get("cnt")));
		paging.setTotalCount(count);
		paging.paging();
		System.out.println("count(게시물 갯수) : " + count); // 확인용
		// paramMap.put("total", count);
		paramMap.put("startNum", paging.getStartNum());
		paramMap.put("endNum", paging.getEndNum());
		rdao.recipeFavoriteAndRec(paramMap);
		paramMap.put("paging", paging);
	}

	public void addReply(HashMap<String, Object> paramMap) {
		rdao.addReply(paramMap);
	}

	public void deleteReply(int replyseq) {
		rdao.deleteReply(replyseq);
	}

	public void likeRecipe(HashMap<String, Object> paramMap) {
		rdao.likeRecipe(paramMap);
	}
	public void reportRecipe(HashMap<String, Object> paramMap) {
		rdao.reportRecipe(paramMap);
	}

	public void insertRecipe(HashMap<String, Object> paramMap) {
		rdao.insertRecipe(paramMap);
		
	}
	
public void insertProcessIng(HashMap<String, Object> paramMap) {
		
		String checkIng = (String) paramMap.get("checkIng");
		System.out.println("service로 전달된 checkIng : " + checkIng); // 확인용
		String [] ingredients = checkIng.split("\\s");
		ArrayList<String> ingArray = new ArrayList<String>();
		ArrayList<String> qtyArray = new ArrayList<String>();
		for(int i=0; i<ingredients.length; i++) {
			if(ingredients[i].startsWith("#")) {
				String substr = ingredients[i].substring(1);
				ingArray.add(substr);
			}else {
				qtyArray.add(ingredients[i]);
			}
		}
		
		int rnum = Integer.parseInt(String.valueOf(paramMap.get("max_rnum")));
		System.out.println("rnum : " + rnum);
		ArrayList<ProcessImgVO> processList = (ArrayList<ProcessImgVO>) paramMap.get("processList");
		// process 반복문 프로시져 : processList 반복하며 insertProcess 반복(rnum 활용) 
		for(ProcessImgVO pvo : processList) {
			HashMap<String, Object> pvoMap = new HashMap<String, Object>();
			pvoMap.put("rnum", rnum);
			pvoMap.put("iseq", pvo.getIseq());
			pvoMap.put("links", pvo.getLinks());
			pvoMap.put("description", pvo.getDescription());
			rdao.insertProcess(pvoMap);
			// rdao.insertProcess(rnum, pvo.getIseq(), pvo.getLinks(), pvo.getDescription());
		}
		
		for(int i=0; i<ingArray.size(); i++) {
			HashMap<String, Object> ingMap = new HashMap<String, Object>();
			ingMap.put("tag", (String) ingArray.get(i));
			System.out.println("tag : " +  ingArray.get(i)); // 확인용
			ingMap.put("rnum", rnum);
			// System.out.println("ing에서의 rnum : " + rnum);
			ingMap.put("quantity", (String) qtyArray.get(i));
			System.out.println("quantity : " +  qtyArray.get(i)); // 확인용
			ingMap.put("cnt", null);
			rdao.getTagCnt(ingMap);
			// rdao.insertIng(ingArray.get(i), rnum, qtyArray.get(i));
			// rdao.insertIng(ingMap);
			int cnt = Integer.parseInt(String.valueOf(ingMap.get("cnt")));
			System.out.println("cnt : " + cnt); // 확인용
			if(cnt==0) {
				rdao.insertTag(ingMap);
				System.out.println("cnt가 0이므로 태그가 삽입됩니다.");
			}
			else {
				rdao.insertRecipeTag(ingMap);
				System.out.println("cnt가 0이 아니므로 레시피태그만 삽입됩니다.");
			}
			
			
		}
		
	}

	public void updateRecipe(HashMap<String, Object> paramMap) {
		
		String checkIng = (String) paramMap.get("checkIng");
		System.out.println("service로 전달된 checkIng : " + checkIng);
		String [] ingredients = checkIng.split("\\s");
		ArrayList<String> ingArray = new ArrayList<String>();
		ArrayList<String> qtyArray = new ArrayList<String>();
		for(int i=0; i<ingredients.length; i++) {
			if(ingredients[i].startsWith("#")) {
				String substr = ingredients[i].substring(1);
				ingArray.add(substr);
			}else {
				qtyArray.add(ingredients[i]);
			}
		}
		
		for(String str : ingArray) { // 확인용
			System.out.println("ingArray 내용 : " + str);
		}
		for(String str : qtyArray) { // 확인용
			System.out.println("qtyArray 내용 : " + str);
		}
		
		// 1) recipe 테이블 수정
		rdao.updateRecipe(paramMap);
		
		int rnum = Integer.parseInt(String.valueOf(paramMap.get("rnum")));
		
		// 2) processImg 테이블과 recipeTag 테이블의 레코드 삭제
		rdao.deleteProcess(paramMap);
		
		// 3) processImg 레코드 삽입
		ArrayList<ProcessImgVO> processList = (ArrayList<ProcessImgVO>) paramMap.get("processList");
		for(ProcessImgVO pvo : processList) {
			HashMap<String, Object> pvoMap = new HashMap<String, Object>();
			pvoMap.put("rnum", rnum);
			pvoMap.put("iseq", pvo.getIseq());
			pvoMap.put("links", pvo.getLinks());
			pvoMap.put("description", pvo.getDescription());
			rdao.insertProcess(pvoMap);
		}
		
		// 4) 재료 레코드 삽입
		
		
		for(int i=0; i<ingArray.size(); i++) {
			HashMap<String, Object> ingMap = new HashMap<String, Object>();
			ingMap.put("tag", (String) ingArray.get(i));
			System.out.println("tag : " +  ingArray.get(i)); // 확인용
			ingMap.put("rnum", rnum);
			// System.out.println("ing에서의 rnum : " + rnum);
			ingMap.put("quantity", (String) qtyArray.get(i));
			System.out.println("quantity : " +  qtyArray.get(i)); // 확인용
			ingMap.put("cnt", null);
			rdao.getTagCnt(ingMap);
			int cnt = Integer.parseInt(String.valueOf(ingMap.get("cnt")));
			System.out.println("cnt : " + cnt); // 확인용
			if(cnt==0) {
				rdao.insertTag(ingMap);
				System.out.println("cnt가 0이므로 태그가 삽입됩니다.");
			}
			else {
				rdao.insertRecipeTag(ingMap);
				System.out.println("cnt가 0이 아니므로 레시피태그만 삽입됩니다.");
			}
		}

	}

	public void goRecipeList(HashMap<String, Object> paramMap) {
		// header에서 검색 시 검색 결과를 반영한 레시피 리스트로 이동하는 액션입니다. 
			HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
			HttpSession session = request.getSession();
			
			if(request.getParameter("start")!=null) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			int page = 1;
			if(request.getParameter("page")!=null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			}else if(session.getAttribute("page")!=null) {
				page = (Integer)session.getAttribute("page");
			}else {
				session.removeAttribute("page");
			}
			
			String key = "";
			if( request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key", key); 
			}else if( session.getAttribute("key") != null) {
				key = (String) session.getAttribute("key");
			}else {
				session.removeAttribute("key");
			}
			
			Paging paging = new Paging();
			paging.setDisplayPage(10);
			paging.setDisplayRow(12);
			paging.setPage(page);
			
			// System.out.println("key 확인용 : " + key); // 확인용
			
			// ArrayList<HashMap<String, Object>> recipeList = new ArrayList<HashMap<String, Object>>();
			
			String condition = "";
			if( request.getParameter("condition") != null) {
				condition = request.getParameter("condition");
				session.setAttribute("condition", condition); 
			}else if( session.getAttribute("condition") != null) {
				condition = (String) session.getAttribute("condition");
			}else {
				session.removeAttribute("condition");
			}
			paramMap.put("condition", condition);
			
			HashMap<String, Object> cntMap = new HashMap<String, Object>();
			System.out.println("condition 확인용 : " + condition); // 확인용
			
			if(condition.equals("ing")) {
				cntMap.put("cnt", 0);
				// cntMap.put("tableName", "ingTag i, recipeTag r");
				// cntMap.put("fieldName", "i.tag_id = r.tag_id and i.tag");
				cntMap.put("tableName", 1);
				cntMap.put("key", key);
				rdao.getCountsByKey(cntMap); 
				int count = Integer.parseInt(String.valueOf(cntMap.get("cnt")));
				paging.setTotalCount(count);
				paging.paging();
				paramMap.put("total", count);
				paramMap.put("tableName", 1);
				paramMap.put("key", key);
				paramMap.put("startNum", paging.getStartNum());
				paramMap.put("endNum", paging.getEndNum());
				// recipeList = rdao.selectListByIng( paging , key);
				// rdao.selectListByIng( paramMap);
				rdao.selectListByKey( paramMap);
				paramMap.put("paging", paging);
				
			}else if(condition.equals("title")) {
				cntMap.put("cnt", 0);
				cntMap.put("tableName", 2);
				// cntMap.put("fieldName", "subject");
				cntMap.put("key", key);
				rdao.getCountsByKey(cntMap); 
				int count = Integer.parseInt(String.valueOf(cntMap.get("cnt")));
				paging.setTotalCount(count);
				paging.paging();
				System.out.println("count(게시물 갯수) : " + count); // 확인용
				paramMap.put("total", count);
				paramMap.put("tableName", 2);
				paramMap.put("key", key);
				paramMap.put("startNum", paging.getStartNum());
				paramMap.put("endNum", paging.getEndNum());
				// rdao.selectListBySubCon( paramMap);
				rdao.selectListByKey( paramMap);
				paramMap.put("paging", paging);
			}else {
				cntMap.put("cnt", 0);
				cntMap.put("tableName", 3);
				// cntMap.put("fieldName", "content");
				cntMap.put("key", key);
				rdao.getCountsByKey(cntMap); 
				int count = Integer.parseInt(String.valueOf(cntMap.get("cnt")));
				paging.setTotalCount(count);
				paging.paging();
				paramMap.put("total", count);
				paramMap.put("tableName", 3);
				paramMap.put("key", key);
				paramMap.put("startNum", paging.getStartNum());
				paramMap.put("endNum", paging.getEndNum());
				// rdao.selectListBySubCon( paramMap);
				rdao.selectListByKey( paramMap);
				paramMap.put("paging", paging);
			}
			
	}

	public void getReplyCount(HashMap<String, Object> paramMap) {
		ArrayList<HashMap<String, Object>> recipeList 
		= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
		// System.out.println("ref_cursor(0) : " + recipeList.get(0)); // 확인용
		ArrayList<Integer> replyCountList = new ArrayList<Integer>();
		for(HashMap<String, Object> rvo : recipeList) {
			// System.out.println("replycnt를 위해 들어가는 rnum : " + rvo.get("RNUM"));
			rvo.put("replycnt", 0);
			rdao.getReplyCount(rvo);
			replyCountList.add(Integer.parseInt(String.valueOf(rvo.get("replycnt"))));
		}
		paramMap.put("replyCountList", replyCountList);
		
	}

	public void getCategory(HashMap<String, Object> paramMap) {
		
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpSession session = request.getSession();
		
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		}else if(session.getAttribute("page")!=null) {
			page = (Integer)session.getAttribute("page");
		}else {
			session.removeAttribute("page");
		}
		
		Paging paging = new Paging();
		paging.setDisplayPage(10);
		paging.setDisplayRow(12);
		paging.setPage(page);
		
		HashMap<String, Object> cntMap = new HashMap<String, Object>();
		cntMap.put("cnt", 0);
		cntMap.put("recipekey", paramMap.get("recipekey"));
		cntMap.put("kind", Integer.parseInt(String.valueOf(paramMap.get("kind"))));
		// System.out.println("service의 kind : " + paramMap.get("kind"));
		rdao.getRecipeCounts(cntMap); 
		int count = Integer.parseInt(String.valueOf(cntMap.get("cnt")));
		paging.setTotalCount(count);
		paging.paging();
		System.out.println("count(게시물 갯수) : " + count); // 확인용
		paramMap.put("total", count);
		paramMap.put("startNum", paging.getStartNum());
		paramMap.put("endNum", paging.getEndNum());
		rdao.getCategory( paramMap);
		paramMap.put("paging", paging);
		
		
		
	}

	public void getRecipeForUpdate(HashMap<String, Object> paramMap) {
		rdao.getRecipeForUpdate(paramMap);
		
	}

	
	
	

	
	
	
	
}
