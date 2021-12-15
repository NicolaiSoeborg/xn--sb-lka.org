import httpx
from flask import Flask, request

app = Flask(__name__)

FAKE_HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:94.0) Gecko/20100101 Firefox/94.0',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'DNT': '1',
    'Upgrade-Insecure-Requests': '1',
    'Sec-Fetch-Dest': 'document',
    'Sec-Fetch-Mode': 'navigate',
    'Sec-Fetch-Site': 'cross-site',
    'Pragma': 'no-cache',
    'Cache-Control': 'no-cache',
    'TE': 'trailers',
}

TO_REPLACE = {
    b'://medium.com': b'://medium.xn--sb-lka.org',
    b'cdn-client.medium.com': b'127.0.0.1',
    # Remove weird big log in top:
    b'</body>': b'<script>setTimeout(function(){ document.getElementsByTagName("svg")[0].remove() }, 1);</script></body>',
}

@app.after_request
def add_header(response):
    # Block medium crap
    # img-src *;
    # cdn-client.medium.com <-- this hijacks right click
    # "cdn.optimizely.com"
    response.headers['Content-Security-Policy'] = ';'.join([
        "default-src 'self' 'unsafe-inline' *",
        #"img-src *",
        "script-src 'self' 'unsafe-inline' miro.medium.com",
    ])
    return response

#@app.route('/', defaults={'path': ''})
@app.route('/<path:path>', methods=['GET', 'POST'])
def proxy(path):
    print(request.host)
    if request.method == 'POST':
        return 'Sorry, no tracking here!', 404

    r = httpx.get(f'https://medium.com/{path}', headers=FAKE_HEADERS)
    print(r)
    body = r.content
    for k, v in TO_REPLACE.items():
        body = body.replace(k, v)
    return body

if __name__ == '__main__':
    app.run(host='localhost', port=6666)
