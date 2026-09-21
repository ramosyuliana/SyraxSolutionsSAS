---
name: Geometric Precision System
colors:
  surface: '#f7f9fb'
  surface-dim: '#d8dadc'
  surface-bright: '#f7f9fb'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f4f6'
  surface-container: '#eceef0'
  surface-container-high: '#e6e8ea'
  surface-container-highest: '#e0e3e5'
  on-surface: '#191c1e'
  on-surface-variant: '#3e4850'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eff1f3'
  outline: '#6e7881'
  outline-variant: '#bec8d2'
  surface-tint: '#006591'
  primary: '#006591'
  on-primary: '#ffffff'
  primary-container: '#0ea5e9'
  on-primary-container: '#003751'
  inverse-primary: '#89ceff'
  secondary: '#006877'
  on-secondary: '#ffffff'
  secondary-container: '#3fe1fd'
  on-secondary-container: '#00616f'
  tertiary: '#545f73'
  on-tertiary: '#ffffff'
  tertiary-container: '#919cb2'
  on-tertiary-container: '#293446'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#c9e6ff'
  primary-fixed-dim: '#89ceff'
  on-primary-fixed: '#001e2f'
  on-primary-fixed-variant: '#004c6e'
  secondary-fixed: '#a2eeff'
  secondary-fixed-dim: '#2fd9f4'
  on-secondary-fixed: '#001f25'
  on-secondary-fixed-variant: '#004e5a'
  tertiary-fixed: '#d8e3fb'
  tertiary-fixed-dim: '#bcc7de'
  on-tertiary-fixed: '#111c2d'
  on-tertiary-fixed-variant: '#3c475a'
  background: '#f7f9fb'
  on-background: '#191c1e'
  surface-variant: '#e0e3e5'
typography:
  display-lg:
    fontFamily: Sora
    fontSize: 48px
    fontWeight: '700'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Sora
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Sora
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Hanken Grotesk
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
    letterSpacing: 0.01em
  body-md:
    fontFamily: Hanken Grotesk
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-md:
    fontFamily: Hanken Grotesk
    fontSize: 14px
    fontWeight: '600'
    lineHeight: '1.4'
    letterSpacing: 0.05em
  caption:
    fontFamily: Hanken Grotesk
    fontSize: 12px
    fontWeight: '500'
    lineHeight: '1.4'
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 64px
  gutter: 24px
  margin: 32px
  max-width: 1280px
---

## Brand & Style

This design system is engineered for a premium IT services and SaaS environment, prioritizing clarity, technological sophistication, and structural integrity. Drawing inspiration from the geometric S-shaped logo, the visual language balances sharp technological precision with an approachable, airy aesthetic.

The style leans into **Experimental Corporate Modernism**. It utilizes expansive white space (breathing room) to denote high-end service quality while employing futuristic typographic treatments to signal innovation. The interface should feel light and hyper-organized, evoking a sense of calm reliability and advanced technical capability. Key characteristics include high-radius corners for a "soft-tech" feel, rhythmic spacing, and a focus on content legibility above all else.

## Colors

The palette is rooted in a spectrum of technical blues and clean neutrals. The **Primary Sky Blue** serves as the main action color, providing a vibrant, high-energy point of interaction. This is supported by a **Soft Cyan** for secondary accents and illustrative elements.

The background architecture uses a very light Slate (#F8FAFC) to define the canvas, while foreground surfaces (cards, modals) use pure white to create "islands" of information. Text hierarchy is managed through a scale of deep slates and cool grays, ensuring high contrast without the harshness of pure black. Status indicators follow a "soft-wash" logic: desaturated background fills with high-saturation text for immediate but non-jarring recognition.

## Typography

The typography system creates a "techno-humanist" balance. **Sora** is utilized for headlines; its geometric construction and unique ink traps mirror the precision of the brand's logo. It should be typeset with slightly tighter tracking in large formats to emphasize its architectural structure.

**Hanken Grotesk** is the workhorse for body text and interface labels. Chosen for its exceptional legibility and sharp, contemporary finish, it provides a clean reading experience in data-heavy environments. To maintain the "premium" feel, body copy utilizes a generous line height (1.6) and subtle tracking increases to prevent visual crowding. All labels and functional text should prioritize clarity, using medium to semi-bold weights for interactive elements.

## Layout & Spacing

The design system follows a 4px baseline grid to ensure mathematical consistency across all components. 

### Grid Philosophy
The system employs a **12-column fluid grid** for desktop, transitioning to a 6-column grid for tablets and a 2-column/stacked grid for mobile. 
- **Desktop (1280px+):** 24px gutters with 32px side margins.
- **Tablet (768px - 1024px):** 16px gutters with 24px side margins.
- **Mobile (Below 768px):** 16px gutters with 16px side margins.

Horizontal and vertical rhythm should be driven by the defined spacing tokens. Large-scale sections should use `xxl` (64px) padding to maintain the "airy" brand promise, while internal card padding should default to `lg` (24px).

## Elevation & Depth

This design system uses a **Tonal Layering** and **Ambient Shadow** approach to create a sense of organized depth. 

1.  **Level 0 (Base):** The #F8FAFC background.
2.  **Level 1 (Cards/Surfaces):** Pure white surfaces with a "Natural Glow" shadow. These shadows are extra-diffused, using a primary-tinted neutral color (e.g., `hsla(210, 20%, 30%, 0.05)`) with a high blur radius (20px-40px) and zero spread.
3.  **Level 2 (Modals/Popovers):** Higher elevation with a more pronounced, darker shadow to indicate focus and separation from the main UI.

Borders are used sparingly. When necessary, use a 1px solid border in a very soft gray (#E2E8F0) to define edges on white backgrounds where shadows might be too subtle.

## Shapes

In alignment with the "Experimental" visual identity, the system utilizes high-radius corners to soften the geometric nature of the branding. 

- **Standard Components:** (Buttons, Inputs, Small Cards) use a `rounded-lg` (2rem) setting.
- **Large Containers:** (Main dashboards, Large sections) use `rounded-xl` (3rem).
- **Interactive Pill Elements:** (Tags, Badges, Search Bars) use the full pill-shape (9999px or 3rem).

This high roundedness creates a friendly, futuristic "liquid" feel that differentiates the brand from more rigid, traditional corporate competitors.

## Components

### Buttons
- **Primary:** Sky blue background, white text. Pill-shaped. Heavy horizontal padding (32px).
- **Secondary:** Transparent background with a 2px primary blue border or a soft cyan tint.
- **Ghost:** No background, slate text, becomes primary blue on hover with a soft background wash.

### Input Fields
Inputs should feature a subtle light gray background (#F1F5F9) to distinguish them from the white card surfaces. Upon focus, the border transitions to Primary Blue with a 4px soft outer glow.

### Cards
Cards are the primary container for information. They must be pure white, use `rounded-xl` corners, and feature the standard Ambient Shadow. No borders should be used on cards unless they are interactive or selectable.

### Chips & Badges
- **Status Badges:** Use the desaturated background + saturated text logic. Emerald for success/active, Amber for pending, Slate for inactive.
- **Filter Chips:** Pill-shaped, light gray background, becomes primary blue when selected.

### Lists
Lists should utilize generous vertical padding (`md` or 16px) between items. Use subtle dividers (#F1F5F9) and include a chevron-right icon for navigable list items to reinforce directionality.