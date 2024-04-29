//installed logic
cacheName = "v1";

cacheAssets = [
  "about.html",
  "index.html",
  "contact.html",
  "images/logo192.png",
  "images/logo512.png",
];

self.addEventListener("install", (e) => {
  console.log("Installed");
  e.waitUntil(
    caches
      .open(cacheName)
      .then((cache) => cache.addAll(cacheAssets))
      .catch((err) => console.log(`Error Occured : ${err}`))
  );
  e.skipWaiting();
});

self.addEventListener("activate", (e) => {
  console.log("Activated");
});

//fetch event --> so that jab offline rahe hum toh bhi cache mein cheezein stored rahe

self.addEventListener("fetch", (e) => {
  // Skip caching if the request is coming from a Chrome extension
  if (e.request.url.startsWith("chrome-extension://")) {
    return;
  }
  e.respondWith(
    fetch(e.request)
      .then((res) => {
        //create copy of response
        const resClone = res.clone();
        //open cache
        caches.open(cacheName).then((cache) => cache.put(e.request, resClone));
        return res;
      })
      .catch((err) => caches.match(e.request).then((res) => res))
  );
});

// Handle push notifications
self.addEventListener('push', (event) => {
  const options = {
    body: 'This is a push notification',
    icon: '/path/to/icon.png',
  };

  event.waitUntil(
    self.registration.showNotification('Push Notification', options)
  );
});
