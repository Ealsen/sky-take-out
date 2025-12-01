// package com.sky.controller.admin;
//
// import com.sky.constant.MessageConstant;
// import com.sky.result.Result;
// import com.sky.utils.AliOssUtil;
// import io.swagger.annotations.Api;
// import io.swagger.annotations.ApiOperation;
// import io.swagger.annotations.ApiParam;
// import lombok.extern.slf4j.Slf4j;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.validation.annotation.Validated;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;
// import org.springframework.web.multipart.MultipartFile;
//
// import javax.management.ObjectName;
// import java.io.IOException;
// import java.util.UUID;
//
// @RestController
// @Slf4j
// @RequestMapping("/admin/common")
// @Api(tags = "通用接口")
// @Validated
// public class CommonController {
//
//     @Autowired
//     private AliOssUtil aliOssUtil;
//
//     /**
//      * 文件上传
//      * @param file
//      * @return
//      */
//     @PostMapping("/upload")
//     @ApiOperation("文件上传接口")
//     public Result<String> uploadFile(
//             @ApiParam("需要上传的文件")
//             // @File(maxSize = 5, allowFileTypes = {"jpg", "jpeg", "png", "gif"})
//             MultipartFile file
//     ) {
//         log.info("文件上传：{}", file);
//         try {
//             // 获取文件原始名称
//             String originalFilename = file.getOriginalFilename();
//             // 获取文件类型
//             String extension = null;
//             if (originalFilename != null) {
//                 extension = originalFilename.substring(originalFilename.lastIndexOf("."));
//             }
//             String objectName = UUID.randomUUID().toString() + extension;
//             log.info("文件名：{}", file.getOriginalFilename());
//             String filePath = aliOssUtil.upload(file.getBytes(), objectName);
//             return Result.success(filePath);
//         } catch (IOException e) {
//             log.error("文件上传失败：{}", e);
//
//         }
//         return Result.error(MessageConstant.UPLOAD_FAILED);
//     }
// }



package com.sky.controller.admin;

import com.sky.constant.MessageConstant;
import com.sky.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@RestController
@Slf4j
@RequestMapping("/admin/common")
@Api(tags = "通用接口")
@Validated
public class CommonController {

    // 本地存储根目录（在 application.yml 中配置）
    @Value("${file.upload.base-dir}")
    private String baseDir;

    // 对外访问的基础路径（与静态资源映射路径一致）
    @Value("${file.upload.access-path}")
    private String accessPath;

    // 基础路径
    @Value("${server.url}")
    private String baseUrl;


    /**
     * 文件上传到本地服务器（内置 Tomcat）
     */
    @PostMapping("/upload")
    @ApiOperation("文件上传接口")
    public Result<String> uploadFile(
            @ApiParam("需要上传的文件") MultipartFile file,
            HttpServletRequest request
    ) {
        log.info("文件上传：{}", file.getOriginalFilename());

        try {
            // 1. 校验文件是否为空
            if (file.isEmpty()) {
                return Result.error(MessageConstant.UPLOAD_FAILED + "：文件为空");
            }

            // 2. 校验文件大小（限制 5MB 以内）
            long fileSize = file.getSize();
            if (fileSize > 5 * 1024 * 1024) {
                return Result.error(MessageConstant.UPLOAD_FAILED + "：文件大小不能超过 5MB");
            }

            // 3. 校验文件类型（仅允许图片格式）
            String originalFilename = file.getOriginalFilename();
            if (originalFilename == null || !originalFilename.matches(".*\\.(jpg|jpeg|png|gif|bmp)$")) {
                return Result.error(MessageConstant.UPLOAD_FAILED + "：仅支持 jpg、jpeg、png、gif、bmp 格式");
            }

            // 4. 构建存储路径（按日期分目录，避免文件过多）
            String dateDir = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
            File uploadDir = new File(baseDir + File.separator + dateDir);
            // 若目录不存在则创建
            if (!uploadDir.exists()) {
                boolean mkdirs = uploadDir.mkdirs();
                if (!mkdirs) {
                    log.error("创建上传目录失败：{}", uploadDir.getAbsolutePath());
                    return Result.error(MessageConstant.UPLOAD_FAILED + "：服务器存储目录创建失败");
                }
            }

            // 5. 生成唯一文件名（避免重名覆盖）
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String fileName = UUID.randomUUID().toString() + extension;

            // 6. 保存文件到本地目录
            File destFile = new File(uploadDir, fileName);
            file.transferTo(destFile);
            log.info("文件保存成功：{}", destFile.getAbsolutePath());

            // 7. 构建对外访问的 URL（例如：http://ip:port/upload/2024/11/18/uuid.jpg）
            String fileUrl = accessPath + "/" + dateDir + "/" + fileName;
            // 若配置了上下文路径，需要拼接（例如：http://ip:port/项目上下文/upload/...）
            String contextPath = request.getContextPath();
            if (contextPath != null && !contextPath.isEmpty()) {
                fileUrl = contextPath + fileUrl;
            }

            // 将基础URL拼接到最前面
            fileUrl = baseUrl + fileUrl;

            return Result.success(fileUrl);

        } catch (IOException e) {
            log.error("文件上传失败", e);
            return Result.error(MessageConstant.UPLOAD_FAILED + "：" + e.getMessage());
        }
    }
}