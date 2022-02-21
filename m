Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA7A4BDC22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:41:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380280AbiBUQ1r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 11:27:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381116AbiBUQ0d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 11:26:33 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF52A2A273
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 08:25:27 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by andre.telenet-ops.be with bizsmtp
        id xsRN260033YJRAw01sRNEB; Mon, 21 Feb 2022 17:25:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBV3-001TiC-OG; Mon, 21 Feb 2022 17:25:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBV3-006G0d-2O; Mon, 21 Feb 2022 17:25:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rzg2l: Simplify multiplication/shift logic
Date:   Mon, 21 Feb 2022 17:25:20 +0100
Message-Id: <71e1cf2e30fb2d7966fc8ec6bab23eb7e24aa1c4.1645460687.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"a * (1 << b)" == "a << b".

No change in generated code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v5.18.

 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 486d0656c58ac442..1b4c6782a1e8080c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -291,7 +291,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	val1 = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
 	val2 = readl(priv->base + GET_REG_SAMPLL_CLK2(pll_clk->conf));
 	mult = MDIV(val1) + KDIV(val1) / 65536;
-	div = PDIV(val1) * (1 << SDIV(val2));
+	div = PDIV(val1) << SDIV(val2);
 
 	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * mult, div);
 }
-- 
2.25.1

