Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99ACA617FA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 15:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiKCOey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 10:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiKCOew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 10:34:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0842810CC
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=orkNEf9kPZldLA
        xy6kIaP839kSl1JZQ0OMEJQibLxVc=; b=VTPfQERg8y/fMuuxnBMv5CUg42oS0n
        RRzGzsegTpkSE/yZxeJ8CraIVFSv8S1VW3N5/S0ZNWMNy7ksEF76bn2sUraGzEUT
        lYqbldAtC2WAMuwS8i70SlQUPG3jbAliyZUR5gMZFlxvCLpHnszR6XtROY/pIGvn
        B0EaAwvItf/6g=
Received: (qmail 2669704 invoked from network); 3 Nov 2022 15:34:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2022 15:34:47 +0100
X-UD-Smtp-Session: l3s3148p1@Pafm25HsQLUujns0
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/4] clk: renesas: r8a779f0: Fix HSCIF parent clocks
Date:   Thu,  3 Nov 2022 15:34:37 +0100
Message-Id: <20221103143440.46449-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221103143440.46449-1-wsa+renesas@sang-engineering.com>
References: <20221103143440.46449-1-wsa+renesas@sang-engineering.com>
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

As serial communication requires a clean clock signal, the High Speed
Serial Communication Interfaces with FIFO (HSCIF) is clocked by a clock
that is not affected by Spread Spectrum or Fractional Multiplication.

Hence change the parent clocks for the HSCIF modules from the S0D3_PER
clock to the SASYNCPERD1 clock (which has the same clock rate), cfr.
R-Car S4-8 Hardware User's Manual rev. 0.81.

Fixes: 080bcd8d5997 ("clk: renesas: r8a779f0: Add HSCIF clocks")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index e4f2bbbfeb2d..fd1462425316 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -128,10 +128,10 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
-	DEF_MOD("hscif0",	514,	R8A779F0_CLK_S0D3),
-	DEF_MOD("hscif1",	515,	R8A779F0_CLK_S0D3),
-	DEF_MOD("hscif2",	516,	R8A779F0_CLK_S0D3),
-	DEF_MOD("hscif3",	517,	R8A779F0_CLK_S0D3),
+	DEF_MOD("hscif0",	514,	R8A779F0_CLK_SASYNCPERD1),
+	DEF_MOD("hscif1",	515,	R8A779F0_CLK_SASYNCPERD1),
+	DEF_MOD("hscif2",	516,	R8A779F0_CLK_SASYNCPERD1),
+	DEF_MOD("hscif3",	517,	R8A779F0_CLK_SASYNCPERD1),
 	DEF_MOD("i2c0",		518,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("i2c1",		519,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("i2c2",		520,	R8A779F0_CLK_S0D6_PER),
-- 
2.35.1

