Return-Path: <linux-renesas-soc+bounces-14201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C6A594B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017273A9FD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748C222759B;
	Mon, 10 Mar 2025 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2oPyzvpN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA41224B07
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610430; cv=none; b=OAUkuZ36fpmGn5vCKXUG9rAzuTaQt3l+dNLvGVVjtFw2o+/bUosvZdDLmhb6Pc7RvbzkUFij4tG961D872zQBnfzzEh6UasAUu5BmPzLh4pdhOqTONRRw1/YNckAe9vMwgA8ancqIyu2mf2aKaXPybVCD9CosC2VwZEi/yL3rl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610430; c=relaxed/simple;
	bh=oW/aiEUvZZXqJSh9yhfXEXd+nz94th1LNEkngduFixs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akK/H1N5RnGguxhUufCY9bQw9GWiIzP0rHctVRbxLjvYovUMWQkiovuFHyKhoqgolXq4sjmJ78/nkHqE9mFn5ECBKv3LejScQBxjI7Gz+JNHgZxsqI2bjYtPHUwjePhCxPYdb1O7umLvAeiSPHuIHxYSPnbPH3OAPUBHaWjQhpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2oPyzvpN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso13038285e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610427; x=1742215227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYGAI05OK7Mp/05h37Cjc2avvREPLKZMIgnLXPpZpUk=;
        b=2oPyzvpNOQxj0AoIsHlPAvoQwk2ZarGCLuUwM0+S7xdIB1vsslGDiNQGq/fDW29Pbs
         +yELrJNgE9JQIEzmeM7UQttfKhwVLi6L7JLvSlcPEWE4Fu4iAGmpu7L9avPHPEpIxGk1
         yt/BfQ+ATCsFxPV2Vl+vfYUVcRDLMXKhWm8YLx0FXY6V/W9FFG73tlHRa4BTcPG69zp9
         cfXXVuGfCCIFuH7OVdgsQqSeo7o8le2tr8INqPw/6HmI7zK7zvUWG4BnEE9fOUwhVN+4
         sGRd5yMY6pumPCmdwR0D9TE8ww9RAuPS9N1xCVPWPP2qefTujsAsb0y/C/+NZNGr8NZg
         mbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610427; x=1742215227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYGAI05OK7Mp/05h37Cjc2avvREPLKZMIgnLXPpZpUk=;
        b=DVlZWL1l4jogGXOuodp8RvNcAau1avIECzAGON2DwOaaREi8OucKbQL1oamlHm7ecQ
         QwjN0wZd2DXQpYmquxd+wkIcS91JSO7oE0PNfxVQrXbmDqib+ZmofiqXVaI2mgWjIWXW
         HJiP0VQD2oQV6QDnnvq8PU+14rhG0e9KozPgFNWxc7N0+69Wwqfxbkne2O+TAR+1c3PQ
         Xcs+PfP5JJAYJsghD+BMHRmt7YDo7iHr+OinD/WkFInwka7JsQpIJznp+wyIngcFStQ4
         9MezK+8vzzT6ijz7/ZALs+R/zww9nN5wnwOnFMQfcCBJ74G1m0GCzWaBDPgQf4RgFLvm
         rMLg==
X-Forwarded-Encrypted: i=1; AJvYcCVWuA4U+t4WERNXll8DVaOa06fcZjelpKp+RmY5m3GbJugEROjiPUycEY6P1Gvy7KCXo97w80viEmySCtnBxT+0vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8T0wwM+4s8/f3n0+iry6eKU5bgjII+DdXB0SYc8cHdxgCIB9y
	7ibEwFtVLt1L3T0pKoovbsugchjLBnnLP5XzmJNQ5a66ohClmvcY4viENpFLOZ8=
X-Gm-Gg: ASbGncvtA8e7VafjjPe1XfcIYGRtP0Fehl0JxYMhsM2jRSDYAAFdm9IYs9VnZl3uLK9
	E93zzhvJZL9xAghWDoa7Q08aMP3hmfPQqmMJYboo71bcU6JuukDq4N1+l4aRCyMUEeGFKtGIHtB
	5VC6LyE874kAcQFJeo2lq4sqyf3v6aB08L6aZkSKmd96RcXYi8tXuo+QsbbOAhYsE6bXM9lcVBE
	YHEMA/byRJMemCjHq08bcS1TlPkvlQ0/gmn4PI6zixk0PCYhLck4RFERA3HWV74KsbB5C9QmnDl
	oslBQLR4MwV+XVa+WPvSUsrUsmtEDTYofBHbxsRmX3MuJm0N
X-Google-Smtp-Source: AGHT+IEpiZSigsD7mq/7aroNSLpkKgw14vyLzwCpAs6P3IU39kiwkAcoJYwXJqsG7JdjAFA2p1EHlQ==
X-Received: by 2002:a05:6000:1fa4:b0:38f:577f:2f6d with SMTP id ffacd0b85a97d-39132d093demr9788508f8f.2.1741610426632;
        Mon, 10 Mar 2025 05:40:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:15 +0100
Subject: [PATCH 01/15] gpio: bcm-kona: use lock guards
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-1-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8700;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=64LvLyjulLlcRTZ6GwgHPm6zOm13plfMb/iq3ckJj3M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt21eodUQWkbpDril/aofsEv3YS5awh3YzS5v
 pLHOsHTSUKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtQAKCRARpy6gFHHX
 co4WEACFOzNSsrtqyn29Tv1p2FDoEi4QHiQUDjLxZx2Bv3sENlv3Tx75JcS/y1LNsyW06lE+Lht
 hni/2nm5Ku+vMumPzvWiQpBGr7jvBFFisiXHVGoKHZD60rPJV3x1VGH5fpXSYrkqF0G9SzZi2/l
 sr1zPSrIQ98kdRuklC9yiUQCidpG7gpymoTNQ61suzfAmfv23IiTfxlE8xnzb3YRnGZgMAoTydg
 yiWDrRIiOgcxDTGUf9Qb0NqtPeOKf7xy7K7WDs3vSkHs9HWmU3IAmawoi0CYedV6LVxTwWxjmpc
 csZNcgsMcVziHsGfPLUVy0/8HlwM5Ukux4cLc7Bn6q9k+Jn1ceTy5UyyRzSpdoCI+DC6lp6pzMm
 i654kvtGMluy6k3KW3YAErcIMxRWcM3aXp8RMGs5CxfkUnOMKS4XycWERkdPLun4RgR6HFvrHlI
 KhhJpNS9RGUBP7stOEyCgd+PkGd6y1oU2qGGNshbuXlg9c+xU+R/JZEHApv09Ncywafj9Bdjtpy
 vxHR4j2+I/jnJi56GrWy53xOBgGky1gNT6SAXOIOS1xn01LuIZeRPNMXL0eGmxG0EOxnhXd5psN
 HS/oYXp5UOwxqWQBiSK8N4yy7mxJrW7R5ptA//ih+YDloJvs0xBPMUxedvFEn2yqJ5ElJ7N0WFJ
 qzp7ejpfa8xA3eg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reduce the code complexity by using automatic lock guards with the raw
spinlock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 64 +++++++++++++-------------------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 64908f1a5e7f..a7390b1f1173 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
@@ -100,7 +101,6 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 					unsigned gpio)
 {
 	u32 val;
-	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
@@ -112,13 +112,11 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
 	}
 
 	if (--bank->gpio_unlock_count[bit] == 0) {
-		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+		guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
 		val |= BIT(bit);
 		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
-
-		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 	}
 }
 
@@ -126,19 +124,16 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
 					unsigned gpio)
 {
 	u32 val;
-	unsigned long flags;
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	struct bcm_kona_gpio_bank *bank = &kona_gpio->banks[bank_id];
 
 	if (bank->gpio_unlock_count[bit] == 0) {
-		raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+		guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 		val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
 		val &= ~BIT(bit);
 		bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
-
-		raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 	}
 
 	++bank->gpio_unlock_count[bit];
@@ -161,24 +156,21 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	/* this function only applies to output pin */
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
-		goto out;
+		return;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
 
 	val = readl(reg_base + reg_offset);
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
-
-out:
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -188,11 +180,11 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		reg_offset = GPIO_IN_STATUS(bank_id);
@@ -202,8 +194,6 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	/* read the GPIO bank status */
 	val = readl(reg_base + reg_offset);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	/* return the specified bit status */
 	return !!(val & BIT(bit));
 }
@@ -228,19 +218,17 @@ static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_IOTR_MASK;
 	val |= GPIO_GPCTR0_IOTR_CMD_INPUT;
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -252,11 +240,11 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val, reg_offset;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_IOTR_MASK;
@@ -268,8 +256,6 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
 	val |= BIT(bit);
 	writel(val, reg_base + reg_offset);
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -289,7 +275,6 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	struct bcm_kona_gpio *kona_gpio;
 	void __iomem *reg_base;
 	u32 val, res;
-	unsigned long flags;
 
 	kona_gpio = gpiochip_get_data(chip);
 	reg_base = kona_gpio->reg_base;
@@ -312,7 +297,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	}
 
 	/* spin lock for read-modify-write of the GPIO register */
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_DBR_MASK;
@@ -327,8 +312,6 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 
@@ -367,17 +350,15 @@ static void bcm_kona_gpio_irq_ack(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_STATUS(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_STATUS(bank_id));
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static void bcm_kona_gpio_irq_mask(struct irq_data *d)
@@ -388,19 +369,16 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_MASK(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_MASK(bank_id));
 	gpiochip_disable_irq(&kona_gpio->gpio_chip, gpio);
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
@@ -411,19 +389,16 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
 	int bank_id = GPIO_BANK(gpio);
 	int bit = GPIO_BIT(gpio);
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
 	val |= BIT(bit);
 	writel(val, reg_base + GPIO_INT_MSKCLR(bank_id));
 	gpiochip_enable_irq(&kona_gpio->gpio_chip, gpio);
-
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
 }
 
 static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -433,7 +408,6 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned gpio = d->hwirq;
 	u32 lvl_type;
 	u32 val;
-	unsigned long flags;
 
 	kona_gpio = irq_data_get_irq_chip_data(d);
 	reg_base = kona_gpio->reg_base;
@@ -459,15 +433,13 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
+	guard(raw_spinlock_irqsave)(&kona_gpio->lock);
 
 	val = readl(reg_base + GPIO_CONTROL(gpio));
 	val &= ~GPIO_GPCTR0_ITR_MASK;
 	val |= lvl_type << GPIO_GPCTR0_ITR_SHIFT;
 	writel(val, reg_base + GPIO_CONTROL(gpio));
 
-	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
-
 	return 0;
 }
 

-- 
2.45.2


