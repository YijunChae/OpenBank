package kopo.aisw.hc.product.service;

import kopo.aisw.hc.product.vo.ProductVO;
import java.util.List;
import java.util.Map;

public interface ProductService {
    void insertProduct(ProductVO product) throws Exception;
    ProductVO selectProduct(int productNum) throws Exception;
    List<ProductVO> selectAllProducts() throws Exception;
    void updateProduct(ProductVO product) throws Exception;
    void deleteProduct(int productNum) throws Exception;
    List<Map<String, Object>> getProductStatistics() throws Exception;
    List<Map<String, Object>> getNewUserTrends() throws Exception;
    int getTotalUsers() throws Exception;
    int getNewSubscribers() throws Exception;
    long getTotalDeposits() throws Exception;
    long getTotalWithdrawals() throws Exception;
    String getProductDescription(int productNum);
}