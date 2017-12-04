const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const webpackLoaders = require('./webpack.loaders');
const SourceCompile = require('./webpack.source.compile');
const htmlFile = path.resolve(__dirname, '..', 'src', 'index.html');
const htmlName = htmlFile.split('/').slice(-1)[0];
const cwd = path.resolve(__dirname, '..');
const webpackIncludeCallback = SourceCompile(cwd, {
  dirs: [/^src/i],
  modules: [/^miox\-/i, /webpack\-dev\-server/i]
});

module.exports = {
  entry: {
    app: path.resolve(__dirname, '..', 'src', 'index.js')
  },
  output: {
    path: path.resolve(__dirname, '..', 'build'),
    filename: '[name].[hash:10].js'
  },
  module: {
    rules: webpackLoaders(webpackIncludeCallback)
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV || 'development')
    }),
    new HtmlWebpackPlugin({
      template: htmlFile,
      filename: htmlName,
      inject: true
    }),
    new ExtractTextPlugin('web.[hash:10].css')
  ]
};