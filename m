Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9330961C2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 11:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbfGHJNo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:44 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24098 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729726AbfGHJNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 05:13:43 -0400
X-IronPort-AV: E=Sophos;i="5.62,466,1554735600"; 
   d="scan'208";a="20843050"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2019 18:08:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B3EF4219A70;
        Mon,  8 Jul 2019 18:08:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 6/7] pwm: rcar: Add gpio support to output duty zero
Date:   Mon,  8 Jul 2019 18:07:47 +0900
Message-Id: <1562576868-8124-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car SoCs PWM Timer cannot output duty zero. So, this patch
adds gpio support to output it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pwm/pwm-rcar.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index c8cd43f..1c19a8b 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -7,6 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/log2.h>
 #include <linux/math64.h>
@@ -38,6 +39,7 @@ struct rcar_pwm_chip {
 	struct pwm_chip chip;
 	void __iomem *base;
 	struct clk *clk;
+	struct gpio_desc *gpio;
 };
 
 static inline struct rcar_pwm_chip *to_rcar_pwm_chip(struct pwm_chip *chip)
@@ -119,8 +121,11 @@ static int rcar_pwm_set_counter(struct rcar_pwm_chip *rp, int div, int duty_ns,
 	ph = tmp & RCAR_PWMCNT_PH0_MASK;
 
 	/* Avoid prohibited setting */
-	if (cyc == 0 || ph == 0)
+	if (cyc == 0)
 		return -EINVAL;
+	/* Try to use GPIO to output duty zero */
+	if (ph == 0)
+		return -EAGAIN;
 
 	rcar_pwm_write(rp, cyc | ph, RCAR_PWMCNT);
 
@@ -157,6 +162,28 @@ static void rcar_pwm_disable(struct rcar_pwm_chip *rp)
 	rcar_pwm_update(rp, RCAR_PWMCR_EN0, 0, RCAR_PWMCR);
 }
 
+static int rcar_pwm_gpiod_get(struct rcar_pwm_chip *rp)
+{
+	if (rp->gpio)
+		return 0;
+
+	rp->gpio = gpiod_get(rp->chip.dev, "renesas,duty-zero", GPIOD_OUT_LOW);
+	if (!IS_ERR(rp->gpio))
+		return 0;
+
+	rp->gpio = NULL;
+	return -EINVAL;
+}
+
+static void rcar_pwm_gpiod_put(struct rcar_pwm_chip *rp)
+{
+	if (!rp->gpio)
+		return;
+
+	gpiod_put(rp->gpio);
+	rp->gpio = NULL;
+}
+
 static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			  struct pwm_state *state)
 {
@@ -171,6 +198,7 @@ static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	if (!state->enabled) {
 		rcar_pwm_disable(rp);
+		rcar_pwm_gpiod_put(rp);
 		return 0;
 	}
 
@@ -187,8 +215,12 @@ static int rcar_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	/* The SYNC should be set to 0 even if rcar_pwm_set_counter failed */
 	rcar_pwm_update(rp, RCAR_PWMCR_SYNC, 0, RCAR_PWMCR);
 
-	if (!ret)
+	if (!ret) {
 		ret = rcar_pwm_enable(rp);
+		rcar_pwm_gpiod_put(rp);
+	} else if (ret == -EAGAIN) {
+		ret = rcar_pwm_gpiod_get(rp);
+	}
 
 	return ret;
 }
-- 
2.7.4

