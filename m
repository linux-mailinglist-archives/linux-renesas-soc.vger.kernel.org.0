Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05AFC7EC546
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 15:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344236AbjKOO2x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 09:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234980AbjKOO2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 09:28:48 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22224125
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 06:28:45 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9e623356e59so793967866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 06:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058523; x=1700663323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7Hw9o7TS/Xej42E1buaGJPREqe+QW0GFOlVV5jy/SE=;
        b=S6HvP1hgCb0W42VuaJSX4AnA3o0X065CLpwzFxlfTLf0Otyl98ieMSGnaxAgr6oQwT
         EuYE3LKhLEt/v+kWYgmeidwuyAkkoRdrWteUmEn7vD36lf9BiKHRZKGGoI8oxyp4esgB
         w+4O8YOdpYQbgr5A+Zi4bt9PUGmITsNnwJ0xJWWUIbzYOrE3A+jXiVTTxx58CCO5DD8g
         YndBVIhRtAPsbKA7ODTbdGCbzA//wDU6gH0N2iyX7CKEzW2WGLwKMOYoRlS7kDZgq2Lv
         a7j9gVuij6IkbvgLAEANUnazwE8gdjahdryeBQnkfy9uDejMWyhvjWgfBqw62dXq8+Cg
         C2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058523; x=1700663323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Hw9o7TS/Xej42E1buaGJPREqe+QW0GFOlVV5jy/SE=;
        b=AQ6Lq8xULfQezY3iBa3f4Jss6ETOjIfGQBjLWAbTVSVcH6R3Epsl4qzgMA8qNbLeEn
         MtFNeKAux3XmjrJK0wVxe7ebK73CuDnOmdTslmo6lrplKXuu2bG/LLYfDetSOBtt/S4J
         MkknMZ16bp0PdK4jGfob9L1Q1VdTvjOpRcal3wJoXczThOYKU2yC6waELbQNPZTQHMun
         XOpZFzPjFDeuX57RF4WaLrqq6ADJjGu3KeJby2dQSN11fDsWVZxbjFNJ8qHYkazstHAb
         CHT9AFG+Cyfsl4mWNKgPDFN2QjMClxmbw8+z+ACqCnHpaTz+z0HI3n0KalFc9D2kdKT7
         Ov/A==
X-Gm-Message-State: AOJu0YzUMCoaMI9fvQhUH8Sf7C2cTvGQF7PcRm/+BhqkWrtn6frxHjfH
        Ns8c1LculZ7SABmtGJWwTrgSTw==
X-Google-Smtp-Source: AGHT+IE4l9dM5Czih/3QK37kv9B6Zex7R+xmjQUgr3pcKqtHma3uatRNTil9z6jZ7X6iHucmqLcfPQ==
X-Received: by 2002:a17:907:6d15:b0:994:555a:e49f with SMTP id sa21-20020a1709076d1500b00994555ae49fmr13465601ejc.31.1700058523675;
        Wed, 15 Nov 2023 06:28:43 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:43 -0800 (PST)
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
Subject: [PATCH v2 5/9] irqchip/renesas-rzg2l: Document structure members
Date:   Wed, 15 Nov 2023 16:27:45 +0200
Message-Id: <20231115142749.853106-6-claudiu.beznea.uj@bp.renesas.com>
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

Document structure members to follow the requirements specified in
maintainer-tip, section 4.3.7. Struct declarations and initializers.

Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is new

 drivers/irqchip/irq-renesas-rzg2l.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 90971ab06f0c..d666912adc74 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -56,6 +56,12 @@
 #define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
+/**
+ * struct rzg2l_irqc_priv - IRQ controller private data structure
+ * @base: controller's base address
+ * @fwspec: IRQ firmware specific data
+ * @lock: lock to protect concurrent access to hardware registers
+ */
 struct rzg2l_irqc_priv {
 	void __iomem			*base;
 	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
-- 
2.39.2

