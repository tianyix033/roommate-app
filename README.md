# RoomMate – Roommate matching & housing listings

This repository contains **my personal version** of *RoomMate*, originally built as a team project for **NYU CS-UY 4513 Software Engineering (Fall 2025)**. The original course repo lives under the NYU organization; this copy is owned and maintained by me and may differ in features, code quality, and deployment setup from the class submission.

RoomMate is a Rails SaaS application that helps people find compatible roommates and share housing costs. It combines listings, a matching algorithm, and in-app messaging into a single workflow.

- **Create profiles** with lifestyle, budget, and housing preferences
- **Post and browse listings** filtered by city, price range, and keywords
- **Match roommates** using a compatibility score based on profile data
- **Message matches** and track conversations, matches, and reports over time

> The original deployed version was at `https://room-mate.app/` during the course; deployment details here may differ from that environment.

## Tech stack
- **Language**: Ruby 3.3.8, HTML, CSS
- **Framework**: Ruby on Rails 7
- **Database**: PostgreSQL (production), SQLite (development/test)
- **Testing**:
  - RSpec (unit and integration)
  - Cucumber + Capybara (end‑to‑end feature tests)
  - Factory Bot (test data)

## Running the app locally
From the project root:

```bash
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails server
```

Then visit `http://localhost:3000` in your browser.

## Running tests
```bash
bundle exec rspec
bundle exec cucumber
```

## Background / original spec
- High‑level requirements and original assignment: `docs/Project_Specification.md`
- Additional feature notes: `docs/features.md`
