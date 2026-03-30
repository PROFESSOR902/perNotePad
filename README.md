# perNotPad

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
