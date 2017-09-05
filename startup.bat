@echo off
for /f "usebackq delims=|" %%f in (`dir /b "./startup"`) do start ./startup/%%f