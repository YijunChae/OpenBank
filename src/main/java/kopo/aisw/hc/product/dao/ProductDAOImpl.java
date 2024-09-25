package kopo.aisw.hc.product.dao;

import kopo.aisw.hc.product.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Map;

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void insertProduct(ProductVO product) throws Exception {
        sqlSession.insert("dao.ProductDAO.insertProduct", product);
    }

    @Override
    public ProductVO selectProduct(int productNum) throws Exception {
        return sqlSession.selectOne("dao.ProductDAO.selectProduct", productNum);
    }

    @Override
    public List<ProductVO> selectAllProducts() throws Exception {
        return sqlSession.selectList("dao.ProductDAO.selectAllProducts");
    }

    @Override
    public void updateProduct(ProductVO product) throws Exception {
        sqlSession.update("dao.ProductDAO.updateProduct", product);
    }

    @Override
    public void deleteProduct(int productNum) throws Exception {
        sqlSession.update("dao.ProductDAO.deleteProduct", productNum);
    }

    @Override
    public List<Map<String, Object>> getProductStatistics() throws Exception {
        return sqlSession.selectList("dao.ProductDAO.getProductStatistics");
    }

    @Override
    public List<Map<String, Object>> getNewUserTrends() throws Exception {
        return sqlSession.selectList("dao.ProductDAO.getNewUserTrends");
    }

    @Override
    public int getTotalUsers() throws Exception {
        return sqlSession.selectOne("dao.ProductDAO.getTotalUsers");
    }

    @Override
    public int getNewSubscribers() throws Exception {
        return sqlSession.selectOne("dao.ProductDAO.getNewSubscribers");
    }

    @Override
    public long getTotalDeposits() throws Exception {
        return sqlSession.selectOne("dao.ProductDAO.getTotalDeposits");
    }

    public long getTotalWithdrawals() throws Exception {
        Long result = sqlSession.selectOne("dao.ProductDAO.getTotalWithdrawals");
        return result != null ? result : 0L;
    }
    
    @Override
    public String getProductDescription(int productNum) {
        return sqlSession.selectOne("dao.ProductDAO.getProductDescription", productNum);
    }
    
}