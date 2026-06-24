%dw 2.0
output application/json

var errorType = vars.errorType default "SYSTEM"
var errorCode =
    if (upper(errorType) contains "VALIDATION") "VAL_001"
    else if (upper(errorType) contains "BUSINESS") "BUS_001"
    else "SYS_001"

var httpStatus =
    if (errorCode startsWith "VAL") 400
    else if (errorCode startsWith "BUS") 409
    else 500

---
{
  httpStatus: httpStatus,
  body: {
    dateTimeStamp: now(),
    timestamp: now(),

    correlationId: vars.correlationId default correlationId,
    traceId: vars.traceId default vars.correlationId default correlationId,

    interfaceId: vars.interfaceId default p("api.interface.id") default null,

    error: {
      code: vars.errorCode default errorCode,
      'type': vars.errorType default errorType,
      message: vars.errorMessage default error.description default "Service temporarily unavailable",
      severity: vars.errorSeverity default if (errorCode startsWith "SYS") "HIGH" else "MEDIUM",
      retryable: vars.retryable default if (errorCode startsWith "SYS") true else false
    },

    businessContext: {
      referenceType: vars.businessContext.referenceType default null,
      referenceId: vars.businessContext.referenceId default null,
      orderId: vars.businessContext.orderId default null,
      customerId: vars.businessContext.customerId default null
    },

    request: {
      payload: vars.originalRequestPayload default null
    },

    application: {
      muleApplication: p("api.name") default app.name default null,
      muleEnvironment: p("env") default null,
      version: p("api.version") default null
    },

    systems: {
      originatingSystem: vars.originatingSystem default p("source.system") default null,
      targetSystem: vars.targetSystem default p("target.system") default null
    },

    context: {
      service: p("api.name") default app.name default null,
      operation: vars.operation default null,
      flowName: vars.flowName default null
    },

    additionalDetails: vars.additionalDetails default {
      failingComponent: error.failingComponent default null,
      errorIdentifier: error.errorType.identifier default null,
      errorNamespace: error.errorType.namespace default null
    },

    other: vars.other default null
  }
}