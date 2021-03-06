const ExtractTextPlugin = require('extract-text-webpack-plugin');
const isProd = process.env.NODE_ENV === 'production';

module.exports = function(includeCompiler) {
  return [
    js(includeCompiler),
    jsx(includeCompiler),
    css(includeCompiler),
    less(includeCompiler),
    sass(includeCompiler)
  ];
};

function postCssLoader() {
  return {
    loader: 'postcss-loader',
    options: {
      sourceMap: !isProd
    }
  }
}

function cssLoader() {
  return {
    loader: 'css-loader',
    options: {
      minimize: true,
      sourceMap: !isProd
    }
  }
}

function styleLoader() {
  return {
    loader: 'style-loader',
    options: {
      sourceMap: !isProd
    }
  }
}

function lessLoader() {
  return {
    loader: 'less-loader',
    options: {
      sourceMap: !isProd
    }
  }
}

function sassLoader() {
  return {
    loader: 'sass-loader',
    options: {
      sourceMap: !isProd
    }
  }
}

function cssBlock() {
  return isProd
    ? ExtractTextPlugin.extract({
      use: [cssLoader(), postCssLoader()],
      fallback: styleLoader()
    })
    : [styleLoader(), cssLoader(), postCssLoader()]
}

function lessBlock() {
  return isProd
    ? ExtractTextPlugin.extract({
      use: [cssLoader(), postCssLoader(), lessLoader()],
      fallback: styleLoader()
    })
    : [styleLoader(), cssLoader(), postCssLoader(), lessLoader()]
}

function sassBlock() {
  return isProd
    ? ExtractTextPlugin.extract({
      use: [cssLoader(), postCssLoader(), sassLoader()],
      fallback: styleLoader()
    })
    : [styleLoader(), cssLoader(), postCssLoader(), sassLoader()]
}

function js(includeCompiler) {
  return {
    test: /\.js$/,
    loader: 'babel-loader',
    include: includeCompiler
  }
}

function jsx(includeCompiler) {
  return {
    test: /\.jsx$/,
    loader: 'babel-loader',
    include: includeCompiler
  }
}

function css(includeCompiler) {
  return {
    test: /\.css$/,
    include: includeCompiler,
    use: cssBlock()
  }
}

function less(includeCompiler) {
  return {
    test: /\.less$/,
    include: includeCompiler,
    use: lessBlock()
  }
}

function sass(includeCompiler) {
  return {
    test: /\.scss$/,
    include: includeCompiler,
    use: sassBlock()
  }
}