'use strict';

describe('The main view', function () {
  var page;

  beforeEach(function () {
    browser.get('http://localhost:3000/index.html');
    page = require('./home.po');
  });

  it('list more than 5 awesome things', function () {
    expect(page.mainMenuItems.count()).toEqual(5);
  });

});
