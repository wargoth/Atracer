package org.atracer.web;

import org.atracer.model.PackageName;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "packagenames", formBackingObject = PackageName.class)
@RequestMapping("/packagenames")
@Controller
public class PackageNameController {
}
