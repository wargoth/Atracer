package org.atracer.web;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.validation.Valid;

import org.atracer.model.PackageName;
import org.atracer.model.PackageVersion;
import org.atracer.model.Record;
import org.atracer.model.RecordFormBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RooWebScaffold(path = "records", formBackingObject = Record.class, delete = false)
@RequestMapping("/records")
@Controller
public class RecordController {
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<String> register(@Valid RecordFormBean form) {
		PackageVersion packageVersion = null;
		try {
			TypedQuery<PackageVersion> packageVersions = PackageVersion
					.findPackageVersionsByName(form.getPackage_version());
			packageVersion = packageVersions.getSingleResult();
		} catch (NoResultException e) {
			packageVersion = new PackageVersion();
			packageVersion.setName(form.getPackage_version());
			packageVersion.persist();
		}
		PackageName packageName = null;
		try {
			TypedQuery<PackageName> packageVersions = PackageName
					.findPackageNamesByName(form.getPackage_name());
			packageName = packageVersions.getSingleResult();
		} catch (NoResultException e) {
			packageName = new PackageName();
			packageName.setName(form.getPackage_name());
			packageName.persist();
		}
		Record record = new Record();
		record.setPackageName(packageName);
		record.setPackageVersion(packageVersion);
		record.setStacktrace(form.getStacktrace());
		record.persist();

		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}
}
