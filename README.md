# fast.ai image

Add the following above notebooks to source the fastai libraries:-

```python
import sys
sys.path.append('../fastai')
```

## Running

```
docker run -it -e COURSE_PATH=/workspace -v $(pwd)/workspace:/workspace/personal -p 8888:8888 gaving/fastai
```

## Building (optional)

```
docker build -t fastai .
```
