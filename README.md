# Career Engine

Career Engine helps you organize your professional profile, education, projects, and target jobs in one place. Build tailored resumes using your career information and portfolio highlights.

## Clone

```bash
git clone --recurse-submodules git@github.com:DPTPhatUS/career-engine.git
cd career-engine
```

If you cloned without submodules:

```bash
git submodule update --init --recursive
```

## Update Submodules

To move the parent repository to the latest `main` commits from each submodule:

```bash
git submodule update --remote
git status
git add backend frontend
git commit -m "chore: update submodules"
```

