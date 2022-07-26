Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265DE581B72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 23:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiGZVBS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 17:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbiGZVBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 17:01:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970192CE34
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Oqk3qBo92f99c5
        /6S/phTNbmZQCFAQNIxXe21iUNj6g=; b=Tqni9xmEwQE6ViQ4Mki8Y44uf/RE6b
        i8gOgYh4Uh/tZ9SzQG/xLVRtFg3b7lckji74hTNrqMzyJM9tWaj0oY51NOIxdg4o
        GfobEV3jaEh5FIsqT4DFdu6Go7DHpnwZim237wkEyG/eKHrarrUdnnBPAMQuzneh
        a8EnKWt+r+Zrk=
Received: (qmail 2810258 invoked from network); 26 Jul 2022 23:01:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2022 23:01:14 +0200
X-UD-Smtp-Session: l3s3148p1@kT3MmbvkTVRZzIts
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] clk: renesas: r8a779f0: Add TMU and parent SASYNC clocks
Date:   Tue, 26 Jul 2022 23:01:08 +0200
Message-Id: <20220726210110.1444-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726210110.1444-1-wsa+renesas@sang-engineering.com>
References: <20220726210110.1444-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 89cedd0f504c..6f8c967181f4 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -108,6 +108,11 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED("cbfusa",	R8A779F0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cpex",	R8A779F0_CLK_CPEX,	CLK_EXTAL,	2, 1),
 
+	DEF_FIXED("sasyncrt",	R8A779F0_CLK_SASYNCRT,	CLK_PLL5_DIV4,	48, 1),
+	DEF_FIXED("sasyncperd1", R8A779F0_CLK_SASYNCPERD1, CLK_PLL5_DIV4, 3, 1),
+	DEF_FIXED("sasyncperd2", R8A779F0_CLK_SASYNCPERD2, R8A779F0_CLK_SASYNCPERD1, 2, 1),
+	DEF_FIXED("sasyncperd4", R8A779F0_CLK_SASYNCPERD4, R8A779F0_CLK_SASYNCPERD1, 4, 1),
+
 	DEF_GEN4_SDH("sdh0",	R8A779F0_CLK_SD0H,	CLK_SDSRC,	   0x870),
 	DEF_GEN4_SD("sd0",	R8A779F0_CLK_SD0,	R8A779F0_CLK_SD0H, 0x870),
 
@@ -140,6 +145,11 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("sdhi0",        706,    R8A779F0_CLK_SD0),
 	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
+	DEF_MOD("tmu0",		713,	R8A779F0_CLK_SASYNCRT),
+	DEF_MOD("tmu1",		714,	R8A779F0_CLK_SASYNCPERD2),
+	DEF_MOD("tmu2",		715,	R8A779F0_CLK_SASYNCPERD2),
+	DEF_MOD("tmu3",		716,	R8A779F0_CLK_SASYNCPERD2),
+	DEF_MOD("tmu4",		717,	R8A779F0_CLK_SASYNCPERD2),
 	DEF_MOD("wdt",		907,	R8A779F0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
 	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
-- 
2.35.1

