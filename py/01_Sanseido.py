#Webサイトからhtmlを取得
from urllib import request
from bs4 import BeautifulSoup as bs
url = "https://www.sanseido.biz/main/words/hyakka/sonkei/"
response = request.urlopen(url)
html = bs(response)
response.close()

#二元配列にする
words = html.find('tr')[1:]
n_words = len(words)
words_table = [i.find_all('td') for i in words]

#htmlタグを消す
wordstable = [[None for i in range(4)] for j in range(n_words)]
def droptag(s):
    s_dropped = s.replace("<br/>\r\n                  ", " ").replace("▼", "")
    return s_dropped

for i in range(n_words):
    for j in range(4):
        current = str(words_table[i][j])[17:-5]
        wordstable[i][j] = droptag(current)
        if(wordstable[i][j] == ""):
            wordstable[i][j] = "Sorry... No Data"

"""
wordstableが二元配列
wordstable[i][0] ⇨ 元の単語
wordstable[i][1] ⇨ 尊敬語
wordstable[i][2] ⇨ 謙譲語
wordstable[i][3] ⇨ 丁寧語
データなし ⇨ "Sorry... No Data" が出力
"""
