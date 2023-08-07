Meister ML Challenge
==============================

Meister take home ML challenge

Project Organization
------------

    ├── LICENSE
    ├── Makefile           <- Makefile with commands like `make data` or `make train`
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
    │                         generated with `pip freeze > requirements.txt`
    │
    ├── setup.py           <- makes project pip installable (pip install -e .) so src can be imported
    ├── src                <- Source code for use in this project.
    │   ├── __init__.py    <- Makes src a Python module
    │   │
    │   ├── api            <- Rest API for model inference
    │   │   └── app.py
    |   |
    │   ├── data           <- Scripts to download or generate data
    │   │   └── make_dataset.py
    │   │
    │   ├── features       <- Scripts to turn raw data into features for modeling
    │   │   └── build_features.py
    │   │
    │   ├── models         <- Scripts to train models and then use trained models to make
    │   │   │                 predictions
    │   │   ├── predict_model.py
    │   │   └── train_model.py
    │   │
    │   └── visualization  <- Scripts to create exploratory and results oriented visualizations
    │       └── visualize.py
    │
    └── tox.ini                   <- tox file with settings for running tox; see tox.readthedocs.io
    └── Dockerfile                <- Dockerfile for the model inference API
    └── docker-compose-prod.yaml  <- Docker compose spec for Apache Airflow (Can be used for data pipelines/automation) can also include MLflow for MLOps


--------

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>

## Dependencies

```bash
make requirements
```

## Notebooks
The Jupyter notebooks with the Exploratory analysis and model training can be found in the __notebooks__ directory.

## Deployment Considerations
I selected [Ray](https://www.ray.io/) model serve API to develop the model inference. Ray allows for batch or real-time inference, and has production grade features that can make the model productization easier.

Some of the main characteristics:
* Pythonic API
* Low latency, high throughput
* Multi-model composition
* FastAPI Integration
* Native GPU support

For a production deployment there's KubeRay operator to run the inference in a distributed mode in Kubernetes, allowing auto-scaling, deployment strategies, etc...


## Build the Inference Image
```bash
make build
```

## Run Inference Image
```bash
make run
```

## Testing the Model Inference
The inference enpoint expects a text input of the concatenation of __idea_title__ and __map_title__ as the parameter __sentence__.

OpenAPI Spec: http://127.0.0.1:8000/docs


```bash
curl --location 'http://127.0.0.1:8000/classify?sentence=%22Mapa%20aprende%20un%20nuevo%20lenguaje%22'
```

Output:
```json
[
    {
        "label": "Education",
        "score": 0.9989756345748901
    }
]
```

## References

* https://docs.ray.io/en/latest/serve/tutorials/text-classification.html
* https://huggingface.co/docs/transformers/main/tasks/sequence_classification
* https://pytorch.org/serve/inference_api.html