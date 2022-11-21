package com.seed.lib.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seed.lib.hope.HopeService;
import com.seed.lib.hope.HopeVO;
import com.seed.lib.util.HdPager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("mypage")
@Slf4j
public class MyPageController {
	@Autowired
	private HopeService hopeService;
	
	
	@GetMapping("myIndex")
	public void getIndex() throws Exception{
		
	}
	

	
	
	@GetMapping("hopeList")
	public ModelAndView setHList(HdPager hdPager)throws Exception{
		//세션으로 아이디 받아야됨!!!!!!!!!!!
		ModelAndView mv = new ModelAndView();
		hdPager.setUserName("id3");
		List<HopeVO> hl = hopeService.getHopeList(hdPager);
		mv.addObject("hlist", hl);
		mv.addObject("pager", hdPager);
		return mv;
	}
	
	@PostMapping("hopeCancel")
	@ResponseBody
	public int setDeleteHope(@RequestBody HopeVO hopeVO) throws Exception{
		log.info("@@@@@@@@@@@@@@@@@@@@@@cancel:{}",hopeVO.getHopNum());
		int result = hopeService.setUpdateHope(hopeVO);		
		return result;
	}
	
}
