# Unit Converter API

A full-stack unit conversion application built as a solution to the [roadmap.sh Unit Converter project](https://roadmap.sh/projects/unit-converter). It lets users enter a value, choose source and target units, and view the converted result for length, weight, and temperature.

The project is split into a **Go REST API backend** and a **Flutter cross-platform frontend** that consumes the API.

**Live demo**

- Frontend: [https://unit-converter-1-0ju7.onrender.com/](https://unit-converter-1-0ju7.onrender.com/)
- Backend API: [https://unit-converter-hwde.onrender.com](https://unit-converter-hwde.onrender.com)

## Project inspiration

This repository implements the requirements from [roadmap.sh/projects/unit-converter](https://roadmap.sh/projects/unit-converter):

- Input a value to convert
- Select units to convert from and to
- View the converted result
- Support for length, weight, and temperature units

## Features

### Backend (Go + Gin)

- REST API with versioned routes under `/api/v1`
- Length, weight, and temperature conversion endpoints
- Input validation and clear error responses
- Health check and echo endpoints for connectivity testing
- Swagger/OpenAPI documentation
- CORS middleware for deployed frontend origins
- Deployed at `https://unit-converter-hwde.onrender.com`

### Frontend (Flutter)

- Deployed at [https://unit-converter-1-0ju7.onrender.com/](https://unit-converter-1-0ju7.onrender.com/)
- Cross-platform app (Web, Android, iOS, Windows, Linux, macOS)
- Dashboard with dedicated converter screens for length, weight, and temperature
- Shared converter form UI with validation and loading states
- Real-time API health status badge
- Light/dark theme support (persisted with SharedPreferences)
- Responsive layout with desktop sidebar and mobile bottom navigation
- Clean Architecture: presentation → domain → data layers per feature
- State management with GetX; HTTP client via Dio

## Supported units

| Category      | Units |
|---------------|-------|
| **Length**    | `mm`, `cm`, `m`, `km`, `inch`, `ft`, `yard`, `mile` |
| **Weight**    | `mg`, `gram`, `kg`, `oz`, `lb` |
| **Temperature** | `celsius`, `fahrenheit`, `kelvin` |

Length and weight conversions normalize through a base unit (meters and kilograms). Temperature uses direct formula conversion between scales.

## Project structure

```
unit-converter-api/
├── backend/                    # Go REST API
│   ├── cmd/server/main.go      # Application entry point
│   ├── docs/                   # Swagger generated docs
│   └── internal/
│       ├── handlers/           # HTTP request handlers
│       ├── middleware/         # CORS, logging
│       ├── models/             # Request/response structs
│       ├── routes/             # Route registration
│       └── services/           # Conversion & validation logic
│
└── frontend/
    └── unit_converter/         # Flutter application
        ├── lib/
        │   ├── core/           # Theme, routes, network, shared widgets
        │   └── features/       # Feature modules (length, weight, temperature, health, echo, about)
        └── deploy/web/         # Pre-built web deployment assets
```

## API reference

**Base URL:** `https://unit-converter-hwde.onrender.com/api/v1`

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET`  | `/health` | Server health check |
| `POST` | `/echo` | Echo test (`{ "name": "John" }` → `{ "message": "Hello, John" }`) |
| `POST` | `/convert/length` | Convert length units |
| `POST` | `/convert/weight` | Convert weight units |
| `POST` | `/convert/temperature` | Convert temperature units |

### Example requests

**Length conversion**

```bash
curl -X POST https://unit-converter-hwde.onrender.com/api/v1/convert/length \
  -H "Content-Type: application/json" \
  -d '{"value": 10, "from": "m", "to": "ft"}'
```

```json
{ "value": 32.8084 }
```

**Weight conversion**

```bash
curl -X POST https://unit-converter-hwde.onrender.com/api/v1/convert/weight \
  -H "Content-Type: application/json" \
  -d '{"value": 10, "from": "kg", "to": "lb"}'
```

```json
{ "value": 22.0462 }
```

**Temperature conversion**

```bash
curl -X POST https://unit-converter-hwde.onrender.com/api/v1/convert/temperature \
  -H "Content-Type: application/json" \
  -d '{"value": 0, "from": "celsius", "to": "fahrenheit"}'
```

```json
{ "result": 32 }
```

**Error response (400)**

```json
{ "error": "Invalid unit" }
```

### Swagger UI

When running the backend locally, interactive API docs are available at:

```
http://localhost:8080/swagger/index.html
```

## Getting started

### Prerequisites

- [Go](https://go.dev/) 1.26+
- [Flutter](https://docs.flutter.dev/get-started/install) 3.10+ (for the frontend)

### Run the backend

```bash
cd backend
go run ./cmd/server
```

The server starts on port `8080` by default. Override with the `PORT` environment variable.

```bash
PORT=3000 go run ./cmd/server
```

### Run the frontend

```bash
cd frontend/unit_converter
flutter pub get
flutter run
```

To run on a specific platform:

```bash
flutter run -d chrome    # Web
flutter run -d windows   # Windows
flutter run -d android   # Android
```

### Point the frontend to a local API

Update the base URL in `frontend/unit_converter/lib/core/constants/api_constants.dart`:

```dart
static const String baseUrl = 'http://localhost:8080';
```

For Android emulator, use `http://10.0.2.2:8080`. For a physical device, use your machine's LAN IP.

## Tech stack

| Layer | Technologies |
|-------|--------------|
| **Backend** | Go, Gin, Swagger (swaggo), gin-contrib/cors |
| **Frontend** | Flutter, GetX, Dio, Google Fonts, SharedPreferences |
| **Architecture** | REST API + Clean Architecture (Flutter features) |

## Frontend screens

| Screen | Route | Purpose |
|--------|-------|---------|
| Dashboard | `/` | Overview and navigation to converters |
| Length | `/length` | Length unit conversion |
| Weight | `/weight` | Weight unit conversion |
| Temperature | `/temperature` | Temperature unit conversion |
| Echo Tester | `/echo` | Test backend connectivity |
| About | `/about` | App info, API endpoints, tech stack |

## License

This project was built as a learning exercise for the [roadmap.sh Unit Converter](https://roadmap.sh/projects/unit-converter) project.
