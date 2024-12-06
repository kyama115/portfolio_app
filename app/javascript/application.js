import "@hotwired/turbo-rails"
import "./controllers/autocomplete_controller"
import "./controllers/hello_controller"
import "./controllers/index"
import "./controllers/maps"

// グローバルスコープに公開
window.initializeMaps = initializeMaps;

// // Google Maps APIのコールバック関数
// window.initMap = function() {
//   const mapElement = document.getElementById('map');
//   if (!mapElement) {
//     console.error('Map element not found');
//     return;
//   }

//   const defaultLocation = { lat: 35.6803997, lng: 139.7690174 };
//   const mapOptions = {
//     center: defaultLocation,
//     zoom: 12,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };

//   const map = new google.maps.Map(mapElement, mapOptions);

//   // 現在地取得
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(
//       (position) => {
//         const pos = {
//           lat: position.coords.latitude,
//           lng: position.coords.longitude
//         };

//         map.setCenter(pos);

//         // 現在地マーカー
//         new google.maps.marker.AdvancedMarkerElement({
//           map,
//           position: pos,
//           title: '現在地'
//         });

//         fetchShops(pos);
//       },
//       () => {
//         fetchShops(defaultLocation);
//       }
//     );
//   } else {
//     fetchShops(defaultLocation);
//   }

//   function fetchShops(coordinates) {
//     const params = new URLSearchParams({
//       lat: coordinates.lat,
//       lng: coordinates.lng,
//       format: 'json'
//     });

//     fetch(`/shops?${params}`, {
//       headers: {
//         'Accept': 'application/json',
//         'X-Requested-With': 'XMLHttpRequest'
//       }
//     })
//     .then(response => {
//       if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
//       return response.json();
//     })
//     .then(shops => {
//       shops.forEach(shop => {
//         const marker = new google.maps.marker.AdvancedMarkerElement({
//           map,
//           position: { lat: shop.latitude, lng: shop.longitude },
//           title: shop.name
//         });

//         marker.addListener('click', () => {
//           showShopDetails(shop);
//         });
//       });
//     })
//     .catch(error => {
//       console.error('Error fetching shops:', error);
//       document.querySelector('[data-maps-target="shopList"]').innerHTML = 
//         '<p class="text-red-500">店舗データの取得に失敗しました。</p>';
//     });
//   }

//   function showShopDetails(shop) {
//     const modal = document.getElementById('spot_modal');
//     const content = document.querySelector('.spot_show');
    
//     // モーダルの内容を設定
//     content.innerHTML = `
//       <h3 class="font-bold">${shop.name}</h3>
//       <p>${shop.address || ''}</p>
//       <!-- 他の店舗情報 -->
//     `;
    
//     modal.showModal();
//   }
// };