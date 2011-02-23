package org.atracer.web;

import junit.framework.Assert;

import org.atracer.model.RecordFormBean;
import org.junit.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class RecordControllerTest {

	@Test
	public void testRegister() {
		RecordController recordController = new RecordController();

		RecordFormBean form = new RecordFormBean();
		form.setPackage_name("Test.package.name");
		form.setPackage_version("1.3.5-test");
		form.setStacktrace("sample stack trace");
		ResponseEntity<String> result = recordController.register(form);

		Assert.assertEquals(HttpStatus.OK, result.getStatusCode());
	}
}
