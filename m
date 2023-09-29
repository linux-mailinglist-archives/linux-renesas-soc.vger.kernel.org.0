Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3197B2B70
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 07:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbjI2FkK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 01:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbjI2Fj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 01:39:57 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1C21B7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:39:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso1765111666b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965970; x=1696570770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnqQLNYZz3xo/Z2CLQzgm+cKizcANRje7hedbfOoLFU=;
        b=Hrado1MyFwyR7mvK71RCyzFzGbXu9MJSQDBMIk2zhzioAc+6XROHOWJB/cBcbuTfUF
         W9Fm6EFk+wf1A5DJSHTmyD1yLcFfzj8xGQQWeoVFGy481cmja3fakRuMwIxflcPE/ApU
         B8wXyUSU73HhUFi4TldIQZmkFSRLHg3zuT9GGd7OkoQYGf6r3Wz3ocGgmOCtOJ41uCUB
         tbGTrSoWpb65wx9bUoj55JsJJO3DN12Bvi6EE3ahDNonoccdVYvf0hN4igMSAq26ka9Y
         syyRKAzK93j3OAhtIpDxdWvlD6oqCH0yT7bA/E3zGxGdTf+fpKUzhNCiG6WLLiQJwwwK
         RmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965970; x=1696570770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnqQLNYZz3xo/Z2CLQzgm+cKizcANRje7hedbfOoLFU=;
        b=rfnSAafA2MOAYJWnAMuwOxUwwuTQG95cdzVd5gZjh3A7xnoVnuCGyCYw3BG4geygqt
         Cgy/+2hfQckOKaWILUWqCe75p5Hnb4JWF9ewqxvn6WYIZ7uVATYKLCssoLDmyTpCoDVi
         P+pTIjPsPPGUtB+FMSeEwpNjJEuror5i6kkR3OegxL7eXGVB7vRnAALheNF77kp4yQRm
         WHq3SViHegMHPwZKr514qH6XBc3NHcbbH/stH6xqiPCvPKmvdP7ava3H4agVAWiN/921
         OpJlo+DtzIcij9CmY6YymafymhHyfNThpvdzkBEK7JDGSFDIJZh0URILIXophVrgm7rb
         G9fg==
X-Gm-Message-State: AOJu0Yy6Jl92oewQVBmXRY5/gd0ZbyY0Jt9y3IYiijZBNPpEztiNG9Jy
        MLm7J7u9RrgRqce+JyU6kr5Zag==
X-Google-Smtp-Source: AGHT+IHQNetWLkVJ62VPE+HyiTqj5WFfnB+Bs5B1knSVeh9ea0t+7zjVn4DhCdK1IlZdfEVAxrGMkQ==
X-Received: by 2002:a17:906:3019:b0:9b2:73b3:29a1 with SMTP id 25-20020a170906301900b009b273b329a1mr3092024ejz.23.1695965969759;
        Thu, 28 Sep 2023 22:39:29 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:29 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea@bp.renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org, arnd@arndb.de,
        neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/28] clk: renesas: rzg2l: fix computation formula
Date:   Fri, 29 Sep 2023 08:38:52 +0300
Message-Id: <20230929053915.1530607-6-claudiu.beznea@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
References: <20230929053915.1530607-1-claudiu.beznea@bp.renesas.com>
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

According to hardware manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf)
the computation formula for PLL rate is as follows:

Fout = ((m + k/65536) * Fin) / (p * 2^s)

and k has values in range [-32768, 32767]. Dividing k by 65536 with
integer variables leads all the time to zero. Thus we may have slight
differences b/w what has been set vs. what is displayed. Thus,
get rid of this and decompose the formula before dividing k by 65536.

Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- used mul_u64_u32_shr()

 drivers/clk/renesas/rzg2l-cpg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 6f50f0329ecf..f411e428196c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -695,18 +695,18 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
 	unsigned int val1, val2;
-	unsigned int mult = 1;
-	unsigned int div = 1;
+	u64 rate;
 
 	if (pll_clk->type != CLK_TYPE_SAM_PLL)
 		return parent_rate;
 
 	val1 = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
 	val2 = readl(priv->base + GET_REG_SAMPLL_CLK2(pll_clk->conf));
-	mult = MDIV(val1) + KDIV(val1) / 65536;
-	div = PDIV(val1) << SDIV(val2);
 
-	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult, div);
+	rate = mul_u64_u32_shr(parent_rate, (MDIV(val1) << 16) + (s16)KDIV(val1),
+			       16 + SDIV(val2));
+
+	return DIV_ROUND_CLOSEST_ULL(rate, PDIV(val1));
 }
 
 static const struct clk_ops rzg2l_cpg_pll_ops = {
-- 
2.39.2

