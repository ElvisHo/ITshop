package cn.tedu.goods.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.tedu.common.exception.ServiceException;
import cn.tedu.goods.dao.GoodsDao;
import cn.tedu.goods.entity.Goods;
import cn.tedu.goods.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService{
  @Autowired
  private GoodsDao goodsDao; 
	@Override
	public void addGoods(Goods goods,MultipartFile mFile,String abpath) {
		if(mFile==null)
			throw new ServiceException("请先选择文件");
			if(mFile.isEmpty())
			throw new ServiceException("文件内容不能为空");
		String path= abpath+File.separator+new Date().getTime()+mFile.getOriginalFilename();
			System.out.println(path);
			goods.setImg(path);
		goodsDao.saveGoods(goods);
		try {
			mFile.transferTo(new File(path));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
               throw new ServiceException("上传失败");		
		}
	}

	@Override
	public void deleteGoods(int id) {
		goodsDao.deleteGoods(id);
	}

	@Override
	public void updateGoods(Goods goods) {
		goodsDao.updateGoods(goods);
	}

	@Override
	public List<Goods> findAllGoods() {
		
		return goodsDao.findAllGoods();
	}

	@Override
	public List<Goods> findGoodsByGoodsnameHost(String goodsname) {
		String host=goodsname;
		List<Goods> list=goodsDao.findGoodsByGoodsnameHost(goodsname,host);
		
		if(list.isEmpty()) throw new ServiceException("没有相关的商品信息");
		return list;
	}

	@Override
	public Goods findGoodsById(int id) {
		return goodsDao.findGoodsById(id);
	}

//	@Override
//	public List<Goods> findGoodsByHost(String host) {
//		return goodsDao.findGoodsByHost(host);
//	}

}
