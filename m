Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7B0617FA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Nov 2022 15:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiKCOex (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Nov 2022 10:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKCOew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2022 10:34:52 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5453B10F4
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Nov 2022 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=dgEAshEdGCOMCj
        6DPEiPcajJnsXGXQXKpPYsEthcYTo=; b=Jhje4K4i4IMfHSCbYRrieGqoAfii9u
        WUHaFOIP9HxCGAopOuCxnxV8LsTxBuqZIVtmBQZwVFuYYlUW1hTU02db3Zzii/lY
        SRAfJNJpecBV8VSnTrApZCvvnNbBczzFus7bP0JuFU7wIEIAo0vxNxY+IztAkqrU
        7PFLCrgFhdDHQ=
Received: (qmail 2669729 invoked from network); 3 Nov 2022 15:34:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2022 15:34:48 +0100
X-UD-Smtp-Session: l3s3148p1@tQLy25HsSrUujns0
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/4] clk: renesas: r8a779f0: Fix SCIF parent clocks
Date:   Thu,  3 Nov 2022 15:34:38 +0100
Message-Id: <20221103143440.46449-3-wsa+renesas@sang-engineering.com>
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

As serial communication requires a clean clock signal, the Serial
Communication Interfaces with FIFO (SCIF) is clocked by a clock that is
not affected by Spread Spectrum or Fractional Multiplication.

Hence change the parent clocks for the SCIF modules from the S0D12_PER
clock to the SASYNCPERD4 clock (which has the same clock rate), cfr.
R-Car S4-8 Hardware User's Manual rev. 0.81.

Fixes: 24aaff6a6ce4 ("clk: renesas: cpg-mssr: Add support for R-Car S4-8")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index fd1462425316..800fdc104edd 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -144,10 +144,10 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("msiof3",	621,	R8A779F0_CLK_MSO),
 	DEF_MOD("pcie0",	624,	R8A779F0_CLK_S0D2),
 	DEF_MOD("pcie1",	625,	R8A779F0_CLK_S0D2),
-	DEF_MOD("scif0",	702,	R8A779F0_CLK_S0D12_PER),
-	DEF_MOD("scif1",	703,	R8A779F0_CLK_S0D12_PER),
-	DEF_MOD("scif3",	704,	R8A779F0_CLK_S0D12_PER),
-	DEF_MOD("scif4",	705,	R8A779F0_CLK_S0D12_PER),
+	DEF_MOD("scif0",	702,	R8A779F0_CLK_SASYNCPERD4),
+	DEF_MOD("scif1",	703,	R8A779F0_CLK_SASYNCPERD4),
+	DEF_MOD("scif3",	704,	R8A779F0_CLK_SASYNCPERD4),
+	DEF_MOD("scif4",	705,	R8A779F0_CLK_SASYNCPERD4),
 	DEF_MOD("sdhi0",        706,    R8A779F0_CLK_SD0),
 	DEF_MOD("sys-dmac0",	709,	R8A779F0_CLK_S0D3_PER),
 	DEF_MOD("sys-dmac1",	710,	R8A779F0_CLK_S0D3_PER),
-- 
2.35.1

