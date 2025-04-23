import pytest
from app import app as flask_app 

@pytest.fixture
def client():
    flask_app.config['TESTING'] = True
    with flask_app.test_client() as client:
        yield client
def test_index_route(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b'Welcome to the DevOps Demo App' in response.data
def test_submit_form(client):
    response = client.post('/submit', data={
        'name': 'Test User',
        'message': 'Hello, DevOps!'
    })
    assert response.status_code == 200
    assert b'Test User' in response.data
    assert b'Hello, DevOps!' in response.data