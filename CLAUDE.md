# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Typst diploma thesis template for HTL Wiener Neustadt (Austria). The template is self-documenting — the compiled PDF explains how to use it, covering Typst basics, citations, figures, and printing.

## Build Commands

Single-pass compilation — no multiple runs needed:

```bash
# Compile once
typst compile _Diplomarbeit.typ _Diplomarbeit.pdf

# Live preview (recompiles on every save)
typst watch _Diplomarbeit.typ _Diplomarbeit.pdf
```

Output: `_Diplomarbeit.pdf`

Required tool: `typst` (install via `sudo pacman -S typst` on Arch Linux, or download from the Typst releases page).

## Architecture

### Entry Point

`_Diplomarbeit.typ` — configure thesis metadata here (title, authors, department, advisors, year) and control which chapters are included via `#include` directives.

### Template Module

- **`htldipl.typ`** — Main template module. Defines `htldipl()` (title page, oath page, TOC, global styles), `mainmatter()` (switches to arabic page numbers + heading numbering), `appendix-matter()` (switches to letter-based heading numbering), and helpers (`print-glossary`, `trennstrich`, `frametext`, `kurzfassung`, `abstract-en`).

### Content Structure

Chapter files in `chapters/`, loaded in order from `_Diplomarbeit.typ`:

| File | Purpose |
|------|---------|
| `chapters/vorwort.typ` | Foreword |
| `chapters/kurzfassung.typ` | German abstract (1 page max) |
| `chapters/abstract.typ` | English abstract (1 page max) |
| `chapters/einleitung.typ` | Introduction |
| `chapters/diplomschrift.typ` | Thesis content guide |
| `chapters/typst.typ` | Built-in Typst tutorial |
| `chapters/abbildungen.typ` | Figures, tables, code listings guide |
| `chapters/mathematik.typ` | Math guide |
| `chapters/literatur.typ` | Citations guide |
| `chapters/drucken.typ` | Printing and formatting requirements |
| `chapters/schluss.typ` | Conclusion |
| `chapters/anhang_b.typ` … | Appendices |

### Data Files

- **`literatur.bib`** — BibTeX database; read natively by Typst (no biber needed)
- **`images/`** — All figures referenced in chapters

## Key Conventions

- `#show: mainmatter()` — must be called as a show rule (not `#mainmatter()`) so `set` rules propagate to document scope
- `#show: appendix-matter()` — same requirement
- The `htldipl()` function uses `_section-state` (a Typst `state`) to track frontmatter / mainmatter / appendix and drive heading prefixes ("Kapitel N" / "Anhang X") and page numbering
- Bibliography backend is native Typst — no external tools required
- `color: true` enables colored syntax highlighting; `color: false` for black/white print
