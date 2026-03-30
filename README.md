# perNotPad
- perNotPad is on & is runging in [perchance.org](https://perchance.org/hub). URL for perNotePad: https://perchance.org/precode-collab
- Quick start to contribute. --> [CONTRIBUTING.md](https://github.com/PROFESSOR902/perNotePad/tree/main?tab=contributing-ov-file) (Note: Still needs development for better clarity. Go to [perNotePad](https://perchance.org/pernotepad) Feel free to contribute/Ask where to start? in the feedback comment section. )

# PerNotePad Documentation

## Core Functionality
- 📝 Multi-tab notepad with Markdown support
- ☁️ Cloud sync via Supabase backend
- 🔄 Real-time collaborative editing
- 🆔 Auto-generated note IDs (6-character)
- 🗂️ Tabbed interface (Notes/To-Do default)

## 1. No-Account Syncing  
✅ *"Just open the link and continue where you left off"*  
- Auto-Generated IDs: createNewNote() creates 6-character random URLs (e.g., ?id=x9fj3k)  
- URL-Based State: Entire application state bound to URL parameters  
- Anonymous Supabase Access: Uses Supabase's anon role - zero authentication  

## 2. Cross-Device Sync  
✅ *"Simple cross-device syncing"*  
- Supabase Realtime: subscribeToChanges() listens for remote updates  
- Instant Propagation: Edits sync via Postgres' UPDATE event triggers  
- Ephemeral Storage: Notes persist without user profiles  

## 3. Secret Chat-Like Behavior  
✅ *"Similar to Secret Chat"*  
- Shareable Links: Single URL grants access to entire note  
- No History: No "recent documents" list - purely URL-driven  
- Live Collaboration: Multiple devices edit simultaneously  

## Implementation Highlights  
javascript
```
// Key sync logic
window.history.replaceState({}, '', ?id=${id}); // URL binding
.subscribe('postgres_changes', {filter: id=eq.${id}}) // Live sync
```

Note: Lacks encryption - data visible to anyone with the URL (like Secret Chat).  

## Data Management
- 💾 Save/load functionality with:
  - createNewNote()
  - saveToSupabase()
  - loadFromSupabase()
- 🔔 Live subscription to remote changes

# PerNotePad Usage Guide (Preview)

> For a complete guide go to Mark [README](https://github.com/PROFESSOR902/perNotePad/tree/main/main) In the file that is named main. (Still under development.)

## Basic Workflow  
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

## Collaboration  
- Share the URL → Edits appear live for all viewers  
- No login required


# PerNotePad Future Improvements  

## Sync Safety  
🔹 Conflict Detection: Warn when remote changes exist  
🔹 Version History: Rollback to previous saves  
🔹 Diff Merging: Smart combine simultaneous edits  

## UI/UX  
🔸 Dark Mode: Toggleable theme  
🔸 Keyboard Shortcuts: Ctrl+S to save, etc.  
🔸 Tab Management: Add/delete tabs  
🔸 Private chat: A chat dedicated for your URL hash.

## Features  
🔺 Rich Text: Bold/italic toolbar  
🔺 Image Upload: Drag-and-drop support  
🔺 Export Options: PDF/Markdown download  

## Security  
🔒 End-to-End Encryption: Optional password protection  
🔒 Share Controls: Read-only links  

## Social  
💬 Typing Indicators: Show when others edit  
💬 Presence Detection: List active collaborators  

## Performance  
⚡ Offline Mode: Local cache with sync later  
⚡ Debounced Saves: Auto-save after pause  

## ?Plugins? 
> I don't know if I want to add these, but they're ideas.

🧩 Extensions: Math equations, diagrams  
🧩 Custom Themes: User CSS injection  

*Example Code Snippet:*
javascript
```
// Proposed versioning system  
saveToSupabase({  
  id,  
  tabs,  
  version: Date.now() // Track edits  
})
```
