// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.taskmanager.web;

import com.taskmanager.domain.AlertDetail;
import com.taskmanager.domain.UserDetail;
import com.taskmanager.web.AlertDetailController;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect AlertDetailController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByAlertTo", "form" }, method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsByAlertToForm(Model uiModel) {
        uiModel.addAttribute("userdetails", UserDetail.findAllUserDetails());
        return "alertdetails/findAlertDetailsByAlertTo";
    }
    
    @RequestMapping(params = "find=ByAlertTo", method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsByAlertTo(@RequestParam("alertTo") UserDetail alertTo, Model uiModel) {
        uiModel.addAttribute("alertdetails", AlertDetail.findAlertDetailsByAlertTo(alertTo).getResultList());
        return "alertdetails/list";
    }
    
    @RequestMapping(params = { "find=ByAlertToAndMsgStatusNot", "form" }, method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsByAlertToAndMsgStatusNotForm(Model uiModel) {
        uiModel.addAttribute("userdetails", UserDetail.findAllUserDetails());
        return "alertdetails/findAlertDetailsByAlertToAndMsgStatusNot";
    }
    
    @RequestMapping(params = "find=ByAlertToAndMsgStatusNot", method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsByAlertToAndMsgStatusNot(@RequestParam("alertTo") UserDetail alertTo, @RequestParam(value = "msgStatus", required = false) Boolean msgStatus, Model uiModel) {
        uiModel.addAttribute("alertdetails", AlertDetail.findAlertDetailsByAlertToAndMsgStatusNot(alertTo, msgStatus == null ? Boolean.FALSE : msgStatus).getResultList());
        return "alertdetails/list";
    }
    
    @RequestMapping(params = { "find=ByMsgStatusNot", "form" }, method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsByMsgStatusNotForm(Model uiModel) {
        return "alertdetails/findAlertDetailsByMsgStatusNot";
    }
    
    @RequestMapping(params = "find=ByMsgStatusNot", method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsByMsgStatusNot(@RequestParam(value = "msgStatus", required = false) Boolean msgStatus, Model uiModel) {
        uiModel.addAttribute("alertdetails", AlertDetail.findAlertDetailsByMsgStatusNot(msgStatus == null ? Boolean.FALSE : msgStatus).getResultList());
        return "alertdetails/list";
    }
    
    @RequestMapping(params = { "find=BySendingDateNotEquals", "form" }, method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsBySendingDateNotEqualsForm(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        return "alertdetails/findAlertDetailsBySendingDateNotEquals";
    }
    
    @RequestMapping(params = "find=BySendingDateNotEquals", method = RequestMethod.GET)
    public String AlertDetailController.findAlertDetailsBySendingDateNotEquals(@RequestParam("sendingDate") @DateTimeFormat(style = "M-") Date sendingDate, Model uiModel) {
        uiModel.addAttribute("alertdetails", AlertDetail.findAlertDetailsBySendingDateNotEquals(sendingDate).getResultList());
        addDateTimeFormatPatterns(uiModel);
        return "alertdetails/list";
    }
    
}