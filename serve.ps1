param(
    [int]$Port = 8080,
    [switch]$NoBrowser
)

$ErrorActionPreference = "Stop"

$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } elseif ($MyInvocation.MyCommand.Definition) { Split-Path -Parent $MyInvocation.MyCommand.Definition } else { (Get-Location).Path }
Set-Location $ScriptDir

$listener = New-Object System.Net.HttpListener
$bound = $false
while (-not $bound -and $Port -lt 8100) {
    try {
        $prefix = "http://localhost:" + $Port + "/"
        $listener.Prefixes.Clear()
        $listener.Prefixes.Add($prefix)
        $listener.Start()
        $bound = $true
    } catch {
        $Port++
    }
}

if (-not $bound) {
    Write-Error "Could not bind to any local port between 8080 and 8100."
    exit 1
}

$url = "http://localhost:" + $Port + "/"
Write-Host ""
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "         SIGNBRIDGE PRO -- LOCAL RUNTIME SERVER           " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ("Server running at: " + $url) -ForegroundColor Green
Write-Host "Press Ctrl+C at any time in this window to stop the server." -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

if (-not $NoBrowser) {
    Write-Host "Opening your browser automatically..." -ForegroundColor DarkGray
    Start-Process $url
}

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".md"   = "text/plain; charset=utf-8"
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $path = $request.Url.LocalPath
        if ($path -eq "/" -or $path -eq "") {
            $path = "/index.html"
        }

        $relativePath = $path.TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        $localPath = [System.IO.Path]::Combine($ScriptDir, $relativePath)

        if ([System.IO.File]::Exists($localPath)) {
            $ext = [System.IO.Path]::GetExtension($localPath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $response.ContentType = $mime

            $bytes = [System.IO.File]::ReadAllBytes($localPath)
            $response.ContentLength64 = $bytes.Length
            $response.StatusCode = 200
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
            Write-Host ("200 OK: " + $path + " (" + $bytes.Length + " bytes)") -ForegroundColor Green
        } else {
            $response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($msg, 0, $msg.Length)
            Write-Host ("404 Not Found: " + $path) -ForegroundColor Red
        }
        $response.OutputStream.Close()
    }
} finally {
    $listener.Stop()
    $listener.Close()
}
