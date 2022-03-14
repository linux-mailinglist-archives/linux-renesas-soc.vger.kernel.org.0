Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A39F4D8F27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Mar 2022 23:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245422AbiCNWBy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 18:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245421AbiCNWBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 18:01:54 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4083BF8A;
        Mon, 14 Mar 2022 15:00:44 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DE7B083937;
        Mon, 14 Mar 2022 23:00:40 +0100 (CET)
From:   marek.vasut@gmail.com
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] clk: renesas: r8a77965: Add ZG clocks
Date:   Mon, 14 Mar 2022 23:00:12 +0100
Message-Id: <20220314220012.218731-3-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314220012.218731-1-marek.vasut@gmail.com>
References: <20220314220012.218731-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

This patch adds ZG clocks used by the PowerVR GPU.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index d687c29efa3c..854b0173827d 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -80,6 +80,7 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 
 	/* Core Clock Outputs */
 	DEF_GEN3_Z("z",		R8A77965_CLK_Z,		CLK_TYPE_GEN3_Z,  CLK_PLL0, 2, 8),
+	DEF_GEN3_Z("zg",	R8A77965_CLK_ZG,	CLK_TYPE_GEN3_Z,  CLK_PLL4, 2, 0),
 	DEF_FIXED("ztr",	R8A77965_CLK_ZTR,	CLK_PLL1_DIV2,	6, 1),
 	DEF_FIXED("ztrd2",	R8A77965_CLK_ZTRD2,	CLK_PLL1_DIV2,	12, 1),
 	DEF_FIXED("zt",		R8A77965_CLK_ZT,	CLK_PLL1_DIV2,	4, 1),
@@ -126,6 +127,7 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
+	DEF_MOD("3dge",			112,	R8A77965_CLK_ZG),
 	DEF_MOD("fdp1-0",		119,	R8A77965_CLK_S0D1),
 	DEF_MOD("tmu4",			121,	R8A77965_CLK_S0D6),
 	DEF_MOD("tmu3",			122,	R8A77965_CLK_S3D2),
-- 
2.35.1

