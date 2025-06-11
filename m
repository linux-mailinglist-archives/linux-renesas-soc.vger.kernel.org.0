Return-Path: <linux-renesas-soc+bounces-18077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3CFAD4CA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D2CB169055
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 07:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E24F236445;
	Wed, 11 Jun 2025 07:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="efTa7A1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A47234966
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626888; cv=none; b=BLCgomEDslYml35pM8YaCcsStWpC4AbPTZKLNgyqgp/GNqxvdH00DOGvv6jk8sdmu6fZ2JA4daURj6RXeM9DKBf3tqj7OXqs6YeqByUJdsO4zzhZz6/orUAYOgwvZgxlXfbi1/yAL9I/q+sHRykYhLZFNJKy2QSHX3/4hLmhnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626888; c=relaxed/simple;
	bh=ZMckEftaur0awqo/yKW4VecLuHYo3Jj+Dpx2jIF7DDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C932n/k9wyksEZt9gXg7ktCBnPVg3D88bMIGcKCEKs1HA0Soi4QTitYz+9h9JXHmPIXVXVudgaihBl7sV7VMWw/k4EOBRSI/WAI/KL/yMCPgTHsRFa1HnbzYrBy35p+UnEEeEwU18Ay7PkCEs3Bh7nrsh6/MirAZpZwSTrcTDrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=efTa7A1g; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4530921461aso28260195e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626883; x=1750231683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fz5ZJtTWraCxO84eZToYsMCR6vkVrOOU3h2l01GftKA=;
        b=efTa7A1gXjZbLJ7NIyHtT8ZrBKckenDEJsn/wl27wBQM1eKPmT7cncdgrfoEu1/WBt
         3jbb/1aHuX0xF1M5CHCE8eOX9PMlkONRDwhW7E4+9GWvGySIHkQUQiS0HSeV/GI4IlVS
         IuvPlEu4CA1ex0lNMLv/1Nj+xI7B8eIZ1SvwIV/bULxTtIx2Yvj8mlHZIu9ToJYQWVv1
         N+Rgc13ycgWlAo4Lmgy3m6DtROf4Cvz9qOnITAWaXzN6B8DkqM5JdRXZPhn8Izi9E+6r
         7gxQbGATN6BO9GORHCzP1fK3EVLQQUIF7Lz20L3el/kysfZp4S6rMGmWJKACDEiTQo69
         SYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626883; x=1750231683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz5ZJtTWraCxO84eZToYsMCR6vkVrOOU3h2l01GftKA=;
        b=FAFaIC1vp5/C31qlAC/UrM2KCxaj+N0zm6XCBF3mCyjvtVmArSamdLXFeI4v7ZJthf
         WWlMJVHhRzfcpcc7NeCk08b1EAX7musA9wK5wmiyEAQSLu4elXJQegUOPbwrATwbyx9l
         9UrxATbJvlRemW/0TDIMhwCgO9ovzH1cLpQalSU33rrDwLy5vlqZhlX9zizN5OTNvLRt
         AUAYlQCG0elLcH57eitNHqjrOnYWnvu8MK2v15uoXtKA8UGQVR0uRvKVM82q9HGItqvB
         VrwZ7oaW0NHF47jOg6MYAgfAy3z6sneo3JFIrQFj+SLYWJdRfkHeeaU0x6oqF2YUGh29
         8mMA==
X-Gm-Message-State: AOJu0YzW58GT22Q+gpSlSwZlROk/nXsSzK56xZQD1gAMLI2ATlQ7hMp3
	8Bt3qGnYy3YlIAKxKmw+FBqrCxnOGY3hQJmmMZk4Ib2OuxccidOnw1XXdyOtdkAxYJUW97fBgaK
	vZYNx
X-Gm-Gg: ASbGncu/ghQiVYhZtbDYWpQLm/0Gy3mkuCHo7p4m9s0PhYReh+e9vhpLXzHIAQZx2WP
	7zSY66G6UhbxKtUlg9Syj6KeinOCC2YnV/2IpoD540D2optH0NkFqhcRPlTWxc16kJ3p1WZvhna
	B4Arr8g252EUfiAV1ZS/9OJ1D926WqONVfbQ5qSu0gOQc6JA5wtH99nRaxqzAPCgk6EwGoG7zVN
	Oz+RWz3qr3K4Va6qZuvnEq2SZxrZIl3oytuEwuciW4JwpMNNDxYcV6PLITP4xNjo52ecx+o1uct
	okmoXgnT95RR/Pp+Pakh1sQsV8tzYiJEM8E6cc9D/4R4eiDeTbi4/wBX
X-Google-Smtp-Source: AGHT+IHqWcTXTC99slfypNY0J9/R51fSuHI2YW+gpFEROt5HmX5Uek+3vp75fg822snEUAb4UYU7yQ==
X-Received: by 2002:a05:600c:154c:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-453248b0ee1mr19824435e9.10.1749626882786;
        Wed, 11 Jun 2025 00:28:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:28:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 09:27:55 +0200
Subject: [PATCH 4/5] pinctrl: rzv2m: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-4-ad169a794ef0@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4WbKIM0oy4jYhp0GxcNLcfPlrGEmjN+KK2bG6xszgaA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/94JhCtS4qT2pc9oKKMLm7V6mr5W1LPvI+L
 HrCCwC4EgWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/QAKCRARpy6gFHHX
 cg68EADPjlzfffAjS9JziCwkMELfjtNZrm68yRRW4u6BaMBuFpQ7bmviRD7VISXRGQ3eRyTlgRu
 2eJvyX8g6hrCG0RVFyHG7TzWTk5gReiV7oAl1fK7ufi+m3hSIn08JEP7tv9ybZYJ4Qhnr4iYNSm
 GpXH4eXdmCPhQ2m4QnYWItQTGv5b25tLfYYJc39PJs8y/oHBGvyDOxCzAdu2KSP3sbIG1KKzuva
 sQPZngx9vz8JyPfLVCJrwhkbhmQoowNzJxyt78dE7AYBMBmbIQLhlolZkgkWMZ9nhvNpsSBPLwW
 G5a5aiIDMrCTsq33Yy3S+sXf7z1pJO5h/p1D9cAXoKLEhc+ox8VbaLa2O7m5Dy8KocrnbgwQBBw
 A8LOBOxQk4Ge5uhdiY8CEKm+9VkiFCkoTK2NJV/Lg3jQxDlNJQ22AucvH9T2rRar73KS/gUE4Z6
 CQFxrRdHWbFcpBUU6dwLh1YgjrZA+4jhmjHrckjgXMHqWeexo75Ld6RuYrQAX1uNZpIU8EHHt6t
 OVTxj1Pp7FsBZG37ZU4+apTO7hvzn97y3I6aAs/1rJu5bvXf7faLk902BCnB+I6AqJMWTU1sBon
 wPdEjA+izWVPoNVMg33DatFFsRkjOd5ZSRir+jRm+sU2aIF3uztPu1XD/iV8eQCf2i+lmJA3OIs
 W8aaDT/xF26HjoQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 8c7169db4fcce6144d26b963dfd3b11bacd66d80..a17b68b4c466e2ca91cb26a713a088e309d5e167 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -790,14 +790,16 @@ static int rzv2m_gpio_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static void rzv2m_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int rzv2m_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rzv2m_pinctrl *pctrl = gpiochip_get_data(chip);
 	u32 port = RZV2M_PIN_ID_TO_PORT(offset);
 	u8 bit = RZV2M_PIN_ID_TO_PIN(offset);
 
 	rzv2m_writel_we(pctrl->base + DO(port), bit, !!value);
+
+	return 0;
 }
 
 static int rzv2m_gpio_direction_output(struct gpio_chip *chip,
@@ -955,7 +957,7 @@ static int rzv2m_gpio_register(struct rzv2m_pinctrl *pctrl)
 	chip->direction_input = rzv2m_gpio_direction_input;
 	chip->direction_output = rzv2m_gpio_direction_output;
 	chip->get = rzv2m_gpio_get;
-	chip->set = rzv2m_gpio_set;
+	chip->set_rv = rzv2m_gpio_set;
 	chip->label = name;
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


