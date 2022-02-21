Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBBC4BDB64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbiBUQ14 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 11:27:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349795AbiBUQ1v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 11:27:51 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0C5AE49
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 08:27:24 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by laurent.telenet-ops.be with bizsmtp
        id xsTN2600F3YJRAw01sTNCg; Mon, 21 Feb 2022 17:27:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBX0-001Tii-4w; Mon, 21 Feb 2022 17:27:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBWz-006G4O-Jh; Mon, 21 Feb 2022 17:27:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: sh_mmcif: Simplify division/shift logic
Date:   Mon, 21 Feb 2022 17:27:20 +0100
Message-Id: <68d689c39c769d298b53ee8cb9de0e594a2999b2.1645460780.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"a / (1 << b)" == "a >> b".

No change in generated code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/sh_mmcif.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 104dcd702870c423..5f9ebf045b1cb22b 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -521,8 +521,7 @@ static void sh_mmcif_clock_control(struct sh_mmcif_host *host, unsigned int clk)
 		}
 
 		dev_dbg(dev, "clk %u/%u (%u, 0x%x)\n",
-			(best_freq / (1 << (clkdiv + 1))), clk,
-			best_freq, clkdiv);
+			(best_freq >> (clkdiv + 1)), clk, best_freq, clkdiv);
 
 		clk_set_rate(host->clk, best_freq);
 		clkdiv = clkdiv << 16;
@@ -1012,8 +1011,8 @@ static void sh_mmcif_clk_setup(struct sh_mmcif_host *host)
 		 */
 		host->clkdiv_map = 0x3ff;
 
-		host->mmc->f_max = f_max / (1 << ffs(host->clkdiv_map));
-		host->mmc->f_min = f_min / (1 << fls(host->clkdiv_map));
+		host->mmc->f_max = f_max >> ffs(host->clkdiv_map);
+		host->mmc->f_min = f_min >> fls(host->clkdiv_map);
 	} else {
 		unsigned int clk = clk_get_rate(host->clk);
 
-- 
2.25.1

