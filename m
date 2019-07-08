Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3F361C27
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 11:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729725AbfGHJNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24098 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727065AbfGHJNm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 05:13:42 -0400
X-IronPort-AV: E=Sophos;i="5.62,466,1554735600"; 
   d="scan'208";a="20843042"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2019 18:08:36 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DBCAE4219A70;
        Mon,  8 Jul 2019 18:08:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 2/7] pinctrl: sh-pfc: remove incomplete flag "cfg->type"
Date:   Mon,  8 Jul 2019 18:07:43 +0900
Message-Id: <1562576868-8124-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The old commit c58d9c1b26e3 ("sh-pfc: Implement generic pinconf
support") broke the cfg->type flag to PINMUX_TYPE_FUNCTION because
sh_pfc_pinconf_set() didn't call sh_pfc_reconfig_pin().
Now if we fix the cfg->type condition, it gets worse because:
 - Some drivers might be deferred so that .set_mux() will be called
   multiple times.
 - In such the case, the sh-pfc driver returns -EBUSY even if
   the group is the same, and then that driver fails to probe.

Since the pinctrl subsystem already has such conditions according
to @set_mux and @gpio_request_enable, this patch just remove
the incomplete flag from sh-pfc/pinctrl.c.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 157b257..7e5aca2 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -26,7 +26,6 @@
 #include "../pinconf.h"
 
 struct sh_pfc_pin_config {
-	u32 type;
 	bool mux_set;
 	bool gpio_enabled;
 };
@@ -354,16 +353,6 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	spin_lock_irqsave(&pfc->lock, flags);
 
 	for (i = 0; i < grp->nr_pins; ++i) {
-		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
-		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
-
-		if (cfg->type != PINMUX_TYPE_NONE) {
-			ret = -EBUSY;
-			goto done;
-		}
-	}
-
-	for (i = 0; i < grp->nr_pins; ++i) {
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)
 			goto done;
@@ -395,14 +384,6 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pfc->lock, flags);
 
-	if (cfg->type != PINMUX_TYPE_NONE) {
-		dev_err(pfc->dev,
-			"Pin %u is busy, can't configure it as GPIO.\n",
-			offset);
-		ret = -EBUSY;
-		goto done;
-	}
-
 	if (!pfc->gpio) {
 		/* If GPIOs are handled externally the pin mux type need to be
 		 * set to GPIO here.
@@ -414,7 +395,6 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 			goto done;
 	}
 
-	cfg->type = PINMUX_TYPE_GPIO;
 	cfg->gpio_enabled = true;
 
 	ret = 0;
@@ -436,7 +416,6 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 	unsigned long flags;
 
 	spin_lock_irqsave(&pfc->lock, flags);
-	cfg->type = PINMUX_TYPE_NONE;
 	cfg->gpio_enabled = false;
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
@@ -450,7 +429,6 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	int new_type = input ? PINMUX_TYPE_INPUT : PINMUX_TYPE_OUTPUT;
 	int idx = sh_pfc_get_pin_index(pfc, offset);
 	const struct sh_pfc_pin *pin = &pfc->info->pins[idx];
-	struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
 	unsigned long flags;
 	unsigned int dir;
 	int ret;
@@ -470,8 +448,6 @@ static int sh_pfc_gpio_set_direction(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto done;
 
-	cfg->type = new_type;
-
 done:
 	spin_unlock_irqrestore(&pfc->lock, flags);
 	return ret;
@@ -794,13 +770,11 @@ static int sh_pfc_map_pins(struct sh_pfc *pfc, struct sh_pfc_pinctrl *pmx)
 
 	for (i = 0; i < pfc->info->nr_pins; ++i) {
 		const struct sh_pfc_pin *info = &pfc->info->pins[i];
-		struct sh_pfc_pin_config *cfg = &pmx->configs[i];
 		struct pinctrl_pin_desc *pin = &pmx->pins[i];
 
 		/* If the pin number is equal to -1 all pins are considered */
 		pin->number = info->pin != (u16)-1 ? info->pin : i;
 		pin->name = info->name;
-		cfg->type = PINMUX_TYPE_NONE;
 	}
 
 	return 0;
-- 
2.7.4

