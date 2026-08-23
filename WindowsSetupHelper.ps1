# Requires -RunAsAdministrator
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Asystent Konfiguracji Windows"
$form.Size = New-Object System.Drawing.Size(680, 780)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedSingle"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(15, 23, 42)

# --- Górny pasek z Tytułem i Opisem ---
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Dock = [System.Windows.Forms.DockStyle]::Top
$headerPanel.Height = 70
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
$form.Controls.Add($headerPanel)

$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Text = "ASYSTENT KONFIGURACJI I AUTOMATYZACJI WINDOWS"
$lblTitle.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$lblTitle.ForeColor = [System.Drawing.Color]::FromArgb(56, 189, 248)
$lblTitle.Location = New-Object System.Drawing.Point(15, 12)
$lblTitle.Size = New-Object System.Drawing.Size(635, 25)
$headerPanel.Controls.Add($lblTitle)

$lblSubTitle = New-Object System.Windows.Forms.Label
$lblSubTitle.Text = "Narzędzie do automatycznej konfiguracji, optymalizacji systemu oraz instalacji pakietów."
$lblSubTitle.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$lblSubTitle.ForeColor = [System.Drawing.Color]::FromArgb(148, 163, 184)
$lblSubTitle.Location = New-Object System.Drawing.Point(15, 37)
$lblSubTitle.Size = New-Object System.Drawing.Size(635, 20)
$headerPanel.Controls.Add($lblSubTitle)

# Główny kontener na treści
$scrollPanel = New-Object System.Windows.Forms.Panel
$scrollPanel.Location = New-Object System.Drawing.Point(15, 85)
$scrollPanel.Size = New-Object System.Drawing.Size(635, 580)
$scrollPanel.BackColor = [System.Drawing.Color]::FromArgb(15, 23, 42)
$scrollPanel.AutoScroll = $true
$form.Controls.Add($scrollPanel)

$global:y = 5

function Add-DarkHeader ($text) {
    $lbl = New-Object System.Windows.Forms.Label
    $lbl.Text = $text
    $lbl.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
    $lbl.ForeColor = [System.Drawing.Color]::FromArgb(56, 189, 248)
    $lbl.Location = New-Object System.Drawing.Point(5, $global:y)
    $lbl.Size = New-Object System.Drawing.Size(600, 25)
    [void]$scrollPanel.Controls.Add($lbl)
    $global:y += 30
}

function Add-DarkCheckBox ($text) {
    $cb = New-Object System.Windows.Forms.CheckBox
    $cb.Text = $text
    $cb.Font = New-Object System.Drawing.Font("Segoe UI", 9.5)
    $cb.ForeColor = [System.Drawing.Color]::FromArgb(226, 232, 240)
    $cb.Location = New-Object System.Drawing.Point(15, $global:y)
    $cb.Size = New-Object System.Drawing.Size(580, 26)
    $cb.Checked = $false
    [void]$scrollPanel.Controls.Add($cb)
    $global:y += 28
    return $cb
}

# --- KATEGORIA 1 ---
Add-DarkHeader "1. Personalizacja i Wygląd"
$cbDark        = Add-DarkCheckBox "Włącz czarny motyw (Dark Mode)"
$cbBlackBg     = Add-DarkCheckBox "Ustaw jednolite czarne tło pulpitu (Solid Black Wallpaper)"
$cbLeftStart   = Add-DarkCheckBox "Przesuń logo Windows / Start na lewą stronę (Win 11)"
$cbAutoHide    = Add-DarkCheckBox "Automatycznie ukrywaj pasek zadań"
$cbCleanTaskbar= Add-DarkCheckBox "Ukryj ikony Widgets, Task View oraz Chat/Copilot z paska zadań"

# --- KATEGORIA 2 ---
Add-DarkHeader "2. Eksplorator Plików i Wygoda"
$cbExt         = Add-DarkCheckBox "Pokaż rozszerzenia znanych plików (.txt, .exe itp.)"
$cbHidden      = Add-DarkCheckBox "Pokaż ukryte pliki i foldery"
$cbSticky      = Add-DarkCheckBox "Wyłącz Klawisze Trwałe (brak okna po 5x Shift)"
$cbEndTask     = Add-DarkCheckBox "Dodaj 'Zakończ zadanie' w prawokliku na pasku zadań"
$cbClassicMenu = Add-DarkCheckBox "Przywróć klasyczne menu kontekstowe (Win 11)"
$cbNoBing      = Add-DarkCheckBox "Wyłącz wyszukiwarkę Bing w menu Start"
$cbThisPC      = Add-DarkCheckBox "Otwieraj Eksplorator na 'Ten komputer' zamiast 'Szybki dostęp'"
$cbGodMode     = Add-DarkCheckBox "Utwórz skrót 'God Mode' na pulpicie"

# --- KATEGORIA 3 ---
Add-DarkHeader "3. Wydajność i Optymalizacja Pod Gry"
$cbRestore     = Add-DarkCheckBox "Utwórz punkt przywracania systemu"
$cbHighPerf    = Add-DarkCheckBox "Włącz plan zasilania Wysoka Wydajność"
$cbDisableHiber= Add-DarkCheckBox "Wyłącz hibernację i Szybkie Uruchamianie (odzyskuje miejsce na C:)"
$cbNoAccel     = Add-DarkCheckBox "Wyłącz akcelerację myszy (Zwiększ precyzję wskaźnika)"
$cbGameMode    = Add-DarkCheckBox "Włącz Tryb Gry (Windows Game Mode) i wyłącz nagrywanie w tle"

# --- KATEGORIA 4 ---
Add-DarkHeader "4. Instalacja Oprogramowania (winget)"
$cb7Zip        = Add-DarkCheckBox "Zainstaluj 7-Zip (Archiwizator)"
$cbHWiNFO      = Add-DarkCheckBox "Zainstaluj HWiNFO64 (Diagnostyka sprzętu)"
$cbSteam       = Add-DarkCheckBox "Zainstaluj Steam"
$cbDiscord     = Add-DarkCheckBox "Zainstaluj Discord"
$cbOpera       = Add-DarkCheckBox "Zainstaluj Opera GX"

# Przycisk wykonania
$btnRun = New-Object System.Windows.Forms.Button
$btnRun.Text = "URUCHOM WYBRANE AKCJE"
$btnRun.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$btnRun.ForeColor = [System.Drawing.Color]::White
$btnRun.BackColor = [System.Drawing.Color]::FromArgb(14, 165, 233)
$btnRun.FlatStyle = "Flat"
$btnRun.FlatAppearance.BorderSize = 0
$btnRun.Location = New-Object System.Drawing.Point(15, 675)
$btnRun.Size = New-Object System.Drawing.Size(635, 45)
$btnRun.Cursor = [System.Windows.Forms.Cursors]::Hand

# LOGIKA WYKONAWCZA
$btnRun.Add_Click({
    $btnRun.Enabled = $false
    $btnRun.Text = "PRZETWARZANIE..."
    $form.Refresh()

    if ($cbRestore.Checked) {
        Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
        Checkpoint-Computer -Description "AsystentKonfiguracjiWindows" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
    }

    if ($cbDark.Checked) {
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -Type DWord -Force
    }

    if ($cbBlackBg.Checked) {
        Set-ItemProperty -Path "HKCU:\Control Panel\Colors" -Name "Background" -Value "0 0 0" -Force
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WallPaper" -Value "" -Force
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" -Name "BackgroundType" -Value 1 -Type DWord -Force
    }

    if ($cbLeftStart.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0 -Type DWord -Force
    }

    if ($cbAutoHide.Checked) {
        $st = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" -ErrorAction SilentlyContinue
        if ($st) {
            $st.Settings[8] = 3
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" -Name "Settings" -Value $st.Settings
        }
    }

    if ($cbCleanTaskbar.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    }

    if ($cbExt.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Type DWord -Force }
    if ($cbHidden.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 -Type DWord -Force }
    if ($cbSticky.Checked) { Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "506" -Type String -Force }
    if ($cbEndTask.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDeveloperSettings" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue }
    if ($cbClassicMenu.Checked) { New-Item -Path "HKCU:\Software\Classes\CLSID\{86ca3aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Value "" -Force | Out-Null }
    if ($cbNoBing.Checked) { Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue }
    if ($cbThisPC.Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1 -Type DWord -Force }
    if ($cbGodMode.Checked) {
        $desktopPath = [Environment]::GetFolderPath("Desktop")
        New-Item -Path "$desktopPath\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}" -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
    }

    if ($cbHighPerf.Checked) { powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c -ErrorAction SilentlyContinue }
    if ($cbDisableHiber.Checked) { powercfg /h off -ErrorAction SilentlyContinue }
    if ($cbNoAccel.Checked) {
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "0" -Type String -Force
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "0" -Type String -Force
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "0" -Type String -Force
    }
    if ($cbGameMode.Checked) {
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AllowAutoGameMode" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
    }

    $pkgs = @()
    if ($cb7Zip.Checked)   { $pkgs += "7zip.7zip" }
    if ($cbHWiNFO.Checked) { $pkgs += "REALiFE.HWiNFO" }
    if ($cbSteam.Checked)  { $pkgs += "Valve.Steam" }
    if ($cbDiscord.Checked){ $pkgs += "Discord.Discord" }
    if ($cbOpera.Checked)  { $pkgs += "Opera.OperaGX" }

    foreach ($p in $pkgs) {
        winget install --id $p -e --silent --accept-package-agreements --accept-source-agreements -ErrorAction SilentlyContinue
    }

    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue

    [System.Windows.Forms.MessageBox]::Show("Wykonano wybrane akcje!", "Sukces", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

    $btnRun.Enabled = $true
    $btnRun.Text = "URUCHOM WYBRANE AKCJE"
})

[void]$form.Controls.Add($btnRun)
[void]$form.ShowDialog()