Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2658944E2D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 09:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbhKLIND (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 03:13:03 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6127 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233351AbhKLIND (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 03:13:03 -0500
X-IronPort-AV: E=Sophos;i="5.87,228,1631545200"; 
   d="scan'208";a="100048263"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Nov 2021 17:10:11 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3E15A42236BA;
        Fri, 12 Nov 2021 17:10:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/4] clk: renesas: rzg2l: Add CPG_PL1_DDIV macro
Date:   Fri, 12 Nov 2021 08:10:00 +0000
Message-Id: <20211112081003.15453-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112081003.15453-1-biju.das.jz@bp.renesas.com>
References: <20211112081003.15453-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Core clock "I" is sourced from  CPG_PL1_DDIV which controls CPU
frequency. Define CPG_PL1_DDIV, so that we can register it as a
clock divider in later patch.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 484c7cee2629..fce4a8f35410 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -9,6 +9,7 @@
 #ifndef __RENESAS_RZG2L_CPG_H__
 #define __RENESAS_RZG2L_CPG_H__
 
+#define CPG_PL1_DDIV		(0x200)
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
 #define CPG_PL2SDHI_DSEL	(0x218)
@@ -29,6 +30,7 @@
 
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
+#define DIVPL1A		DDIV_PACK(CPG_PL1_DDIV, 0, 2)
 #define DIVPL2A		DDIV_PACK(CPG_PL2_DDIV, 0, 3)
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
-- 
2.17.1

