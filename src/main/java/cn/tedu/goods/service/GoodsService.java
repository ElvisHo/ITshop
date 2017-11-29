package cn.tedu.goods.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.tedu.goods.entity.Goods;

public interface GoodsService {
	void deleteGoods(int id);
	void updateGoods(Goods goods);
	List<Goods> findAllGoods();
	List<Goods> findGoodsByGoodsnameHost(String goodsname);
	Goods findGoodsById(int id);
	//List<Goods> findGoodsByHost(String host);
	void addGoods(Goods g, MultipartFile file, String path);
}
