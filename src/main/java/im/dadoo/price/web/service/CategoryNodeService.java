/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.service;

import im.dadoo.price.core.dao.CategoryDao;
import im.dadoo.price.core.domain.Category;
import im.dadoo.price.web.dto.Node;
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
public class CategoryNodeService {
  
  @Resource
  private CategoryDao categoryDao;
  
  public List<Node<Category>> list() {
    List<Node<Category>> nodes = new ArrayList<>();
    List<Category> categories1 = this.categoryDao.listBySupId(null);
    for (Category c1 : categories1) {
      Node<Category> sub1 = new Node<>();
      sub1.setData(c1);
      List<Category> categories2 = this.categoryDao.listBySupId(c1.getId());
      for (Category c2 : categories2) {
        Node<Category> sub2 = new Node<>();
        sub2.setData(c2);
        List<Category> categories3 = this.categoryDao.listBySupId(c2.getId());
        for (Category c3 : categories3) {
          Node<Category> sub3 = new Node<>();
          sub3.setData(c3);
          sub2.getSubs().add(sub3);
        }
        sub1.getSubs().add(sub2);
      }
      nodes.add(sub1);
    }
    return nodes;
  }
}
