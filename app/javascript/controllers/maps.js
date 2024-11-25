let currentMap = null;
let markers = [];

export function initializeMaps() {
  console.log('Maps initialization started');
  if (document.getElementById('map')) {
    initializeCurrentLocationMap();
    // 現在地取得ボタンのイベントリスナー追加は不要（自動で確認ダイアログを表示）
    requestLocationPermission();
    fetchNearbyShops(); // 全店舗データの取得と表示
  }
}

function checkLocationPermission() {
  if (!navigator.geolocation) {
    initializeMapWithDefault();
    return;
  }

  // 位置情報の許可状態をチェック
  navigator.permissions.query({ name: 'geolocation' }).then(function(permissionStatus) {
    if (permissionStatus.state === 'granted') {
      // 既に許可されている場合は直接地図を初期化
      getCurrentLocation();
    } else if (permissionStatus.state === 'prompt') {
      // 許可を求める必要がある場合
      showPermissionDialog();
    } else {
      // 拒否されている場合はデフォルトの地図を表示
      initializeMapWithDefault();
    }
  });
}

function initializeCurrentLocationMap() {
  const mapElement = document.getElementById('map');
  if (!mapElement) return;

  navigator.geolocation.getCurrentPosition(function (position){
    // LatLngに位置座標を代入
    let LatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

  currentMap = new google.maps.Map(mapElement, {
    zoom: 15,
    center: { lat: 35.6812, lng: 139.7671 }, // デフォルト: 東京
    styles: [
      {
        featureType: "poi",
        elementType: "labels",
        stylers: [{ visibility: "off" }]
      }
    ]
  });
  });
}

function requestLocationPermission() {
  if (!navigator.geolocation) {
    alert('お使いのブラウザでは位置情報を取得できません。');
    return;
  }

  navigator.geolocation.getCurrentPosition(
    (position) => {
      const pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      // 現在地にマーカーを設置
      const currentLocationMarker = new google.maps.Marker({
        position: pos,
        map: currentMap,
        icon: {
          url: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
        },
        title: '現在地'
      });
      markers.push(currentLocationMarker);

      // 地図の中心を現在地に移動
      if (currentMap) {
        currentMap.setCenter(pos);
      }

      // 周辺の店舗を取得して表示
      fetchNearbyShops(pos);
    },
    (error) => {
      handleLocationError(error);
    }
  );
}

function fetchNearbyShops() {
  fetch(`/api/shops`)
    .then(response => response.json())
    .then(data => {
      console.log(data); // データが正しく取得できているか確認
      displayShops(data.shops);
    })
    .catch(error => {
      console.error('店舗データの取得に失敗しました:', error);
    });
}

function displayShops(shops) {
  clearShopMarkers(); // 既存のマーカーをクリア

  shops.forEach(shop => {
    const marker = new google.maps.Marker({
      position: { lat: shop.latitude, lng: shop.longitude }, // 緯度経度の設定
      map: currentMap,
      title: shop.title, // 店舗名
      icon: {
        url: 'http://maps.google.com/mapfiles/ms/icons/red-dot.png'
      }
    });

    const infoWindow = new google.maps.InfoWindow({
      content: `
        <div class="p-3">
          <h3 class="font-bold text-lg">${shop.title}</h3>
          <a href="/shops/${shop.id}" class="text-blue-600 hover:text-blue-800">詳細を見る</a>
        </div>
      `
    });

    marker.addListener('click', () => {
      infoWindow.open(currentMap, marker);
    });

    markers.push(marker);
  });
}

function clearShopMarkers() {
  markers.forEach(marker => marker.setMap(null));
  markers = [];
}

function handleLocationError(error) {
  let message;
  switch(error.code) {
    case error.PERMISSION_DENIED:
      message = "位置情報の利用が許可されていません。";
      break;
    case error.POSITION_UNAVAILABLE:
      message = "位置情報を取得できませんでした。";
      break;
    case error.TIMEOUT:
      message = "位置情報の取得がタイムアウトしました。";
      break;
    default:
      message = "予期せぬエラーが発生しました。";
  }
  alert(message);
}

// DOMContentLoaded イベントで初期化
document.addEventListener('turbolinks:load', function() {
  if (typeof google !== 'undefined' && document.getElementById('map')) {
    initializeMaps();
  }
});

document.addEventListener('DOMContentLoaded', function() {
  const searchForm = document.querySelector('.search-form');
  if (searchForm) {
    searchForm.addEventListener('submit', function(event) {
      event.preventDefault();
      const formData = new FormData(searchForm);
      const searchParams = new URLSearchParams(formData).toString();
      fetch(`/api/shops/search?${searchParams}`)
        .then(response => response.json())
        .then(data => {
          clearShopMarkers();
          displayShops(data.shops);
        })
        .catch(error => console.error('検索エラー:', error));
    });
  }
});