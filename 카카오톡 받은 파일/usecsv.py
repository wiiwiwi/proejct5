import csv
import re

# 파일명을 지정하면 해당 csv파일을 열고 내용을 읽어온 다음에 2차원 리스트 형태의 데이터를 반환

def read_csv(file_name):
    data_list = []

    fr = open(file_name, 'r', encoding='utf-8')

    new = csv.reader(fr)
    for item in new:
        data_list.append(item)

    fr.close()

    return data_list


def write_csv(file_name, data_list):
    fw = open(file_name, 'w', encoding='utf-8', newline='')

    write_obj = csv.writer(fw, delimiter=',')
    write_obj.writerows(data_list)

    fw.close()


def switch_csv(csv_data):
    trans_data_list = []

    for item_list in csv_data:
        trans_data = []
        for item in item_list:
            if re.search(r'[a-zA-Z가-힣!@#$%&*(]', item):
                trans_data.append(item)
            else:
                try:
                    sub = re.sub(',', '', item);
                    sub_float = float(sub)
                except:
                    pass
                finally:
                    trans_data.append(sub_float)

        trans_data_list.append(trans_data)

    return trans_data_list




