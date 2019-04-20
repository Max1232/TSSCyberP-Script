//Ubuntu secure user.js
//check if firefox is default browser
user_pref("browser.shell.checkDefaultBrowser", true);
//update search engines
user_pref("browser.search.update", true);
//send websites a do not track signal always
user_pref("privacy.donottrackheader.enabled", true);
//never remember history
user_pref("browser.privatebrowsing.autostart", true);
user_pref("browser.privacy.trackingprotection.menu", "always");
//disable popups
user_pref("dom.disable_open_during_load", true);
//warn when sites try to install addons
user_pref("xpinstall.whitelist.required", true);
//Block dangerous and deceptive content
user_pref("browser.safebrowsing.phishing.enabled", true);
user_pref("browser.safebrowsing.malware.enabled", true);
//Block dangerous downloads
user_pref("browser.safebrowsing.downloads.enabled", true);
//Warn you about unwanted and uncommon software
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", true);
//certificates
user_pref("security.default_personal_cert", "Ask Every Time");
user_pref("security.OCSP.enabled", 1);
//tracking protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
//block 3rd party cookies
user_pref("network.cookie.cookieBehavior", 4);
user_pref("network.cookie.lifetimePolicy", 2);
//always ask you where to save files
user_pref("browser.download.useDownloadDir", false);
//auto updates
user_pref("app.update.auto", true);
// Enable insecure password warnings
user_pref("security.insecure_password.ui.enabled", true);
//disable passwords
user_pref("browser.safebrowsing.passwords.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("signon.autofillForms", false);
user_pref("signon.autofillForms.http", false);
//clear stuff on shutdown
user_pref("signon.rememberSignons", false);
user_pref("privacy.sanitize.sanitizeOnShutdown", true); // Always clear my private data when I close Firefox
user_pref("privacy.sanitize.timeSpan", 0); // 0 = Clear everything
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.passwords", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.passwords", true);
//do not send firefox data
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("privacy.sanitize.sanitizeOnShutdown", false);
user_pref("extensions.formautofill.addresses.enabled", false);