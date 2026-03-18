
exports.activate = () => {
  console.log('language-proto-redux activated!');
};

exports.consumeHyperlinkInjection = (hyperlink) => {
  hyperlink.addInjectionPoint('source.proto', {
    types: ['comment', 'string']
  });
};

exports.consumeTodoInjection = (todo) => {
  todo.addInjectionPoint('source.proto', {
    types: ['comment']
  });
};
