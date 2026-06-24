# NRI MuleSoft System API Template

## Purpose

This template provides a standard starting point for building MuleSoft System APIs. It ensures all APIs follow the same structure, logging approach, error handling, and security practices. Developers should use this template instead of creating a new project from scratch.

------

## Naming Convention

Use the format: --sys-api

Examples:

dayforce-sys-api

snowflake-sys-api

------

## What is Included

| Area | Description |
|------|------------|
| Mule Project | Ready-to-use Maven Mule application |
| API Contract | Sample RAML and OpenAPI YAML |
| API Fragments | Reusable error, trait, and security definitions |
| Logging | Standard structured logging with correlationId and traceId |
| Error Handling | Global error handler with consistent response format |
| Secure Properties | Encrypted property structure |
| Testing | Basic MUnit setup |
| Governance | Rules and standards for consistent development |

------

## How to Use the Template

1. Download or import the template from Exchange.
2. Rename the project using the naming standard.
3. Update the following:

    - `artifactId` in pom.xml
    - API name
    - RAML or YAML files
    - configuration properties

4. Add business logic in:src/main/mule/implementation/
5. Keep the base structure and shared components unchanged.

------

## What Should Not Be Changed

| Item | Reason |
|------|--------|
| Folder structure | Keeps all APIs consistent |
| global.xml location | Required for configuration |
| Logging format | Required for support and tracing |
| Error model | Keeps responses consistent |
| Secure property setup | Prevents security risks |
| API fragments | Enables reuse |

------

## Logging Standard

Each API must log using structured fields:

```json
{
  "timestamp": "2026-04-30T00:00:00Z",
  "level": "INFO",
  "correlationId": "abc123",
  "traceId": "trace123",
  "service": "dayforce-payroll-sys-api",
  "event": "REQUEST_RECEIVED",
  "message": "Request received"
}

Error Handling Standard

All APIs must return the same error format:

{
  "timestamp": "2026-04-30T00:00:00Z",
  "correlationId": "abc123",
  "traceId": "trace123",
  "error": {
    "code": "SYS_001",
    "message": "Service temporarily unavailable",
    "type": "SYSTEM",
    "severity": "HIGH",
    "retryable": true
  },
  "context": {
    "service": "dayforce-payroll-sys-api",
    "operation": "getEmployee",
    "version": "1.0.0"
  }
}

```

------

## Error Types

Type    Meaning

SYSTEM    Technical or runtime failure

BUSINESS    Business rule failure

VALIDATION    Input or format issue

------

## Secure Properties

Do not store real credentials in the code.

Example:

secure:

  client:

```
id: "![encrypted-client-id]"

secret: "![encrypted-client-secret]"
```

Provide the encryption key during deployment:

secure.key=

## API Specification Rules

Each API must define:

Endpoints

Request and response examples

Standard error responses

Security requirements

Reusable fragments should be used from:

src/main/resources/api/fragments/

## Definition of Done

| Check     | Requirement                    |
| --------- | ------------------------------ |
| Naming    | Follows standard               |
| Contract  | Updated                        |
| Structure | Unchanged                      |
| Logic     | Added in implementation folder |
| Logging   | Uses correlationId and traceId |
| Errors    | Uses standard format           |
| Security  | No secrets in code             |
| Build     | Successful                     |
