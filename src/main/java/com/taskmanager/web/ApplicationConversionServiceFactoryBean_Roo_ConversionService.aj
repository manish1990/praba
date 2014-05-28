// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.taskmanager.web;

import com.taskmanager.domain.AlertDetail;
import com.taskmanager.domain.ProjectDetail;
import com.taskmanager.domain.TaskDetail;
import com.taskmanager.domain.UserDetail;
import com.taskmanager.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<AlertDetail, String> ApplicationConversionServiceFactoryBean.getAlertDetailToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.taskmanager.domain.AlertDetail, java.lang.String>() {
            public String convert(AlertDetail alertDetail) {
                return new StringBuilder().append(alertDetail.getAlertTopic()).append(' ').append(alertDetail.getAlertMessage()).append(' ').append(alertDetail.getSendingDate()).toString();
            }
        };
    }
    
    public Converter<Long, AlertDetail> ApplicationConversionServiceFactoryBean.getIdToAlertDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.taskmanager.domain.AlertDetail>() {
            public com.taskmanager.domain.AlertDetail convert(java.lang.Long id) {
                return AlertDetail.findAlertDetail(id);
            }
        };
    }
    
    public Converter<String, AlertDetail> ApplicationConversionServiceFactoryBean.getStringToAlertDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.taskmanager.domain.AlertDetail>() {
            public com.taskmanager.domain.AlertDetail convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), AlertDetail.class);
            }
        };
    }
    
    public Converter<ProjectDetail, String> ApplicationConversionServiceFactoryBean.getProjectDetailToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.taskmanager.domain.ProjectDetail, java.lang.String>() {
            public String convert(ProjectDetail projectDetail) {
                return new StringBuilder().append(projectDetail.getTask()).append(' ').append(projectDetail.getType()).append(' ').append(projectDetail.getStartTime()).append(' ').append(projectDetail.getEndTime()).toString();
            }
        };
    }
    
    public Converter<Long, ProjectDetail> ApplicationConversionServiceFactoryBean.getIdToProjectDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.taskmanager.domain.ProjectDetail>() {
            public com.taskmanager.domain.ProjectDetail convert(java.lang.Long id) {
                return ProjectDetail.findProjectDetail(id);
            }
        };
    }
    
    public Converter<String, ProjectDetail> ApplicationConversionServiceFactoryBean.getStringToProjectDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.taskmanager.domain.ProjectDetail>() {
            public com.taskmanager.domain.ProjectDetail convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProjectDetail.class);
            }
        };
    }
    
    public Converter<TaskDetail, String> ApplicationConversionServiceFactoryBean.getTaskDetailToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.taskmanager.domain.TaskDetail, java.lang.String>() {
            public String convert(TaskDetail taskDetail) {
                return new StringBuilder().append(taskDetail.getTaskName()).append(' ').append(taskDetail.getAssignDate()).append(' ').append(taskDetail.getEndDate()).append(' ').append(taskDetail.getRootTaskId()).toString();
            }
        };
    }
    
    public Converter<Long, TaskDetail> ApplicationConversionServiceFactoryBean.getIdToTaskDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.taskmanager.domain.TaskDetail>() {
            public com.taskmanager.domain.TaskDetail convert(java.lang.Long id) {
                return TaskDetail.findTaskDetail(id);
            }
        };
    }
    
    public Converter<String, TaskDetail> ApplicationConversionServiceFactoryBean.getStringToTaskDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.taskmanager.domain.TaskDetail>() {
            public com.taskmanager.domain.TaskDetail convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), TaskDetail.class);
            }
        };
    }
    
    public Converter<UserDetail, String> ApplicationConversionServiceFactoryBean.getUserDetailToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.taskmanager.domain.UserDetail, java.lang.String>() {
            public String convert(UserDetail userDetail) {
                return new StringBuilder().append(userDetail.getFirstName()).append(' ').append(userDetail.getLastName()).append(' ').append(userDetail.getVerificationCode()).append(' ').append(userDetail.getContactNumber()).toString();
            }
        };
    }
    
    public Converter<Long, UserDetail> ApplicationConversionServiceFactoryBean.getIdToUserDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.taskmanager.domain.UserDetail>() {
            public com.taskmanager.domain.UserDetail convert(java.lang.Long id) {
                return UserDetail.findUserDetail(id);
            }
        };
    }
    
    public Converter<String, UserDetail> ApplicationConversionServiceFactoryBean.getStringToUserDetailConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.taskmanager.domain.UserDetail>() {
            public com.taskmanager.domain.UserDetail convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), UserDetail.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAlertDetailToStringConverter());
        registry.addConverter(getIdToAlertDetailConverter());
        registry.addConverter(getStringToAlertDetailConverter());
        registry.addConverter(getProjectDetailToStringConverter());
        registry.addConverter(getIdToProjectDetailConverter());
        registry.addConverter(getStringToProjectDetailConverter());
        registry.addConverter(getTaskDetailToStringConverter());
        registry.addConverter(getIdToTaskDetailConverter());
        registry.addConverter(getStringToTaskDetailConverter());
        registry.addConverter(getUserDetailToStringConverter());
        registry.addConverter(getIdToUserDetailConverter());
        registry.addConverter(getStringToUserDetailConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}