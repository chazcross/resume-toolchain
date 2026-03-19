# resume-toolchain

Markdown-based resume system with Git version control and AI-assisted tailoring.

## Requirements

```
sudo pacman -S pandoc typst
```

## Repo Structure

```
source/resume.md                          # canonical resume
template/resume.typ                       # layout and styles (Pandoc Typst template)
tailored/YYYY-MM-DD-company-role.md       # role-specific versions
jobs/YYYY-MM-DD-company-role.md           # matching job postings
output/YYYY-MM-DD-company-role.pdf        # compiled PDFs (git-ignored)
```

## Build

```sh
# fish
fish build.fish                                        # source only
fish build.fish all                                    # source + all tailored
fish build.fish tailored/2026-03-18-acme-engineer.md  # specific file

# sh
sh build.sh
sh build.sh all
sh build.sh tailored/2026-03-18-acme-engineer.md
```

## Versioning

Tag commits when sending a resume out:

```sh
git tag sent/{company}-{role}-YYYY-MM-DD
```
