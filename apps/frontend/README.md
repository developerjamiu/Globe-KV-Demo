# GitHub Repository Stats Frontend

A Flutter web application for viewing GitHub repository statistics.

## Features

- **URL-based Routing**: The app now supports proper URL routing with the following paths:

  - `/` - Home page with repository search form
  - `/stats/:org/:repo` - Repository stats page (e.g., `/stats/flutter/flutter`)

- **Direct URL Access**: You can now directly access repository stats by visiting URLs like:

  - `https://repo-stats.globeapp.dev/stats/flutter/flutter`
  - `https://repo-stats.globeapp.dev/stats/facebook/react`

- **Navigation**: The app includes a back button on the stats page to return to the search form.
