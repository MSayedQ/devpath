# devpath

A documentation site and learning hub built with Jaspr — free and open source for Afghans.

---

## Quick start

- Run the dev server:

```bash
jaspr serve
```

The development server will be available on `http://localhost:8080`.

- Build a production-ready site:

```bash
jaspr build
```

The build output is placed in `build/jaspr/`.

---

**Developer Guide**

- Prerequisites:
	- Install the Dart SDK (compatible with your Jaspr version).
	- Install `jaspr` tooling used by the project (see project or global instructions).

- Local development workflow:
	- Start the dev server: `jaspr serve` and open `http://localhost:8080`.
	- Edit markup and components under `content/` and `lib/` respectively.
	- Client-only components are annotated with `@client` and run in the browser (see `lib/main.client.dart`).
	- The new platform helper lives in `lib/src/platform.dart` — it uses conditional exports to detect a browser environment. Guard client timers and DOM APIs with this helper to avoid server-only errors.

- Code layout overview:
	- `lib/` — application code and Jaspr components.
		- `lib/components/` — reusable Jaspr components (UI widgets).
		- `lib/main.client.dart` & `lib/main.server.dart` — entrypoints for client and server.
		- `lib/src/` — small helpers and platform utilities.
	- `content/` — Markdown pages rendered into the site.
	- `web/images/` — static images used by pages and components.

- Formatting, analysis & tests:
	- Format code: `dart format .`
	- Static analysis: `dart analyze`
	- (Optional) Add unit/integration tests as needed; place them under `test/`.

---

**Learner Guide**

This site is a learning resource for Afghan developers and students. If you're using the site to learn or to contribute educational content, here's how to get involved:

- Browse content:
	- Pages are in `content/` as Markdown files (e.g. `content/web.md`, `content/mobile.md`). Open them locally with the dev server.

- Contribute learning material:
	- Add or edit Markdown files inside `content/` to propose new lessons, guides, or translations.
	- Images and media go in `web/images/` and should be referenced with a relative path (e.g. `/images/my-image.png`).
	- Front-matter and metadata are supported by the content pipeline; follow existing files as examples.

- Non-technical contributions:
	- If you can't code, you can still contribute by suggesting content via Issues, writing notes in plain Markdown, or providing review and proofreading (especially for Dari/Pashto translations).

---

**How to Contribute**

We welcome contributions from learners and developers. Follow these steps:

- For contributors (learners / non-coders):
	1. Open an Issue describing the content you'd like to add or improve.
	2. If you can write the content, submit a Pull Request with a new Markdown file in `content/` or edits to an existing page.
	3. If you need help converting content into the required format, add a comment to the Issue and a developer will assist.

- For developers:
	1. Fork the repository and create a branch named `feat/<short-description>` or `fix/<short-description>`.
	2. Run the dev server locally: `jaspr serve`.
	3. Make your changes (components under `lib/components`, pages under `content/`).
	4. Include tests where appropriate and run `dart analyze` and `dart format .`.
	5. Commit with a clear message and open a Pull Request against `main`.

- Pull request checklist for maintainers and contributors:
	- [ ] Does the change build locally (`jaspr serve`) without server-only errors?
	- [ ] Are client-only behaviors guarded behind a platform check (see `lib/src/platform.dart`)?
	- [ ] Is formatting applied (`dart format .`)?
	- [ ] Are any new assets added to `web/images/` and referenced correctly?

---

**Community & Support**

- Report bugs or request features by opening an Issue on this repository.
- For translation or proofreading help, open an Issue and tag it `i18n` or `translation`.

---

**Notes & Next steps**

- This project is free and open source, created for Afghan learners and developers. If you want, I can add a `LICENSE` file (e.g. MIT or CC BY-SA) and a `CONTRIBUTING.md` / PR template — tell me which license you prefer and I will add it.

---

Happy learning and contributing! 🌱

