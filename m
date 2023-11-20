Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724F77F11D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 12:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbjKTLUM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 06:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbjKTLTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 06:19:48 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9256010F8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:36 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40859c464daso14943105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479115; x=1701083915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqGjAGh4CKyy6nggCnS+RNoaOYdNw7jP+033IkTDbaA=;
        b=gi15J+HcQvbepVqOCaFZsE+HwH8glyFd9oupueA1mn1Oq+vRSjqaa1uv/XdhRMrPyT
         fN0L6T034H5pcGa0mc8NVYS6fOrayE5w4h6ctbHa8CRWWICl1nAPHDOTwWT4jAKdzy5i
         1oUbXpyj1lTuQTdT2Xk2yVetjhn2Vmn09ZELJqhqMJ8lMHW0pxmDPlYYLahRyxntNtkE
         bawYDs2jLD6yju1VdiGVQK3XeHIp7qxzZa2jvz8PHagrPUZ6X0T4riIhGqNgOkS6Z0+w
         M/M7U1b1A8hhN3ii9lSvobE+CADxbbAhWabaTu3OyZL0Ms0Jc5ZJAVw0RK0fogfFQupW
         9CBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479115; x=1701083915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqGjAGh4CKyy6nggCnS+RNoaOYdNw7jP+033IkTDbaA=;
        b=CAAEw9Emmwasn8O+ApNvBqME1KSGABVRFsG92qUzOQsFpzL1JlV/OQpZ5zex1IXQ7X
         1nnleeJUARUf31Z2VWELX9SWo6pcUb4LF6lnTZZPqoQvc9GWXMxTogdPdvozRGaProHT
         ikClbADSjfXju7mhuHlEyUNfv5B36Ka0HxisGJl7c8D/2NeNe4nwQSgM3ZNIHF01WlAJ
         7ZG0B2g6CancrfK7QyfPnH7uljzWi+GxLUdZv8IbnCuPSeZ9PK5GUQcBc60AgoAiku8g
         cReegNJBd0EhobmzJ0yG7XsWEt5eJH6ShUTbg5pOaJeJ7ib+MaVMpFhDf3ePWcptUVVC
         mThQ==
X-Gm-Message-State: AOJu0YyBILbfUzBqqPGwZrTbWfdrdj4zT0tDsyLbuz/nB6B9RZt8nEnU
        qJrxJXsuFUOEKcULbQ2XvTjTcg==
X-Google-Smtp-Source: AGHT+IFwee0RbxTWFSj/lIhD5S5cVpFwg/mR026a7EYJzWpnZC1lfGCpTao9S2IGVkR3x0ZZ2BBNHg==
X-Received: by 2002:a05:600c:3555:b0:401:b204:3b97 with SMTP id i21-20020a05600c355500b00401b2043b97mr5468250wmq.4.1700479115107;
        Mon, 20 Nov 2023 03:18:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:34 -0800 (PST)
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
Subject: [PATCH v3 4/9] irqchip/renesas-rzg2l: Document structure members
Date:   Mon, 20 Nov 2023 13:18:15 +0200
Message-Id: <20231120111820.87398-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

