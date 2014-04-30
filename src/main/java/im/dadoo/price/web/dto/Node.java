/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author codekitten
 * @param <T>
 */
public class Node<T> {
  
  private T data;
  
  private List<Node<T>> subs;

  public Node() {
    this.data = null;
    this.subs = new ArrayList<>();
  }
  
  /**
   * @return the data
   */
  public T getData() {
    return data;
  }

  /**
   * @param data the data to set
   */
  public void setData(T data) {
    this.data = data;
  }

  /**
   * @return the subs
   */
  public List<Node<T>> getSubs() {
    return subs;
  }

  /**
   * @param subs the subs to set
   */
  public void setSubs(List<Node<T>> subs) {
    this.subs = subs;
  }
  
  
}
