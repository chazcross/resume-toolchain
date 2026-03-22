Tailor the canonical resume for a specific job posting.

1. Read `source/resume-real.md` to understand the full experience and skills available.
2. The user has pasted a job description. Identify the company name and role from it.
3. Determine today's date and construct the file stem: `YYYY-MM-DD-{company}-{role}` (kebab-case).
4. Write the job posting verbatim to `jobs/{stem}.md`.
5. Write a tailored resume to `tailored/{stem}.md`:
   - Base it entirely on content in `source/resume-real.md` — do not fabricate or embellish
   - Reorder and reword bullet points to emphasize experience most relevant to this role
   - Mirror keywords and terminology from the job posting naturally
   - Keep the same markdown structure and YAML front matter as the source
6. Tell the user the two files created and the build command to run:
   `fish build.fish tailored/{stem}.md`
