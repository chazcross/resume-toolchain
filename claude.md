# Resume Toolchain

## Naming Convention
All tailored resumes, job postings, and output PDFs share the same stem:
```
tailored/YYYY-MM-DD-{company}-{role}.md
jobs/YYYY-MM-DD-{company}-{role}.md
output/YYYY-MM-DD-{company}-{role}.pdf
```
Use today's date and kebab-case for company and role (e.g. `2026-03-18-acme-backend-engineer`).

## Workflow
1. User edits `source/resume.md` for canonical changes
2. User pastes a job description → Claude generates `tailored/YYYY-MM-DD-{company}-{role}.md`
   - Tailor content and keywords to the role; do not fabricate experience
   - Save the job posting to `jobs/YYYY-MM-DD-{company}-{role}.md`
3. Run `fish build.fish tailored/<file>.md` to produce the PDF
4. On send: `git tag sent/{company}-{role}-YYYY-MM-DD`
