from flask import Flask, json, jsonify
import os

app = Flask(__name__)

def readjson():
    SITE_ROOT = os.path.realpath(os.path.dirname(__file__))
    json_url = os.path.join(SITE_ROOT, "", "StockList.json")
    dataOfFile = json.load(open(json_url))
    return dataOfFile

@app.route('/',methods=['GET'])
def demo():
    return 'Bad Request Try Again ...'

@app.route('/all-ohlc/',methods=['GET'])
def ohlc():
    dataOfFile = readjson()
    requiredData = []
    for data in dataOfFile:
        d = {}
        d['key'] = data['key']
        d['date'] = data['date']
        d['open'] = data['open']
        d['high'] = data['high']
        d['low'] = data['low']
        d['close'] = data['close']
        d['volume'] = data['volume']
        requiredData.append(d)
    return jsonify(requiredData)


@app.route('/ohlc/<string:company_key>',methods=['GET'])
def specificohlc(company_key):
    dataOfFile = readjson()
    requiredData = []
    for data in dataOfFile:
        d = {}
        d['key'] = data['key']
        d['date'] = data['date']
        d['open'] = data['open']
        d['high'] = data['high']
        d['low'] = data['low']
        d['close'] = data['close']
        d['volume'] = data['volume']
        if(d['key'] == company_key):
            requiredData.append(d)
    return jsonify(requiredData)

@app.route('/ohlc-latest/',methods=['GET'])
def ohlclatest():
    dataOfFile = readjson()
    requiredData = []
    latest_date = '0000-00-00'
    for data in dataOfFile:
        if(data['date']>latest_date):
            latest_date = data['date']
    for data in dataOfFile:
        if(data['date'] != latest_date):
            continue
        d = {}
        d['key'] = data['key']
        d['date'] = data['date']
        d['open'] = data['open']
        d['high'] = data['high']
        d['low'] = data['low']
        d['close'] = data['close']
        d['volume'] = data['volume']
        requiredData.append(d)
    return jsonify(requiredData)

@app.route('/ohlc-datewise/<string:s>',methods=['GET'])
# s = in format startdate-to-enddate-keyofcompany yyyy-mm-dd-to-yyyy-mm-dd-key
def specificohlcdatewise(s):
    dataOfFile = readjson()
    start_date = s[0:10]
    end_date = s[14:24]
    company_key = s[25:]
    requiredData = []
    for data in dataOfFile:
        d = {}
        d['key'] = data['key']
        d['date'] = data['date']
        d['open'] = data['open']
        d['high'] = data['high']
        d['low'] = data['low']
        d['close'] = data['close']
        d['volume'] = data['volume']
        if(d['key'] == company_key and d['date'] >= start_date and d['date'] <= end_date):
            requiredData.append(d)
    return jsonify(requiredData)


# main driver function
if __name__ == '__main__':
    app.run(debug=True)
