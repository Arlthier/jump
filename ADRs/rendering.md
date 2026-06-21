# Rendering

Internal rendering size: `320x180`
Target size: `1920x1080`

Snaping:
 * rendering spaping: `enabled`

## Sprites
 * Default sprite size: 16x16 pixels.
 * Store sprites at their native resolution.
 * Do not commit pre-upscaled sprite assets (e.g. 32x32, 64x64 versions of a 16x16 sprite).
 * Scaling is handled by the engine at runtime.

### Rationale
> Maintaining a single source resolution prevents duplicate assets, reduces repository size, and ensures consistent rendering across the project.

