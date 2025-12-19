# Network layer

This directory contains network configuration and abstractions.

## Purpose

The network layer:
- Centralizes API configuration
- Provides a single base URL source
- Isolates networking from features

## ApiConfig

ApiConfig defines:
- Base API URL
- Environment-specific configuration

ApiConfig must be injected via DI and never created manually.

All remote access must go through ApiConfig and BaseRemoteDataSource.
