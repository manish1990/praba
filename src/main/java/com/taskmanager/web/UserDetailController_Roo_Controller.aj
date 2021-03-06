// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.taskmanager.web;

import com.taskmanager.domain.UserDetail;
import com.taskmanager.web.UserDetailController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UserDetailController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UserDetailController.create(@Valid UserDetail userDetail, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userDetail);
            return "userdetails/create";
        }
        uiModel.asMap().clear();
        userDetail.persist();
        return "redirect:/userdetails/" + encodeUrlPathSegment(userDetail.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UserDetailController.createForm(Model uiModel) {
        populateEditForm(uiModel, new UserDetail());
        return "userdetails/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String UserDetailController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("userdetail", UserDetail.findUserDetail(id));
        uiModel.addAttribute("itemId", id);
        return "userdetails/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UserDetailController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("userdetails", UserDetail.findUserDetailEntries(firstResult, sizeNo));
            float nrOfPages = (float) UserDetail.countUserDetails() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("userdetails", UserDetail.findAllUserDetails());
        }
        return "userdetails/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UserDetailController.update(@Valid UserDetail userDetail, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, userDetail);
            return "userdetails/update";
        }
        uiModel.asMap().clear();
        userDetail.merge();
        return "redirect:/userdetails/" + encodeUrlPathSegment(userDetail.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String UserDetailController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, UserDetail.findUserDetail(id));
        return "userdetails/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String UserDetailController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserDetail userDetail = UserDetail.findUserDetail(id);
        userDetail.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/userdetails";
    }
    
    void UserDetailController.populateEditForm(Model uiModel, UserDetail userDetail) {
        uiModel.addAttribute("userDetail", userDetail);
    }
    
    String UserDetailController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
