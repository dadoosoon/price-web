/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.dto;

import im.dadoo.price.core.domain.Category;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author codekitten
 */
public class Menu implements Serializable {
  
  private Category item;
  
  private List<Menu> subs;

  public Menu() {
    this.item = null;
    this.subs = new ArrayList<>();
  }
  
  /**
   * @return the item
   */
  public Category getItem() {
    return item;
  }

  /**
   * @param item the item to set
   */
  public void setItem(Category item) {
    this.item = item;
  }

  /**
   * @return the subs
   */
  public List<Menu> getSubs() {
    return subs;
  }

  /**
   * @param subs the subs to set
   */
  public void setSubs(List<Menu> subs) {
    this.subs = subs;
  }
  
}
