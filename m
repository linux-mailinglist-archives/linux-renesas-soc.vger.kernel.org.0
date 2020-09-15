Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C3D26AB9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 20:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgIOSNI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 14:13:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40998 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727962AbgIOSJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 14:09:58 -0400
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; 
   d="scan'208";a="57129186"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Sep 2020 03:09:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD8634006DF6;
        Wed, 16 Sep 2020 03:09:55 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] clk: renesas: rcar-gen3: Update description for RZ/G2
Date:   Tue, 15 Sep 2020 19:09:53 +0100
Message-Id: <20200915180953.2019-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The rcar-gen3-cpg driver is also used on Renesas RZ/G2 SoC's, update the
description for the CLK_RCAR_GEN3_CPG config symbol to reflect this.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
* Updated commit message
* Included RB from Geert
---
 drivers/clk/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 28e8730ce263..1277d5f90389 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -162,7 +162,7 @@ config CLK_RCAR_GEN2_CPG
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_RCAR_GEN3_CPG
-	bool "R-Car Gen3 CPG clock support" if COMPILE_TEST
+	bool "R-Car Gen3 and RZ/G2 CPG clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 
 config CLK_RCAR_USB2_CLOCK_SEL
-- 
2.17.1

