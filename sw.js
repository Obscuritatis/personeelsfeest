// Bewaart de app op het toestel zodat ze ook zonder internet opent.
const CACHE = 'personeelsfeest-v6';
const FILES = [
  './', 'index.html', 'manifest.webmanifest', 'icon.svg', 'icon-180.png', 'icon-192.png', 'icon-512.png',
  'fonts/Barlow-Regular.ttf', 'fonts/Barlow-Medium.ttf', 'fonts/BarlowCondensed-SemiBold.ttf', 'fonts/BarlowCondensed-Bold.ttf'
];
self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(FILES)).then(() => self.skipWaiting()));
});
self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))).then(() => self.clients.claim()));
});
// Eerst het netwerk (zodat aanpassingen meteen doorkomen), anders de bewaarde versie.
self.addEventListener('fetch', e => {
  if (e.request.method !== 'GET') return;
  e.respondWith(
    fetch(e.request).then(res => {
      const copy = res.clone();
      caches.open(CACHE).then(c => c.put(e.request, copy)).catch(() => {});
      return res;
    }).catch(() => caches.match(e.request, { ignoreSearch: true }).then(r => r || caches.match('index.html')))
  );
});
