//to register Service Worker
if ("serviceWorker" in navigator) {
  window.addEventListener("load", (e) => {
    navigator.serviceWorker
      .register("sw.js")
      .then((reg) => console.log("Service Worker installed successfully!!"))
      .catch((err) =>
        console.log(`Service Worker not registered, error ${err}`)
      );
  });
}
