# perchance.org/perNotPad

This how the files are handled.

- `.html` file Is the piece of code that is in the bottom right of the window, In the code editor space of perchance.org.
- `.perch` file Is the piece of code that is in the top left of the window, In the code editor space of perchance.org.

**This `.perch` is not the official file extension. I chose this for easy implementation and sorting.**

## PerNotePad Usage Guide  

### Basic Workflow  
1. Create/Open Note  
   - Click 🆕 New Note → Generates URL like ?id=abc123  
   - Bookmark/share this URL to access later  

2. Editing  
   - Default tabs:  
     - Notes (Markdown supported)  
     - To-Do (Checklist format)  
   - Switch tabs via buttons  

3. Sync  
   - 💾 Save → Pushes changes to cloud  
   - Changes auto-sync across devices using the same URL
   - **PerNotePad Sync Behavior Explanation:**
     - Last-Write-Wins: The most recent saveToSupabase() call completely overwrites previous data
     - No Versioning: No backup history - edits are permanent once synced
     - No Conflict Resolution: Simultaneous edits? Whoever saves last erases others' work
     - Technical Why:  
      javascript
      ```
      // Supabase upsert logic - brutally simple  
      .upsert({ id, tabs }) // Full replacement, no merging  
      ```
      > This is the tradeoff for instant sync simplicity. (A placeholder feature would have to be implemented so that when there is simultaneous editing thay can be cued up correctly.)

### Collaboration  
- Share the URL → Edits appear live for all viewers  
- No login required

### Keyboard Shortcuts  
*(Not yet implemented - placeholder for future update)*  

### Troubleshooting  
- 🔁 Load → Force-refreshes cloud data  
- ID in URL missing? → Create new note  
- Sync delay? → Check network connection  

### Other Features  
- Sidebar (☰) → Access:  
  - Public chat rooms  
  - Comment sections  
- Floating Chat → Click any chat link to open draggable window  
