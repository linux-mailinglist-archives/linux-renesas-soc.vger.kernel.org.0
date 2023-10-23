Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05EF67D2FA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 12:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjJWKXC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 06:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjJWKXA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 06:23:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73384D75
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:22:57 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40850b244beso24450805e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056576; x=1698661376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN/3LO5tvVwfDdWFrwqMG2p+XEYGEFttmBsUPHkc9hE=;
        b=Q8eyWNMVYCFPXdQCKD+uFAz3sNMSJ/bCz/vX3s/eoIsQoPwC16JVibDJtkaXC1GHhW
         3/NzzkFJ8fhj+P6BmeMlvs2eHUvGQlpNTHBwcQ3t5H3Yq7ga78igm/3Kc0MRrIyiVgE2
         b4hwgqR9Yp8/4OOjkf4/C4WjhE3SHTcWJtlH4KBx+Aj5uhmeBTe3oAmCLrgQ7QWPJOKu
         zBANkvXNtdUve7m85YNp6xJZF1zHsUN+S5ABcAnPySUnSvllEmkIu21pDWDQ3g9nLnkC
         2A+bcclW1CZDmBTV4trkJXvq5cp74FsMEAs+MhYU6+icNqWQX9ZdVH1AxZqIUQGv2xGg
         OG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056576; x=1698661376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN/3LO5tvVwfDdWFrwqMG2p+XEYGEFttmBsUPHkc9hE=;
        b=VlbpajHMDIHDOQoCh33M7DISD6YoiGMiaFvrBd3rwEpw2xQ2hWhXjNY1fkovJ5U7WE
         kPSzjpa3K3UVHe35T42gRKxF1rd4EFoWJ6Sr/fFMd8QzFy6GRy9RsVcGkzzPpt67SQlW
         EXaaBPNKXd2eQ6SK2uiALsK8/tNKPEfexGtCQMkZM70DX4GDhjIatC8eHgrfUVXPZ+4v
         EUR/W+ygeWGvYQne92Mfn89c6OzelxBKxmlDnOXlmpHDEeNnxJ3Z6Nxi7WsBQl6Y1+XW
         MKKnbbNPlwBWNMWKmF520/jb+py+xOUkLk4uBZWoOMB3Tte6WDkBIifI1yfdIHotXBH0
         q9MQ==
X-Gm-Message-State: AOJu0YxBM0Ab6E/kgs/EnP8pv4lsNzm4cSp146eTcYjquGZW9nWH5pvs
        gbY0VTumbnanJoyoFhLNK9Lok57d5jIXJUlDKUo=
X-Google-Smtp-Source: AGHT+IGe6Tqmo8KBv27r4U/I4sG811IvcqDvhd8343Xi3gHNdWdtBLdm9FzmPugPuFUNj4KbgtYP1A==
X-Received: by 2002:a05:600c:9a5:b0:406:599f:f934 with SMTP id w37-20020a05600c09a500b00406599ff934mr7577051wmp.12.1698056575778;
        Mon, 23 Oct 2023 03:22:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:55 -0700 (PDT)
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
Subject: [PATCH 4/7] irqchip/renesas-rzg2l: implement restriction when writing ISCR register
Date:   Mon, 23 Oct 2023 13:22:20 +0300
Message-Id: <20231023102223.1309614-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In hardware manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf)
is available the following statement with regards to clearing interrupts
though ISCR register:

[Write operation]
When "Falling-edge detection", "Rising-edge detection" or
"Falling/Rising-edge detection" is set in ISCR.:
- In case ISTAT is 1
	0: IRQn interrupt detection status is cleared.
	1: Invalid to write.
- In case ISTAT is 0
	Invalid to write.
When “Low-level detection” is set in IITSR.:
	Invalid to write.

Thus, take into account interrupt type when clearing interrupts though
ISCR register.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 9ce0d6d67486..1ed9cb7178fa 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -73,11 +73,17 @@ static void rzg2l_irq_eoi(struct irq_data *d)
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
+	 * ISCR could be cleared only if type is falling-edge, rising-edge or
+	 * falling/rising-edge.
+	 */
+	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq)))
+		writel_relaxed(iscr & ~bit, priv->base + ISCR);
 }
 
 static void rzg2l_tint_eoi(struct irq_data *d)
-- 
2.39.2

