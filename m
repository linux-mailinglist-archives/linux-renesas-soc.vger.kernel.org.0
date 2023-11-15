Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1C27EC547
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 15:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344065AbjKOO2s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 09:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344193AbjKOO2p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 09:28:45 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E214124
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 06:28:42 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9e1021dbd28so1018866666b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058520; x=1700663320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS8qg7v/mSX4sJHwfdJG3kD1BNBszOYIoRYlKPnXKMg=;
        b=WMPnnI2acNiJvNjPNuDA+Vs3sVYWWVI0Bdpuc2fP1cksMErkEedALjdvXZZY/tQj+N
         HFg/AXnEqPa4w1JSshB6Jt+8Ewp/Hm/ImG31wCHsC3U6RhAWb5OJ6Pt/i0GoLyV1ytrK
         iwdSirriG65i9hFn3k1EBKceH7vBmDoLx82dYhG+FCOxZ91qgy/TRXkq2W8G6LwsN8Py
         ohh3fA7eIlLRLe4JeDwALcls5Rh06xDPS8uztdZ3RJJa+9IUQqbbNJy4R+r5aqiK/E/O
         QenMJcP2P3tiwvOU47rxbnilgxt4O2+zsqpvqBEznALM66r+jBkNcm8Mgti9G3zMkl2d
         g3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058520; x=1700663320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bS8qg7v/mSX4sJHwfdJG3kD1BNBszOYIoRYlKPnXKMg=;
        b=MNa4O3n7U1NoyNjMbkTSJRM9PIElYEAHZFQ5rqHsPV5OVkS0IsOxe/X5sRZVpsCmR7
         5JPKHrf0KPTIn935mVFvuy0fmfk9wCqDJJO9TZHEidwlXdJ0nvPcmYtoY2Ewk+CG7A7G
         0KuqFs/RwbdJJXzqL08i6KvMoFzo3qnslpATnvBoN8NFsFrfcdNcdguTSh4fHB1elbP2
         n+tu7MwDDZ2+oDmN0z1oM51P94Z1JDn7sbt0pxZr/NgpPVGVNoW0I+xBWtMjuZGdQP3g
         RAzlfqbMmbxIEQHQXYJ3K9zFxby6FiG3rp0meCrdZsmxUO8iQofcXIvKS8W1jWT+U+3B
         R2hQ==
X-Gm-Message-State: AOJu0YxJQEkP6kz4SdttlHAB0yK1o+QqrP2OQWqilQU31+zVrRW7YfTM
        TCyCJuqjYYN5mVDHyn7vHPxp0w==
X-Google-Smtp-Source: AGHT+IGIZlRywh2OGv/s0LdNKxDjI8m0OS+PXIUtS7vI+Ud9wErXZJ1cvlvhTpGNnIy1WOH1qrYodQ==
X-Received: by 2002:a17:907:6d0a:b0:9e7:d1ab:e90b with SMTP id sa10-20020a1709076d0a00b009e7d1abe90bmr11336470ejc.19.1700058520716;
        Wed, 15 Nov 2023 06:28:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:40 -0800 (PST)
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
Subject: [PATCH v2 3/9] irqchip/renesas-rzg2l: Use tabs instead of spaces
Date:   Wed, 15 Nov 2023 16:27:43 +0200
Message-Id: <20231115142749.853106-4-claudiu.beznea.uj@bp.renesas.com>
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

Use tabs instead of spaces in definition of TINT_EXTRACT_HWIRQ()
and TINT_EXTRACT_GPIOINT() macros to align with coding style
requirements described in Documentation/process/coding-style.rst,
"Indentation" chapter.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- improved commit description
- used uppercase letter after ":" in patch title

 drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index fe8d516f3614..cc42cbd05762 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -53,8 +53,8 @@
 #define IITSR_IITSEL_EDGE_BOTH		3
 #define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
 
-#define TINT_EXTRACT_HWIRQ(x)           FIELD_GET(GENMASK(15, 0), (x))
-#define TINT_EXTRACT_GPIOINT(x)         FIELD_GET(GENMASK(31, 16), (x))
+#define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
+#define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
 struct rzg2l_irqc_priv {
 	void __iomem *base;
-- 
2.39.2

