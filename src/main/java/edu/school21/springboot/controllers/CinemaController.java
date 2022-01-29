package edu.school21.springboot.controllers;

import edu.school21.springboot.models.AuthHistory;
import edu.school21.springboot.models.User;
import edu.school21.springboot.services.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.*;

@Controller
public class CinemaController {
    private final UserService userService;
    private final String avatarPath;

    @Autowired
    public CinemaController(UserService userService, String avatarPath) {
        this.userService = userService;
        this.avatarPath = avatarPath;
    }

    @GetMapping("/profile")
    public String profile(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User cinemaUser = userService.getUserByFirstname(request.getUserPrincipal().getName());
        try {
            boolean isAddedHistory = (boolean) session.getAttribute("isAddedSession");
        }
        catch (Exception e) {
            session.setAttribute("isAddedSession", true);
            cinemaUser.getAuthHistory().add(new AuthHistory(cinemaUser, "1", new Date().toString(), request.getRemoteAddr()));
            userService.updateUser(cinemaUser);
        }
        model.addAttribute("user", userService.getUserByFirstname(request.getUserPrincipal().getName()));
        model.addAttribute("listFiles", fileList(cinemaUser));
        return "/admin/panel/profile";
    }

    @GetMapping("/profile/avatar")
    @ResponseBody
    public byte[] downloadAvatar(Principal principal) throws IOException {
        User cinemaUser = userService.getUserByFirstname(principal.getName());
        return downloadAvatar(cinemaUser);
    }

    @PostMapping("/profile/avatar")
    public String uploadAvatar(@RequestParam("file") MultipartFile file, Principal principal) throws IOException {
        User cinemaUser = userService.getUserByFirstname(principal.getName());
        loadAvatar(file, cinemaUser);
        return "redirect:/profile";
    }

    @GetMapping("/profile/photo/{filename}")
    @ResponseBody
    public byte[] getOldAvatar(@PathVariable("filename") String filename, Principal principal) throws IOException {
        User cinemaUser = userService.getUserByFirstname(principal.getName());
        return downloadImage(cinemaUser, filename);
    }

    @GetMapping("/profile/photo/{filename}/show")
    public String showOldAvatar(@PathVariable("filename") String filename) {
        return "/auth/avatar";
    }

    private void loadAvatar(MultipartFile file, User cinemaUser) throws IOException {
        if (file.getBytes().length > 0) {
            File uploadDir = new File(avatarPath + "/" + cinemaUser.getId());
            if (!uploadDir.exists())
            { uploadDir.mkdir(); }
            String uuidFile = file.getName();
            String resultFileName = uuidFile + "." + FilenameUtils.getExtension(file.getOriginalFilename());
            file.transferTo(new File(avatarPath + "/" + cinemaUser.getId() + "/" + resultFileName));
        }
    }

    private byte[] downloadImage(User cinemaUser, String filename) throws IOException {
        File imagesDir0 = new File(avatarPath);
        if (!imagesDir0.exists())
            imagesDir0.mkdir();
        File imagesDir = new File(avatarPath + "/" + cinemaUser.getId());
        if (!imagesDir.exists())
            imagesDir.mkdir();
        File image = new File(avatarPath + "/" + cinemaUser.getId() + "/" + filename);
        if (image.exists())
            return FileUtils.readFileToByteArray(image);
        return null;
    }

    private byte[] downloadAvatar(User cinemaUser) throws IOException {
        File imagesDir0 = new File(avatarPath);
        if (!imagesDir0.exists())
            imagesDir0.mkdir();
        File imagesDir = new File(avatarPath + "/" + cinemaUser.getId());
        if (!imagesDir.exists())
            imagesDir.mkdir();
        File image = new File(avatarPath + "/" + cinemaUser.getId());
        if ((Objects.requireNonNull(image.listFiles()).length != 0)) {
            File[] files = image.listFiles();
            assert files != null;
            Arrays.sort(files, Comparator.comparingLong(File::lastModified));
            return FileUtils.readFileToByteArray(files[files.length - 1]);
        }
        return null;
    }

    private List<String> fileList(User cinemaUser) {
        List<String> result = new ArrayList<>();
        File imagesDir0 = new File(avatarPath);
        if (!imagesDir0.exists())
            imagesDir0.mkdir();
        File imagesDir = new File(avatarPath + "/" + cinemaUser.getId());
        if (!imagesDir.exists())
            imagesDir.mkdir();
        File image = new File(avatarPath + "/" + cinemaUser.getId());
        if ((Objects.requireNonNull(image.listFiles()).length != 0)) {
            File[] files = image.listFiles();
            assert files != null;
            Arrays.sort(files, Comparator.comparingLong(File::lastModified));
            for (File file : files)
                result.add(file.getName());
        }
        return result;
    }

    @GetMapping("/session/search")
    public String sessionSearch() {
        return "sessions/sessionSearch";
    }
}
