Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E977F11D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 12:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjKTLUN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 06:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbjKTLTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 06:19:47 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3D710F4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:35 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40859c466efso14931575e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479113; x=1701083913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqTdxNbR3DIWsz90mETj0syANj+j4DLCa1dx7/EKSLU=;
        b=FFiMjGl9DXP9ZUo53s3400ANiQ+OJGY3XLbwLiILiFV9AbFMt6wCcVYc4BoohCzbf4
         Z+60P10VHsScbMoV/s1DShDHhGQmD8rLou4CSKpJysI3/Ie7AA6H3KQaJ3V0Wk9vD9HU
         GoJ9rASMn+Sad3cl9vXzHHvW2bhSzHBP+jplDpgxFixsQKFkWv4T2Z7lthd18fdUZ0U+
         cZpMMeYHmKpXU9tM1VJ+UOwjAdRqwNKUJpOjJQcU78yAaZtxg8Cg/yjGePfalkN/lZRg
         V5P0m+rBn9WP0/etgRYPZz6sj0nFA+ibtjR9GCJNJchfIK1K2e9dGuWj8v95Mb32E36O
         ruJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479113; x=1701083913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqTdxNbR3DIWsz90mETj0syANj+j4DLCa1dx7/EKSLU=;
        b=HO4XyzqEgzPSE67VPnh+lzANRC0VQUE+yB+oPlwF0JqQNlrRlNNfXZ0LT4yjPWcIF2
         cDY7V3aN8ulh9cHq4oKTi3C29YYLf394Gb18aFTP92lDYULtQCh+rFtxBjvAVSQzqbaf
         SpGZZLod/XLDhwvSBEw6lsBdQYkPAd8EA81/vO9Nz6LYW0KmpA9cz0i6zUypqv7KsKuh
         Mpc6vheBNdMjepLpn1FF3IMUQHaOOc0dsZoJq4QlVhbzPB31p0YOE2UhIKoxVsakj/fk
         qSzyJBYXC/eAnypqo1dxgqWJUw8jhC+D4pYFMEYcxHceWjObwIxTIKRvCfgxVN5vf21E
         dxbw==
X-Gm-Message-State: AOJu0YyHps04pifGGZ81KMD5yhA0eE59Fg2QaM06Bq1BKuzBrtOMze1e
        BTDb+1AtiZt7V09B3QUlqOBJZg==
X-Google-Smtp-Source: AGHT+IHgzpzdAPQRoTygB2X9zpY2EXIcjHCka24fPfFIsh88xrSV88jkI8f1ygKOgzJkWwOk1S4GeA==
X-Received: by 2002:a05:600c:4752:b0:406:52f1:7e6f with SMTP id w18-20020a05600c475200b0040652f17e6fmr5869517wmo.12.1700479113644;
        Mon, 20 Nov 2023 03:18:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:33 -0800 (PST)
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
Subject: [PATCH v3 3/9] irqchip/renesas-rzg2l: Align struct member names to tabs
Date:   Mon, 20 Nov 2023 13:18:14 +0200
Message-Id: <20231120111820.87398-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

