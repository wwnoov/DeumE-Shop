package kr.co.mapper_interface.cart;

import kr.co.chunjaeshop.cart.dto.AddToCartForm;
import kr.co.chunjaeshop.cart.dto.CartDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    CartDTO getCartInformation(@Param("customerIdx") Integer customerIdx, @Param("sellerIdx") Integer sellerIdx);
    int updateCartDetailProductInfo(AddToCartForm parameterMap);
    int insertNewCartDetail(AddToCartForm parameterMap);
    int insertNewCart(AddToCartForm parameterMap);
    List<CartDTO> getAllMyCartList(Integer customerIdx);
}
