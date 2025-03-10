Return-Path: <linux-renesas-soc+bounces-14207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D99A594CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81001188B0BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 12:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A9522ACCE;
	Mon, 10 Mar 2025 12:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uBGow5Iw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76322A4EE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610438; cv=none; b=S1ud4YbR+EJpP1dA1Vpjy4kxB0iUMSf6/QWKeAaeBv2r0yzoy5txj1Ll6CZHjS8vRUZLPa369vreVNBK82JgATnq9FfXyh1wFTeOo0Oo3Lt7iVHYowCoTFvd/L+qVE3veXRWd9M86z6StAJFp9QQHg5EZQiDNcoQDI3VFXmOL0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610438; c=relaxed/simple;
	bh=QWtxoXhKF2oycxErr3xHOOEyp3cijfG+PmUvCY0z4cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XV1UBghkwAchDjVmbU9vCwkUICJvRGiEhIS3XXovcspap87Lr6FMjs5JExHUXv7cFBpw+T0RcwWrZVOH4JKNwW5Ftf284vgZ59ckkKv2mzlsOATh7LrFCpVM0XHOArrf0VYvZpiibNE4ADFJk7phQC116P9FCo4uWwa4pCsR+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uBGow5Iw; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso24711645e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 05:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610434; x=1742215234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9ypBApPZis9ZEd14nlPhR/yx9DAIJjYqHgRrYtwPs8=;
        b=uBGow5IwfJITqK2aMSg+BRY/YnCHSqPslVRAnJACxQJNolf/7zawPm7a15iM668YDo
         auosQV/S2ZwSHkHPhtlaZWwGLGGXZyvr+FaEVWzQU8Rtsq8b02ZSirSlDIXGLnRmnImR
         nUYkl+sB2BBZkK2QCBSAa57nUAUaFoyQAh+EHMXq+P6VjH46/Uu2kwMbtXS1Xy1LFjQe
         2eiwjS89C7q4Gbze8JKExVWsYTegWsO6SIoAb27ipLOOrO8xSQe/ufUM15jLwpiAgIqI
         e9rKWvI/9sPjHZMFXesXUDcHYrPabFqvgTd1WKg8pEKJwB/UCkSKLOURq7LqVx7J1/V8
         zEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610434; x=1742215234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9ypBApPZis9ZEd14nlPhR/yx9DAIJjYqHgRrYtwPs8=;
        b=b0HY5xyG6Orl5RLQqJWtJAD/p+My5XWaEvny9x7VqR1CQP6/Egwbcj4NDVopLtwtvv
         LrTPBclzILVdVqGVlIwOJ6S128V3EqdtnngHQPaq8sl8JF8kNBA4DzREMkSYdDRw8uxf
         XxuMwZKEq1oIFmWfMHyD9q3ajMT8YFKIqPMwbKT8V1eiy8RoeX075NDyQrHUddqcyHRq
         djGxpC3CDBHWt+tjfPK7yet0KnDjHbtcLpVn2YI/3PQRCpH4ENmasfVTYv4XyPEDTUPg
         409FPJHmqoeS2lW0TZ76Ml2hoMhjl8dI7k5DtsuB5IDDhHh1npHEAzs2EiwL9pQi05j+
         ULIw==
X-Forwarded-Encrypted: i=1; AJvYcCUYWwxYOmjFXI8YjWy3CMZfie8GHRsYiZ8W6QfNaKw9GCsqXTeqwceHkWeQgSxQaywxqcg8Q/wEtagvdNsbGNVL+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+fzDsF8bcFK7pDsicSb4qEE3hR4zIod6DSjGXHvpRi8yZgbi
	r1q2ZbRDrTBoS4M4Z070W1ZMCV2wQThlnei8vmYjTqCLS6qOVD1y5tWn+pHsgPU=
X-Gm-Gg: ASbGncviKURiumVYP8bWyBIgxeRgWSy1kshYocUe5YSchjk4utXS6JsL5jnKHJgZo9U
	ixt2G0b7J8hO7Yb6JSH6p4jWhaDir7MsTav4vdGc8xLvio9aiBo+mZaMDTTI3q1CqVSZRE4ttB8
	OnFaFh7jZvs6k9fs5sTfYc4sNMnkQZRl46+6fOVIvRbC4zZHqq+lgn36DZoYpeymgS6K+v6Wgmw
	dImKqVQNEw3i6uokIRDDP3JH8B/XPidzmKoYee3Pc5FmU1M8Eq7K9LvUYXl5OksH67hXyNHqK9p
	MGW+13D3z/c24y5DtHIw+OCnIoSY8PqP+e8Wdw==
X-Google-Smtp-Source: AGHT+IGK0qUS6C3S2XE8X9yVB4lBi7PGkNGx1BRbWu1kP+2lHLgfZ+futRVICmhbqbk83Y2sD+IhWA==
X-Received: by 2002:a5d:5e10:0:b0:391:122c:8ab with SMTP id ffacd0b85a97d-39132d5f36emr6128432f8f.22.1741610434533;
        Mon, 10 Mar 2025 05:40:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:22 +0100
Subject: [PATCH 08/15] gpio: bt8xx: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-8-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qwBsS2oKTY2IIbpNdpv6Gx5gpfJN7LtePKR45ZXxPg4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt22EtYKirSRGcB31ylFtPB3vvoA0QXPEG5nv
 rj0EcgL1JiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 cnT6EAC5zz0cx8z5RrK3ooghI1WDunxYkmwW9P2rIO7r+GyDrLstokK7xaABeZP0ZBfcaAONhGz
 AcO0t6+UBC/Bq6IHmCdyZ/5wgHF2KRdOuJdOu7ygxtSsM60Evg3tbBejarC8ljYSC4gjY0m+xbX
 LdVsqI/6R48060rtcT1/DX08HWXAkCRYDeBsxakx5v//qgriYyJgwbFhEyRgoHET/7TZcNjOP6k
 ykLLjX1rVHACxhDu4nRw7fnZHaJKl9K3PTwkO8XSDVcMfRDurWfWpgGWlx9g0MvYNyacRdGqR+P
 nPPPlnVJ/eTJix2tMXqcy8ahYxrAq4cOuMOuO3vWSk4bxTqXJenEQAy7Vn7gXzRx8neLk+D2wV6
 o07QqY9nfNGgVhH8YFWJz5LpMc0ENrpQcKDa8nYSKwE/boIsxU4qS0uewl0T4G8MPKo+5SjJ0dp
 qpOX77cgq21vtLV2qZjJfDQQw9oVOoWOz8CWtACKfY/2drz9dcugdlnZqfkVh8yna1Dt509EKP5
 rJ4C+5xTwustIw/5wf5RIStc09w1Ji+nacMH1Gk4MBLFwYdiksb59Y4euyDPFGNkplslgA9WIus
 jb8TilDBngFBgftOF+UuGnOKTAeMZYvSvBGBpY6rG6uFuooDIcQwbLBh3lZqKUwMa2sFF5kKCoJ
 Qkv/UnEdhmAFe9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bt8xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index 173da7bbfc98..7c9e81fea37a 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -119,8 +119,7 @@ static int bt8xxgpio_gpio_direction_output(struct gpio_chip *gpio,
 	return 0;
 }
 
-static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
-			    unsigned nr, int val)
+static int bt8xxgpio_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
 	struct bt8xxgpio *bg = gpiochip_get_data(gpio);
 	u32 data;
@@ -133,6 +132,8 @@ static void bt8xxgpio_gpio_set(struct gpio_chip *gpio,
 	else
 		data &= ~(1 << nr);
 	bgwrite(data, BT848_GPIO_DATA);
+
+	return 0;
 }
 
 static void bt8xxgpio_gpio_setup(struct bt8xxgpio *bg)
@@ -144,7 +145,7 @@ static void bt8xxgpio_gpio_setup(struct bt8xxgpio *bg)
 	c->direction_input = bt8xxgpio_gpio_direction_input;
 	c->get = bt8xxgpio_gpio_get;
 	c->direction_output = bt8xxgpio_gpio_direction_output;
-	c->set = bt8xxgpio_gpio_set;
+	c->set_rv = bt8xxgpio_gpio_set;
 	c->dbg_show = NULL;
 	c->base = modparam_gpiobase;
 	c->ngpio = BT8XXGPIO_NR_GPIOS;

-- 
2.45.2


