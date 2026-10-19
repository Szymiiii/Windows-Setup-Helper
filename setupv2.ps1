# ==============================================================================
# 1. CHECK FOR ADMINISTRATOR PRIVILEGES
# ==============================================================================
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "This script requires administrator privileges!" -ForegroundColor Yellow
}

# ==============================================================================
# 2. APPLICATION INSTALLATION FUNCTIONS
# ==============================================================================

function Install-App1 {
    Write-Host "`n[+] Installing 7-Zip..." -ForegroundColor Green
}

function Install-App2 {
    Write-Host "`n[+] Installing Notepad++..." -ForegroundColor Green
}

function Install-App3 {
    Write-Host "`n[+] Installing Git..." -ForegroundColor Green
}

function Install-App4 {
    Write-Host "`n[+] Installing Google Chrome..." -ForegroundColor Green
}

function Install-AllApps {
    Write-Host "`n==========================================" -ForegroundColor Yellow
    Write-Host "     STARTING BULK INSTALLATION            " -ForegroundColor Yellow
    Write-Host "==========================================" -ForegroundColor Yellow
    Install-App1
    Install-App2
    Install-App3
    Install-App4
}

# ==============================================================================
# 3. MAIN PROGRAM MENU LOOP
# ==============================================================================

do {
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "         Windows   Setup   Helper         " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host " 1. Install 7-Zip"
    Write-Host " 2. Install Notepad++"
    Write-Host " 3. Install Git"
    Write-Host " 4. Install Google Chrome"
    Write-Host " 5. Install ALL Applications"
    Write-Host "------------------------------------------"
    Write-Host " Q. Exit"
    Write-Host "=========================================="
    
    $selection = Read-Host "Select option(s) and press Enter"

    # Handle exit
    if ($selection.Trim() -eq 'Q' -or $selection.Trim() -eq 'q') {
            Write-Host "`nExiting program..." -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        break
    }

    # Split input by commas (e.g., "1, 2, 4" -> ["1", "2", "4"])
    $choices =$selection -split ','
    $validSelectionMade =$false

    foreach ($choice in $choices) {
        $cleanChoice = $choice.Trim()

        switch ($cleanChoice) {
            '1' { Install-App1; $validSelectionMade =$true }
            '2' { Install-App2; $validSelectionMade =$true }
            '3' { Install-App3; $validSelectionMade =$true }
            '4' { Install-App4; $validSelectionMade =$true }
            '5' { Install-AllApps; $validSelectionMade =$true }
            default {
                if ($cleanChoice -ne '') {
                    Write-Host "`n[!] Invalid choice '$cleanChoice' ignored." -ForegroundColor Red
                }
            }
        }
    }

    if ($validSelectionMade) {
        Write-Host "`n[OK] Process completed for selected options." -ForegroundColor Green
        Pause
    } else {
        Start-Sleep -Seconds 2
    }

} while ($true)