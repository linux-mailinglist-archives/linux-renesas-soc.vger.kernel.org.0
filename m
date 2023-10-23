Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D5F7D2FA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 12:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbjJWKXG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 06:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjJWKXB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 06:23:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84691D65
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:22:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c50906f941so47032351fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056578; x=1698661378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGt7Al+kGOhABFI1AhgrdMNJArcSe/mnGzlQw6oBpxk=;
        b=NJvDDllK2yzaDs0FrM/ZEQD6LofmpNHfAG+9aWyGkAqWIIxI1r5cUOO7fgvJRMelfM
         brH9Hdy7InoU83DTuiVvyRd4qJ/jwWXYB40GdxpNzr//M+qkbeUnTnOCHxGILOh5btRe
         hqI5Ov8fcKWmBpHrvBAA4ZHyxJgPHAhxUfVmvvo5EvV0gGe4MFTzQb4zPV4HgjdYQKz+
         m5sdfeY5dB9CsQgxwVe3ZKotUGgVDqKWY5sp8jtHh2l92wMq/LyvwMiE4RGEPaXIeTdF
         r37maysnm1pjfTQ3ZEp08HRouVZ2axAXm22KLeA+1tcfxRP4NKfIMCZ3mj7KCd/pAXPk
         rUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056578; x=1698661378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGt7Al+kGOhABFI1AhgrdMNJArcSe/mnGzlQw6oBpxk=;
        b=rOGtI87OfSqMdaPa2NR2INDFxs+XrS6cV45xyXZviElxz2Z/fGSaUsP06kJFVbSgDU
         PB5HXaqn9Ci9SAJlqFkAoJQzpnbSq14XcosWJk/X/gnThYTVp+aj5AyVeFZx/N7FvwlL
         WMXMcm0HUrBIQsd4N8lam0wjAf/bxtzLKycPYVmk5KeDp/dBhdV+itv8hi6URHUHqgCS
         s+uUGfwq/DVxgdOqpqdLFq8eLuIhQIV/SVIDn0ucXdoNAHjZFJv/o4gnEpR/ls5WYZWs
         ojlSLlQuOxbYtpAvOP9gxSIhSCl7zfN5TKbq7O5ITFuaWMq/RqFLl9Krksa2uJWdwvLx
         UktQ==
X-Gm-Message-State: AOJu0YwHuHea8YgDrN6XtWxvuQ66Dbh83ILosq/Dcq6BM9xdZnHNfczZ
        UxBVGzKCVWVgLiG1j5sUe/exZw==
X-Google-Smtp-Source: AGHT+IG1A2rjeG7FTf+YUXCRDv4d4+GXzTBYBVrZoCV3GNqvprajomL3vgjcmNNoSlBt50iG/V+nhw==
X-Received: by 2002:a19:8c1c:0:b0:503:2877:67e3 with SMTP id o28-20020a198c1c000000b00503287767e3mr5712726lfd.6.1698056577645;
        Mon, 23 Oct 2023 03:22:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:57 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/7] irqchip/renesas-rzg2l: cache registers on suspend/resume
Date:   Mon, 23 Oct 2023 13:22:21 +0300
Message-Id: <20231023102223.1309614-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Cache registers content when going to suspend and restore them in resume
as these may be lost when switching to deep sleep states. With this
driver data has been marked as static to be able to play with it
in struct syscon_ops::{suspend, resume}. Because IA55 input is from
pin controller and IA55 resumes before pin controller we don't restore
interrupt enable bits here but let the pinctrl to do it on IA55 behalf
after pins are in proper state to avoid invalid interrupts.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 67 +++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 1ed9cb7178fa..e5e158bf028d 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
 #define IRQC_IRQ_COUNT			8
@@ -39,6 +40,7 @@
 
 #define TSSR_OFFSET(n)			((n) % 4)
 #define TSSR_INDEX(n)			((n) / 4)
+#define TSSR_MAX_INDEX			8
 
 #define TITSR_TITSEL_EDGE_RISING	0
 #define TITSR_TITSEL_EDGE_FALLING	1
@@ -57,11 +59,22 @@
 #define TINT_EXTRACT_HWIRQ(x)           FIELD_GET(GENMASK(15, 0), (x))
 #define TINT_EXTRACT_GPIOINT(x)         FIELD_GET(GENMASK(31, 16), (x))
 
-struct rzg2l_irqc_priv {
+/**
+ * struct rzg2l_irqc_reg_cache - register cache
+ * @iitsr: IITSR register
+ * @titsr: TITSR registers
+ */
+struct rzg2l_irqc_reg_cache {
+	u32 iitsr;
+	u32 titsr[2];
+};
+
+static struct rzg2l_irqc_priv {
 	void __iomem *base;
 	struct irq_fwspec fwspec[IRQC_NUM_IRQ];
 	raw_spinlock_t lock;
-};
+	struct rzg2l_irqc_reg_cache cache;
+} priv;
 
 static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
 {
@@ -238,6 +251,37 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
+static int rzg2l_irqc_irq_suspend(void)
+{
+	struct rzg2l_irqc_reg_cache *cache = &priv.cache;
+
+	cache->iitsr = readl_relaxed(priv.base + IITSR);
+	for (u8 i = 0; i < 2; i++)
+		cache->titsr[i] = readl_relaxed(priv.base + TITSR(i));
+
+	return 0;
+}
+
+static void rzg2l_irqc_irq_resume(void)
+{
+	struct rzg2l_irqc_reg_cache *cache = &priv.cache;
+	u8 i;
+
+	/*
+	 * Restore only interrupt type. TSSRx will be restored at the
+	 * request of pin controller to avoid spurious interrupts due
+	 * to invalid PIN states.
+	 */
+	for (i = 0; i < 2; i++)
+		writel_relaxed(cache->titsr[i], priv.base + TITSR(i));
+	writel_relaxed(cache->iitsr, priv.base + IITSR);
+}
+
+static struct syscore_ops rzg2l_irqc_syscore_ops = {
+	.suspend = rzg2l_irqc_irq_suspend,
+	.resume = rzg2l_irqc_irq_resume,
+};
+
 static const struct irq_chip irqc_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
@@ -323,7 +367,6 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	struct irq_domain *irq_domain, *parent_domain;
 	struct platform_device *pdev;
 	struct reset_control *resetn;
-	struct rzg2l_irqc_priv *priv;
 	int ret;
 
 	pdev = of_find_device_by_node(node);
@@ -336,15 +379,11 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv.base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
+	if (IS_ERR(priv.base))
+		return PTR_ERR(priv.base);
 
-	priv->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
-
-	ret = rzg2l_irqc_parse_interrupts(priv, node);
+	ret = rzg2l_irqc_parse_interrupts(&priv, node);
 	if (ret) {
 		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
 		return ret;
@@ -367,17 +406,19 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 		goto pm_disable;
 	}
 
-	raw_spin_lock_init(&priv->lock);
+	raw_spin_lock_init(&priv.lock);
 
 	irq_domain = irq_domain_add_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
 					      node, &rzg2l_irqc_domain_ops,
-					      priv);
+					      &priv);
 	if (!irq_domain) {
 		dev_err(&pdev->dev, "failed to add irq domain\n");
 		ret = -ENOMEM;
 		goto pm_put;
 	}
 
+	register_syscore_ops(&rzg2l_irqc_syscore_ops);
+
 	return 0;
 
 pm_put:
-- 
2.39.2

