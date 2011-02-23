// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.web;

import java.lang.String;
import org.atracer.model.PackageName;
import org.atracer.model.PackageVersion;
import org.atracer.model.Record;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    Converter<Record, String> ApplicationConversionServiceFactoryBean.getRecordConverter() {
        return new Converter<Record, String>() {
            public String convert(Record source) {
                return new StringBuilder().append(source.getStacktrace()).toString();
            }
        };
    }
    
    Converter<PackageName, String> ApplicationConversionServiceFactoryBean.getPackageNameConverter() {
        return new Converter<PackageName, String>() {
            public String convert(PackageName source) {
                return new StringBuilder().append(source.getName()).toString();
            }
        };
    }
    
    Converter<PackageVersion, String> ApplicationConversionServiceFactoryBean.getPackageVersionConverter() {
        return new Converter<PackageVersion, String>() {
            public String convert(PackageVersion source) {
                return new StringBuilder().append(source.getName()).toString();
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getRecordConverter());
        registry.addConverter(getPackageNameConverter());
        registry.addConverter(getPackageVersionConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
