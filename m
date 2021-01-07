Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65B592ED648
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Jan 2021 19:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbhAGSCG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Jan 2021 13:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbhAGSCG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jan 2021 13:02:06 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B258EC0612FB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Jan 2021 10:01:22 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id Du1K2400H4C55Sk01u1Kjp; Thu, 07 Jan 2021 19:01:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxZax-001uqV-CY; Thu, 07 Jan 2021 19:01:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxZaw-008ANW-KY; Thu, 07 Jan 2021 19:01:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779a0: Add SYS-DMAC clocks
Date:   Thu,  7 Jan 2021 19:01:09 +0100
Message-Id: <20210107180109.1946475-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the module clocks used by the Direct Memory Access Controller for
System (SYS-DMAC) instances on the Renesas R-Car V3U (r8a779a0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v5.12

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 7993133983f9d130..3f0a6bf6f9dc8343 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -168,6 +168,8 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
+	DEF_MOD("sydm1",	709,	R8A779A0_CLK_S1D2),
+	DEF_MOD("sydm2",	710,	R8A779A0_CLK_S1D2),
 	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
-- 
2.25.1

