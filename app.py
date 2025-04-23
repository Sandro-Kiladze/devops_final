from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html', message="Version B")


@app.route('/submit', methods=['POST'])
def submit():
    name = request.form.get('name', 'Anonymous')
    message = request.form.get('message', 'No message provided')
    return render_template('result.html', name=name, message=message)


if __name__ == '__main__':
    app.run(debug=True)