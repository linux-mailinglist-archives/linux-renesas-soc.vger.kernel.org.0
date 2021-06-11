Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 792233A4338
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 15:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhFKNsw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 09:48:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48059 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230457AbhFKNsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:48:51 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="83958003"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2021 22:46:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BF1BF4274BCF;
        Fri, 11 Jun 2021 22:46:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/6] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
Date:   Fri, 11 Jun 2021 14:46:38 +0100
Message-Id: <20210611134642.24029-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock entries for USB{0,1}.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 04123908511c..2d2bc78b84a2 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -88,6 +88,12 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 	DEF_MOD("dmac",		R9A07G044_CLK_DMAC,
 				R9A07G044_CLK_P1,
 				0x52c, (BIT(0) | BIT(1)), (BIT(0) | BIT(1))),
+	DEF_MOD("usb0",		R9A07G044_CLK_USB0,
+				R9A07G044_CLK_P1,
+				0x578, (BIT(0) | BIT(2) | BIT(3)), (BIT(0) | BIT(2) | BIT(3))),
+	DEF_MOD("usb1",		R9A07G044_CLK_USB1,
+				R9A07G044_CLK_P1,
+				0x578, (BIT(1) | BIT(3)), (BIT(1) | BIT(3))),
 	DEF_MOD("scif0",	R9A07G044_CLK_SCIF0,
 				R9A07G044_CLK_P0,
 				0x584, BIT(0), BIT(0)),
-- 
2.17.1

