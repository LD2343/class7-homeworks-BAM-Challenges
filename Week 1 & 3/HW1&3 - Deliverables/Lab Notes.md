# Notes for Class 7, Week 3: CLI, Source Code Management, and IDE

## Table of Contents
1. [Introduction](#introduction)
2. [Core Concepts](#core-concepts)
3. [Visual Studio Code](#visual-studio-code)
4. [File Paths](#file-paths)
5. [CLI File Management Basics](#cli-file-management-basics)
6. [Git Setup](#git-setup)
7. [GitHub Setup](#github-setup)

## Introduction

This week we cover some essential skills IT professionals need. Goals are to explore command-line interfaces, version control systems, file management, and how these tools work together in modern development workflows.

---

## Core Concepts

### What is Version Control, Source Code Management, and GitOps

**Version Control System:**
A system that tracks changes to files over time, allowing you to:
- See what changed, when, and who made the changes
- Revert to previous versions of files
- Create branches for different features or experiments
- Merge changes from multiple contributors
- Maintain a complete history of your project

**Source Code Management (SCM):**
The practice and tools used to track and control changes in software code. SCM encompasses:
- Version control systems (like Git)
- Repository hosting (like GitHub, GitLab)
- Branching strategies and workflows
- Code review processes
- Release management

**GitOps:**
A modern operational framework that uses Git as the single source of truth for:
- Infrastructure configuration
- Application deployment
- System state management
- Automated deployments triggered by Git changes

### What is a CLI, Shell, and Terminal

**CLI (Command Line Interface):**
A text-based interface where users type commands to interact with the computer, rather than using a graphical interface with windows and buttons.

**Shell:**
The program that interprets and executes the commands you type in a CLI. It acts as an intermediary between you and the operating system.

**Terminal:**
The application that provides the window/interface where you can access the shell. It's like a container that runs the shell program.

#### Popular Shells Explained

**Bash (Bourne Again Shell):**
- Default shell for most Linux distributions
- Used on older macOS versions (before macOS Catalina)
- Widely supported and documented
- Excellent for scripting and automation

**Zsh (Z Shell):**
- Default shell on newer macOS versions (Catalina and later)
- Enhanced version of Bash 
- Better auto-completion and customization options
- Compatible with most Bash scripts

**PowerShell:**
- Default shell for newer Windows versions
- Powerful scripting capabilities
- Cross-platform (available on Linux and macOS)

**Command Prompt (cmd):**
- Traditional Windows command-line interface
- Limited compared to modern shells
- Still useful for basic Windows system tasks

**Git Bash:**
- Bash shell emulator specifically designed for Windows
- Comes bundled with Git for Windows
- Provides Unix-like command experience on Windows
- Provides a very similar experience to bash on Linux

---

## Visual Studio Code

Visual Studio Code (VS Code) is an Integrated Development Environment (IDE) that brings together multiple development tools with convenient shortcuts and integrations.

### Key Features:
- **Code editing** with syntax highlighting and IntelliSense
- **Integrated terminal** that works exactly the same as standalone terminals
- **Version control integration** with built-in Git support
- **Extension marketplace** for additional functionality
- **Debugging tools** for multiple programming languages
- **File management** with built-in explorer

> **Important Note:** Running a terminal inside VS Code functions identically to running a terminal outside of VS Code. The commands, file paths, and shell behavior remain the same.

---

## File Paths

File paths tell the computer exactly where files and folders are located in the storage system. Think of them as addresses for your files.

### Absolute vs Relative Paths

#### **Absolute File Paths:**
These reference files from the root of the storage drive, including every folder in the path. Like giving complete directions from a landmark (root drive) everyone knows.

**macOS/Linux/Unix Examples:**
```bash
/Users/john/Documents/resume.pdf
/Applications/Visual Studio Code.app
/System/Library/Fonts/Helvetica.ttc
/etc/hosts
/var/log/system.log
```

 **Windows (Git Bash) Examples:**
```bash
/c/Users/John/Documents/resume.pdf
/c/Program Files/Git/bin/git.exe
/d/Projects/website/index.html
```

#### **Relative File Paths:**
These reference files from your current location (present working directory). Like giving directions from where someone currently is.

```bash
./Documents/resume.pdf          # File in Documents folder from current location
../Desktop/photo.jpg            # File in Desktop folder, one level up
scripts/backup.sh               # File in scripts subfolder
../../shared/config.txt         # File two levels up, then in shared folder
```

### Path Shortcuts

#### Home Directory Shortcuts:

**Tilde (`~`) - Universal Home Directory:**
- **macOS:** Expands to `/Users/<YOUR-USERNAME>/`
- **Windows (Git Bash):** Expands to `/c/Users/<YOUR-USERNAME>/`

**Examples:**
```bash
~/Documents/file.txt            # Your Documents folder
~/.ssh/id_ed25519              # SSH key in your home directory
~/Desktop/project/             # Project folder on your desktop
```

**Current Directory:** `.` or `./`

**Parent Directory:** `..` or `../`

### Setting Up GUI File Views

#### macOS File Path and Extension Setup

**Show File Paths:**

*Basic path bar (recommended):*
1. Open Finder
2. Go to **View** menu → **Show Path Bar**
3. Path bar appears at bottom of Finder window

*Show full path in title bar:*
1. Open Terminal
2. Run:
```bash
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
killall Finder
```

**Show File Extensions:**
1. Open Finder
2. Go to **Finder** menu → **Preferences** (or press **Cmd + ,**)
3. Click the **Advanced** tab
4. Check **"Show all filename extensions"**

**Alternative keyboard shortcut:**
- **Cmd + Shift + .** toggles hidden files and extensions

#### Windows File Explorer Setup

**Show File Extensions:**
1. Open File Explorer
2. Click **View** tab in ribbon
3. Check **File name extensions**

**Show Full Paths:**
1. Open File Explorer
2. Click **View** tab
3. Click **Options** → **Change folder and search options**
4. Click **View** tab
5. Check **Display the full path in the title bar**

---

## CLI File Management Basics

### Essential Navigation Commands

**`pwd` (Print Working Directory):**
Shows your current location in the file system.

**`ls` (List Storage/Contents):**
Shows files and folders in the current directory.

**`cd` (Change Directory):**
Navigate between folders.

Also:
```bash
cd ..                       # Go up one directory level
cd ~                        # Go to home directory
```

### File and Directory Operations

**`mkdir` (Make Directory):**
Create new folders.

**`touch` (Create Empty Files):**
Create new empty files (Unix/macOS/Git Bash).

**`rm` (Remove/Delete):**
Delete files and directories.

**`cat` (Concatenate/Read Files):**
Display file contents.

### Terminal Management

1. **`clear` (clear history in terminal window)**

2. **Use up and down arrows** to retrieve previous commands 

3. **Use ctrl-c** to kill a command currently executing

4. **Stop using spaces, stop using caps**

---

## Git Setup

Git is a distributed version control system that tracks changes in your code. Before using Git, you need to configure your identity. 

### Initial Git Configuration

1. **Set Your Name:**
   ```bash
   git config --global user.name "Your Full Name"
   ```

2. **Set Your Email:**
   ```bash
   git config --global user.email "your.email@example.com"
   ```

3. **Verify Configuration:**
   ```bash
   git config --global --list
   ```

---

## GitHub Setup

GitHub is a web-based platform for hosting Git repositories, collaborating on code, project management, and more.

### Terminology

**Repository (Repo):**
A project folder that contains all your files, folders, and the complete history of changes. Think of it as your project's home on GitHub.

**Remote:**
A version of your repository that's stored on a server (like GitHub) rather than your local computer. The connection between your local repo and the GitHub repo.

**Origin:**
The default name for the main remote repository. When you clone a repo, GitHub automatically becomes the "origin" remote.

**Pull Request (PR):**
A request to merge changes from one branch into another. It allows code review and discussion before changes are integrated.

**Fork:**
Your personal copy of someone else's repository. You can make changes to your fork without affecting the original project.

**Clone:**
Creating a local copy of a remote repository on your computer.

**Commit:**
A snapshot of your changes with a descriptive message. Each commit creates a point in your project's history.

**Push:**
Uploading your local commits to the remote repository (GitHub).

**Pull:**
Downloading the latest changes from the remote repository to your local copy.

**Merge:**
Combining changes from different branches into one branch.

### Authentication

Authentication proves your identity to GitHub so you can access your repositories and make changes. There are two main methods:

**HTTPS Authentication:**
- Uses your GitHub username and password (or personal access token)
- Easier to set up but requires entering credentials frequently
- GitHub now requires Personal Access Tokens instead of passwords for security

**SSH Authentication:**
- Uses cryptographic key pairs (public and private keys)
- More secure and convenient once set up
- No need to enter credentials repeatedly

### Create Your First Repository

**On GitHub:**
1. Click "+" icon → "New repository"
2. Name your repository
3. Add description (optional)
4. Choose public 
5. Click "Create repository"

### Basic Git Workflow

```bash
git init
git add <files to stage>
git commit -m "<message name>"
git branch -M main
git remote add origin <your remote>
git push -u origin main
```

### GitHub Best Practices

**Repository Organization:**
- Use clear, descriptive repository names
- Include comprehensive README files
- Add appropriate .gitignore files
- Use meaningful commit messages

**Security:**
- Never commit sensitive information (passwords, API keys)
- Review code before committing