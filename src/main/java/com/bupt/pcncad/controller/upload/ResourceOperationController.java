package com.bupt.pcncad.controller.upload;

import com.bupt.pcncad.controller.BaseController;
import com.bupt.pcncad.domain.Resource;
import com.bupt.pcncad.domain.User;
import com.bupt.pcncad.service.datatraining.DataTraining;
import com.bupt.pcncad.service.mail.MailService;
import com.bupt.pcncad.service.resource.IResourceOperationService;
import com.bupt.pcncad.service.usesr.IUserService;
import com.bupt.pcncad.util.Constants;
import com.bupt.pcncad.util.LoggerUtil;
import com.bupt.pcncad.webContext.WebContextThreadLocal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Arrays;

/**
 * Created with IntelliJ IDEA.
 * User: liboyang01
 * Date: 12-7-27
 * Time: 下午8:32
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/resourceOperation")
public class ResourceOperationController extends BaseController<Resource> {
    @Autowired
    private IResourceOperationService resourceOperationService;
    @Autowired
    private MailService mailService;
    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public void upload(@RequestParam("Filedata") MultipartFile file,ModelMap modelMap, @RequestParam(Constants.USER_INFO) String userId,@RequestParam(value="mark")int mark) throws Exception {
        try {
            if ("".equals(userId) || null == userId) {
                modelMap.put("login",Constants.LOGIN);
                return ;
            }
            User user = this.userService.getUserByUserId(userId);
            if (user != null) {
                WebContextThreadLocal.setCurrentUser(user);
            } else {
                modelMap.put("login",Constants.LOGIN);
                return ;
            }
            StringBuilder resourceId=new StringBuilder();
            File uploadFile = this.resourceOperationService.uploadResource(file,userId,resourceId,mark);
            String type = file.getOriginalFilename().split("\\.")[1];
            String[] key ={};
            if(type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("pdf")){
                  key = DataTraining.extractiongkeyWordsFromInputFile(DataTraining.router(type,uploadFile.getAbsolutePath()));
            }
            modelMap.put("keys",key);
            modelMap.put("resourceId",resourceId.toString());
        } catch (Exception e) {
            LoggerUtil.error(this.getClass(), e.getMessage());
            throw e;
        }
    }

    @RequestMapping("/download")
    public void download(@RequestParam(value = "resourceId", required = true) String resourceId, HttpServletResponse response) throws Exception {
        this.resourceOperationService.downloadResource(resourceId, response);
    }

    /*@RequestMapping("/save")
    public void saveResourceWithUser(@RequestParam("resourceId") String resourceId, @RequestParam("category") String category,@RequestParam("keyWords") String keyWords) throws Exception{
           this.resourceOperationService.saveResourceWithUser(resourceId,category,keyWords);
    }*/
    @RequestMapping("/save")
    public void saveResource(@RequestParam("resourceIds") String resourceIds, @RequestParam("description") String description, @RequestParam("courseIds") String courseIds,@RequestParam(value = "mark")int mark, ModelMap modelMap, @RequestParam(value = "mail", required = false, defaultValue = "0") int mail) throws Exception {
        final String[] resourceIdArray = resourceIds.split(",");
        this.resourceOperationService.saveResource(resourceIdArray, courseIds, description,mark);
        modelMap.put("save", "success");
        if (mail == 1) {
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        mailService.sendMimeMessageOnUploadResource(resourceIdArray);
                    } catch (Exception e) {
                        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    }
                }
            }).start();
        }

    }

    @RequestMapping("/delete")
    public void deleteResource(ModelMap model, @RequestParam(value = "resourceId", required = true) String resourceId) throws Exception {
        model.addAttribute("delete", this.resourceOperationService.deleteResource(resourceId));
    }

    @RequestMapping("/upload_img")
    @ResponseBody
    public String uploadImage(@RequestParam(value = "img") MultipartFile img, ModelMap modelMap,HttpServletRequest request) throws Exception {
        String imgRootPath = request.getSession().getServletContext().getRealPath("/");
        String path = this.resourceOperationService.uploadImage(img,imgRootPath);
        String script="<script type='text/javascript'>parent.showImg('topicImg/"+path+"')</script>";
        return script;
    }

    /*public static String printBinary(String n) {

        int intPart = Integer.parseInt(n.substring(0, n.indexOf('.')));

        double decPart = Double.parseDouble(

                n.substring(n.indexOf('.'), n.length()));

        String int_string = "";

        while (intPart > 0) {

            int r = intPart % 2;

            intPart >>= 1;

            int_string = r + int_string;

        }

        StringBuffer dec_string = new StringBuffer();

        while (decPart > 0) {

            if (dec_string.length() > 32) return "ERROR";

            if (decPart == 1) {

                dec_string.append((int)decPart);

                break;

            }

            double r = decPart * 2;

            if (r >= 1) {

                dec_string.append(1);

                decPart = r - 1;

            } else {

                dec_string.append(0);

                decPart = r;

            }

        }

        return int_string + "." + dec_string.toString();
    }*/

}
