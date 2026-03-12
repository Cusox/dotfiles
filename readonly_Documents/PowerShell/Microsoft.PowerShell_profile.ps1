# scoop-search
. ([ScriptBlock]::Create((& scoop-search --hook | Out-String)))

# mise
. ([ScriptBlock]::Create((& mise activate pwsh | Out-String)))

# atuin
. ([ScriptBlock]::Create((& atuin init powershell | Out-String)))

# pay-respects
. ([ScriptBlock]::Create((& pay-respects pwsh --alias | Out-String)))i])

# starship
. ([ScriptBlock]::Create((& starship init powershell | Out-String)))

# zoxide
. ([ScriptBlock]::Create((& zoxide init powershell | Out-String)))
