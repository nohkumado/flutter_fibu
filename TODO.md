# TODO

Done items move to CHANGELOG.md.

- [ ] The chosen book file is kept only for the session: store
  `key-filename` in SharedPreferences (the preferences page writes some keys)
- [ ] Tests for the pages (plan, journal, settings) — only a smoke test now
- [ ] 180-odd analyzer infos (style, prints); `MyApp.prefs` and
  `NavDrawer.pages` not final

## Later

- [ ] Sync between devices and with collaborators (access rights per
  person): phone and desktop on the same books, archive and letterheads —
  a Nextcloud/WebDAV share, the own gitea, or a small server; www/fibu
  (archived) started this. The versioned files (book format, archive
  format) are the base for merging.

## Books & devices — try on real devices

- [x] Sync on real devices (Pixel 8 Android 17, tablet Android 11) — the
  integration test, see CHANGELOG
- [ ] The tablet hangs sometimes (2 of 4 device-test runs: "did not
  complete" after 9 min, no step reached the hub in one of them): log each
  step with its time in the test, find where (Keystore? connection?
  isolate?); after a hang the cleanup may not have run — check the tablet:
  key "nohfibu-key-devicetest", pref "ledger-book"
- [ ] By hand: pairing by camera on the phone, the desktop app as hub, a
  backup into Nextcloud and its restore on another device
- [ ] Native PBKDF2 (cryptography_flutter) once it supports AGP 9's
  built-in Kotlin — 16 s backups on older tablets
- [ ] "Keep the key in the password manager": does Bitwarden offer to save
  it (Android autofill), and fill it back in "enter the key"?
- [x] Android 17: sync over Wi-Fi worked with the declared permissions, no
  run-time prompt (Pixel 8)
- [ ] Device name and invoice series editable in the app (today: the host
  name, the series from it)
- [ ] Resolve a conflict in the app (take the replaced version back)

