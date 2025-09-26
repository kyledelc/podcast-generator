# 🎙️ Podcast Feed Generator (Practice Project)

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
language: <Language code e.g. en-us>
category: <Podcast Category e.g. Technology>
format: <File format e.g. audio/mpeg>

item:
  - title: <Episode Title>
    description: <Episode Description>
    published: <Date Published e.g. Thu, 12 Jan 2023 18:00:00 GMT>
    file: <File path e.g. /audio/episode1.mp3>
    duration: <Duration e.g. 00:10:36>
    length: <File size in bytes e.g. 576324>
  # Add more episodes as needed
```
### Sample Workflow
You're also going to need your own workflow file. Here's a sample:
```yaml
name: Generate Feed
on: [push]
jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Run Feed Generator
        uses: planetoftheweb/podcast-feed-generator@main
```
