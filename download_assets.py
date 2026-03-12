import os
import re
import urllib.request
import urllib.parse
from pathlib import Path
import time

# Base directory
base_dir = r'C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site'
base_url = 'https://powerjunk.ca'

# Create directories
os.makedirs(os.path.join(base_dir, 'css'), exist_ok=True)
os.makedirs(os.path.join(base_dir, 'js'), exist_ok=True)
os.makedirs(os.path.join(base_dir, 'images'), exist_ok=True)
os.makedirs(os.path.join(base_dir, 'wp-content'), exist_ok=True)

# HTML files to process
html_files = [
    'index.html',
    'junk-removal.html',
    'bin-rentals.html',
    'small-demolition.html',
    'about-us.html',
    'contact.html'
]

downloaded_urls = set()

def download_file(url, local_path):
    """Download a file from URL to local path"""
    if url in downloaded_urls:
        return True

    try:
        # Create directory if needed
        os.makedirs(os.path.dirname(local_path), exist_ok=True)

        # Download file
        print(f"Downloading: {url}")
        urllib.request.urlretrieve(url, local_path)
        downloaded_urls.add(url)
        time.sleep(0.1)  # Be polite to the server
        return True
    except Exception as e:
        print(f"Error downloading {url}: {e}")
        return False

def process_html_file(html_file):
    """Process HTML file and download all referenced assets"""
    file_path = os.path.join(base_dir, html_file)

    print(f"\n\nProcessing {html_file}...")

    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Find all CSS files
    css_pattern = r'href=["\']https://powerjunk\.ca/([^"\']+\.css[^"\']*)["\']'
    css_matches = re.findall(css_pattern, content)

    for css_path in css_matches:
        url = f"{base_url}/{css_path}"
        # Keep the full path structure
        local_path = os.path.join(base_dir, css_path.split('?')[0])
        download_file(url, local_path)

    # Find all JS files
    js_pattern = r'src=["\']https://powerjunk\.ca/([^"\']+\.js[^"\']*)["\']'
    js_matches = re.findall(js_pattern, content)

    for js_path in js_matches:
        url = f"{base_url}/{js_path}"
        local_path = os.path.join(base_dir, js_path.split('?')[0])
        download_file(url, local_path)

    # Find all image files
    img_patterns = [
        r'src=["\']https://powerjunk\.ca/([^"\']+\.(png|jpg|jpeg|gif|svg|webp)[^"\']*)["\']',
        r'href=["\']https://powerjunk\.ca/([^"\']+\.(png|jpg|jpeg|gif|svg|webp|ico)[^"\']*)["\']',
        r'url\(["\']?https://powerjunk\.ca/([^"\']+\.(png|jpg|jpeg|gif|svg|webp)[^"\')]*)["\']?\)',
    ]

    for pattern in img_patterns:
        img_matches = re.findall(pattern, content)
        for match in img_matches:
            img_path = match[0] if isinstance(match, tuple) else match
            url = f"{base_url}/{img_path}"
            local_path = os.path.join(base_dir, img_path.split('?')[0])
            download_file(url, local_path)

    # Update HTML to use local paths
    content = re.sub(r'https://powerjunk\.ca/', '', content)

    # Write updated HTML
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"Updated {html_file} with local paths")

# Process all HTML files
for html_file in html_files:
    process_html_file(html_file)

print(f"\n\nDownload complete! Total files downloaded: {len(downloaded_urls)}")
