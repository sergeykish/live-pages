require 'ffi-xattr'
require 'webrick'

run Proc.new {|env|
  method = env['REQUEST_METHOD']
  path = '.' + env['PATH_INFO']
  path = 'index.html' if path == './'

  case method
  when 'PUT'
    content = env['rack.input'].read
    content_type = env['CONTENT_TYPE']
    File.write(path, content)
    Xattr::Lib.set(path, false, 'user.mime_type', content_type)
    [204, {}, []]
  when 'GET'
    File.file?(path) || path = 'not-found'
    content = File.read(path)
    content_type = Xattr::Lib.get(path, false, 'user.mime_type')
    content_type ||= 'text/html'
    content_type = "#{content_type};charset=utf-8" if content_type == "text/html"
    [200, {"Content-Type" => content_type}, [content]]
  end
}
