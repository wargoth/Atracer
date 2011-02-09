package org.atracer.web;

import org.atracer.model.PackageVersion;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "packageversions", formBackingObject = PackageVersion.class)
@RequestMapping("/packageversions")
@Controller
public class PackageVersionController {
}
