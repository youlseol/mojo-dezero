# DEMO-DEZERO


## 가상 환경 비활성화
deactivate

## 가상 환경 디렉터리 삭제
 - rm -rf my_venv
 - rmdir /s /q my_venv

## 프로젝트의 패키지를 requirements.txt 파일로 내보내기
pip freeze > requirements.txt     


## requirements.txt 파일을 사용하여 패키지 설치
pip install -r requirements.txt


## production 실행 시(Windows)
- pip install waitress
- waitress-serve --listen=*:5000 app:app


## production 실행 시(Linux/MacOS)
- pip install gunicorn
- gunicorn -b 0.0.0.0:5000 app:app  


# [Trouble shooting] python module compile 하기
- python cli 에서 from dezero.core import Variable 실행 해보고 오류 나면 설치 패키지 확인

### 모듈 직접 컴파일로 생성 하기
```bash
python -m py_compile your_module.py
```

```python
import os
import py_compile

def compile_folder(folder_path):
    for dirpath, dirnames, filenames in os.walk(folder_path):
        for filename in filenames:
            if filename.endswith('.py'):
                file_path = os.path.join(dirpath, filename)
                py_compile.compile(file_path)

# 사용 예:
compile_folder('/path/to/your/folder')
```