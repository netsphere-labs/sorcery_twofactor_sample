# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true

# $ bin/importmap pin bootstrap
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.2/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js"
