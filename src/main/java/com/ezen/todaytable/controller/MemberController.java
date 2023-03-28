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


import com.ezen.todaytable.dto.MemberVO;
import com.ezen.todaytable.service.MemberService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;

	@RequestMapping(value = "/loginForm")
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
			 HttpServletRequest request,Model model) {

		  String url = "member/login";
	      
	      if(result.getFieldError("id") !=null ) {
	         model.addAttribute("message",result.getFieldError("id").getDefaultMessage());
	      }else if(result.getFieldError("pwd") !=null ) {
	         model.addAttribute("message",result.getFieldError("pwd").getDefaultMessage());
	      }else {
	         HashMap<String, Object> paramMap = new HashMap<String, Object>();
	         paramMap.put("id",membervo.getId() );
	         paramMap.put("ref_cursor", null);
	         ms.getMembersList(paramMap); 
	         
	            ArrayList<HashMap<String, Object>> list
	               = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
	            
	            if( list.size() == 0) {
	               model.addAttribute("message", "아이디가 없습니다");
	               return "member/login";
	            }
	            HashMap<String, Object> mvo = list.get(0);
	            if( mvo.get("PWD") == null)
	               model.addAttribute("message", "비밀번호 오류. 관리자에게 문의하세요");
	            else if( !mvo.get("PWD").equals(membervo.getPwd()))
	               model.addAttribute("message", "비밀번호가 맞지않습니다");
	            else if(mvo.get("USEYN").equals("N")) {
		               model.addAttribute("message", "휴면 계정입니다. 휴면계정을 복구하려면 관리자에게 문의하세요");
		            }
	            else if( mvo.get("PWD").equals(membervo.getPwd())) {
	            	HttpSession session = request.getSession();
	            	
	            	System.out.println(session.getAttribute("refer")+"나와라");
		               if(session.getAttribute("refer")!=null) {
		            	   session.setAttribute("loginUser", mvo);
		            	   url = "redirect:/qnaList?refer=all";
		               }else{
		            	   session.setAttribute("loginUser", mvo);
		            	   url = "redirect:/";
		               }
	            }
	           
	      }
	       return url;
	   }

	@RequestMapping("/contract")
	public String contract() {
		return "member/contract";
	}

	@RequestMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("refer");
		session.removeAttribute("loginUser");
		return "redirect:/";
	}

	@RequestMapping("idCheckForm")
	public String id_check_form(HttpServletRequest request, Model model, @RequestParam("id") String id /* 전달 받은 id */) {
		// getMemberShop 메서드를 호출해서 전달된 아이디의 유무를 확인하고 member/check.jsp로
		// 결과와 아이디를 갖고 이동합니다.
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("ref_cursor", null);
		ms.getMembersList(paramMap); // 아이디로 검색해서 나온 결과값

		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");

		if (list.size() == 0) { // list.size()와 list.get(0) 느낌이 다르다?
			model.addAttribute("result", -1);
		} else {
			model.addAttribute("result", 1);
		}
		model.addAttribute("id", id);

		return "member/idcheck";
	}
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="fileup", method=RequestMethod.POST)
	   @ResponseBody
	   public  HashMap<String, Object> fileup(HttpServletRequest request,  Model model){
		   
		   // 현재 메서드는 다른 메서드처럼 jsp 파일이름을 리턴해서 파일이름.jsp로 이동하는 메서드가 아닙니다.
		   // ajax에 의해서 호출된 지점으로 다시 되돌아가서 화면 이동없이 운영이 계속되어야 하기때문에 이동할때
		   // 가져갈 데이터가 리턴됩니다
		   
		   String path = context.getRealPath("/imageProfile");
		   HashMap<String, Object> result = new HashMap<>();
		   
		   try {
				MultipartRequest multi = new MultipartRequest(
						request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
				result.put("STATUS", 1);
				result.put("FILENAME", multi.getFilesystemName("fileimage"));
		   } catch (IOException e) { e.printStackTrace();
		   }
		   
		   return result; // result 는 목적지의 매개변수 data 객체를 전달됩니다.
	   }
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
			@RequestParam(value = "reid", required = false) String reid,
			@RequestParam(value = "pwdCheck", required = false) String pwdCheck, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinForm");
		// 매개변수 구성 + 밸리데이션 구성 + 회원가입 실행
		// 회원가입 프로시져 이름 insertMemberShop
		if (result.getFieldError("id") != null)
			mav.addObject("message", result.getFieldError("id").getDefaultMessage());
		else if (result.getFieldError("name") != null)
			mav.addObject("message", result.getFieldError("name").getDefaultMessage());
		else if (result.getFieldError("nickname") != null)
			mav.addObject("message", result.getFieldError("nick").getDefaultMessage());
		else if (result.getFieldError("pwd") != null)
			mav.addObject("message", result.getFieldError("pwd").getDefaultMessage());
		else if (result.getFieldError("email") != null)
			mav.addObject("message", result.getFieldError("email").getDefaultMessage());
		else if (result.getFieldError("phone") != null)
			mav.addObject("message", result.getFieldError("phone").getDefaultMessage());
		else if (reid == null || (reid != null && !reid.equals(membervo.getId()))) {
			mav.addObject("message", "아이디 중복체크를 하지 않으셨습니다.");
			mav.addObject("reid", reid);
		} else if (pwdCheck == null || (pwdCheck != null && !pwdCheck.equals(membervo.getPwd())))
			mav.addObject("message", "비밀번호 확인이 일치하지 않습니다.");
		else {
		
			  HashMap<String, Object> paramMap = new HashMap<String, Object>();
			   
			   paramMap.put("id", request.getParameter("id"));
			   paramMap.put("pwd", request.getParameter("pwd"));
			   paramMap.put("name", request.getParameter("name"));
			   paramMap.put("email", request.getParameter("email"));
			   paramMap.put("phone", request.getParameter("phone"));
			   paramMap.put("nick", request.getParameter("nick"));
			   paramMap.put("address1", request.getParameter("address1"));
			   paramMap.put("address2", request.getParameter("address2"));
			   paramMap.put("address3", request.getParameter("address3"));
			   paramMap.put("zip_num", request.getParameter("zip_num"));
			   paramMap.put("img","imageProfile/"+request.getParameter("img"));
			   paramMap.put("useyn", request.getParameter("useyn"));
			
			ms.insertMemberttable(paramMap);
			mav.addObject("message", "회원가입이 완료되었습니다. 로그인하세요");
			mav.setViewName("member/loginForm");
		}
		return mav;
	}



	@RequestMapping(value = "/updateMemForm")
	public String updateMemForm() {
		return "member/updateMemForm";
	}

	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(HttpServletRequest request, 
			@RequestParam("oldImg") String oldImg) {
		
		String savepath = context.getRealPath("/imageProfile");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("oldImg", oldImg);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();

		
		try {
			MultipartRequest multi = new MultipartRequest(request, savepath, 5 * 1024 * 1024, "UTF-8",
					new DefaultFileRenamePolicy());
				
				paramMap.put("ID", multi.getParameter("id"));
				paramMap.put("PWD", multi.getParameter("pwd"));
				paramMap.put("NAME", multi.getParameter("name"));
				paramMap.put("NICK", multi.getParameter("nick"));
				paramMap.put("EMAIL", multi.getParameter("email"));
				paramMap.put("PHONE", multi.getParameter("phone"));
				paramMap.put("ZIP_NUM", multi.getParameter("zip_num"));
				paramMap.put("ADDRESS1", multi.getParameter("address1"));
				paramMap.put("ADDRESS2", multi.getParameter("address2"));
				paramMap.put("ADDRESS3", multi.getParameter("address3"));
				paramMap.put("INDATE", multi.getParameter("indate"));
				paramMap.put("USEYN", multi.getParameter("useyn"));

				if (multi.getFilesystemName("img") == null) {
					paramMap.put("IMG", oldImg);// 수정하려는 이미지가 없을 경우 이전 이미지 적용
				} else {
					paramMap.put("IMG", "imageProfile/"+multi.getFilesystemName("img"));
				}
				ms.updateMemberttable(paramMap);
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", paramMap);
				
				mav.setViewName("redirect:/");
			

		} catch (IOException e) {
			e.printStackTrace();
		}
		return mav;
	}
//	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
//	public ModelAndView memberUpdate(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
//			HttpServletRequest request, @RequestParam("oldImg") String oldImg,
//			@RequestParam(value = "pwdCheck", required = false) String pwdCheck) {
//		
//		ModelAndView mav = new ModelAndView();
//		
//		 mav.addObject("oldImg", oldImg);
//		
//		System.out.println("img="+request.getParameter("img"));
//		System.out.println("oldImg="+oldImg);
//		HashMap<String, Object> paramMap = new HashMap<String, Object>();
//		
//		 if (result.getFieldError("name") != null)
//				mav.addObject("message", result.getFieldError("name").getDefaultMessage());
//			else if (result.getFieldError("nickname") != null)
//				mav.addObject("message", result.getFieldError("nick").getDefaultMessage());
//			else if (result.getFieldError("pwd") != null)
//				mav.addObject("message", result.getFieldError("pwd").getDefaultMessage());
//			else if (result.getFieldError("email") != null)
//				mav.addObject("message", result.getFieldError("email").getDefaultMessage());
//			else if (result.getFieldError("phone") != null)
//				mav.addObject("message", result.getFieldError("phone").getDefaultMessage());
//			 else if (pwdCheck == null || (pwdCheck != null && !pwdCheck.equals(membervo.getPwd())))
//				mav.addObject("message", "비밀번호 확인이 일치하지 않습니다.");
//			else {
//				
//				   paramMap.put("ID", request.getParameter("id"));
//				   paramMap.put("PWD", request.getParameter("pwd"));
//				   paramMap.put("NAME", request.getParameter("name"));
//				   paramMap.put("EMAIL", request.getParameter("email"));
//				   paramMap.put("PHONE", request.getParameter("phone"));
//				   paramMap.put("NICK", request.getParameter("nick"));
//				   paramMap.put("ADDRESS1", request.getParameter("address1"));
//				   paramMap.put("ADDRESS2", request.getParameter("address2"));
//				   paramMap.put("ADDRESS3", request.getParameter("address3"));
//				   paramMap.put("ZIP_NUM", request.getParameter("zip_num"));
//				   paramMap.put("INDATE", request.getParameter("indate"));
//				   paramMap.put("USEYN", request.getParameter("useyn"));
//		
//		
//
//				if (request.getParameter("img") == null) {
//					paramMap.put("IMG", oldImg);// 수정하려는 이미지가 없을 경우 이전 이미지 적용
//				} else {
//					paramMap.put("IMG", request.getParameter("img"));
//				}
//				ms.updateMemberttable(paramMap);
//				HttpSession session = request.getSession();
//				session.setAttribute("loginUser", paramMap);
//				
//				mav.setViewName("redirect:/");
//			}
//
//	
//		return mav;
//	}
	
	// 로그인 창에서 '계정 찾기' 버튼을 눌렀을 때
		@RequestMapping("/findAccountForm")
		public String findAccountForm() {
			return "member/findAccountForm";
		}
		
		// 아이디/비밀번호 중 선택했을 때
		@RequestMapping("/findAccountBy")
		public String findAccountByParam(HttpServletRequest request, @RequestParam("param") String param, Model model) {
			model.addAttribute("param", param);
			return "member/findAccountByForm";
		}
				
		// 인증 후 계정 정보 조회
		@RequestMapping(value="/findAccInfo", method=RequestMethod.POST)
		public ModelAndView findAccInfo(@RequestParam("param") String param, 
				@RequestParam("name") String name,
				@RequestParam("phone") String phone, 
				@RequestParam(value="id", required=false) String id) {
			ModelAndView mav = new ModelAndView();
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("ref_cursor", null);
			if(param.equals("id")){  // id 찾기를 눌렀을 때
				paramMap.put("name", name);
				paramMap.put("phone", phone);
				ms.findId(paramMap); // id 검색 메서드
			}
			else if(param.equals("pwd")) { // 비밀번호 찾기를 눌렀을 때
				// paramMap.put("name", name);
				// paramMap.put("phone", phone);
				// * 아이디는 중복값이 없으니 id만 보내서 검사(기존 메서드 활용 가능)
				paramMap.put("id", id);
				// ms.findPwd(paramMap); // 비밀번호 검색 메서드
				ms.getMembersList(paramMap);
			}
			
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			HashMap<String, Object> mvo = list.get(0);
			if(mvo != null) {
				// System.out.println("mvo가 null이 아니예요 " + mvo); // 확인용
				mav.addObject("account", mvo);
			}else {
				mav.addObject("message", "등록된 정보가 없습니다.");
			}
			
			mav.setViewName("member/findAccountByForm");
			return mav;
		}
		
		
		// 아이디 인증 후 새 비밀번호 설정
		@RequestMapping(value="/makeNewPass", method=RequestMethod.POST)
		public String makeNewPass(@RequestParam("id") String id, @RequestParam("pwd") String pwd, Model model) {
			// 기존 아이디와 새 비밀번호 값을 받아서 회원 정보 비밀번호 변경
			// int result = mdao.updatePwd(id, pwd);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			paramMap.put("pwd", pwd);
			paramMap.put("result", 0);
			ms.updatePwd(paramMap);
			int result = Integer.parseInt(String.valueOf(paramMap.get("result")));
			if( result == 0) {
				model.addAttribute("message", "비밀번호 변경이 실패했습니다. 다시 시도하세요");
				return "member/findAccountByForm";
			}else {
				model.addAttribute("message", "비밀번호 설정이 성공했습니다. 로그인하세요");
			}
			System.out.println("result : " + result); // 확인용
			return "member/checkSuccess";
		}
		
		@RequestMapping("/withDrawal")
		public String withDrawal (HttpServletRequest request,HttpSession session,
				@RequestParam("id") String id) {
			HashMap<String,Object> loginUser = (HashMap<String, Object>) session.getAttribute("loginUser");
			if(loginUser ==null) {
				request.setAttribute("message", "로그인이 필요한 서비스입니다");
				return "loginForm";
			}else {
				ms.withDrawal(id);
				request.setAttribute("message", "탈퇴되었습니다. 탈퇴회원의 정보는 3개월간 보관되며 그 기간안에 별도의 가입없이 계정 복구가 가능합니다");
				session.removeAttribute("loginUser");
				return "member/loginForm";
			}
		}

}
