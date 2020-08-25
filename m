Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC290251A20
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 15:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbgHYNsi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 09:48:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:7784 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725998AbgHYNsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 09:48:37 -0400
X-IronPort-AV: E=Sophos;i="5.76,352,1592838000"; 
   d="scan'208";a="55270482"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Aug 2020 22:48:35 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BD02D4008C5D;
        Tue, 25 Aug 2020 22:48:33 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Add clk entry for VSPR
Date:   Tue, 25 Aug 2020 14:48:06 +0100
Message-Id: <20200825134806.25295-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock entry 130 for VSPR module, so that this module can be used
on R8A7742 (RZ/G1H) SoC.

Note: The entry for VSPR clock was accidentally dropped from RZ/G manual
when all the information related to RT were removed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Similar details can be seen in commit 79ea9934b8df ("ARM: shmobile:
r8a7790: Rename VSP1_(SY|RT) clocks to VSP1_(S|R)") for R-Car H2
---
 drivers/clk/renesas/r8a7742-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7742-cpg-mssr.c b/drivers/clk/renesas/r8a7742-cpg-mssr.c
index e919828668a4..28b24c4e9d7d 100644
--- a/drivers/clk/renesas/r8a7742-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7742-cpg-mssr.c
@@ -97,6 +97,7 @@ static const struct mssr_mod_clk r8a7742_mod_clks[] __initconst = {
 	DEF_MOD("tmu0",			 125,	R8A7742_CLK_CP),
 	DEF_MOD("vsp1du1",		 127,	R8A7742_CLK_ZS),
 	DEF_MOD("vsp1du0",		 128,	R8A7742_CLK_ZS),
+	DEF_MOD("vspr",			 130,	R8A7742_CLK_ZS),
 	DEF_MOD("vsp1-sy",		 131,	R8A7742_CLK_ZS),
 	DEF_MOD("scifa2",		 202,	R8A7742_CLK_MP),
 	DEF_MOD("scifa1",		 203,	R8A7742_CLK_MP),
-- 
2.17.1

