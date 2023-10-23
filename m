Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40DFD7D2FAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 12:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbjJWKXN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 06:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjJWKXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 06:23:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0405AD79
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:23:00 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so26919755e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056579; x=1698661379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X82FS37MpATKittBab30iZpigNPQeNpIZ7vC4jhKrjE=;
        b=oIfulWeSARbFBk5Tn2nGzAEftSL4CgvfON24Xo+SOvu/LySpcOe+jLZ6ccebBcYzG9
         zeEFoIVlVK+fr27H+vdzzdlnU2cEvT4BIm6glYWSBfjoH6ja7oHPryMB0TNRucXhXpEZ
         N5SqdOcLieansqETjXiOLitCOPaUog/MIzeF078S1i3v6XqNuthw7BXI0EZQGxKH6cjF
         7VopqMbhfKFkSFBVnDvYnBT5fx00ClgdCsnfSUIjv0/G5631Dj5h5EOzuZPOWOljIhIx
         MTzG8BbY/F3FyXItqvUDzg8ZQsMD09Iw4wamPYaCtX4XjUY/juadb4b+W/miCsRpvet2
         9CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056579; x=1698661379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X82FS37MpATKittBab30iZpigNPQeNpIZ7vC4jhKrjE=;
        b=qUlj+VhReH9aNbamLXvH3gv2PwXTa4aGDc4WjA9qWXa+5KlxvHSC2kIaNzUV/DVh6x
         AqWzLgk/LrUTXRSKmnX6upkjr1OnM0ektg04VTr+NRz/WDw4AEP+oBGNxkD3BETlU6Kh
         PUd1HX+DfqCXdTrzUOllNcV4iCM+/lt218/329uXenHh0nluOoebeuh28rkWZpRB3qvx
         ZA8rfnCfHr+NM3Opo5DTKS4IQ6ajFGylu13AM6hIEAQF1HqxQjyk5Gi7rjnK8H4ZWHT2
         9VorLACVEehViXHaDJNjXYqkyXSItDC0hI3ACNIzCU18CcnWk09202l9TEFXDplD7tpR
         Navg==
X-Gm-Message-State: AOJu0YzjGDnFb3IHzjoY31g1P3hDrCyKp/gUjQRiMRTvZCJ4LUN7DMtU
        z710XBzLE05eJ+Xdrt3mHI/3mQ==
X-Google-Smtp-Source: AGHT+IFljXMqxHrslhD3f5aaczqeFQBtBIQnWV+U2sbvpYvMW9byaeQIqLPtr2IOqZNiNuJ+/np7GA==
X-Received: by 2002:a05:600c:4f86:b0:408:f9ce:56c5 with SMTP id n6-20020a05600c4f8600b00408f9ce56c5mr3226751wmq.24.1698056579471;
        Mon, 23 Oct 2023 03:22:59 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:59 -0700 (PDT)
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
Subject: [PATCH 6/7] irqchip/renesas-rzg2l: use tabs instead of spaces
Date:   Mon, 23 Oct 2023 13:22:22 +0300
Message-Id: <20231023102223.1309614-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
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

Use tabs instead of spaces in definition of TINT_EXTRACT_HWIRQ()
and TINT_EXTRACT_GPIOINT() macros.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index e5e158bf028d..ce50745bba87 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -56,8 +56,8 @@
 #define IITSR_IITSEL_EDGE_BOTH		3
 #define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
 
-#define TINT_EXTRACT_HWIRQ(x)           FIELD_GET(GENMASK(15, 0), (x))
-#define TINT_EXTRACT_GPIOINT(x)         FIELD_GET(GENMASK(31, 16), (x))
+#define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
+#define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
 /**
  * struct rzg2l_irqc_reg_cache - register cache
-- 
2.39.2

