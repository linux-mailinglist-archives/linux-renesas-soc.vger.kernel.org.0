Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145662926F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Oct 2020 14:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgJSMGV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Oct 2020 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgJSMGT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 08:06:19 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F611C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2020 05:06:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id ho6G2300K4C55Sk01o6Gfa; Mon, 19 Oct 2020 14:06:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0000WY-N5; Mon, 19 Oct 2020 14:06:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0005mJ-M4; Mon, 19 Oct 2020 14:06:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/6] gpio: rcar: Add support for R-Car V3U
Date:   Mon, 19 Oct 2020 14:06:13 +0200
Message-Id: <20201019120614.22149-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019120614.22149-1-geert+renesas@glider.be>
References: <20201019120614.22149-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phong Hoang <phong.hoang.wz@renesas.com>

Add support for the R-Car V3U (r8a779a0) SoC.
This includes support for the new "General Input Enable" register to
control input enable.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested on actual hardware.

Should input be enabled unconditionally, as recommended by the Hardware
Manual for backwards compatibility with existing software?
As per (errata?) commit ae9550f635533b1c ("gpio-rcar: Use OUTDT when
reading GPIOs configured as output"), the gpio-rcar driver does not use
the INDT register to read the status of a GPIO line when configured for
output.
---
 drivers/gpio/gpio-rcar.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index a924cf8ac8df7f8f..44d09a0028db49e9 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -42,6 +42,7 @@ struct gpio_rcar_priv {
 	atomic_t wakeup_path;
 	bool has_outdtsel;
 	bool has_both_edge_trigger;
+	bool has_inen;
 	struct gpio_rcar_bank_info bank_info;
 };
 
@@ -58,6 +59,7 @@ struct gpio_rcar_priv {
 #define FILONOFF 0x28	/* Chattering Prevention On/Off Register */
 #define OUTDTSEL 0x40	/* Output Data Select Register */
 #define BOTHEDGE 0x4c	/* One Edge/Both Edge Select Register */
+#define INEN 0x50	/* General Input Enable Register */
 
 #define RCAR_MAX_GPIO_PER_BANK		32
 
@@ -126,6 +128,10 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
 	if (p->has_both_edge_trigger)
 		gpio_rcar_modify_bit(p, BOTHEDGE, hwirq, both);
 
+	/* Select "Input Enable" in INEN */
+	if (p->has_inen)
+		gpio_rcar_modify_bit(p, INEN, hwirq, true);
+
 	/* Select "Interrupt Input Mode" in IOINTSEL */
 	gpio_rcar_modify_bit(p, IOINTSEL, hwirq, true);
 
@@ -231,6 +237,10 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	/* Configure positive logic in POSNEG */
 	gpio_rcar_modify_bit(p, POSNEG, gpio, false);
 
+	/* Select "Input Enable/Disable" in INEN */
+	if (p->has_inen)
+		gpio_rcar_modify_bit(p, INEN, gpio, !output);
+
 	/* Select "General Input/Output Mode" in IOINTSEL */
 	gpio_rcar_modify_bit(p, IOINTSEL, gpio, false);
 
@@ -349,16 +359,25 @@ static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
 struct gpio_rcar_info {
 	bool has_outdtsel;
 	bool has_both_edge_trigger;
+	bool has_inen;
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen1 = {
 	.has_outdtsel = false,
 	.has_both_edge_trigger = false,
+	.has_inen = false,
 };
 
 static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
 	.has_outdtsel = true,
 	.has_both_edge_trigger = true,
+	.has_inen = false,
+};
+
+static const struct gpio_rcar_info gpio_rcar_info_v3u = {
+	.has_outdtsel = true,
+	.has_both_edge_trigger = true,
+	.has_inen = true,
 };
 
 static const struct of_device_id gpio_rcar_of_table[] = {
@@ -389,6 +408,9 @@ static const struct of_device_id gpio_rcar_of_table[] = {
 		.compatible = "renesas,gpio-r8a7796",
 		/* Gen3 GPIO is identical to Gen2. */
 		.data = &gpio_rcar_info_gen2,
+	}, {
+		.compatible = "renesas,gpio-r8a779a0",
+		.data = &gpio_rcar_info_v3u,
 	}, {
 		.compatible = "renesas,rcar-gen1-gpio",
 		.data = &gpio_rcar_info_gen1,
@@ -419,6 +441,7 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	info = of_device_get_match_data(p->dev);
 	p->has_outdtsel = info->has_outdtsel;
 	p->has_both_edge_trigger = info->has_both_edge_trigger;
+	p->has_inen = info->has_inen;
 
 	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args);
 	*npins = ret == 0 ? args.args[2] : RCAR_MAX_GPIO_PER_BANK;
-- 
2.17.1

