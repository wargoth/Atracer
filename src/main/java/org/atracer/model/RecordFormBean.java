package org.atracer.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.roo.addon.javabean.RooJavaBean;

@RooJavaBean
public class RecordFormBean {
	@NotEmpty
	private String stacktrace;

	@NotEmpty
	private String package_version;

	@NotEmpty
	private String package_name;

}
