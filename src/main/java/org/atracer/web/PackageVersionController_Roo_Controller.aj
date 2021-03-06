// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.web;

import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import org.atracer.model.PackageVersion;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect PackageVersionController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PackageVersionController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("packageversion", PackageVersion.findPackageVersion(id));
        model.addAttribute("itemId", id);
        return "packageversions/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PackageVersionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("packageversions", PackageVersion.findPackageVersionEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) PackageVersion.countPackageVersions() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("packageversions", PackageVersion.findAllPackageVersions());
        }
        return "packageversions/list";
    }
    
    @RequestMapping(params = { "find=ByName", "form" }, method = RequestMethod.GET)
    public String PackageVersionController.findPackageVersionsByNameForm(Model model) {
        return "packageversions/findPackageVersionsByName";
    }
    
    @RequestMapping(params = "find=ByName", method = RequestMethod.GET)
    public String PackageVersionController.findPackageVersionsByName(@RequestParam("name") String name, Model model) {
        model.addAttribute("packageversions", PackageVersion.findPackageVersionsByName(name).getResultList());
        return "packageversions/list";
    }
    
}
