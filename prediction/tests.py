from django.test import SimpleTestCase
from .services import MODEL_CONFIG, predict_image


class ModelConfigurationTests(SimpleTestCase):
    def test_five_model_configs_are_present(self):
        self.assertEqual(set(MODEL_CONFIG), {"brain", "breast", "kidney", "lung", "skin"})

    def test_known_input_shapes_are_150_square(self):
        for config in MODEL_CONFIG.values():
            self.assertEqual(config["input_size"], (150, 150))
            self.assertIn(config["channels"], (1, 3))

    def test_breast_model_is_blocked_when_class_mapping_is_unverified(self):
        with self.assertRaisesRegex(RuntimeError, "3 output units"):
            predict_image("breast", None)
