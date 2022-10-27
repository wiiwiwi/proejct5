import urllib.request as ur
from bs4 import BeautifulSoup as bs

print('-' * 5, '다음 뉴스 페이지 크롤링 하기', '-' * 5)

# 다음 뉴스 페이지 주소
url = 'https://news.daum.net/'
html = ur.urlopen(url) # 해당 주소에 접속
soup = bs(html.read(), 'html.parser') # html 방식으로 데이터 파싱

# 전체 뉴스 내용을 저장할 리스트
news_list = []

# 뷰티풀수프로 전체 뉴스 목록 가져오기
item_issue_list = soup.find_all('div', {'class': 'item_issue'})

# 목록에서 뉴스 각각의 제목과 링크 주소 가져오기
for item in item_issue_list:
    a_tag = item.find('a', {'class': 'link_txt'})
    title = a_tag.text.strip() # 제목
    link = a_tag.get("href") # 링크 주소

    # 서브 페이지에 접속하기
    sub_html = ur.urlopen(link)
    sub_soup = bs(sub_html.read(), 'html.parser')

    # 뉴스 내용 가져오기
    div_article_view = sub_soup.find('div', {'class': 'article_view'})
    p_tag_list = div_article_view.find_all('p', {'dmcf-ptype': 'general'})

    # 전체 뉴스 내용 중 2줄만 가져오기
    news = '';
    for i in range(2):
        news = news + p_tag_list[i].text.strip() + '\n';

    print(f'뉴스 제목 : {title}')
    print(f'뉴스 주소 : {link}')
    print(f'뉴스 기사 : {news}')
    print('-' * 20)
    # 가져온 뉴스 내용을 리스트에 저장
    news_list.append([title, link, news])

# 크롤링한 전체 뉴스 내용을 text 파일로 저장하기
f = open('daum_news.txt', 'w', encoding='UTF-8')

# for items in news_list:
#     for item in items:
#         f.write(item + '\n')
#     f.write('-' * 30 + '\n')

for items in news_list:
    f.write(items[0] + '\n' + items[1] + '\n' + items[2] + '\n')
    f.write('-' * 30 + '\n')

f.close()





