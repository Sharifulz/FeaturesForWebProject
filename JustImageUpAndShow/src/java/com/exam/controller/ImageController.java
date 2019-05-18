package com.exam.controller;

import com.exam.Image;
import com.exam.dao.ImageDao;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author shaarif
 */
@Controller
public class ImageController {

    @RequestMapping("/fileUpload.htm")
    public String upload(Model model, @RequestParam("imageFile") MultipartFile[] files) throws IOException {

        String uploadDir = "C:\\Users\\shaarif\\Documents\\NetBeansProjects\\JustImageUpAndShow\\web\\img";

//---------------------------------------------------
        StringBuilder fileNames = new StringBuilder();
        Path fileNameAndPath = null;
        for (MultipartFile file : files) {
            fileNameAndPath = Paths.get(uploadDir, file.getOriginalFilename());
            fileNames.append(file.getOriginalFilename());
            Files.write(fileNameAndPath, file.getBytes());
        }
        String imagName = fileNames.toString();
        model.addAttribute("img", imagName);
        System.out.println("file Name " + imagName + " filePath : " + fileNameAndPath);
        model.addAttribute("msg", "CLICK CONFIRM BUTTON TO CONFIRM");
        return "index";
    }

    @RequestMapping("/saveData.htm")
    public String upload(@ModelAttribute("member") Image img, Model m) {
        ImageDao imd = new ImageDao();
        imd.doSave(img);
        m.addAttribute("msg", "YOUR IMAGE IS BEING PUBLISHED");
        return "index";
    }

    @RequestMapping("/showImage.htm")
    public String getAllData(@ModelAttribute("image") Image img, Model m) {
        ImageDao imd = new ImageDao();
        List<Image> imageList = imd.getAllImage();
        m.addAttribute("imageList", imageList);
        m.addAttribute("msg", "IMAGE IS SHOWN ON GALLERY");
        return "index";
    }
    
    @RequestMapping("/deleteImage.htm")
    public String deleteData(@ModelAttribute("image") Image img, Model m) {
        ImageDao imd = new ImageDao();
        imd.doDelete(img);
        List<Image> imageList = imd.getAllImage();
        m.addAttribute("imageList", imageList);
        m.addAttribute("msg", "IMAGE DELETED");
        return "index";
    }

}
