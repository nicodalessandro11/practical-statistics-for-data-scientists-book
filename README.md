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

Cloning on a new computer

```powershell
git lfs install
git clone https://github.com/nicodalessandro11/practical-statistics-for-data-scientists-book.git
cd practical-statistics-for-data-scientists-book
git lfs pull
```

If you cloned without Git LFS
- You may see small text "pointer" files instead of real media. Fix it by running:

```powershell
git lfs install
git lfs pull
git lfs checkout
```

Helper script
- You can also run:

```powershell
.\scripts\pull-lfs.ps1
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

If you add new `.mp4` or `.m4a` files and want a guided push:

```powershell
.\scripts\push-lfs.ps1 -Branch main
```

Contact
- If you want me to help standardize more files or automate naming, ask and I will run the changes.
"# practical-statistics-for-data-scientists-book" 
