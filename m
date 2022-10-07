Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E495F78A5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 15:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJGNKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 09:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiJGNKQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 09:10:16 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59863F31B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 06:10:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by michel.telenet-ops.be with bizsmtp
        id V1A6280035Lh0ZK061A6Pf; Fri, 07 Oct 2022 15:10:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-000uNh-LA; Fri, 07 Oct 2022 15:10:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogn77-00CPMy-9c; Fri, 07 Oct 2022 15:10:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] clk: renesas: r8a779g0: Add TPU clock
Date:   Fri,  7 Oct 2022 15:10:04 +0200
Message-Id: <f2c1e2c5411b7bd6af726e6baf6e1efc354a7cdf.1665147497.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665147497.git.geert+renesas@glider.be>
References: <cover.1665147497.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the module clock used by the 16-Bit Timer Pulse Unit (TPU) on the
Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 1215b6f516ea40c9..5cc5ee1295d9fe68 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -182,6 +182,7 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("scif4",	705,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("sydm0",	709,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("sydm1",	710,	R8A779G0_CLK_S0D6_PER),
+	DEF_MOD("tpu0",		718,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("wdt1:wdt0",	907,	R8A779G0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779G0_CLK_CL16M),
 	DEF_MOD("pfc1",		916,	R8A779G0_CLK_CL16M),
-- 
2.25.1

