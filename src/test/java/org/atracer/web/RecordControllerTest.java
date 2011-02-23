package org.atracer.web;

import java.util.List;

import junit.framework.Assert;

import org.atracer.model.PackageName;
import org.atracer.model.PackageVersion;
import org.atracer.model.Record;
import org.atracer.model.RecordFormBean;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml")
@Transactional
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

	@Test
	public void testReuse() {
		PackageName packageName = new PackageName();
		packageName.setName("some.name");
		packageName.persist();

		PackageVersion packageVersion = new PackageVersion();
		packageVersion.setName("some.version");
		packageVersion.persist();

		RecordController recordController = new RecordController();

		RecordFormBean form = new RecordFormBean();
		form.setPackage_name(packageName.getName());
		form.setPackage_version(packageVersion.getName());
		form.setStacktrace("sample stack trace");
		recordController.register(form);

		List<Record> allRecords = Record.findAllRecords();
		Record record = allRecords.get(0);

		Assert.assertEquals(1, allRecords.size());
		Assert.assertEquals(packageName, record.getPackageName());
		Assert.assertEquals(packageVersion, record.getPackageVersion());
	}
}
