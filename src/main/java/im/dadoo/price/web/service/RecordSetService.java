/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package im.dadoo.price.web.service;

import im.dadoo.price.core.dao.BrandDao;
import im.dadoo.price.core.dao.FullRecordDao;
import im.dadoo.price.core.dao.ProductDao;
import im.dadoo.price.core.domain.Brand;
import im.dadoo.price.core.domain.FullRecord;
import im.dadoo.price.core.domain.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

/**
 *
 * @author codekitten
 */
@Service
@Transactional
public class RecordSetService {
  
  @Resource
  private BrandDao brandDao;
  
  @Resource
  private ProductDao productDao;
  
  @Resource
  private FullRecordDao frDao;
  
  public List<Map<String, Object>> listByCategoryId(Integer categoryId) {
    List<Map<String, Object>> brandMaps = new ArrayList<>();
    if (categoryId != null) {
      List<Brand> brands = this.brandDao.listByCategoryId(categoryId);
      if (brands != null && !brands.isEmpty()) {
        for (Brand brand : brands) {
          Map<String, Object> brandMap = new HashMap<>();
          List<Product> products = this.productDao.listByCategoryAndBrandId(categoryId, brand.getId());
          List<Map<String, Object>> productMaps = new ArrayList<>();
          if (products != null && !products.isEmpty()) {
            for (Product product : products) {
              Map<String, Object> productMap = new HashMap<>();
              List<FullRecord> frs = this.frDao.listByProductId(product.getId());
              productMap.put("product", product);
              productMap.put("records", frs);
              productMaps.add(productMap);
            }
          }
          brandMap.put("brand", brand);
          brandMap.put("products", productMaps);
          brandMaps.add(brandMap);
        }
      }
    }
    return brandMaps;
  }
}
