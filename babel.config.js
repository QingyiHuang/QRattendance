module.exports = {
    plugins: [
      [
        'component',
        {
          libraryName: 'hui',
          libDir: 'packages',
          styleLibrary: {
            name: 'theme',
            path: '[module].scss'
          }
        }
      ]
    ]
  };