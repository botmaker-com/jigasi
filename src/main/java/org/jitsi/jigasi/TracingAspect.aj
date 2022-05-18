package org.jitsi.jigasi;

public aspect TracingAspect {

    pointcut traceAnnotatedClasses(): within(@Trace *) && execution(* *(..));

    Object around(): traceAnnotatedClasses() {
        String signature = thisJoinPoint.getSignature().toShortString();
        System.out.println("Entering " + signature);
        try {
            return proceed();
        } finally {
            System.out.println("Exiting " + signature);
        }
    }
}