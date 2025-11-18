# Bucket List With Kids

Bucket List With Kids is a Ruby on Rails application for discovering and curating family-friendly destinations, experiences, and accommodations. It powers browsing, search, reviews, photos, and personal bucket lists so parents can plan memorable trips with children of different ages.

## Features
- Browse destinations, experiences, and accommodations with rich location details and amenities.
- Add items to a personalized bucket list and manage content through an admin-style management area.
- Upload and display photos via Cloudinary, with optional seeding support for demo content.
- Search content with Algolia for fast, typo-tolerant discovery.
- User authentication with Devise plus reviews and rating flow for experiences.

## Tech Stack
- Ruby 3.3.5 with Rails ~> 7.1
- PostgreSQL for persistence
- Webpacker (Webpack 3) with Bootstrap 3, jQuery, and Algolia client libraries
- Cloudinary for photo uploads
- Algolia for search indexing

## Prerequisites
- Ruby 3.3.5 and Bundler
- PostgreSQL running locally
- Node.js and Yarn (for Webpacker assets)
- Environment access to any optional services you plan to use (e.g., Cloudinary, Algolia)

## Setup
1. Install Ruby dependencies:
   ```bash
   bundle install
   ```
2. Install JavaScript dependencies:
   ```bash
   yarn install
   ```
3. Create and migrate the database:
   ```bash
   bin/rails db:create db:migrate
   ```
4. (Optional) Seed demo content. Cloudinary credentials are required if you want the sample photos to upload; otherwise seeding will skip image uploads gracefully:
   ```bash
   bin/rails db:seed
   ```
5. Start the application:
   ```bash
   bin/rails server
   ```

## Search Indexing
If you change search-related models and need to refresh Algolia indexes, eager load the application and trigger reindexing:
```ruby
Rails.application.eager_load!
algolia_models = ActiveRecord::Base.descendants.select { |model| model.respond_to?(:reindex) }
algolia_models.each(&:reindex)
```
You can also reindex specific models when needed:
```ruby
[Accommodation, Destination, Experience].each { |model| model.reindex! }
```

## Running Tests
Execute the test suite with:
```bash
bin/rails test
```

## Deployment Notes
Production environments expect PostgreSQL and should provide service credentials (Algolia, Cloudinary, mail delivery, etc.) through environment variables or credentials files. Ensure these are configured before deploying.
