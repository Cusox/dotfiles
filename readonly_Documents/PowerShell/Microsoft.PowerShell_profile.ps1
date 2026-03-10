# scoop-search
. ([ScriptBlock]::Create((& scoop-search --hook | Out-String)))

# mise
. ([ScriptBlock]::Create((& mise activate pwsh | Out-String)))

# atuin
. ([ScriptBlock]::Create((& atuin init powershell | Out-String)))

# starship
. ([ScriptBlock]::Create((& starship init powershell | Out-String)))

# Zoxide
. ([ScriptBlock]::Create((& zoxide init powershell | Out-String)))
