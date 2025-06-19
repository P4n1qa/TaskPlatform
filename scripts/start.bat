@echo off
cd /d "%~dp0.."
setlocal

echo --------------------------
echo 🔨 Сборка всех контейнеров
echo --------------------------
docker compose build
if errorlevel 1 goto :error

echo --------------------------
echo 🧱 Применение миграций
echo --------------------------
docker compose run --rm migrations
if errorlevel 1 goto :error

echo --------------------------
echo 🚀 Запуск всех контейнеров
echo --------------------------
docker compose up -d
if errorlevel 1 goto :error

echo ✅ Проект успешно запущен!
goto :eof

:error
echo ❌ Произошла ошибка во время выполнения. Проверь выше.
exit /b 1
