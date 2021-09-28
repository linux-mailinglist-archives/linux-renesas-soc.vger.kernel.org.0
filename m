Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B26841B808
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 22:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242648AbhI1UKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 16:10:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:60798 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242655AbhI1UJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 16:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=LCC3s3F/AEsrPw
        s+Jpx5oCOLBgvia9+3zAivxUwx3KA=; b=m64vu1eiFBh2vPBEU9ALv1gYjavORS
        fNgSjFG4ZuC0oREl/zjyvnNEUxiwmWR6HtqIohhzqmH8PQB2Z74XE7/3IToA+I6B
        WDAgUMh+I+vyuElaFGizq65x82qH2H6F4aRf5npEuXYnE8RFIFA2F7CELBy9rFO9
        r/oRHGmaeViaU=
Received: (qmail 1377281 invoked from network); 28 Sep 2021 22:08:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 22:08:17 +0200
X-UD-Smtp-Session: l3s3148p1@XDQ4xhPNdtIgAwDPXxnDADNsFyRXxb9N
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 3/9] clk: renesas: r8a779a0: add SDnH clock to V3U
Date:   Tue, 28 Sep 2021 22:07:58 +0200
Message-Id: <20210928200804.50922-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently a pass-through clock but we will make it a real divider clock
in the next patches.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index f16d125ca009..fb7f0cf2654a 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -33,6 +33,7 @@ enum rcar_r8a779a0_clk_types {
 	CLK_TYPE_R8A779A0_PLL1,
 	CLK_TYPE_R8A779A0_PLL2X_3X,	/* PLL[23][01] */
 	CLK_TYPE_R8A779A0_PLL5,
+	CLK_TYPE_R8A779A0_SDH,
 	CLK_TYPE_R8A779A0_SD,
 	CLK_TYPE_R8A779A0_MDSEL,	/* Select parent/divider using mode pin */
 	CLK_TYPE_R8A779A0_OSC,	/* OSC EXTAL predivider and fixed divider */
@@ -84,6 +85,9 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define DEF_SDH(_name, _id, _parent, _offset)   \
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SDH, _parent, .offset = _offset)
+
 #define DEF_SD(_name, _id, _parent, _offset)   \
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_SD, _parent, .offset = _offset)
 
@@ -145,7 +149,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cl16mck",	R8A779A0_CLK_CL16MCK,	CLK_PLL1_DIV2,	64, 1),
 
-	DEF_SD("sd0",		R8A779A0_CLK_SD0,	CLK_SDSRC,	0x870),
+	DEF_SDH("sdh0",		R8A779A0_CLK_SD0H,	CLK_SDSRC,	   0x870),
+	DEF_SD( "sd0",		R8A779A0_CLK_SD0,	R8A779A0_CLK_SD0H, 0x870),
 
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
@@ -293,6 +298,10 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 		div = cpg_pll_config->pll5_div;
 		break;
 
+	case CLK_TYPE_R8A779A0_SDH:
+		return cpg_sdh_clk_register(core->name, base + core->offset,
+					   __clk_get_name(parent), notifiers);
+
 	case CLK_TYPE_R8A779A0_SD:
 		return cpg_sd_clk_register(core->name, base, core->offset,
 					   __clk_get_name(parent), notifiers,
-- 
2.30.2

