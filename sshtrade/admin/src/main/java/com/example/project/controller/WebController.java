package com.example.project.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import com.example.project.common.Result;
import cn.hutool.core.collection.CollectionUtil;
import com.example.project.common.annotation.AutoLog;
import com.example.project.controller.domain.LoginDTO;
import com.example.project.controller.domain.UserRequest;
import com.example.project.entity.User;
import com.example.project.entity.Notice;
import com.example.project.service.IUserService;
import com.example.project.service.INoticeService;
import com.example.project.utils.SessionUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import com.example.project.utils.SpringContextUtil;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import javax.annotation.Resource;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Objects;
import java.util.stream.Collectors;
import com.example.project.service.IConsumerService;
import com.example.project.entity.Consumer;
import com.example.project.mapper.ConsumerMapper;
import com.example.project.service.ICategoryService;
import com.example.project.entity.Category;
import com.example.project.service.IProductService;
import com.example.project.entity.Product;
import com.example.project.service.IPaytypeService;
import com.example.project.entity.Paytype;
import com.example.project.service.ICartService;
import com.example.project.entity.Cart;
import com.example.project.service.IOrdersService;
import com.example.project.entity.Orders;
import com.example.project.service.IAddressService;
import com.example.project.entity.Address;
import com.example.project.service.IPmService;
import com.example.project.entity.Pm;
import com.example.project.service.IBannerService;

@Api(tags = "无权限接口列表")
@RestController
@Slf4j
public class WebController {

    @Resource
    IUserService userService;

    @Resource
    INoticeService noticeService;

        @Resource
        IConsumerService consumerService;

        @Resource
        ICategoryService categoryService;
        @Resource
        IProductService productService;
        @Resource
        IPaytypeService paytypeService;
        @Resource
        ICartService cartService;
        @Resource
        IOrdersService ordersService;
        @Resource
        IAddressService addressService;
        @Resource
        IPmService pmService;

        @Resource
        IBannerService bannerService;

    @GetMapping("/getCurrentUser")
    public User getLoginUser(){
        return SessionUtils.getUser();
    }

    @GetMapping(value = "/")
    @ApiOperation(value = "版本校验接口")
    public String version() {
        String ver = "partner-back-0.0.1-SNAPSHOT";  // 应用版本号
        Package aPackage = WebController.class.getPackage();
        String title = aPackage.getImplementationTitle();
        String version = aPackage.getImplementationVersion();
        if (title != null && version != null) {
            ver = String.join("-", title, version);
        }
        return ver;
    }

    @AutoLog("用户登录")
    @ApiOperation(value = "用户登录接口")
    @PostMapping("/login")
    public Result login(@RequestBody UserRequest user) {
        long startTime = System.currentTimeMillis();
        LoginDTO res = userService.login(user);
        log.info("登录花费时间 {}ms", System.currentTimeMillis() - startTime);
        return Result.success(res);
    }
    @AutoLog("用户退出登录")
    @ApiOperation(value = "用户退出登录接口")
    @GetMapping("/logout/{uid}")
    @SaIgnore
    public Result logout(@PathVariable String uid) {
        userService.logout(uid);
        return Result.success();
    }

    @AutoLog("用户注册")
    @ApiOperation(value = "用户注册接口")
    @PostMapping("/register")
    public Result register(@RequestBody UserRequest user) {
        userService.register(user);
        return Result.success();
    }

    @AutoLog("用户重置密码")
    @ApiOperation(value = "密码重置接口")
    @PostMapping("/password/reset")
    public Result passwordReset(@RequestBody UserRequest userRequest) {
        String newPass = userService.passwordReset(userRequest);
        return Result.success(newPass);
    }

    @AutoLog("用户修改密码")
    @PostMapping("/password/change")
    public Result passwordChange(@RequestBody UserRequest userRequest) {
        userService.passwordChange(userRequest);
        return Result.success();
    }

    @AutoLog("编辑用户")
    @PutMapping("/updateUser")
    public Result updateUser(@RequestBody User user) {
        Object loginId = StpUtil.getLoginId();
        if (!loginId.equals(user.getUid())) {
            return Result.error("无权限");
        }
        User dbUser = SessionUtils.getUser();
        if(dbUser.getRole().equals("CONSUMER")){
            ConsumerMapper mapper = SpringContextUtil.getBean(ConsumerMapper.class);
            QueryWrapper<Consumer> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_id",dbUser.getId());
            Consumer consumer = mapper.selectOne(queryWrapper);
            consumer.setName(user.getName());
            mapper.updateById(consumer);
        }
        userService.updateById(user);
        return Result.success(user);
    }

    @AutoLog("修改头像")
    @PutMapping("/updateAvatar")
    public Result updateAvatar(@RequestBody User user) {
        Object loginId = StpUtil.getLoginId();
        if (!loginId.equals(user.getUid())) {
        return Result.error("无权限");
        }
        User dbUser = userService.getById(user.getId());
        dbUser.setAvatar(user.getAvatar());
        userService.updateById(dbUser);
        return Result.success(user);
    }

    @GetMapping("/front/user/list")
    @SaIgnore
    public Result findAllUser() {
        return Result.success(userService.list());
    }




    @AutoLog("公告浏览")
    @GetMapping("/front/notice/{id}")
    @SaIgnore
    public Result findOneNotice(@PathVariable Integer id) {
        return Result.success(noticeService.getById(id));
    }

    @AutoLog("所有公告")
    @GetMapping("/front/notice/list")
    @SaIgnore
    public Result findAllNotice() {
        return Result.success(noticeService.list());
    }



   @AutoLog("网站公告查询")
   @GetMapping("/front/notice/page")
   @SaIgnore
   public Result findPageNotice(
      @RequestParam(defaultValue = "") String name,
      @RequestParam Integer pageNum,
      @RequestParam Integer pageSize) {
          QueryWrapper<Notice> queryWrapper = new QueryWrapper<Notice>().orderByDesc("id");
          queryWrapper.like(!"".equals(name), "name", name);
          return Result.success(noticeService.page(new Page<>(pageNum, pageSize), queryWrapper));
   }

   @AutoLog("商品列表查询")
   @GetMapping("/front/product/page")
   @SaIgnore
   public Result findPageProduct(
      @RequestParam(defaultValue = "") String name,
      @RequestParam(defaultValue = "") String category_id,
      @RequestParam Integer pageNum,
      @RequestParam Integer pageSize) {
          QueryWrapper<Product> queryWrapper = new QueryWrapper<Product>().orderByDesc("id");
          queryWrapper.like(!"".equals(name), "name", name);
          queryWrapper.like(!"".equals(category_id), "category_id", category_id);
          return Result.success(productService.page(new Page<>(pageNum, pageSize), queryWrapper));
   }

   @AutoLog("购物车查询")
   @GetMapping("/front/cart/page")
   @SaIgnore
   public Result findPageCart(
      @RequestParam(defaultValue = "") String name,
      @RequestParam Integer pageNum,
      @RequestParam Integer pageSize) {
          QueryWrapper<Cart> queryWrapper = new QueryWrapper<Cart>().orderByDesc("id");
          queryWrapper.like(!"".equals(name), "name", name);
          return Result.success(cartService.page(new Page<>(pageNum, pageSize), queryWrapper));
   }

   @AutoLog("我的收货地址查询")
   @GetMapping("/front/address/page")
   @SaIgnore
   public Result findPageAddress(
      @RequestParam(defaultValue = "") String name,
      @RequestParam Integer pageNum,
      @RequestParam Integer pageSize) {
          QueryWrapper<Address> queryWrapper = new QueryWrapper<Address>().orderByDesc("id");
          queryWrapper.like(!"".equals(name), "name", name);
          return Result.success(addressService.page(new Page<>(pageNum, pageSize), queryWrapper));
   }

   @AutoLog("我的商品订单查询")
   @GetMapping("/front/orders/page")
   @SaIgnore
   public Result findPageOrders(
      @RequestParam(defaultValue = "") String name,
      @RequestParam Integer pageNum,
      @RequestParam Integer pageSize) {
          QueryWrapper<Orders> queryWrapper = new QueryWrapper<Orders>().orderByDesc("id");
          queryWrapper.like(!"".equals(name), "name", name);
          return Result.success(ordersService.page(new Page<>(pageNum, pageSize), queryWrapper));
   }


    @AutoLog("用户浏览")
    @GetMapping("/front/consumer/{id}")
    @SaIgnore
    public Result findOneConsumer(@PathVariable Integer id) {
        return Result.success(consumerService.getById(id));
    }

    @GetMapping("/front/consumer/list")
    @SaIgnore
    public Result findAllConsumer() {
        return Result.success(consumerService.list());
    }

    @AutoLog("商品分类浏览")
    @GetMapping("/front/category/{id}")
    @SaIgnore
    public Result findOneCategory(@PathVariable Integer id) {
        return Result.success(categoryService.getById(id));
    }

    @AutoLog("商品分类列表")
    @GetMapping("/front/category/list")
    @SaIgnore
    public Result findAllCategory() {
        return Result.success(categoryService.list());
    }
    @AutoLog("商品浏览")
    @GetMapping("/front/product/{id}")
    @SaIgnore
    public Result findOneProduct(@PathVariable Integer id) {
        return Result.success(productService.getById(id));
    }

    @AutoLog("商品列表")
    @GetMapping("/front/product/list")
    @SaIgnore
    public Result findAllProduct() {
        return Result.success(productService.list());
    }
    @AutoLog("支付类型浏览")
    @GetMapping("/front/paytype/{id}")
    @SaIgnore
    public Result findOnePaytype(@PathVariable Integer id) {
        return Result.success(paytypeService.getById(id));
    }

    @AutoLog("支付类型列表")
    @GetMapping("/front/paytype/list")
    @SaIgnore
    public Result findAllPaytype() {
        return Result.success(paytypeService.list());
    }
    @AutoLog("购物车浏览")
    @GetMapping("/front/cart/{id}")
    @SaIgnore
    public Result findOneCart(@PathVariable Integer id) {
        return Result.success(cartService.getById(id));
    }

    @AutoLog("购物车列表")
    @GetMapping("/front/cart/list")
    @SaIgnore
    public Result findAllCart() {
        return Result.success(cartService.list());
    }
    @AutoLog("商品订单浏览")
    @GetMapping("/front/orders/{id}")
    @SaIgnore
    public Result findOneOrders(@PathVariable Integer id) {
        return Result.success(ordersService.getById(id));
    }

    @AutoLog("商品订单列表")
    @GetMapping("/front/orders/list")
    @SaIgnore
    public Result findAllOrders() {
        return Result.success(ordersService.list());
    }
    @AutoLog("收货地址浏览")
    @GetMapping("/front/address/{id}")
    @SaIgnore
    public Result findOneAddress(@PathVariable Integer id) {
        return Result.success(addressService.getById(id));
    }

    @AutoLog("收货地址列表")
    @GetMapping("/front/address/list")
    @SaIgnore
    public Result findAllAddress() {
        return Result.success(addressService.list());
    }
    @AutoLog("私聊浏览")
    @GetMapping("/front/pm/{id}")
    @SaIgnore
    public Result findOnePm(@PathVariable Integer id) {
        return Result.success(pmService.getById(id));
    }

    @AutoLog("私聊列表")
    @GetMapping("/front/pm/list")
    @SaIgnore
    public Result findAllPm() {
        return Result.success(pmService.list());
    }

    @GetMapping("/front/banner/list")
    @SaIgnore
    public Result findAllBanner() {
        return Result.success(bannerService.list());
    }

    @AutoLog("修改cart")
    @PostMapping("/front/cart/update")
    @SaIgnore
    public Result updateCart(@RequestBody Cart cart) {
        //如果物品不存在则新增
        Cart dbCart = cartService.getOne(new QueryWrapper<Cart>().eq("name", cart.getName()).eq("user_id",cart.getUserId()));
        if(dbCart==null){
            return Result.success(cartService.save(cart));
        }else{
            if(cart.getId()==null){
                //添加列表时，修改数量
                dbCart.setNum(dbCart.getNum()+cart.getNum());
                return Result.success(cartService.updateById(dbCart));
            }else{
                //修改列表，修改数量
                dbCart.setNum(cart.getNum());
                return Result.success(cartService.updateById(dbCart));
            }
        }
    }

    @AutoLog("删除cart")
    @DeleteMapping("/front/cart/{id}")
    @SaIgnore
    public Result deleteCart(@PathVariable Integer id) {
        return Result.success(cartService.removeById(id));
    }

    @AutoLog("修改收货地址")
    @PostMapping("/front/address/update")
    @SaIgnore
    public Result updateAddress(@RequestBody Address address) {
        return Result.success(addressService.saveOrUpdate(address));
    }

    @AutoLog("删除收货地址")
    @DeleteMapping("/front/address/{id}")
    @SaIgnore
    public Result deleteAddress(@PathVariable Integer id) {
    return Result.success(addressService.removeById(id));
    }

    @AutoLog("设置默认收货地址")
    @PutMapping("/front/address/setDefault/{id}")
    @SaIgnore
    public Result updateAddressDefault(@PathVariable Integer id) {
    UpdateWrapper<Address> updateWrapper = new UpdateWrapper();
        updateWrapper.eq("user_id",SessionUtils.getUser().getId());
        updateWrapper.set("default_radio","否");
        addressService.update(updateWrapper);

        Address address = new Address();
        address.setId(id);
        address.setDefaultRadio("是");

        return Result.success(addressService.updateById(address));
    }

    @AutoLog("更新orders")
    @PostMapping("/front/orders/update")
    @SaIgnore
    public Result updateOrders(@RequestBody Orders orders) {
        return Result.success(ordersService.saveOrUpdate(orders));
    }

    @AutoLog("删除orders")
    @DeleteMapping("/front/orders/{id}")
    @SaIgnore
    public Result deleteOrders(@PathVariable Integer id) {
        return Result.success(ordersService.removeById(id));
    }

    @AutoLog("取消orders")
    @PutMapping("/front/orders/cancel/{id}")
    @SaIgnore
    public Result cancelOrders(@PathVariable Integer id) {
        Orders orders = ordersService.getById(id);
        orders.setStateRadio("已取消");
        return Result.success(ordersService.updateById(orders));
    }



   

	
}