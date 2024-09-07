module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      width: {
        '1280': '1280px', // 幅1280pxのカスタムクラス
        '960': '960px', // 幅960pxのカスタムクラス
        '600': '600px', // 幅600pxのカスタムクラス

      },
      height: {
        '720': '720px', // 高さ720pxのカスタムクラス
        '480': '480px', // 高さ480pxのカスタムクラス
        '400': '400px', // 高さ400pxのカスタムクラス
      }
    }
  },

  theme: {
    extend: {
      // ... 既存のコード ...
      colors: {
        'flash-success': '#D4EDDA', // 成功メッセージの背景色
        'flash-error': '#F8D7DA', // エラーメッセージの背景色
        'flash-success-text': '#155724', // 成功メッセージの文字色
        'flash-error-text': '#721c24', // エラーメッセージの文字色
      }
    }
  },

  plugins: [require("daisyui")],
  daisyui: {
    darkTheme: false
  },
}
