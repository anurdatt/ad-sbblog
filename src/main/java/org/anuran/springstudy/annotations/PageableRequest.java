package org.anuran.springstudy.annotations;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;

@Retention(RUNTIME)
public @interface PageableRequest {

	String path() default "/";
}
