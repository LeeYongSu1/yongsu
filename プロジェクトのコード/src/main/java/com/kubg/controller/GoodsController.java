package com.kubg.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kubg.service.GoodsService;
import com.kubg.service.GoodsServiceImpl;
import com.kubg.vo.GoodsVO;

@Controller
public class GoodsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Inject
	GoodsServiceImpl service;
	
	
	
	
  @GetMapping("/upload") public String uploadGoods() {
  System.out.println("=====상품등록 시작=====");
  return "insertGoodsForm";
  // view로 사용되는 jsp의 파일명 return --> view 페이지로 이동 return "insertGoodsForm"; }
  }
  
  @PostMapping("/upload") public String uploadGoods(GoodsVO vo, MultipartFile file) throws Exception{ 
	  
	  
	  service.insertGoods(vo); 
	  return"home"; //home.jsp 뷰로 가겠다! }
	 
  }
	@RequestMapping("/productlist")
	public String loadAllGoods(Model model) {
		System.out.println("=====상품 전체목록 불러오기=====");
							//service --> listGoods(); --> dao --> listGoods(); --> sql:select문 실행
		List<GoodsVO> list = service.listGoods();
		model.addAttribute("list", list);
		
		//listOfGoods.jsp - view
		return "listOfGoods";
	}
	
	@RequestMapping("/listOfGoods")  // 세부적인 url mapping
	 public String detail(String product_name, Model model) {
		
		System.out.println("=======상품 상세페이지=======");
		
		model.addAttribute("vo", service.detailGoods(product_name));
		
		return "infoOfGoods";
	}
	
	@GetMapping("/edit")
    public String update(String product_name, Model model) {
        System.out.println("======= 상품 수정 중 =======");
        model.addAttribute("vo", service.detailGoods(product_name));
        
        return "edit_Item";
    }
	
	@PostMapping("/edit")
	public String update(GoodsVO vo) {
		
		service.updateGoods(vo);
		System.out.println("post mapping completed");
		return "redirect:/list";
	}
	
    @RequestMapping("/delete")
    public String delete(@RequestParam int product_num) {     //RequestParam 어노테이션을 사용해서 상품의 id를 받아온다.
        service.deleteGoods(product_num); //이미지를 삭제한 후에 나머지 (가격 등등) 자료들도 삭제하기 위해 서비스에 id를 매개변수로 줘서 저장(삭제함)
        return "redirect:/list"; //최신화 한 후에 list.jsp로 redirect한다.
                
    }
    

}
