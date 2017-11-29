package cn.tedu.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import cn.tedu.goods.entity.Goods;
@Repository("goodsDao")
public interface GoodsDao {
List<Goods> findAllGoods();
Goods findGoodsById(int id);
List<Goods> findGoodsByGoodsnameHost(@Param("goodsname")String goodsname,@Param("host")String host);
List<Goods> findGoodsByHost(String host);
void saveGoods(Goods goods);
void deleteGoods(int id);
void updateGoods(Goods goods);
}
