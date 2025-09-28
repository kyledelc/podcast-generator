# Podcast Feed Generator (Practice Project)

This is a **GitHub Action** that generates a podcast RSS feed from a simple **YAML file**.  
YAML is easier to read and write than XML, and this Action will convert your YAML into a valid podcast feed automatically.

⚠️ **Note:** This is a practice project I built while following the Practical GitHub Actions course on LinkedIn Learning.  It is for **educational purposes only**.

---

## Usage

### 1. Enable GitHub Pages
In your repository:  
- Go to **Settings > Pages**  
- Set the source branch to **main**  
- This will give your repo a public URL where the podcast feed (`feed.xml`) can be hosted.  

---

### 2. Create a YAML File
Add a YAML file (e.g. `feed.yaml`) with the following structure:

```yaml
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
link: <GitHub Pages URL>
image: <Artwork Location>
language: <Podcast Language e.g. en-us>
category: <Postcast Category e.g. Technology https://podcasters.apple.com/support/1691-apple-podcasts-categories>
format: <format of files e.g. audio/mpeg>
item:
  - title: <Podcast Episode Title>
    description: <Podcast Episode Description>
    published: <Date Published - e.g. Thu, 12 Jan 2023 18:00:00 GMT>
    file: <Filename e.g. /audio/TFIT01.mp3>
    duration: <duration e.g. 00:00:36>
    length: <length e.g. 576,324 (Get Info on your files)>
  ... Repeat for each episode
```
### Sample Workflow
You're also going to need your own workflow file. Here's a sample:
```yaml
name: Generate Podcast Feeds
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Run Feed Generator
        uses: kyledelc/podcast-gen-testing@main
        with:
          name: ${{ github.actor }}
          email: ${{ github.actor }}@users.noreply.github.com
```
