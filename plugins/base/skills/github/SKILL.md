---
name: github
description: Activates when performing GitHub operations like creating PRs, managing branches, viewing issues, or any GitHub-related tasks. Uses the gh CLI command for all GitHub interactions.
version: 2.0.0
---

# GitHub CLI (gh)

GitHub操作はすべて `gh` コマンドを使用する。MCP serverは使用しない。

## Pull Requests

```bash
# PR作成
gh pr create --title "タイトル" --body "説明"

# PR一覧
gh pr list

# PR詳細
gh pr view <number>

# PR編集
gh pr edit <number> --title "新タイトル" --body "新説明"

# PRをマージ
gh pr merge <number>

# PRのdiff確認
gh pr diff <number>

# PRをチェックアウト
gh pr checkout <number>
```

## Issues

```bash
# Issue一覧
gh issue list

# Issue作成
gh issue create --title "タイトル" --body "説明"

# Issue詳細
gh issue view <number>

# Issueをクローズ
gh issue close <number>
```

## Branches

```bash
# ブランチ一覧
gh api repos/{owner}/{repo}/branches | jq '.[].name'

# リモートブランチ作成（git経由）
git push origin HEAD:<branch-name>
```

## Files / Contents

```bash
# ファイル内容取得
gh api repos/{owner}/{repo}/contents/{path} | jq -r '.content' | base64 -d
```

## Commits

```bash
# コミット一覧
gh api repos/{owner}/{repo}/commits | jq '.[].commit.message'

# コミット詳細
gh api repos/{owner}/{repo}/commits/{sha}
```

## Repository

```bash
# リポジトリ情報
gh repo view

# リポジトリをブラウザで開く
gh repo view --web
```

## Troubleshooting

### gh未認証の場合

```bash
gh auth status
```

未認証なら：

```bash
gh auth login
```

### 認証確認

```bash
gh api user | jq '.login'
```
