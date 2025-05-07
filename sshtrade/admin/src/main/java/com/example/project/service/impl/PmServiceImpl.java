package com.example.project.service.impl;

import com.example.project.entity.Pm;
import com.example.project.mapper.PmMapper;
import com.example.project.service.IPmService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 私信信息 服务实现类
 * </p>
*/
@Service
public class PmServiceImpl extends ServiceImpl<PmMapper, Pm> implements IPmService {

}
