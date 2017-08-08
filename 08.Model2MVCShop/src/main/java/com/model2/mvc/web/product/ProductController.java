package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.sun.tracing.dtrace.ModuleAttributes;

//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {

	/// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method ���� ����

	public ProductController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties ,
	// classpath:config/commonservice.xml ���� �Ұ�
	// ==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	//@RequestMapping("/addProduct.do")
	@RequestMapping("/addProduct")
	//@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") Product product, HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("/product/addProduct :: POST");

		
		if(FileUpload.isMultipartContent(request)){
			String temDir = "C:\\Users\\���ظ�\\git\\07.Model2MVCShop\\WebContent\\images\\uploadFiles";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024*1024*1);
			fileUpload.setSizeThreshold(1024*100);
			
			if(request.getContentLength() < fileUpload.getSizeMax()){
				StringTokenizer token = null;
				
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				
				for(int i=0; i<Size; i++){
					FileItem fileItem = (FileItem)fileItemList.get(i);
					if(fileItem.isFormField()){
						if(fileItem.getFieldName().equals("manuDate")){
							token = new StringTokenizer(fileItem.getString("EUC-KR"), "-");
							String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
							product.setManuDate(manuDate);
						}else if(fileItem.getFieldName().equals("prodName")){
							product.setProdName(fileItem.getString("EUC-KR"));
						}else if(fileItem.getFieldName().equals("prodDetail")){
							product.setProdDetail(fileItem.getString("EUC-KR"));
						}else if(fileItem.getFieldName().equals("price")){
							product.setPrice(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
					}else{
						if(fileItem.getSize()>0){
							int idx = fileItem.getName().lastIndexOf("\\");
							if(idx == -1){
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx+1);
							product.setFileName(fileName);
							try{
								File uploadedFile = new File(temDir, fileName);
								fileItem.write(uploadedFile);
							}catch (IOException e) {
								// TODO: handle exceptions
								System.out.println(e);
							}
						}else{
							product.setFileName("../../images/empty.GIF");
						}
					}
				}
				
				productService.addProduct(product);
				
			}else{
				int overSize = (request.getContentLength() /1000000);
				System.out.println("<script>alert('������ ũ��� 1MB�Դϴ�. �ø��� ������ �뷮�� "+overSize+"MB�Դϴ� ')");
				System.out.println("history.back();</script>");
			}
		}else{
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�...");
		}
		//product.setManuDate(product.getManuDate().replaceAll("-", ""));

		//productService.addProduct(product);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/addProductViewDitail.jsp");
		// modelAndView.addObject("product", product);

		return modelAndView;
	}
	@RequestMapping("/getProduct")
	//@RequestMapping(value ="getProduct", method=RequestMethod.GET)
	public ModelAndView getProduct(	@RequestParam("prodNo") int prodNo) throws Exception {

		System.out.println("/product/getProduct : get");
		// Business Logic
		System.out.println(prodNo);
		Product product = productService.getProduct(prodNo);
		// Model �� View ����

		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("forward:/product/getProduct.jsp");

		modelAndView.addObject("product", product);

		return modelAndView;
	}

	@RequestMapping("updateProductView")
	//@RequestMapping(value="updateProductView",method=RequestMethod.GET)
	public ModelAndView updateProductView(
			@ModelAttribute("product") Product product/*
														 * @RequestParam(
														 * "prodNo") int prodNo
														 */) throws Exception {

		System.out.println("/updateProduct, get");
		// Business Logic

		product = productService.getProduct(product.getProdNo());
		// Model �� View ����

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/updateProduct.jsp");
		modelAndView.addObject("product", product);

		return modelAndView;
	}

	@RequestMapping("/updateProduct")
	//@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public ModelAndView updateProduct(@ModelAttribute("product")Product product
		/*@RequestParam("prodNo") int prodNo*/) throws Exception {
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		System.out.println("/updateProduct post");
		// Business Logic
		productService.updateProduct(product);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/product/getProduct?prodNo");
		 modelAndView.addObject("product", product);

		System.out.println(modelAndView.getViewName());
		System.out.println("/updateProduct post");
		return modelAndView;
	}

	@RequestMapping("/listProduct")
	//@RequestMapping(value ="listProduct", method=RequestMethod.GET)
	public ModelAndView listProduct(@ModelAttribute("search") Search search, @RequestParam("menu") String menu,
			HttpServletRequest request) throws Exception {

		System.out.println("/listProduct get");
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("Ŀ��Ʈ������"+search.getCurrentPage());
		System.out.println("��ġ�����"+search.getSearchCondition());
		System.out.println("��ġŰ����"+search.getSearchKeyword());
		// Business logic ����
		Map<String, Object> map = productService.getProductList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model �� View ����
		ModelAndView modelAndView = new ModelAndView();

		if (menu.equals("search")) {
			modelAndView.setViewName("forward:/product/listProduct.jsp");
		} else {
			modelAndView.setViewName("forward:/product/listProductAdmin.jsp");
		}

		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);

		return modelAndView;
	}
}