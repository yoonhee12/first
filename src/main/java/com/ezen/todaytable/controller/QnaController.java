package com.ezen.todaytable.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import org.springframework.web.servlet.ModelAndView;

import com.ezen.todaytable.dto.Paging;
import com.ezen.todaytable.dto.QnaVO;
import com.ezen.todaytable.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService qs;
	
		// qna 리스트
		@RequestMapping("/qnaList")
		public ModelAndView qnaList(HttpServletRequest request, HttpSession session,
				@RequestParam("refer") String refer){
			ModelAndView mav = new ModelAndView();
			
			session.setAttribute("refer", refer);
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			if (refer.equals("my")) {
				paramMap.put("id","scott");
				mav.addObject("title","나의 Q&A");
				mav.addObject("text","내가 했던 질문들을 확인할 수 있습니다.");
			} else if (refer.equals("all")) { 
				paramMap.put("id","");
				mav.addObject("title","고객 게시판");
				mav.addObject("text","궁금하신 사항은 언제든지 문의하세요.");
			}
			paramMap.put("refer", refer);
			paramMap.put("request", request);
			paramMap.put("ref_cursor",null);
			qs.listQna(paramMap);
			
			ArrayList<HashMap<String,Object>> list
			= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
			
			mav.addObject("refer",refer);
			mav.addObject("qnaList",list);
			mav.addObject("paging",(Paging)paramMap.get("paging"));
			mav.setViewName("qna/qnaList");
			
			return mav;
		}
		

	// qna 게시글 보기
	@RequestMapping("/qnaDetail")
	public ModelAndView qnaDetail(HttpServletRequest request, HttpSession session,
			@RequestParam("qseq") int qseq){

			ModelAndView mav = new ModelAndView();
			if (session.getAttribute("loginUser")==null) {
				mav.setViewName("member/login");
				return mav;
			}
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("qseq", qseq);
			paramMap.put("ref_cursor",null);
			qs.oneQna(paramMap);
			
			ArrayList<HashMap<String,Object>> list
			= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
			
			mav.addObject("qnaVO",list.get(0));
			mav.setViewName("qna/qnaDetail");
			return mav;
		}
	
	
	
	// qna 글쓰기폼이동
	@RequestMapping(value="/qnaWriteForm")
	public String qna_writre_form( HttpSession session) {
		if (session.getAttribute("loginUser")==null) return "member/login";
	    return "qna/qnaWriteForm";
	}
	
	// qna 글쓰기
	@RequestMapping("qnaWrite")
	public ModelAndView qna_write( @ModelAttribute("dto") @Valid QnaVO qnavo,
			BindingResult result, HttpSession session) {
		
			ModelAndView mav = new ModelAndView();
			if (session.getAttribute("loginUser")==null) {
				mav.setViewName("member/login");
				return mav;
			}
			
			mav.setViewName("qna/qnaWriteForm");
			if(result.getFieldError("qsubject")!=null) {
				mav.addObject("message", result.getFieldError("qsubject").getDefaultMessage());
			}else if(result.getFieldError("qcontent")!=null) {
				mav.addObject("message", result.getFieldError("qcontent").getDefaultMessage());
			} else {
				if( qnavo.getSecret()==null) {
					qnavo.setSecret("0");
					qnavo.setQnapass("");
				}
	    		HashMap<String, Object> paramMap = new HashMap<String, Object>();
	
	    		paramMap.put("qnavo", qnavo);
	    		qs.insertQnas( paramMap );
				mav.setViewName("redirect:/qnaList?page=1&refer=all");
			}
	    return mav;
	}

	// qna 업데이트 폼 이동
	@RequestMapping(value="/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(HttpSession session,
				@RequestParam("qseq") int qseq){
		
			ModelAndView mav = new ModelAndView();
			if (session.getAttribute("loginUser")==null) {
				mav.setViewName("member/login");
				return mav;
			}
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("qseq", qseq);
			paramMap.put("ref_cursor",null);
			qs.oneQna(paramMap);
			
			ArrayList<HashMap<String,Object>> list
			= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
			
			mav.addObject("qnaVO",list.get(0));
			mav.setViewName("qna/qnaUpdateForm");

			return mav;
		}
	
	// qna 수정 작업 --
	@RequestMapping(value="/qnaUpdate")
	public String qnaUpdate( @Valid QnaVO qnavo,
			BindingResult result, HttpSession session, Model model){
		if (session.getAttribute("loginUser")==null) return "member/login";
		
		HashMap<String,Object> qnaVO = new HashMap<>();
		qnaVO.put("QSEQ", qnavo.getQseq());
		qnaVO.put("QNADATE", qnavo.getQnadate());
		qnaVO.put("QSUBJECT", qnavo.getQsubject());
		qnaVO.put("QCONTENT", qnavo.getQcontent());
		model.addAttribute("qnaVO", qnaVO);
		
		if(result.getFieldError("qsubject")!=null) {
			model.addAttribute("message", result.getFieldError("qsubject").getDefaultMessage());
			return "qna/qnaUpdateForm";
		}else if(result.getFieldError("qcontent")!=null) {
			model.addAttribute("message", result.getFieldError("qcontent").getDefaultMessage());
			return "qna/qnaUpdateForm";
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
			paramMap.put("qnaVO", qnavo);
		
			qs.qnaUpdate(paramMap);
		}

		return "redirect:/qnaDetail?qseq="+qnavo.getQseq();
	}
	
	// qna게시글삭제
	@RequestMapping("/deleteQna")
	public String deleteQna(@RequestParam("qseq") int qseq, HttpSession session){
		if (session.getAttribute("loginUser")==null) return "member/login";
		
		String refer = (String)session.getAttribute("refer");
		qs.deleteQna(qseq);
		return "redirect:/qnaList?page=1&refer="+refer;
	}
	
}
	

