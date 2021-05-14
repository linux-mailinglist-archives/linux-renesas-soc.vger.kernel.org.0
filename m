Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128213810CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhENT3v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:29:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:59886 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231703AbhENT3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:29:51 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81147966"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2021 04:23:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 611F44010906;
        Sat, 15 May 2021 04:23:32 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 07/16] soc: renesas: Add support to read LSI DEVID register
Date:   Fri, 14 May 2021 20:22:09 +0100
Message-Id: <20210514192218.13022-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for reading the LSI DEVID register which is present on
RZ/G2{L,LC,UL} SoC's.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 0f8eff4a641a..d73389670eef 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -64,7 +64,7 @@ static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 
 struct renesas_soc {
 	const struct renesas_family *family;
-	u8 id;
+	u32 id;
 };
 
 static const struct renesas_soc soc_rz_a1h __initconst __maybe_unused = {
@@ -348,6 +348,25 @@ static int __init renesas_soc_init(void)
 		goto done;
 	}
 
+	np = of_find_compatible_node(NULL, NULL, "renesas,devid");
+	if (np) {
+		chipid = of_iomap(np, 0);
+		of_node_put(np);
+
+		if (chipid) {
+			product = readl(chipid);
+			iounmap(chipid);
+
+			if (soc->id && (product & 0xfffffff) != soc->id) {
+				pr_warn("SoC mismatch (product = 0x%x)\n",
+					product);
+				return -ENODEV;
+			}
+		}
+
+		goto done;
+	}
+
 	/* Try PRR first, then hardcoded fallback */
 	np = of_find_compatible_node(NULL, NULL, "renesas,prr");
 	if (np) {
-- 
2.17.1

