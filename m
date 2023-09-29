Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9FD7B2B48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 07:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbjI2Fj3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 01:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjI2Fj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 01:39:27 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E841AA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:39:24 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-533d9925094so13647894a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 22:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695965963; x=1696570763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeROYzXT5X0vhWub03MpkUt5t0C3EfcKOwYZPDuBwCY=;
        b=iXjiS5MxM9RIAEPbwtRNcJX+E8z0R0L93eGAAb5VokHuXB7prx9WreoLZ/twhVQ4CT
         fNA7+ur0PJeFCYSBBeTeDkRPMB38/vfDFRTrfff9015aCVhGMHPaOumXhCZSNZipWmjr
         dw4qNcYNa7GOWt1ERRsNBH16MXTivAB7j5B+4E1rveqQI31jtnpddCyKktl49Is9DOaP
         I3DFzKtSKIBnleD5CcZj1HnRULeIz4NtxaZfnQACtMZhPiGvzXIloMVOxX5GN856dzEp
         L/MvpSJVhIbLhJiUq5bHQ75vsN8kfCHVediG64G/tc+bhjCTuwZiNF5J80p4JAiv6UI0
         TWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695965963; x=1696570763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeROYzXT5X0vhWub03MpkUt5t0C3EfcKOwYZPDuBwCY=;
        b=BkEcx1asrPRt3r22zCCoST28DwFD9GoLKWdsaedR6cs1xqwJ76geRf7ltCaNVNTipK
         OzwXAqEr+qReHQdtit4pVs/zmzJO8JQqcgrQQtR12m/XYmc+1E8vETW1Sr/Y2r/PWlb7
         I6fakwEmMkJDr0LlzHWhnsBV5WjMocu7AwA8g/X8C6lILPLC+aigzLmY2ahraXNbIfXo
         TNjbxpy1O4n156Ma/+MP4D46cx6M4sQuHjbd7/COBZvMej8fYL8Tq8szf9RzjFwO0E74
         h9MC2HT8MKN+CGnIGm/OVUQykJ//uJ0unNqbgw57QP7sNCy69SQ9CX8vNUgIyyErqYz7
         dt3Q==
X-Gm-Message-State: AOJu0YyNbU1j/hDiWMvAwOQMeNlEAqCAFfKJ2eDOhoT2oAoVega2OIbF
        QiLJEtDVQCyPyTaUjN52kXhOrQ==
X-Google-Smtp-Source: AGHT+IGADEnpx3heQWFHdL/4NzaHz21fAG/RuwtTOzG7s3wQgRBxCwzfIgq/eWl2F+fu8QtXUo2AmA==
X-Received: by 2002:a17:906:100c:b0:9a2:24f9:fabe with SMTP id 12-20020a170906100c00b009a224f9fabemr3031122ejm.66.1695965963508;
        Thu, 28 Sep 2023 22:39:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm11971992ejd.87.2023.09.28.22.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 22:39:23 -0700 (PDT)
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
Subject: [PATCH v2 02/28] clk: renesas: rzg2l: wait for status bit of SD mux before continuing
Date:   Fri, 29 Sep 2023 08:38:49 +0300
Message-Id: <20230929053915.1530607-3-claudiu.beznea@bp.renesas.com>
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

Hardware user manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf,
chapter 7.4.7 Procedure for Switching Clocks by the Dynamic Switching
Frequency Selectors) specifies that we need to check CPG_PL2SDHI_DSEL for
SD clock switching status.

Fixes: eaff33646f4cb ("clk: renesas: rzg2l: Add SDHI clk mux support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- initialized msk

 drivers/clk/renesas/rzg2l-cpg.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 9baae7bb7094..5343d04fd70d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -188,7 +188,8 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	u32 off = GET_REG_OFFSET(hwdata->conf);
 	u32 shift = GET_SHIFT(hwdata->conf);
 	const u32 clk_src_266 = 2;
-	u32 bitmask;
+	u32 msk, val, bitmask;
+	int ret;
 
 	/*
 	 * As per the HW manual, we should not directly switch from 533 MHz to
@@ -202,14 +203,10 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	 * the index to value mapping is done by adding 1 to the index.
 	 */
 	bitmask = (GENMASK(GET_WIDTH(hwdata->conf) - 1, 0) << shift) << 16;
+	msk = off ? CPG_CLKSTATUS_SELSDHI1_STS : CPG_CLKSTATUS_SELSDHI0_STS;
 	if (index != clk_src_266) {
-		u32 msk, val;
-		int ret;
-
 		writel(bitmask | ((clk_src_266 + 1) << shift), priv->base + off);
 
-		msk = off ? CPG_CLKSTATUS_SELSDHI1_STS : CPG_CLKSTATUS_SELSDHI0_STS;
-
 		ret = readl_poll_timeout(priv->base + CPG_CLKSTATUS, val,
 					 !(val & msk), 100,
 					 CPG_SDHI_CLK_SWITCH_STATUS_TIMEOUT_US);
@@ -221,7 +218,13 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 
 	writel(bitmask | ((index + 1) << shift), priv->base + off);
 
-	return 0;
+	ret = readl_poll_timeout(priv->base + CPG_CLKSTATUS, val,
+				 !(val & msk), 100,
+				 CPG_SDHI_CLK_SWITCH_STATUS_TIMEOUT_US);
+	if (ret)
+		dev_err(priv->dev, "failed to switch clk source\n");
+
+	return ret;
 }
 
 static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
-- 
2.39.2

