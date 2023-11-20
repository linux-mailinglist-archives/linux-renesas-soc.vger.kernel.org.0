Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA657F11F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 12:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbjKTL2G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 06:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233406AbjKTL1w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 06:27:52 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A35C1708
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:38 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40a5a444c3eso12220465e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479116; x=1701083916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx4aN/zGGPbPx5wuHBwZqoZnjcfUFGnzIbzLn9y7CFM=;
        b=A5lX2XkttnakvOALBo9HgEMO/99tfIMdnWeKfg0aarUCsl1vg4QtB/K3GXZ4Eihxbs
         FJEEZGHTGECduu3sL63UqbAZ33Gp88XgBzSLa4N3WpFSmtKeUX72NTISinjAPnF/pOCx
         bRc5nlxZJ9lZKkipMFdLzo8vfSrmeYcNBbmbqD261Xfa3+k7+kS93Eoum3QHH1YOSIza
         DcSwgdqTXhRfGE+yh8ksTGujHQKs3LfYomnVU2+HQiWc2RUX80siP6PPRd+4auzIpLFF
         U8Y4wC9lsmP5fgCglaAc/kBVdL1P6m07pbiVVUZO4N/y8XfZGpv3NnxIxSzu65xLxWcp
         LhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479116; x=1701083916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx4aN/zGGPbPx5wuHBwZqoZnjcfUFGnzIbzLn9y7CFM=;
        b=PYTUrFrcnQFGaDeo2e1ZYhsDG4lQyO5vHgbMMkRl4NpsbXVB0XG6TF/usw+Ji7c6so
         zLF0SfJcuIs5EuqjvlxxIflmpgCFIRHfGKXrFrcfIakr9FHF5XM1fAGD1y/WIdv460KU
         7CcEuSEU+u2ioLkEXeiqGT4eBp2f+bfznKUBHJZaiGF6xFjkUGMhpsEHOUGYcxTmO1AQ
         DO8e9m0o/c2R8BYSx11VIDEckYh1DT6BVnqXkm8vxzanG5apQojnqE+VC60YonskLulM
         I7DqFp/uw0PnM8r3yYQ4O0OW4ylkg0O7pLn/NRefltGEh/xI+cbZOf/ewg3Hn6XnPAY8
         qFlw==
X-Gm-Message-State: AOJu0YyWXYaj3wE487TThsuTyfQifvyj23CM60U6D+/XWa27LST5B8Au
        Knu3d7f3TF0ZGMKMCLOpMnc6Ww==
X-Google-Smtp-Source: AGHT+IG4q9+CFKWWh1PtV4CMYsm0ublGYiA2GT1Ip89ZJtr+DG+TrKWQY2HA9TpUNmUJDiG8Qb2AvQ==
X-Received: by 2002:a05:600c:a07:b0:409:703c:b9b1 with SMTP id z7-20020a05600c0a0700b00409703cb9b1mr6455336wmp.40.1700479116562;
        Mon, 20 Nov 2023 03:18:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:36 -0800 (PST)
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
Subject: [PATCH v3 5/9] irqchip/renesas-rzg2l: Implement restriction when writing ISCR register
Date:   Mon, 20 Nov 2023 13:18:16 +0200
Message-Id: <20231120111820.87398-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G2L manual (chapter "IRQ Status Control Register (ISCR)") describes
the operation to clear interrupts through the ISCR register as follows:

[Write operation]
When "Falling-edge detection", "Rising-edge detection" or
"Falling/Rising-edge detection" is set in IITSR:
- In case ISTAT is 1
	0: IRQn interrupt detection status is cleared.
	1: Invalid to write.
- In case ISTAT is 0
	Invalid to write.

When “Low-level detection” is set in IITSR.:
	Invalid to write.

Take the interrupt type into account when clearing interrupts through
the ISCR register to avoid writing the ISCR when interrupt type is
level.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index d666912adc74..a77ac6e1606f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -78,11 +78,17 @@ static void rzg2l_irq_eoi(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	u32 bit = BIT(hw_irq);
-	u32 reg;
+	u32 iitsr, iscr;
 
-	reg = readl_relaxed(priv->base + ISCR);
-	if (reg & bit)
-		writel_relaxed(reg & ~bit, priv->base + ISCR);
+	iscr = readl_relaxed(priv->base + ISCR);
+	iitsr = readl_relaxed(priv->base + IITSR);
+
+	/*
+	 * ISCR can only be cleared if the type is falling-edge, rising-edge or
+	 * falling/rising-edge.
+	 */
+	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq)))
+		writel_relaxed(iscr & ~bit, priv->base + ISCR);
 }
 
 static void rzg2l_tint_eoi(struct irq_data *d)
-- 
2.39.2

