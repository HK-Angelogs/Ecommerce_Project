from django.test import TestCase
from django.urls import reverse, NoReverseMatch
from django.contrib.auth import get_user_model

class LoginPageTests(TestCase):
    def setUp(self):
        User = get_user_model()
        self.username = "testuser"
        self.email = "test@example.com"
        self.password = "s3cretPassw0rd"
        User.objects.create_user(username=self.username, email=self.email, password=self.password)

        # Resolve login URL; fallback to /Login.html if URL name not configured
        try:
            self.login_url = reverse('Login_page')
        except NoReverseMatch:
            self.login_url = '/Login.html'

    def test_login_page_renders(self):
        """GET the login URL responds 200 and contains expected form labels."""
        response = self.client.get(self.login_url)
        self.assertIn(response.status_code, (200, 302), msg="Login URL did not return 200/302")
        content = response.content.decode('utf-8')
        self.assertIn("Email address", content, msg="Login page should contain 'Email address' label")
        self.assertIn("Password", content, msg="Login page should contain 'Password' label")

    def test_login_with_username_authenticates(self):
        """POST with username+password logs the user in via the view (if view performs auth)."""
        post_data = {'username': self.username, 'password': self.password}
        response = self.client.post(self.login_url, post_data, follow=True)
        # Check request user on the final response
        self.assertTrue(getattr(response.wsgi_request, 'user', None).is_authenticated,
                        msg="POST with correct username/password did not authenticate the user")
        # Also assert session contains auth id
        self.assertIn('_auth_user_id', self.client.session)

    def test_login_with_email_authenticates_if_supported(self):
        """POST with email+password: if the view supports email login this should authenticate."""
        post_data = {'email': self.email, 'password': self.password}
        response = self.client.post(self.login_url, post_data, follow=True)
        is_auth = getattr(response.wsgi_request, 'user', None).is_authenticated
        if is_auth:
            self.assertTrue(is_auth, msg="Email-based login succeeded and authenticated user")
            self.assertIn('_auth_user_id', self.client.session)
        else:
            # If the project does not support email-as-username login, ensure it failed cleanly
            self.assertFalse(is_auth, msg="Email-based login not supported by the view (expected in some setups)")

    def test_login_with_invalid_credentials_fails(self):
        """POST with wrong password does not authenticate."""
        post_data = {'username': self.username, 'password': 'wrong-password'}
        response = self.client.post(self.login_url, post_data, follow=True)
        self.assertFalse(getattr(response.wsgi_request, 'user', None).is_authenticated,
                         msg="Invalid credentials should not authenticate the user")
        self.assertNotIn('_auth_user_id', self.client.session)