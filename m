Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5E2561C28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 11:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbfGHJNn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 05:13:43 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:44370 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728708AbfGHJNn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 05:13:43 -0400
X-IronPort-AV: E=Sophos;i="5.62,466,1554735600"; 
   d="scan'208";a="20628205"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Jul 2019 18:08:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F0AE04219A91;
        Mon,  8 Jul 2019 18:08:36 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linus.walleij@linaro.org, geert+renesas@glider.be,
        thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 3/7] pinctrl: sh-pfc: Rollback to mux if requires when the gpio is freed
Date:   Mon,  8 Jul 2019 18:07:44 +0900
Message-Id: <1562576868-8124-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1562576868-8124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car PWM controller requires the gpio to output zero duty,
this patch allows to roll it back from gpio to mux when the gpio
is freed.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pinctrl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 7e5aca2..bc29066 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -26,6 +26,7 @@
 #include "../pinconf.h"
 
 struct sh_pfc_pin_config {
+	unsigned int mux_mark;
 	bool mux_set;
 	bool gpio_enabled;
 };
@@ -353,6 +354,15 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 	spin_lock_irqsave(&pfc->lock, flags);
 
 	for (i = 0; i < grp->nr_pins; ++i) {
+		int idx = sh_pfc_get_pin_index(pfc, grp->pins[i]);
+		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
+
+		/*
+		 * This doesn't assume the order which gpios are enabled
+		 * and then mux is set.
+		 */
+		WARN_ON(cfg->gpio_enabled);
+
 		ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
 		if (ret < 0)
 			goto done;
@@ -364,6 +374,7 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
 		struct sh_pfc_pin_config *cfg = &pmx->configs[idx];
 
 		cfg->mux_set = true;
+		cfg->mux_mark = grp->mux[i];
 	}
 
 done:
@@ -417,6 +428,9 @@ static void sh_pfc_gpio_disable_free(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pfc->lock, flags);
 	cfg->gpio_enabled = false;
+	/* If mux is already set, this configure it here */
+	if (cfg->mux_set)
+		sh_pfc_config_mux(pfc, cfg->mux_mark, PINMUX_TYPE_FUNCTION);
 	spin_unlock_irqrestore(&pfc->lock, flags);
 }
 
-- 
2.7.4

