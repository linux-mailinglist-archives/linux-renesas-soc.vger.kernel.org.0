Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE0F34A6BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 13:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCZMC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 08:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhCZMCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 08:02:22 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84CBC0613B8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 05:02:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by albert.telenet-ops.be with bizsmtp
        id l02F2400Q53vE1T0602FDY; Fri, 26 Mar 2021 13:02:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAN-00AXLW-6o; Fri, 26 Mar 2021 13:02:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-006cQe-Cp; Fri, 26 Mar 2021 13:02:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/7] clk: renesas: rcar-gen3: Increase Z clock accuracy
Date:   Fri, 26 Mar 2021 13:00:58 +0100
Message-Id: <20210326120100.1577596-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Improve accuracy in the .determine_rate() callback for Z and Z2 clocks
by using rounded divisions.  This is similar to the calculation of rates
and multipliers in the .recalc_rate() resp. set_rate() callbacks.

Sample impact for a few requested clock rates:
  - R-Car H3:
      - Z 500 MHz:	468 MHz => 515 MHz
      - Z2 1000 MHz:	973 MHz => 1011 MHz
  - R-Car M3-W:
      - Z 500 MHz:	422 MHz => 516 MHz
      - Z2 800 MHz:	750 MHz => 788 MHz

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index a241bf6e904f2f66..6b389c1caca76f07 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -83,10 +83,10 @@ static int cpg_z_clk_determine_rate(struct clk_hw *hw,
 	if (max_mult < min_mult)
 		return -EINVAL;
 
-	mult = div64_ul(req->rate * 32ULL, prate);
+	mult = DIV_ROUND_CLOSEST_ULL(req->rate * 32ULL, prate);
 	mult = clamp(mult, min_mult, max_mult);
 
-	req->rate = div_u64((u64)prate * mult, 32);
+	req->rate = DIV_ROUND_CLOSEST_ULL((u64)prate * mult, 32);
 	return 0;
 }
 
-- 
2.25.1

