// 연금·절세 통합관리 서비스 워커 — 홈 화면 설치용 최소 구성
// 캐시하지 않음: 항상 최신 index.html을 네트워크에서 받음
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (e) => e.waitUntil(self.clients.claim()));
self.addEventListener('fetch', () => {});
