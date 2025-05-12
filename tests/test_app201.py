import unittest
from flask import Flask
from c201.src.app201 import create_app, build_routes

class TestApp201(unittest.TestCase):

    def setUp(self):
        self.app = build_routes()
        self.client = self.app.test_client()

    def test_hello101_route(self):
        response = self.client.get('/201')
        self.assertEqual(response.data, b"Hello, course 201!")

if __name__ == '__main__':
    unittest.main()