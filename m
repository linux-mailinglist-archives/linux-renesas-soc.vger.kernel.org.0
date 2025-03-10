Return-Path: <linux-renesas-soc+bounces-14215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F2A594E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE563A66D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 12:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D255122D4F9;
	Mon, 10 Mar 2025 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Nic+D6DQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D022B590
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610445; cv=none; b=Hn5ooQ+3a7ki2RkcDbdKrwSsP7cuNQbUxOprrOoZqCiB54LlMJpmyHJfLCZaws7ZIjdQODILtSGG9NNsjh7bkqKhG+F4CDr1X9Dt4o4CPmhBMftszkx9FJp2iQOUrIBVfaujjUfenkD+dSQe6aGbIoAiq7yazP20lPucxxcRYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610445; c=relaxed/simple;
	bh=JCZwjmhHkI7UGuyylm3hmg1ybe6vyUyFrcZEROggpDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMfernI3iCZAr8WoJZ2VNP/boaSNVK1mzQSWA3LUSaxKoDHa3YzKzfGmTN2pSzVtLDGfMMT1vb4SZzTnoJ1fg1fc1XuxRrxbL3TQbTDQQ1WZjEx7E16gDAMuZEAVO69n2zGtAn5Y+ifB1LB5QJp902TV7V3uxt8zrLggXbBvEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Nic+D6DQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso434735f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610442; x=1742215242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNtczHCYOvGzkg4rCw2cTpCLRIRLWrJdIViZwBgDUNE=;
        b=Nic+D6DQQagsZe1PK2xtlYSRwDO+piDdGyt/HwRI5KcP9Vw7y5V0G7m7zZ/QANbYcG
         Vc29uqqLfzKDCLJXoo9ObQsOKeZ/XtiW92ePG33T7M4ON/9p8SN+7XIcCD/sd39+0kZU
         FhTzLqiRJQQuraE/wsI6SerVD5m8vEOTNdeHXfx/rnAqqqLsGoMAMKwp6hCa67r4xge6
         EKZapVNjUWPaMtf4xeGzXf4hWfFDwfF1iIy0zeZHrNxoD6FqzJ3NmIoZ4sJSYkh/9OoQ
         d7OQXsalVJgy1gRIWOj+bE8tDnqUrP2e0BHj60n4HEuuXXI7MnoKLqAn99bB0vzPaUx4
         qEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610442; x=1742215242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNtczHCYOvGzkg4rCw2cTpCLRIRLWrJdIViZwBgDUNE=;
        b=RXCvC8zeOBd/s237AvZlixnby2HuNnsFsKXQ6qkOuX+mvwRT65ma1XYz2m7mX8+2sR
         sQ4B5RTs7TO9Tx+cpP+u0yRAnCxMOy5eRHib6JrD5nYIJt1N8lzdT9d6TJmCOKKdPc6Q
         9sLlLQo/iVGoPJQheC81qbn5J+e86X378EBEv3ASEzy5DhkvGLEDx5/lZM7BsgOv5oAf
         HXNApY1R7AGOV7UJZpRPl0SK2WeBWoUzWpgnv34jteogjKQtoeHeHCgBz/5Td4ms3NxQ
         ISE/+VlwNqXCJx/uz5PDfki27zTaGF+Iae4l+7b/CN6PJ2bWtFGgb3LJ799ySxjn3vQy
         TnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfKLn+kNflt1WxZune213uVDP5IHD+sqb69yuw3xoAQt1DrpFfIgx9fB2lbu9zjyxg/LmnVn/FQrxzcMVG1oib7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1AKjGTSLkFcbPYe7XIMacequkDYXriuKpULCA2bSIQ4+yOgfg
	j66Qxp6W5mlGi70e8amJ2Gihzl+xQQN1ptFXmAVfScA4u9ZRqCuUJlhTdlR3xzM=
X-Gm-Gg: ASbGncsWx4GCq/aaz936jYk97wcmRrQcfRQYkPCv+lSRgP2u+GbMRUuiYw9+4ibV3Dp
	6ydXyOcB/dxna8Xj93TUk43mbdHeI4uTz80Liix/yDIrrrk/tGPWQfo0cxR/yOIv7643Il5N2r1
	0ztD2k4EnWHn/n9nkq5EndkXnqtTPTQer9E9n4C8XbEVlTh2TywhOWXJoSOx3EYMJfNOSQe/pIP
	DRmUm2mNNf2bnoWjCosqlc5osH2hdDZr8z1c20sQGm+ygFXXAOpyaQImw9Z6gNF8l6tevAKvnKr
	niiCt45vC/qQvdAiphu8xSvUIh0OfHKSsoOmOg==
X-Google-Smtp-Source: AGHT+IFVuyRiKFOOAXDZU5l6h/TGQ2xggZC6+4dIULrDNG5L2YF0yi09dTRtPuRjwegzC6F/xDPbXg==
X-Received: by 2002:a5d:648f:0:b0:391:3150:96ff with SMTP id ffacd0b85a97d-39132d57d7emr8406280f8f.32.1741610442247;
        Mon, 10 Mar 2025 05:40:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:29 +0100
Subject: [PATCH 15/15] gpio: da9055: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-15-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=aX+Sc7fT/BffIdWWzJi16XZBvVpXWWKC15xKXdoh/ts=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt24DB5SoA3hXBMRBC6RePpPoJYAb2N8IdI5i
 pcr3SXpATaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87duAAKCRARpy6gFHHX
 cimWD/98dfw0xWyjhT1TCRNPGdqbkj2nQnmfYJC8g42IGydzwqwzSN7m6xgIlZL5yQJ74CjTNIq
 9zx2WmSkS9S7588Gi0ihnRPW/sA04phIaDLWiLDK2YpSI21KDCGEsVOa1Sua7LP+ocVdXL0y5Dl
 fojCC2iWXNQEaHr/gWiPoktUcwODCRnKzP4Hkaj3fZ5yAleEYanJve+yvCEXSDQfjyetqR5Dj8j
 NUgBSu0fUzZqtcezJoxnsV1hUfXGLeE3nCABFzZEOjAHvYCQTXUugJ0NpRrzO5omloRmYltItnw
 mL6cpyrRR0CCohWjQwbvTFtMVbB06mzFVZO/2/XK4+0/4rQN9uDRJVnme3b+qulhOSopMdKpybk
 n6hGsKM/zWn0vDAaM22cVeBrBsWJBOPrpe1mbUAQxfM+3ZlT/Qvet2Oi/diAKsqASoXEumH374N
 tOQioORX2FMyUTAJ2hSLK60xJHWRcGunqLTzM0zdbbruDBC/xhYA7qlT9HLkpAB0qnAQBkxSjMi
 jI70EtKxQfPccNt3EAjVZtBWPizGrbS+qDe55Cs/jK9KhfT9oP9d1JiUUWXKWr4PWnaCiq9KD+w
 oKxxGJa5QZmrir/4qi1+OCJ4vMc1kRpkir+a1wFlfEzZRCy4Uzq676K6WWHtidzMnjq9yMiZuSq
 1ZPwoMDDsmuemPQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-da9055.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 49446a030f10..3d9d0c700100 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -59,14 +59,12 @@ static int da9055_gpio_get(struct gpio_chip *gc, unsigned offset)
 
 }
 
-static void da9055_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int da9055_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct da9055_gpio *gpio = gpiochip_get_data(gc);
 
-	da9055_reg_update(gpio->da9055,
-			DA9055_REG_GPIO_MODE0_2,
-			1 << offset,
-			value << offset);
+	return da9055_reg_update(gpio->da9055, DA9055_REG_GPIO_MODE0_2,
+				 1 << offset, value << offset);
 }
 
 static int da9055_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
@@ -102,9 +100,7 @@ static int da9055_gpio_direction_output(struct gpio_chip *gc,
 	if (ret < 0)
 		return ret;
 
-	da9055_gpio_set(gc, offset, value);
-
-	return 0;
+	return da9055_gpio_set(gc, offset, value);
 }
 
 static int da9055_gpio_to_irq(struct gpio_chip *gc, u32 offset)
@@ -120,7 +116,7 @@ static const struct gpio_chip reference_gp = {
 	.label = "da9055-gpio",
 	.owner = THIS_MODULE,
 	.get = da9055_gpio_get,
-	.set = da9055_gpio_set,
+	.set_rv = da9055_gpio_set,
 	.direction_input = da9055_gpio_direction_input,
 	.direction_output = da9055_gpio_direction_output,
 	.to_irq = da9055_gpio_to_irq,

-- 
2.45.2


