package com.seed.lib.admin.program;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seed.lib.util.DateUtil;
import com.seed.lib.util.HdPager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/program/*")
@Slf4j
public class AdProgramController {

	@Autowired
	private AdProgramService programService;
	
	// 문화프로그램 삭제
	@GetMapping("proDelete")
	public ModelAndView setProgramDelete(AdProgramVO programVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = 0;
		String title = "실패..";
		String text = "프로그램삭제를 실패했습니다";
		String icon = "error";
		String button = "확인";
		String url = "./program/proList";
		
		result = programService.setProgramDelete(programVO);
		
		if(result > 0) {
			
			result = 1;
			title = "성공!!";
			text = "프로그램삭제를 성공했습니다";
			icon = "success";
			url="../program/proList";
			
		}
		
		mv.addObject("title", title);
		mv.addObject("text", text);
		mv.addObject("icon", icon);
		mv.addObject("button", button);
		mv.addObject("url", url);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	// 문화프로그램 수정
	@GetMapping("proUpdate")
	public ModelAndView setProgramUpdateView(AdProgramVO programVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		programVO = programService.getProgramDetail(programVO);
		
		// 뒤에 시간빼고 앞에 날짜만 파싱 -> 2022-09-09
		programVO.setPsDt(programVO.getPsDt().substring(0,programVO.getPsDt().indexOf(" ")));
		programVO.setPlDt(programVO.getPlDt().substring(0,programVO.getPlDt().indexOf(" ")));
		
		mv.addObject("proVO", programVO);
		mv.setViewName("admin/program/proUpdate");
		
		return mv;
	}
	
	// 문화프로그램 수정(POST)
	@PostMapping("proUpdate")
	public ModelAndView setProgramUpdate(AdProgramVO programVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = 0;
		String title = "실패..";
		String text = "프로그램수정을 실패했습니다!";
		String icon = "error";
		String button = "확인";
		String url = "./program/proUpdate";
		
		result = programService.setProgramUpdate(programVO);
		
		if(result > 0) {
			
			result = 1;
			title = "성공!!";
			text = "프로그램수정을 성공했습니다!";
			icon = "success";
			url="../program/proUpdate";
			mv.addObject("proVO", programVO);
			
		}
		
		mv.addObject("title", title);
		mv.addObject("text", text);
		mv.addObject("icon", icon);
		mv.addObject("url", url);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	// 문화 프로그램 상세정보
	@GetMapping("proDetail")
	public ModelAndView getProgramDetail(AdProgramVO programVO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		programVO = programService.getProgramDetail(programVO);
		
		// 뒤에 시간빼고 앞에 날짜만 파싱 -> 2022-09-09
		programVO.setPsDt(programVO.getPsDt().substring(0,programVO.getPsDt().indexOf(" ")));
		
		if(programVO != null) {
			
			mv.addObject("proVO", programVO);
			
		}
		
		mv.setViewName("admin/program/proDetail");
		
		return mv;
	}
	
	// 문화프로그램 목록 조회
	@GetMapping("proList")
	public ModelAndView getProgramList(HdPager hdPager)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<AdProgramVO> ar = programService.getProgramList(hdPager);
		mv.addObject("proList", ar);
		mv.addObject("pager", hdPager);
		mv.setViewName("admin/program/proList");
		
		return mv;
	}
	
	// 문화프로그램 추가
	@GetMapping("proAdd")
	public String setProgramAdd()throws Exception{
		return "admin/program/proAdd";
	}
	
	// 문화프로그램 추가(POST)
	@PostMapping("proAdd")
	public ModelAndView setProgramAdd(AdProgramVO programVO, String name, String teacher)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = 0;
		String title = "실패..";
		String text = "프로그램등록을 실패했습니다!";
		String icon = "error";
		String button = "확인";
		String url = "./program/proAdd";
		
		result = programService.setProgramAdd(programVO, name, teacher);
		
		if(result > 0) {
			
			result = 1;
			title = "성공!!";
			text = "프로그램등록을 성공했습니다!";
			icon = "success";
			button = "확인";
			url="../program/proList";
			
		}
		
		mv.addObject("title", title);
		mv.addObject("text", text);
		mv.addObject("icon", icon);
		mv.addObject("button", button);
		mv.addObject("url", url);
		mv.setViewName("common/result");
		
		return mv;
	}
	
}
