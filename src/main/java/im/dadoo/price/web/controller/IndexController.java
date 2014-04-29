/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author codekitten
 */
@Controller
public class IndexController extends BaseController {
  
  private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(ModelMap map) {
    this.renderNav(map);
		return "index";
	}
}
