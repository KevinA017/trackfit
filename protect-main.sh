#!/usr/bin/env bash
# Protege la rama main. Ejecutar DESPUÉS de que el CI haya corrido al menos una vez.
set -euo pipefail

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"

gh api -X PUT "repos/$REPO/branches/main/protection" --input - << 'JSON'
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["Commitlint", "Lint & Typecheck"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": {
    "required_approving_review_count": 0
  },
  "restrictions": null,
  "allow_force_pushes": false,
  "allow_deletions": false
}
JSON

echo "✅ Rama main protegida en $REPO"
