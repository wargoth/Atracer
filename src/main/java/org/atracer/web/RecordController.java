package org.atracer.web;

import org.atracer.model.Record;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "records", formBackingObject = Record.class, create = false, delete = false)
@RequestMapping("/records")
@Controller
public class RecordController {
}
