'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"assets/assets/github_icon.svg": "998f698bcaeab42caffaaf107ec9137e",
"assets/assets/projects/orazo.png": "f3fb5aeb81350904362722e87799e30d",
"assets/assets/projects/Tradyex.png": "a24d1c7e541ff0cf195d63d9056a7bd0",
"assets/assets/projects/savita.svg": "0295560dc198ff05f49af9e4cef38348",
"assets/assets/projects/bitmet.svg": "65412125316643a54b2029c62e5d54da",
"assets/assets/projects/portfolio.png": "390422fcff823ee9e605b98c5611baa6",
"assets/assets/projects/starrbox.png": "aad697c48a31d9f72a4c7d26652320b7",
"assets/assets/skills/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/skills/android_studio.svg": "f45824a5ae74092cba63532b26c45518",
"assets/assets/skills/figma.svg": "3b0fb69f67df8e1c5665644cc8f7a983",
"assets/assets/skills/android.svg": "5f4709b74bb37a3dd3857743691ed8d2",
"assets/assets/skills/jetpackcompose.svg": "ad7e5dea775eb333e3b4522a436991a6",
"assets/assets/skills/sql.svg": "8b22fe7d840ee6daf9b4bfaa5e0f107d",
"assets/assets/skills/postman.svg": "fbfb57a181ce251926d686d12e6cee5a",
"assets/assets/skills/kotlin.svg": "94e0a77ea6158d72c09683facdc057f5",
"assets/assets/skills/firebase.svg": "7f1bf2795e067daf4ac3b42a2a140496",
"assets/assets/skills/flutter.svg": "5c3a6308a335872a831a9f836f0e236c",
"assets/assets/profile.jpg": "c71c7b3cf5324bc0788c5f0a17e300ed",
"assets/assets/linkedin_icon.svg": "e69feb711f7ea709b33850af1f920265",
"assets/assets/certificates/bloc.jpg": "58ba1bcf7378552f613a549f1ea191e7",
"assets/assets/certificates/kotlin.jpg": "5e87e2c5c07c92eec31df66d51ce6d0a",
"assets/assets/me.png": "a2ee6e52fe646d551cb53f6014135146",
"assets/assets/mine.JPG": "3d4f0e61c684ec3d13a8091dac2d562f",
"assets/assets/service/ui_ux_development.png": "a259adebfef081e44f36ba9444de2bd2",
"assets/assets/service/web_development.png": "b915a94df5fab6445d33b127f9a38433",
"assets/assets/service/mobile_app.png": "ce744ac97e350bc7b3c4286b7fdf8a21",
"assets/fonts/MaterialIcons-Regular.otf": "4453c4d2ebc77884f8a87612652c25bb",
"assets/AssetManifest.bin.json": "cd42a0964e4c8dfb62b2397aa81db10f",
"assets/NOTICES": "e3fa5abe2be7c2bd9ac415a292847078",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/AssetManifest.bin": "6eebe70f9d1c537d6452c90643c77ae9",
"assets/AssetManifest.json": "5f8c522d92622cd6e598fedef56d846f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"main.dart.js": "44afddcc9d088bcc157f94470eac56ec",
"index.html": "80b7f3c2a7bb29c643595523dbc0fc2e",
"/": "80b7f3c2a7bb29c643595523dbc0fc2e",
"_redirects%20": "5f52dbefcf63c9f677ace09fcf8bc7d8",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter_bootstrap.js": "3ab483c4019f40f1f7635fd05fd609d3",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
