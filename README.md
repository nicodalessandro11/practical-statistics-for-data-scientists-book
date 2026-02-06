# Practical Statistics for Data Scientists — Repository

This repository contains supporting files for the book "Practical Statistics for Data Scientists" (chapters, slide decks, infographics, audio and video overviews).

Contents
- Chapter folders: `Chapter 1. Exploratory Data Analysis`, `Chapter 2. Data and Sampling Distributions`, etc.
- Each chapter folder contains a text file with the chapter notes plus assets: slide deck, infographic, mind map, audio overview and video overview.

Naming convention
- Files use the pattern: `Chapter N - <Name> (Language).ext` where Language is `English` or `Spanish` when applicable.
- Examples: `Chapter 3 - Slide Deck.pdf`, `Chapter 5 - Video Overview (Spanish).mp4`, `Chapter 6 - Audio Overview (Spanish).m4a`.

Media and large files
- Media files (mp4, mp3, pdf, images, archives) are tracked with Git LFS. Install Git LFS before working with large files:

```powershell
git lfs install
```

If you add large media files, run:

```powershell
git lfs track "*.mp4" "*.m4a" "*.mp3" "*.pdf" "*.png" "*.jpg" "*.zip"
git add .gitattributes
```

.gitignore
- There is a `.gitignore` in the repo to exclude temporary files, virtual environments and OS/IDE files.

Contributing
- Follow the naming convention for new files.
- Add new chapter assets inside the corresponding `Chapter N.*` folder.
- Commit small changes and push; if adding media, use Git LFS as shown above.

Contact
- If you want me to help standardize more files or automate naming, ask and I will run the changes.
"# practical-statistics-for-data-scientists-book" 
