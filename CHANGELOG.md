# Changelog

## [Unreleased]

### Added
- **Wildcard support for Foreground Auto-Reload Trigger URL**: You can use `*` in the Foreground Trigger URL to match multiple URLs. Examples:
  - **Subdomains:** `https://*.jamfcloud.com` matches `https://someschool.jamfcloud.com` (and any subdomain)
  - **Any path:** `https://app.example.com/*` matches `https://app.example.com/dashboard/profile/42/settings` (and any path)
  - **Prefix (no wildcard):** `https://example.com/user/` matches any URL starting with that path

### Changed
- **Background Trigger URL wildcards**: `*` now correctly matches any characters (`.*`); previously it matched only zero-or-more dots.
- Settings UI: Foreground Trigger URL field supports wildcards; duplicate-check and validation updated for both trigger and foreground URLs.
