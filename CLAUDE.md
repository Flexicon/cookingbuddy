# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Setup & Running
- **Setup**: `bin/setup` - Initial setup and dependency installation
- **Start development**: `bin/dev` - Starts Rails server, asset watchers (JS/CSS) via Procfile.dev
- **Rails console**: `bin/rails console`

### Testing & Quality
- **Run tests**: `bin/rails test` - Basic test suite
- **Run all tests**: `bin/rails test:all` - Includes integration/system tests
- **Lint (Ruby)**: `bin/rubocop` or `bin/rubocop -f github` - Code quality checks with RuboCop
- **Security scan**: `bin/brakeman` - Static security analysis

### Asset Building
- **Build JS**: `bun run build` - Compile JavaScript with Bun
- **Build CSS**: `bun run build:css` - Compile Tailwind CSS
- **Watch mode**: Both JS and CSS building happen automatically in `bin/dev`

## Architecture Overview

### Core Domain Models
- **Recipe**: Central entity with categories (breakfast/lunch/dinner/supper/dessert), rich text instructions, image attachments
- **Product**: Categorized items (general/protein/carbohydrate) that serve as ingredients
- **Ingredient**: Join model connecting recipes to products with quantities
- **User**: Devise authentication with GitHub OAuth, email allowlist in credentials

### Key Patterns & Technologies

**Rails 8.0.2** with modern conventions:
- **Turbo/Stimulus**: Hotwire for SPA-like interactions without JavaScript frameworks
- **ViewComponent**: Component-based view architecture in `app/components/`
- **Form Objects**: Custom form classes like `RecipeFilterForm` for complex filtering logic
- **Rich Text**: ActionText for recipe instructions with Trix editor
- **Active Storage**: File uploads with S3-compatible storage (AWS SDK)

**Frontend Stack**:
- **Bun**: JavaScript runtime and package manager
- **Tailwind CSS v4** with **DaisyUI**: Utility-first styling with component library
- **Stimulus Controllers**: Minimal JavaScript for interactions (modals, toggles, select)

**Component System**:
- ViewComponents in `app/components/` with accompanying templates
- Recipe filtering, lists, forms, and UI elements as reusable components
- Component previews and tests in `test/components/`

### Key Architecture Decisions

**Filtering System**: Complex recipe filtering via form objects that build SQL queries with proper joins and aggregations for product-based filtering.

**Inline Editing**: Recipes support granular updates (name, instructions, image, category) with dedicated controller actions and Turbo Stream responses.

**Authentication**: GitHub OAuth with credential-based email allowlist for access control.

**Asset Pipeline**: Modern approach using Bun for JavaScript bundling and Tailwind CLI for CSS, avoiding Webpacker complexity.

## Code Conventions

- **RuboCop**: Uses RuboCop for Ruby code analysis and formatting
- **Frozen String Literals**: All Ruby files use `# frozen_string_literal: true`
- **Strong Parameters**: Rails 8 `params.expect()` syntax throughout
- **Component Naming**: ViewComponents follow `*_component.rb` pattern with matching templates
- **Turbo Streams**: Extensive use for dynamic updates without full page reloads

## Testing Notes

- **System Tests**: Capybara + Selenium for browser automation
- **Component Tests**: Dedicated tests for ViewComponents
- **Factory Bot**: Available for test data generation
- **Shoulda**: Matchers for cleaner test assertions