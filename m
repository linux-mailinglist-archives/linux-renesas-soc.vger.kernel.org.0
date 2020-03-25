Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89DE1192500
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 11:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbgCYKED (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 06:04:03 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:59658 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbgCYKED (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 06:04:03 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Ja3y220115USYZQ01a3ykx; Wed, 25 Mar 2020 11:04:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tC-00033U-Qh; Wed, 25 Mar 2020 11:03:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tC-0003Zq-PQ; Wed, 25 Mar 2020 11:03:58 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] gpiolib: Pass gpio_desc to gpio_set_config()
Date:   Wed, 25 Mar 2020 11:03:56 +0100
Message-Id: <20200325100357.13705-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325100357.13705-1-geert+renesas@glider.be>
References: <20200325100357.13705-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All callers of gpio_set_config() have to convert a gpio_desc to a
gpio_chip and offset.  Avoid these duplicated conversion steps by
letting gpio_set_config() take a gpio_desc pointer directly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cf7ee9a0ddde6b45..8eeb29de12cb5811 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3244,9 +3244,9 @@ static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
 	return gc->set_config(gc, offset, config);
 }
 
-static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
-			   enum pin_config_param mode)
+static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 {
+	struct gpio_chip *chip = desc->gdev->chip;
 	unsigned long config;
 	unsigned arg;
 
@@ -3261,7 +3261,7 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	}
 
 	config = PIN_CONF_PACKED(mode, arg);
-	return gpio_do_set_config(gc, offset, config);
+	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
 }
 
 static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
@@ -3277,7 +3277,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
 		bias = PIN_CONFIG_BIAS_PULL_DOWN;
 
 	if (bias) {
-		ret = gpio_set_config(chip, gpio_chip_hwgpio(desc), bias);
+		ret = gpio_set_config(desc, bias);
 		if (ret != -ENOTSUPP)
 			return ret;
 	}
@@ -3435,8 +3435,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	gc = desc->gdev->chip;
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		/* First see if we can enable open drain in hardware */
-		ret = gpio_set_config(gc, gpio_chip_hwgpio(desc),
-				      PIN_CONFIG_DRIVE_OPEN_DRAIN);
+		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN);
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
@@ -3446,8 +3445,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		}
 	}
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
-		ret = gpio_set_config(gc, gpio_chip_hwgpio(desc),
-				      PIN_CONFIG_DRIVE_OPEN_SOURCE);
+		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_SOURCE);
 		if (!ret)
 			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
@@ -3456,8 +3454,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 			goto set_output_flag;
 		}
 	} else {
-		gpio_set_config(gc, gpio_chip_hwgpio(desc),
-				PIN_CONFIG_DRIVE_PUSH_PULL);
+		gpio_set_config(desc, PIN_CONFIG_DRIVE_PUSH_PULL);
 	}
 
 set_output_value:
-- 
2.17.1

