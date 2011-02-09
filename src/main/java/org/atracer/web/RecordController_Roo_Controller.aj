// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.atracer.model.PackageName;
import org.atracer.model.PackageVersion;
import org.atracer.model.Record;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RecordController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String RecordController.create(@Valid Record record, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("record", record);
            return "records/create";
        }
        record.persist();
        return "redirect:/records/" + encodeUrlPathSegment(record.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String RecordController.createForm(Model model) {
        model.addAttribute("record", new Record());
        List dependencies = new ArrayList();
        if (PackageName.countPackageNames() == 0) {
            dependencies.add(new String[]{"packageName", "packagenames"});
        }
        if (PackageVersion.countPackageVersions() == 0) {
            dependencies.add(new String[]{"packageVersion", "packageversions"});
        }
        model.addAttribute("dependencies", dependencies);
        return "records/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String RecordController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("record", Record.findRecord(id));
        model.addAttribute("itemId", id);
        return "records/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String RecordController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("records", Record.findRecordEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Record.countRecords() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("records", Record.findAllRecords());
        }
        return "records/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RecordController.update(@Valid Record record, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("record", record);
            return "records/update";
        }
        record.merge();
        return "redirect:/records/" + encodeUrlPathSegment(record.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String RecordController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("record", Record.findRecord(id));
        return "records/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String RecordController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Record.findRecord(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/records?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("packagenames")
    public Collection<PackageName> RecordController.populatePackageNames() {
        return PackageName.findAllPackageNames();
    }
    
    @ModelAttribute("packageversions")
    public Collection<PackageVersion> RecordController.populatePackageVersions() {
        return PackageVersion.findAllPackageVersions();
    }
    
    String RecordController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
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