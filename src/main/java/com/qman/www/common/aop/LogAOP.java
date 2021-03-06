package com.qman.www.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Aspect
public class LogAOP {
	private static final Logger logger = LoggerFactory.getLogger(LogAOP.class);

	@Around("execution(* com.qman.www..*Controller.*(..)) || execution(* com.qman.www..*Service.*(..)) || execution(* com.qman.www..*DAO.*(..))")
	public Object doLoggingAround(final ProceedingJoinPoint pjp) throws Throwable {
		Object retVal = null;
		final Class<? extends Object> targetClass = pjp.getTarget().getClass();
		logger.info("LogAOP - "+targetClass.getSimpleName());
		
		
		retVal = pjp.proceed();

		return retVal;
	}

}
