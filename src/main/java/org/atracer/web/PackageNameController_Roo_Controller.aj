// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.atracer.model.PackageName;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PackageNameController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PackageNameController.create(@Valid PackageName packageName, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("packageName", packageName);
            return "packagenames/create";
        }
        packageName.persist();
        return "redirect:/packagenames/" + encodeUrlPathSegment(packageName.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PackageNameController.createForm(Model model) {
        model.addAttribute("packageName", new PackageName());
        return "packagenames/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PackageNameController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("packagename", PackageName.findPackageName(id));
        model.addAttribute("itemId", id);
        return "packagenames/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PackageNameController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("packagenames", PackageName.findPackageNameEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PackageName.countPackageNames() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("packagenames", PackageName.findAllPackageNames());
        }
        return "packagenames/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PackageNameController.update(@Valid PackageName packageName, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("packageName", packageName);
            return "packagenames/update";
        }
        packageName.merge();
        return "redirect:/packagenames/" + encodeUrlPathSegment(packageName.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PackageNameController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("packageName", PackageName.findPackageName(id));
        return "packagenames/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PackageNameController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        PackageName.findPackageName(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/packagenames?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    String PackageNameController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
