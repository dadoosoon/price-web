/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.controller;

import im.dadoo.price.core.domain.Brand;
import im.dadoo.price.core.domain.Category;
import im.dadoo.price.core.domain.Product;
import im.dadoo.price.web.dto.Node;
import im.dadoo.price.web.service.CategoryNodeService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author codekitten
 */
@Controller
public class AdminController extends BaseController {
  
  @Resource
  private CategoryNodeService cnService;
  
  @RequestMapping(value = "/admin", method = RequestMethod.GET)
  public String getAdminPage() {
    return "admin/admin";
  }
  
  @RequestMapping(value = "/admin/category", method = RequestMethod.GET)
  public String getAdminCategoryPage(ModelMap map) {
    Map<Integer, Category> categoryMap = this.categoryService.map();
    map.addAttribute("categoryMap", categoryMap);
    return "admin/category";
  }
  
  @RequestMapping(value = "/admin/category/add", method = RequestMethod.GET)
  public String getAdminCategoryAddPage(ModelMap map) {
    List<Node<Category>> categoryNodes = this.cnService.list();
    map.addAttribute("categoryNodes", categoryNodes);
    return "admin/category-add";
  }
  
  @RequestMapping(value = "/admin/brand", method = RequestMethod.GET)
  public String getAdminBrandPage(ModelMap map) {
    List<Brand> brands = this.brandService.list();
    if (brands != null) {
      Map<Brand, List<Category>> brandMap = new HashMap<>();
      for (Brand brand : brands) {
        List<Category> categories = this.categoryService.listByBrandId(brand.getId());
        brandMap.put(brand, categories);
      }
      map.addAttribute("brandMap", brandMap);
    }
    return "admin/brand";
  }
  
  @RequestMapping(value = "/admin/brand/add", method = RequestMethod.GET)
  public String getAdminBrandAddPage(ModelMap map) {
    List<Node<Category>> categoryNodes = this.cnService.list();
    map.addAttribute("categoryNodes", categoryNodes);
    return "admin/brand-add";
  }
  
  @RequestMapping(value = "/admin/product", method = RequestMethod.GET)
  public String getAdminProductPage(ModelMap map) {
    List<Product> products = this.productService.list();
    if (products != null) {
      Map<Product, ImmutablePair<Category, Brand>> productMap = new HashMap<>();
      for (Product product : products) {
        productMap.put(product, this.cbService.findPairById(product.getCategoryBrandId()));
      }
      map.addAttribute("productMap", productMap);
    }
    return "admin/product";
  }
}
