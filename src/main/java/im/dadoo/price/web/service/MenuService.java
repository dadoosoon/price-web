/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.service;

import im.dadoo.price.core.dao.CategoryDao;
import im.dadoo.price.core.domain.Category;
import im.dadoo.price.core.service.CategoryService;
import im.dadoo.price.web.dto.Menu;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author codekitten
 */
@Service
@Transactional
public class MenuService {
  
  @Resource
  private CategoryDao categoryDao;
  
  //构建三级分类菜单
  public List<Menu> build() {
    List<Menu> menu = new ArrayList<>();
    List<Category> categories1 = this.categoryDao.listBySupId(null);
    for (Category c1 : categories1) {
      Menu submenu1 = new Menu();
      submenu1.setItem(c1);
      List<Category> categories2 = this.categoryDao.listBySupId(c1.getId());
      for (Category c2 : categories2) {
        Menu submenu2 = new Menu();
        submenu2.setItem(c2);
        List<Category> categories3 = this.categoryDao.listBySupId(c2.getId());
        for (Category c3 : categories3) {
          Menu submenu3 = new Menu();
          submenu3.setItem(c3);
          submenu2.getSubs().add(submenu3);
        }
        submenu1.getSubs().add(submenu2);
      }
      menu.add(submenu1);
    }
    return menu;
  }
}
