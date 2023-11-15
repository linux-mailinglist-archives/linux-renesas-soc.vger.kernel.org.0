Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 410B97EC541
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 15:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344195AbjKOO2w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 09:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344219AbjKOO2r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 09:28:47 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D013012A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 06:28:43 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so10640362a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 06:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058522; x=1700663322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pSo7A/cRaiiHr3AOQm4+M5MDktXUCdSbdXvZTsugMw=;
        b=FbMGKCdVBK/q1uEdDEwrAoWeS/lS9OowEFqLHnlvNv4Ewt4AsV/5pVZYGD4b96+0ox
         QEs3rZvw6VNRdhlAZz3sBffpCDXASzIdrrVJXk5C+7IzDN7OjEWS/r3bmCZQgVK2nkzz
         3b8JjbnsZCP5ZlGv+2QiJKIF3wIVeSJyGsJzxj/TLV2iID34QKG/nOG9p7bi05Smi9fb
         j+hxqkGvxkwpPmPp3c3hj3RhPuAcJr7fMD68oI+4i3D30+ZhWpxnzMNb+vNv9jvjd6C4
         KJM/YaegGwMUYgxDKF4eaZC0IsP31UER4WpNWfZsxHBYVFIgj8wbxwOw7mtEk3GtZqQc
         PQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058522; x=1700663322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pSo7A/cRaiiHr3AOQm4+M5MDktXUCdSbdXvZTsugMw=;
        b=rYIT1Wb2IWGXjsaMcYmPeb1hEz9T0Z+2Cdnpef5/HI6KUsa117V7UTlrb+KFATHp82
         /a2CYFlU5G7xr1dCx/MBSuTqtAwNkK7zYCsaDA21W+3LGvSykO/vYffNlYjr48WXix3r
         R0MlBS28n1YFnDcYi2k+Ei+xq8guIFW1y7zoTSuCEm7cizy7ft7IRM9tU6bNt/UKY+Ic
         Htd/Bx8ZkEpc+B8yhQE2b+1Q9AYnHqfCyfX4y+QqNBtv77HBrcBXI/JGqn15j3ecrrJn
         lFLSoLd66YUvKPArU62aEbVWrmZGjoN4orGEKgFu5Ft58ojidRs1TidiV0uUFatwzlWE
         16mg==
X-Gm-Message-State: AOJu0YzivrtavCgaiBSz2JFrg3QbZXL+zWyTDbrm2oHAvdy/1B/rOfNc
        kH+PbBskSIdEeY3vVADgMwNJsw==
X-Google-Smtp-Source: AGHT+IFtuAr4bSPIlt3KKN4kkvsZkdii103x3XEI8Hp7Lij+rtSttP7xjPk9knXbTEZyrwKB08gSMw==
X-Received: by 2002:a17:906:a3c9:b0:9ae:74d1:4b45 with SMTP id ca9-20020a170906a3c900b009ae74d14b45mr9891110ejb.65.1700058522289;
        Wed, 15 Nov 2023 06:28:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:41 -0800 (PST)
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
Subject: [PATCH v2 4/9] irqchip/renesas-rzg2l: Align struct member names to tabs
Date:   Wed, 15 Nov 2023 16:27:44 +0200
Message-Id: <20231115142749.853106-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Align struct member names to tabs to follow the requirements from
maintainer-tip file. 3 tabs were used at the moment as the next commits
will add a new member which requires 3 tabs for a better view.

Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new

 drivers/irqchip/irq-renesas-rzg2l.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index cc42cbd05762..90971ab06f0c 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -57,9 +57,9 @@
 #define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
 struct rzg2l_irqc_priv {
-	void __iomem *base;
-	struct irq_fwspec fwspec[IRQC_NUM_IRQ];
-	raw_spinlock_t lock;
+	void __iomem			*base;
+	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
+	raw_spinlock_t			lock;
 };
 
 static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
-- 
2.39.2

