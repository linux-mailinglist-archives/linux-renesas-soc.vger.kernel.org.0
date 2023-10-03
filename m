Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14CA7B6C29
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 16:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240176AbjJCOvl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Oct 2023 10:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240226AbjJCOvj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 10:51:39 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61323E9
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Oct 2023 07:51:35 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso10481545e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Oct 2023 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344694; x=1696949494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpGAZ8JK0NCFcy4HbqYTmEGAjLfb4Lc8h9XsT2EPYsE=;
        b=dSACUX21hIuF4pWREviicHqpZHEb6E9mveq26pi5uMOzCu06VPLxpFovs6E+ijHlEo
         GA4NYiHefH79BgN2FyamVMjpKGfOHFCjjsrYujzhuEqQ/WypO6xW0ZUGcPpy5XSBftLc
         MQlCODnjmYZvr+dfEuqEZaYZxkUxz4RMkVyCCXXx0MVvgAjzIrWGM6LADZHaIFK1r1sX
         wweA+WDfQpQWQMgJvJ7keS9+W1vZK1Zov9+vRwx9tiTyjGu/bCMMZCCTRNM6Du1GLi28
         LBodzf+/cWZyUdTQlWA6wP5ATGobxPlZmHWrvJkVBZqb858tjxgSp9bSWmuvg9eEpes9
         diVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344694; x=1696949494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpGAZ8JK0NCFcy4HbqYTmEGAjLfb4Lc8h9XsT2EPYsE=;
        b=cupz7NrgCPTIjxBMgcYenFN5WhAe6y0/BA5TS8LEjhGjFcBalY8RHWpiC0VacBwaCU
         +T1QsKAyneinEoNUEg7wEocRgfB2OJ/XZRwUYa2J7YXGcCfsp4HiOVlHVxI05t2OO1kS
         RD3nEwQkbTmk/YhXBvURTeOapTCcPt8HDHPfCYvgMs1AUp94UAYPjkPBgNlLimia/KkX
         PxyjHbeLryg+CFuGsD4PuHFaLDCieIh3JIYq9nUTjyhmDqSrLVwlOgiS+ieTdjt1CFGn
         5YO4ofA9+wcTmV0AM1bCnriPJn6uf3AmW62CdzbFvH4/kHebiY8qeIoi06ApeevsShHJ
         X8Tg==
X-Gm-Message-State: AOJu0YxehcTtju4zFFb1wB4HmoAXIziGp5htp21jlKxJnpn5ce0DNwt1
        ZU+NwBVlYS9TL21zoiwTDjB3dA==
X-Google-Smtp-Source: AGHT+IHdW9L9rksYKP5d4TTPkLpphBpvyDRVGz3n8Q2jQ9lwKMXvOj/DhFHduzGRMB1gMl7fCPbUkA==
X-Received: by 2002:a7b:c7d2:0:b0:405:48ba:9c with SMTP id z18-20020a7bc7d2000000b0040548ba009cmr13654280wmk.16.1696344693886;
        Tue, 03 Oct 2023 07:51:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 14/36] pinctrl: renesas: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:52 +0200
Message-Id: <20231003145114.21637-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/gpio.c          | 8 ++++----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 5758daf94fe2..e7771a57e6d1 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -135,12 +135,12 @@ static int gpio_pin_request(struct gpio_chip *gc, unsigned offset)
 	if (idx < 0 || pfc->info->pins[idx].enum_id == 0)
 		return -EINVAL;
 
-	return pinctrl_gpio_request(gc->base + offset);
+	return pinctrl_gpio_request_new(gc, offset);
 }
 
 static void gpio_pin_free(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_gpio_free(gc->base + offset);
+	return pinctrl_gpio_free_new(gc, offset);
 }
 
 static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
@@ -164,7 +164,7 @@ static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
 
 static int gpio_pin_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(gc->base + offset);
+	return pinctrl_gpio_direction_input_new(gc, offset);
 }
 
 static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
@@ -172,7 +172,7 @@ static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
 {
 	gpio_pin_set_value(gpiochip_get_data(gc), offset, value);
 
-	return pinctrl_gpio_direction_output(gc->base + offset);
+	return pinctrl_gpio_direction_output_new(gc, offset);
 }
 
 static int gpio_pin_get(struct gpio_chip *gc, unsigned offset)
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 03b36c6b2b6d..b9195fff0abd 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -801,7 +801,7 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u8 reg8;
 	int ret;
 
-	ret = pinctrl_gpio_request(chip->base + offset);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -920,7 +920,7 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	unsigned int virq;
 
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	virq = irq_find_mapping(chip->irq.domain, offset);
 	if (virq)
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 52aeafaba4b6..3d29c77a5aad 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -754,7 +754,7 @@ static int rzv2m_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	u8 bit = RZV2M_PIN_ID_TO_PIN(offset);
 	int ret;
 
-	ret = pinctrl_gpio_request(chip->base + offset);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -832,7 +832,7 @@ static int rzv2m_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void rzv2m_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	/*
 	 * Set the GPIO as an input to ensure that the next GPIO request won't
-- 
2.39.2

