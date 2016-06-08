# Running Pandoc

##Preparing to run pandoc

```
cd <directory_of_atmosphere_guides>/docs/staff_guide

# Copy CSS and Media  (if things have changed or first time run)
cp ../themes/cyverse/theme.css /opt/dev/atmosphere/init_files/theme.css
cp -r media /opt/dev/atmosphere/init_files/
```

##How to run Pandoc to generate a .docx file

```
pandoc --standalone -S --toc --toc-depth 4\
        -c ./theme.css -A ../themes/cyverse/footer.html\
        00_introduction/*.md\
        10_requests/*.md\
        20_instances/*.md\
        30_tools/*.md\
        -t docx -o /opt/dev/atmosphere/init_files/staff_guide.docx
```

## How to run Pandoc to generate an HTML file
Copy the lines above, skip the `-t docx` line and insert this instead:

```
        -t html -o /opt/dev/atmosphere/init_files/staff_guide.html
```

