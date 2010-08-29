# URI query_params

* [github.com/postmodern/uri-query_params](http://github.com/postmodern/uri-query_params/)
* [github.com/postmodern/uri-query_params/issues](http://github.com/postmodern/uri-query_params/issues/)
* Postmodern (postmodern.mod3 at gmail.com)

## Description

Allows access to the query component of the URI as a Hash.

## Examples

Inspecting the URI query_params:

    url = URI('http://www.google.com/search?hl=en&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&hs=1HY&q=bob+ross&btnG=Search')
    url.query_params
    # => {"btnG"=>"Search", "hs"=>"1HY", "rls"=>"org.mozilla:en-US:official", "client"=>"firefox-a", "hl"=>"en", "q"=>"bob+ross"}


    url.query_params['q']
    # => "bob+ross"

Setting the URI query_params:

    url.query_params['q'] = 'Upright Citizens Brigade'
    url.to_s
    # => "http://www.google.com/search?btnG=Search&hs=1HY&rls=org.mozilla:en-US:official&client=firefox-a&hl=en&q=Upright%20Citizens%20Brigade"

## Install

    $ sudo gem install uri-query_params

## License

See {file:LICENSE.txt} for license information.

