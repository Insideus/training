#!/usr/bin/env python 2.7
# coding=utf-8
import requests
import urllib2
import lxml
import lxml.html as H
from bs4 import BeautifulSoup

cookie = {
    'WC': ' '
}
def get_number():
    number_url = 'http://www.wechall.net/challenge/impossible/index.php?request=new_number'
    resp = requests.get(number_url, cookies=cookie)
    res =resp.content
    soup = BeautifulSoup(res)
    div_new = soup.find('div',{"id":"page"})
    movie_new = div_new.get_text()
    print movie_new
get_number()

def get_answer():
    post_data = {
        'solution': '',
        'cmd': 'Send',
        'gwf3_csrf': 'bNZbC2XL'
    }
    url = 'http://www.wechall.net/challenge/impossible/index.php' 
    resp = requests.post(url, cookies=cookie, data=post_data)
    # print resp.text
    d = H.document_fromstring(resp.text)
    import re
    ar = re.compile(r'"(\d+)"')
    text = d.xpath('//div[@class=\'gwf_errors\']/ul/li')[0].text_content()
    ans = ar.findall(text)[0]

    print ans 

    post_data = {
        'solution': ans,
        'cmd': 'Send',
        'gwf3_csrf': 'bNZbC2XL'
    }
    resp = requests.post(url, cookies=cookie, data=post_data)
    print resp.text
get_answer()
