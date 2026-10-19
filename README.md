# TrackFit 🏃‍♂️

App móvil para registrar actividades con GPS (correr, caminar, bicicleta) con un **coach de IA** que analiza tu progreso. Proyecto universitario construido con **Expo (React Native)** y **Supabase**.

📄 Especificación completa: [`docs/ESPECIFICACION.md`](docs/ESPECIFICACION.md)

## Características

- Autenticación y perfil de usuario
- Tracking GPS con mapa en tiempo real
- Historial y detalle de actividades
- Estadísticas de progreso
- Coach IA con servidor MCP

## Requisitos previos

- [Node.js](https://nodejs.org/) 20 o superior
- npm 10+
- [Git](https://git-scm.com/)
- App **Expo Go** en tu teléfono ([iOS](https://apps.apple.com/app/expo-go/id982107779) / [Android](https://play.google.com/store/apps/details?id=host.exp.exponent)) o un emulador
- Cuenta en [Supabase](https://supabase.com/) (gratuita)

## Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/<tu-usuario>/trackfit.git
cd trackfit

# 2. Instalar dependencias
cd app
npm install

# 3. Configurar variables de entorno
cp ../.env.example .env
# Edita app/.env con tus credenciales de Supabase

# 4. Iniciar la app
npx expo start
```

Escanea el código QR con Expo Go (Android) o con la cámara (iOS).

## Variables de entorno

Ver [`.env.example`](.env.example). Las variables `EXPO_PUBLIC_*` quedan visibles en la app; **nunca** pongas ahí secretos como la API key de IA (va en Supabase secrets).

## Scripts disponibles (dentro de `/app`)

| Comando | Descripción |
|---------|-------------|
| `npx expo start` | Inicia el servidor de desarrollo |
| `npm run lint` | Ejecuta ESLint |
| `npx tsc --noEmit` | Verifica tipos y sintaxis |
| `npm run android` / `npm run ios` | Abre en emulador |

## Flujo de trabajo (Git)

1. Crear rama desde `develop`: `git checkout -b feat/nombre-de-la-feature`
2. Hacer commits con [Conventional Commits](https://www.conventionalcommits.org/):
   ```
   feat: agregar pantalla de login
   fix: corregir cálculo de distancia
   docs: actualizar README
   ```
3. Abrir un Pull Request hacia `develop` (se llena la plantilla automáticamente)
4. El CI debe pasar (commitlint + lint + tipos)
5. `develop` → `main` solo mediante PR

`main` está protegida: no se puede hacer push directo.

## Pipeline CI

Definido en [`.github/workflows/ci.yml`](.github/workflows/ci.yml). En cada push y PR hacia `main`/`develop`:

1. **Commitlint** — valida la convención de commits
2. **Lint & Typecheck** — ESLint y `tsc --noEmit`

## Estructura

```
├── app/      # Proyecto Expo
├── docs/     # Especificación y documentación
├── .github/  # CI y plantilla de PR
└── README.md
```

## Tecnologías

Expo · React Native · TypeScript · expo-router · expo-location · react-native-maps · Zustand · Supabase · GitHub Actions

## Equipo

| Nombre | Rol |
|--------|-----|
| _(completar)_ | _(completar)_ |

## Licencia

Proyecto académico.
