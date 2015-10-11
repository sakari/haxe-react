module.exports = function(pkg) {
  pkgs = {
    react: require('react'),
    "react-dom": require('react-dom')
  }
  module = pkgs[pkg]
  if(module)
    return module
  else
    throw new Error("unknown package " + pkg)
}
