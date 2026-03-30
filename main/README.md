# perNotPad

# perNotePad Documentation.

## Core Features
1. Multi-Tab Note Editor
   - Dynamic tab system with persistent content
   - Default tabs ("Notes", "To-Do") with Markdown-ready textareas
   - Tab switching via button controls

2. Supabase Cloud Sync
   - Real-time database integration
   - Auto-generated 6-character note IDs
   - Full CRUD operations:
     - createNewNote() - Generates ID + updates URL
     - saveToSupabase() - Upsert functionality
     - loadFromSupabase() - Retrieves by ID
   - Live subscription to updates via Postgres changes

3. Responsive UI Components
   - Custom scrollbar styling (dark theme)
   - Resizable textareas with monospace font
   - Active/inactive tab visual indicators

## Sidebar System
- Toggleable Menu (☰ button controlled)
- Chat Room Integration:
  - Three pre-configured channels:
    - Public Lobby
    - Suggestions
    - Random
  - Floating chat windows (draggable)
  - Comments plugin injection

## Technical Highlights
- Supabase Configuration:
           
javascript
  const supabaseClient = createClient(SUPABASE_URL, SUPABASE_KEY);

- State Management:
  - URL params for note persistence (?id=abc123)
  - DOM-based tab storage (no external state library)

## Styling Features
- Custom scrollbars (ghostwhite/royalblue)
- Fixed header with powderblue background
- Mobile-responsive viewport meta tag
- Tab system with active/inactive states

## Plugin Integration Points
1. Comments/Chat Plugin:
   - Dynamically loaded into floating window
   - Channel parameterization
2. Extensible Architecture:
   - Tab system designed for additional content types
   - Sidebar ready for new menu items

## Special Functions
- subscribeToChanges() - Listens for remote updates
- toggleDropdown() - Expandable sidebar sections
- Drag-handle ready chat window (UI prepared but JS not implemented)

              
