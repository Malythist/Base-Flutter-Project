# Core data layer

This directory contains base abstractions for working with remote data sources.

## Purpose

The core data layer exists to:
- Reduce boilerplate in feature data sources
- Provide a unified HTTP access layer
- Enforce predictable response handling

## BaseRemoteDataSource

BaseRemoteDataSource is the foundation for all remote data sources.

It provides:
- GET / POST / PUT / PATCH / DELETE requests
- Automatic URL construction via ApiConfig
- High-level helpers for JSON responses

## Low-level API

Low-level methods:
- getRequest
- postRequest
- putRequest
- patchRequest
- deleteRequest

Use them only when:
- Response format is non-standard
- Full control over Dio is required
- Working with files, streams, or custom response types

## High-level JSON helpers (recommended)

- getListJson
- getObjectJson
- postObjectJson
- putObjectJson
- patchObjectJson

These helpers:
- Validate response structure
- Throw clear errors on contract mismatch
- Remove repetitive casting logic

Always prefer high-level helpers when backend responses are consistent.
