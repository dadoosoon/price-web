/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.controller;

import im.dadoo.price.core.domain.Brand;
import im.dadoo.price.core.service.BrandService;
import im.dadoo.price.core.service.CategoryBrandService;
import im.dadoo.price.core.service.CategoryService;
import im.dadoo.price.core.service.ProductService;
import im.dadoo.price.web.dto.Menu;
import im.dadoo.price.web.service.MenuService;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.ui.ModelMap;

/**
 *
 * @author codekitten
 */
public class BaseController {
  
  @Resource
  protected CategoryService categoryService;
  
  @Resource
  protected MenuService menuService;
  
  @Resource
  protected BrandService brandService;
  
  @Resource
  protected CategoryBrandService cbService;
  
  @Resource
  protected ProductService productService;
  
  protected void renderNav(ModelMap map) {
    List<Menu> menus = this.menuService.build();
    map.addAttribute("menus", menus);
  }
  
  protected void renderBrands(ModelMap map, Integer categoryId) {
    List<Brand> brands = this.brandService.listByCategoryId(categoryId);
    map.addAttribute("brands", brands);
  }
}
