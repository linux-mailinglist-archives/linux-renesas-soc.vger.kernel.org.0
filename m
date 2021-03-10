Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19B0333A89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 11:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJKqj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 05:46:39 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:16210 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230450AbhCJKqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 05:46:09 -0500
X-Halon-ID: cd5601ed-818d-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id cd5601ed-818d-11eb-b73f-0050569116f7;
        Wed, 10 Mar 2021 11:46:04 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] clk: renesas: r8a7795: Add TMU clocks
Date:   Wed, 10 Mar 2021 11:45:54 +0100
Message-Id: <20210310104554.3281912-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add TMU{0,1,2,3,4} clocks.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Set TMU4 parent clock to S3D2 for ES1.
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 068018ae3c6e2254..c32d2c678046939d 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -128,6 +128,11 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("fdp1-2",		 117,	R8A7795_CLK_S2D1), /* ES1.x */
 	DEF_MOD("fdp1-1",		 118,	R8A7795_CLK_S0D1),
 	DEF_MOD("fdp1-0",		 119,	R8A7795_CLK_S0D1),
+	DEF_MOD("tmu4",			 121,	R8A7795_CLK_S0D6),
+	DEF_MOD("tmu3",			 122,	R8A7795_CLK_S3D2),
+	DEF_MOD("tmu2",			 123,	R8A7795_CLK_S3D2),
+	DEF_MOD("tmu1",			 124,	R8A7795_CLK_S3D2),
+	DEF_MOD("tmu0",			 125,	R8A7795_CLK_CP),
 	DEF_MOD("scif5",		 202,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif3",		 204,	R8A7795_CLK_S3D4),
@@ -362,6 +367,7 @@ static const unsigned int r8a7795es1_mod_nullify[] __initconst = {
 static const struct mssr_mod_reparent r8a7795es1_mod_reparent[] __initconst = {
 	{ MOD_CLK_ID(118), R8A7795_CLK_S2D1 },	/* FDP1-1 */
 	{ MOD_CLK_ID(119), R8A7795_CLK_S2D1 },	/* FDP1-0 */
+	{ MOD_CLK_ID(121), R8A7795_CLK_S3D2 },	/* TMU4 */
 	{ MOD_CLK_ID(217), R8A7795_CLK_S3D1 },	/* SYS-DMAC2 */
 	{ MOD_CLK_ID(218), R8A7795_CLK_S3D1 },	/* SYS-DMAC1 */
 	{ MOD_CLK_ID(219), R8A7795_CLK_S3D1 },	/* SYS-DMAC0 */
-- 
2.30.1

