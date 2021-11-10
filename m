Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2587244C8B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbhKJTTK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:10 -0500
Received: from www.zeus03.de ([194.117.254.33]:54994 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231714AbhKJTTJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=a5uQcQa9lL5lZS
        irCGvck0DoBoIRueZn4XJM2bgbYPI=; b=3LG+fFLVUvlJmSF6vanAgSozumsjCV
        YqQuxbwqf0kzbtfYioDOKHxiEUpykRk6x19riypGPj4gebxP1MGjukYost2t6NaK
        Q4HhQPOogbWLSs8N+9V3t0FAqMWcOhrfrZp0tlhmHttNcUYbkmivw3oiL0p2qKjY
        YpjPT6VF4rLhY=
Received: (qmail 722398 invoked from network); 10 Nov 2021 20:16:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:20 +0100
X-UD-Smtp-Session: l3s3148p1@ytSWD3TQ1JogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 03/21] clk: renesas: r8a779a0: add SDnH clock to V3U
Date:   Wed, 10 Nov 2021 20:15:52 +0100
Message-Id: <20211110191610.5664-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently a pass-through clock but we will make it a real divider clock
in the next patches.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since RFC v1:
* added tag from Geert

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

