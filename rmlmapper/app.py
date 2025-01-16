from flask import Flask, request
import subprocess

app = Flask(__name__)


@app.route("/run-rmlmapper")
def run_rmlmapper():
    mapping = request.args.get("mapping", "")
    result = subprocess.run(['java', '-jar', 'rmlmapper-7.2.0-r374-all.jar', '-m', mapping],
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE)
    return result.stdout.decode('utf-8')


if __name__ == "__main__":
    app.run(debug=True)

