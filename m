Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C47797F11F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 12:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbjKTL2O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 06:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbjKTL1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 06:27:55 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0968170B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:42 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4084de32db5so17763845e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 03:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479121; x=1701083921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptQiN1S6gJwg7uT81xFHroZyIQZNKxY8fT8PJ58AJo4=;
        b=OJhASzGg2XqGKK19Hd0sGp45Vs86iL1W8HjaiUwfGV8P/Vka4DSYgt1r1AOmkn4DlO
         gI+wWkkOzjP6cUOmw5wNY3/08b/UzRV9Aou/ykcZc4rBDjsvUoKHpPXNRESKnVQx9vOf
         ehrIZPLU0mdkwU2JpGpGsSg1LZ12OglTfB/aWkG29ysw4lF9rxHyhLv9g1aSgiZIYob7
         eBXE01zzMrxySZjZooUTFh/fCjetlJlz1YA8mAZrJs7N26BSC15bZ3V8Elxy/4y4W0NZ
         /5cWKPa4u7brO30VG92uGSEiMUZdImAQw8DhlWNrQemLXxnzCOs6XUIjtmrA0PGOPpjC
         IeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479121; x=1701083921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptQiN1S6gJwg7uT81xFHroZyIQZNKxY8fT8PJ58AJo4=;
        b=tB7OaQtHDaYKPxklBAKvHF2BL63VcReOBAgQv01CJVBhleCh4G4h2z82Y9N6VNMsB6
         Lq1lWgH3G6uqcPJAPGoEn2k8rgHm7hGZbNcJJllh2jsr6f204H7x4aL7aJZ1ZYTvLjIz
         idk4MjqJyshUSFWw5jjp/NPYS4EBQo9LXelN6xKCkVVKtPgt8VmhOmhM3bzT7JaqB8Q/
         fuJPxVTD/qdDwpqxaFx1GbrEzYwEI1iRupE3OexLrnyJi0MUWB0M6L8WjqyNvUjENHwy
         1NBe4qBzgIk7/F5gsue8GBMdGQl3e3ccQs7rc1hZVMELzwqfENlmuBzwaXvQyOfqdUXT
         jjaQ==
X-Gm-Message-State: AOJu0YxwO94h3WKlWL2zfdroIq6nkpx3mK+zA4HP6aFQcGXaAaoJqpTK
        azkRNK0ivMhLI28JMB7oaozY/w==
X-Google-Smtp-Source: AGHT+IFU8rlbSjXZPP5nvJmH/WWhnefTiuKeGPD0GA72G9qNeDNZ4oQXOndWcr4wW3agcRaLHHpDYg==
X-Received: by 2002:a05:600c:4f56:b0:402:8c7e:3fc4 with SMTP id m22-20020a05600c4f5600b004028c7e3fc4mr5606755wmq.30.1700479121095;
        Mon, 20 Nov 2023 03:18:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:40 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 8/9] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3S
Date:   Mon, 20 Nov 2023 13:18:19 +0200
Message-Id: <20231120111820.87398-9-claudiu.beznea.uj@bp.renesas.com>
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

Document RZ/G3S (R9108G045) interrupt controller. This has few extra
functionalities compared with RZ/G2UL but the already existing driver
could still be used.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/interrupt-controller/renesas,rzg2l-irqc.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index 2ef3081eaaf3..d3b5aec0a3f7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043u-irqc   # RZ/G2UL
           - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
           - renesas,r9a07g054-irqc    # RZ/V2L
+          - renesas,r9a08g045-irqc    # RZ/G3S
       - const: renesas,rzg2l-irqc
 
   '#interrupt-cells':
@@ -167,7 +168,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a07g043u-irqc
+            enum:
+              - renesas,r9a07g043u-irqc
+              - renesas,r9a08g045-irqc
     then:
       properties:
         interrupts:
-- 
2.39.2

