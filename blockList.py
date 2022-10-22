import IPy
import requests
from urllib import parse
requests.urllib3.disable_warnings()

blockList = """# 禁止政治
regexp:(.*.||)(gov|12377|12315|talk.news.pts.org|cread­ers|zhuich­aguoji|efcc.org|cy­ber­po­lice|abolu­owang|tu­idang|epochtimes|dafa­hao|falundafa|minghui|falu­naz|zhengjian|110.qq|mingjingnews|in­medi­ahk|xin­sheng|banned­book|nt­dtv|falun­gong|12321|se­cretchina|epochweekly|cn.rfi).(cn|com|org|net|club|net|fr|tw|hk)
regexp:(.*\.||)(metatrader4|metatrader5|mql5)\.(org|com|net)

# 禁止BT
"""

trackers = set()
trackerlists = [
    "https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt",
    "https://cdn.staticaly.com/gh/XIU2/TrackersListCollection/master/all.txt"
]

def is_ip(address):
    try:
        IPy.IP(address)
        return True
    except:
        return False

def fnGetTrackerHost(ctx):
    global trackers
    for item in ctx.strip().split("\n"):
        item = item.strip()
        if len(item)>0:
            host = parse.urlparse(item).hostname
            if is_ip(host):
                trackers.add("ip:"+host)
            else:
                trackers.add("domain:"+host)


for trackerlist in trackerlists:
    try:
        req = requests.get(trackerlist, timeout=(5,10), verify=False)
        req.encoding = req.apparent_encoding
        fnGetTrackerHost(req.text)
    except Exception as err:
        print("Error:", err)
        continue

result = list(trackers)
result.sort()
blockList += "\n".join(result)

with open("blockList", "w+", encoding="utf-8") as fp:
    fp.write(blockList+"\n")

