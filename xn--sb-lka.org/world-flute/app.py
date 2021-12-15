import json
from flask import Flask, redirect, request

MAX_SIZE = 11180
app = Flask(__name__)

def get_ip():
    headers_list = request.headers.getlist("X-Forwarded-For")
    return headers_list[0] if headers_list else request.remote_addr

def ip2coord(ip):
    v4 = ip.split(".")
    v4 = [int(n) for n in v4]
    x = (v4[0]*256 + v4[1]) % MAX_SIZE
    y = (v4[2]*256 + v4[3]) % MAX_SIZE
    return x, y


@app.route('/world-flute/save', methods=['POST'])
def save():
    c = request.form["color"]
    r, g, b = int(c[1:3], 16), int(c[3:5], 16), int(c[5:7], 16)
    ip = get_ip()
    if ":" in ip:
        return "Only IPv4 for now"

    x, y = ip2coord(ip)

    with open("data.json", "rt") as fp:
        data = json.load(fp)

    with open("data.json", "wt") as fp:
        json.dump([
            row for row in data if row[0] != x and row[1] != y
        ] + [[x, y, r, g, b]], fp)

    return redirect("https://xn--sb-lka.org/world-flute/")

if __name__ == '__main__':
    app.run(host='localhost', port=8331)
