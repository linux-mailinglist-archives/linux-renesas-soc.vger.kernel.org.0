Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C28329FF75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgJ3IP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJ3IP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:15:29 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E312C0613D5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2020 01:15:28 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id m8FR2300K4C55Sk018FRlK; Fri, 30 Oct 2020 09:15:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kYPZF-0019ff-8A; Fri, 30 Oct 2020 09:15:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kYPZE-009daW-IJ; Fri, 30 Oct 2020 09:15:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v2 2/2] gpio: rcar: Add R-Car V3U (R8A7799A) support
Date:   Fri, 30 Oct 2020 09:15:22 +0100
Message-Id: <20201030081522.2297074-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030081522.2297074-1-geert+renesas@glider.be>
References: <20201030081522.2297074-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the GPIO controller block in the R-Car V3U (R8A779A0)
SoC, which is very similar to the block found on other R-Car Gen3 SoCs.
However, this block has a new General Input Enable Register (INEN),
whose reset state is to have all inputs disabled.

Enable input for all available pins in probe and resume, to support the
use of the General Input Register (INDT) for reading pin state at all
times.  This preserves backwards compatibility with other R-Car Gen3
SoCs, as recommended by the Hardware Manual.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested on actual hardware.

v2:
  - Enable input unconditionally in probe and resume, instead of during
    GPIO line configuration and depending on GPIO line direction,
  - Assumed authorship, as this patch is very different from v1, written
    by Phong Hoang.
---
 drivers/gpio/gpio-rcar.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index cbe9257fff9fc50f..edf67fc9c54bd648 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -36,6 +36,7 @@ struct gpio_rcar_info {
 	bool has_outdtsel;
 	bool has_both_edge_trigger;
 	bool has_always_in;
+	bool has_inen;
 };
 
 struct gpio_rcar_priv {
@@ -63,6 +64,7 @@ struct gpio_rcar_priv {
 #define FILONOFF	0x28	/* Chattering Prevention On/Off Register */
 #define OUTDTSEL	0x40	/* Output Data Select Register */
 #define BOTHEDGE	0x4c	/* One Edge/Both Edge Select Register */
+#define INEN		0x50	/* General Input Enable Register */
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
@@ -390,18 +392,28 @@ static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_outdtsel = false,
 	.has_both_edge_trigger = false,
 	.has_always_in = false,
+	.has_inen = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 	.has_always_in = false,
+	.has_inen = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen3 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
 	.has_always_in = true,
+	.has_inen = false,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_v3u = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_always_in = true,
+	.has_inen = true,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
@@ -430,6 +442,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 	}, {
 		.compatible = "renesas,gpio-r8a7796",
 		.data = &gpio_rcar_info_gen3,
+	}, {
+		.compatible = "renesas,gpio-r8a779a0",
+		.data = &gpio_rcar_info_v3u,
 	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
@@ -471,6 +486,17 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	return 0;
 }
 
+static void gpio_rcar_enable_inputs(struct gpio_rcar_priv *p)
+{
+	u32 mask = GENMASK(p->gpio_chip.ngpio - 1, 0);
+
+	/* Select "Input Enable" in INEN */
+	if (p->gpio_chip.valid_mask)
+		mask &= p->gpio_chip.valid_mask[0];
+	if (mask)
+		gpio_rcar_write(p, INEN, gpio_rcar_read(p, INEN) | mask);
+}
+
 static int gpio_rcar_probe(struct platform_device *pdev)
 {
 	struct gpio_rcar_priv *p;
@@ -560,6 +586,12 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
+	if (p->info.has_inen) {
+		pm_runtime_get_sync(p->dev);
+		gpio_rcar_enable_inputs(p);
+		pm_runtime_put(p->dev);
+	}
+
 	dev_info(dev, "driving %d GPIOs\n", npins);
 
 	return 0;
@@ -635,6 +667,9 @@ static int gpio_rcar_resume(struct device *dev)
 		}
 	}
 
+	if (p->info.has_inen)
+		gpio_rcar_enable_inputs(p);
+
 	return 0;
 }
 #endif /* CONFIG_PM_SLEEP*/
-- 
2.25.1

