# Publishing the site

**Live site:** https://abhipatade-creator.github.io/Portfolio2026/
**Repo:** https://github.com/abhipatade-creator/Portfolio2026

## Every time you change something
1. Edit files in this folder (`index.html`, `work/…`, `assets/…`).
2. Double-click **publish.command**.
3. Wait ~60 seconds. Refresh the live site.

That's it. The script commits every change in the folder and pushes to `main`,
which GitHub Pages serves automatically.

## First time only
The first run connects this folder to the GitHub repo (it keeps your files and
the repo's README). GitHub will ask you to sign in once:

- **Easiest:** install GitHub CLI (`brew install gh`), run `gh auth login`, pick
  "HTTPS" and "Login with a web browser". After that, publishing never asks again.
- **Or:** when git asks for a password, paste a Personal Access Token
  (github.com → Settings → Developer settings → Personal access tokens → classic,
  scope `repo`). macOS Keychain remembers it.

If macOS says the file "can't be opened because it is from an unidentified
developer": right-click → Open → Open. You only have to do that once.

## Custom commit message (optional)
From Terminal, inside this folder:

    ./publish.command "Add Phishing Simulation case study"

## What is NOT published
`.gitignore` skips `.DS_Store`, `index-new.html` and `index_old.html` — those are
working copies. **Edit `index.html`**, that's the live homepage.
