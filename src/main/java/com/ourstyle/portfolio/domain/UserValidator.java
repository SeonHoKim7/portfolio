package com.ourstyle.portfolio.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
//		return User.class.equals(clazz); // 검증하려는 객체가 User타입인지 확인
        return User.class.isAssignableFrom(clazz); // clazz가 User 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("UserValidator.validate() is called");

        User user = (User)target;

        String id = user.getId();
        String pwd = user.getPwd();
        String name = user.getName();

//		if(id==null || "".equals(id.trim())) {
//			errors.rejectValue("id", "required");
//		}
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id",  "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required");

        if(id==null || id.length() <  6 || id.length() > 12) {
            errors.rejectValue("id", "invalidLength", new String[]{"6","12"}, null);
        }
        if(pwd==null || pwd.length() <  8 || pwd.length() > 12) {
            errors.rejectValue("pwd", "invalidLength", new String[]{"8","12"}, null);
        }
        if(name==null || name.length() <  3 || name.length() > 6) {
            errors.rejectValue("name", "invalidLength", new String[]{"3","6"}, null);
        }



    }
}