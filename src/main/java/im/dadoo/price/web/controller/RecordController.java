/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.controller;

import im.dadoo.price.web.service.RecordSetService;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author codekitten
 */
@Controller
public class RecordController extends BaseController {
  
  @Resource
  private RecordSetService rsService;
  
  @RequestMapping(value = "/record", method = RequestMethod.GET)
  public String list(ModelMap map, @RequestParam(value = "category", required = false) Integer categoryId) {
    this.renderNav(map);
    this.renderBrands(map, categoryId);
    List<Map<String, Object>> recordSets = this.rsService.listByCategoryId(categoryId);
    map.addAttribute("recordSets", recordSets);
    return "index";
  }
}
