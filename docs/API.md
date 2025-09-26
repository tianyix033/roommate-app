# RoomMate Platform - RESTful API Specification

## Version Headers
```
API-Version: v1
Link: https://api.[BASE_URL]/v1
```

## Table of Contents

- [API Overview](#api-overview)
- [Authentication](#authentication)
- [User Management](#user-management)
- [Profile Management](#profile-management)
- [Matching System](#matching-system)
- [Communication](#communication)
- [Housing Listings](#housing-listings)
- [Verification System](#verification-system)
- [Search & Filters](#search--and--filters)
- [Notifications](#notifications)
- [Admin Operations](#admin-operations)
- [Error Handling](#error-handling)
- [Rate Limiting](#rate-limiting)

# API Overview
Base URL: https://api.[BASE_URL]/v1
Content Type: application/json
Authentication: JWT Bearer Token
Versioning: URL path versioning (/v1/)

# Authentication
POST /auth/register # Register a new user
POST /auth/login # User login
POST /auth/refresh # Refresh authentication token
POST /auth/logout # Logout user
POST /auth/reset-password # Reset user password

# User Management
GET /users/me # Get current user info
DELETE /users/me # Delete current user
PUT /users/me # Update current user
POST /users/me # Create current user
GET /users/{id} # Get user by ID

# Profile
GET /users/{id}/profile # Get user profile info
DELETE /users/{id}/profile # Delete user profile
PUT /users/{id}/profile # Update user profile (partial)
POST /users/{id}/profile # Create user profile
GET /users/{id}/picture # Get user profile picture
DELETE /users/{id}/picture # Delete user profile picture
POST /users/{id}/picture # Upload user profile picture

# Matching
GET /matches/potential # Get potential matches
GET /matches/{id} # Get match details
GET /matches/{id}/like # Get like status for match
POST /matches/{id}/like # Like/save a match
DELETE /matches/{id}/like # Remove like/save from match
GET /matches/history # Get match history

# Communication
GET /conversations # Get all conversations
GET /conversations/{conversationId}/messages # Get messages in conversation
POST /conversations/{conversationId}/messages # Send message in conversation
POST /conversations/{conversationId}/files # Send file or media in conversation
POST /conversations/{conversationId}/block # Block user in conversation
POST /conversations/{conversationId}/report # Report user in conversation

# Housing Listings
GET /listings # Get all listings
GET /listings/{listingId} # Get listing by ID
POST /listings # Create new listing
DELETE /listings/{listingId} # Delete listing by ID
PUT /listings/{listingId} # Update listing by ID
GET /listings/{listingId}/images # Get images for listing
POST /listings/{listingId}/images # Upload image to listing
DELETE /listings/{listingId}/images/{imageId} # Delete image from listing
GET /listings/favorites # Get saved/favorite listings
POST /listings/{listingId}/favorite # Save/favorite a listing
DELETE /listings/{listingId}/favorite # Remove favorite from listing

# Verification System
GET /verification/email/status # Get email verification status
GET /verification/email/verify-code # Get email verification code status
POST /verification/email/verify-code # Verify email with code

# Search & Filters
GET /search/users # Search for users
GET /search/listings # Search for listings
GET /search/saved # Get saved searches
POST /search/saved/{searchId} # Save a search
DELETE /search/saved/{searchId} # Delete saved search
GET /search/history # Get search history

# Notifications
GET /notifications # Get notifications
POST /notifications/read # Mark notifications as read
DELETE /notifications/{notificationId} # Delete notification

# Admin Operations
GET /admin/users # Get all users (admin)
DELETE /admin/users/{userId} # Delete user (admin)
DELETE /admin/listings/{listingId} # Delete listing (admin)
DELETE /admin/conversations/{conversationId} # Delete conversation (admin)
DELETE /admin/pictures/{pictureId} # Delete picture (admin)

# Error Handling
GET /error # Get error response

# Rate Limiting
GET /rate-limiting # Get rate limiting info
