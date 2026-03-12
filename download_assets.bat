@echo off
setlocal enabledelayedexpansion

cd /d "C:\Users\Acer\Desktop\Power Junk & Bins CO. LTD\claude\powerjunk-site"

echo Downloading CSS files...
curl -L -o "wp-content/uploads/astra-addon/astra-addon-69807d9ff37d85-42126342.css" "https://powerjunk.ca/wp-content/uploads/astra-addon/astra-addon-69807d9ff37d85-42126342.css"
curl -L -o "wp-content/plugins/elementor/assets/css/frontend.min.css" "https://powerjunk.ca/wp-content/plugins/elementor/assets/css/frontend.min.css"
curl -L -o "wp-content/plugins/elementor/assets/css/widget-image.min.css" "https://powerjunk.ca/wp-content/plugins/elementor/assets/css/widget-image.min.css"
curl -L -o "wp-content/plugins/elementor/assets/css/widget-heading.min.css" "https://powerjunk.ca/wp-content/plugins/elementor/assets/css/widget-heading.min.css"
curl -L -o "wp-content/uploads/elementor/css/post-11.css" "https://powerjunk.ca/wp-content/uploads/elementor/css/post-11.css"
curl -L -o "wp-content/uploads/elementor/css/post-31.css" "https://powerjunk.ca/wp-content/uploads/elementor/css/post-31.css"
curl -L -o "wp-content/uploads/elementor/css/post-172.css" "https://powerjunk.ca/wp-content/uploads/elementor/css/post-172.css"
curl -L -o "wp-content/themes/astra/assets/css/minified/compatibility/contact-form-7-main.min.css" "https://powerjunk.ca/wp-content/themes/astra/assets/css/minified/compatibility/contact-form-7-main.min.css"

echo Downloading icon images...
curl -L -o "wp-content/uploads/elementor/thumbs/box-truck.png" "https://powerjunk.ca/wp-content/uploads/elementor/thumbs/box-truck-rgkrmlzmmqzshkjwiu32xqcckp9jrvm63m66oiwrfs.png"
curl -L -o "wp-content/uploads/elementor/thumbs/canada.png" "https://powerjunk.ca/wp-content/uploads/elementor/thumbs/canada-rgkrsensryxg304soca9b9oog8p18omkwazz7ybd2g.png"
curl -L -o "wp-content/uploads/elementor/thumbs/shield.png" "https://powerjunk.ca/wp-content/uploads/elementor/thumbs/shield-rgkrvwm67rpvar1u8uq9ldwg1vg7w4im1mf1j14lwo.png"
curl -L -o "wp-content/uploads/elementor/thumbs/chat.png" "https://powerjunk.ca/wp-content/uploads/elementor/thumbs/chat-rgkry1oxs6ndqrxvqs1o9ug8rgwbfb0lo7wuvpybqg.png"
curl -L -o "wp-content/uploads/2025/12/cropped-logo_power_junk-180x180.png" "https://powerjunk.ca/wp-content/uploads/2025/12/cropped-logo_power_junk-180x180.png"
curl -L -o "wp-content/uploads/2025/12/cropped-logo_power_junk-270x270.png" "https://powerjunk.ca/wp-content/uploads/2025/12/cropped-logo_power_junk-270x270.png"

echo Downloading Google Reviews image...
curl -L -o "wp-content/uploads/2026/01/google-reviews-feed-example.jpg" "https://powerjunk.ca/wp-content/uploads/2026/01/google-reviews-feed-example.jpg"

echo Downloading responsive image sizes...
curl -L -o "wp-content/uploads/2025/12/home_01-300x180.png" "https://powerjunk.ca/wp-content/uploads/2025/12/home_01-300x180.png"
curl -L -o "wp-content/uploads/2025/12/home_01-768x461.png" "https://powerjunk.ca/wp-content/uploads/2025/12/home_01-768x461.png"
curl -L -o "wp-content/uploads/2025/12/home_03-300x180.png" "https://powerjunk.ca/wp-content/uploads/2025/12/home_03-300x180.png"
curl -L -o "wp-content/uploads/2025/12/home_03-768x461.png" "https://powerjunk.ca/wp-content/uploads/2025/12/home_03-768x461.png"
curl -L -o "wp-content/uploads/2025/12/home_04-300x180.png" "https://powerjunk.ca/wp-content/uploads/2025/12/home_04-300x180.png"
curl -L -o "wp-content/uploads/2025/12/home_04-768x461.png" "https://powerjunk.ca/wp-content/uploads/2025/12/home_04-768x461.png"

echo.
echo Download complete!
echo.
pause
