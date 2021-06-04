Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B539BF59
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 20:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFDSLb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 14:11:31 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230063AbhFDSLb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 14:11:31 -0400
X-IronPort-AV: E=Sophos;i="5.83,248,1616425200"; 
   d="scan'208";a="83279187"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jun 2021 03:09:44 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 747F840C7B94;
        Sat,  5 Jun 2021 03:09:42 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] soc: renesas: Add support to read LSI DEVID register of RZ/G2{L,LC} SoC's
Date:   Fri,  4 Jun 2021 19:09:32 +0100
Message-Id: <20210604180933.16754-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for reading the LSI DEVID register which is present in
SYSC block of RZ/G2{L,LC} SoC's.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 34 ++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 0f8eff4a641a..e6b21da281ef 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -56,6 +56,11 @@ static const struct renesas_family fam_rzg2 __initconst __maybe_unused = {
 	.reg	= 0xfff00044,		/* PRR (Product Register) */
 };
 
+static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
+	.name	= "RZ/G2L",
+	.reg	= 0x11020a04,
+};
+
 static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 	.name	= "SH-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -64,7 +69,7 @@ static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 
 struct renesas_soc {
 	const struct renesas_family *family;
-	u8 id;
+	u32 id;
 };
 
 static const struct renesas_soc soc_rz_a1h __initconst __maybe_unused = {
@@ -131,6 +136,11 @@ static const struct renesas_soc soc_rz_g2h __initconst __maybe_unused = {
 	.id	= 0x4f,
 };
 
+static const struct renesas_soc soc_rz_g2l __initconst __maybe_unused = {
+	.family = &fam_rzg2l,
+	.id     = 0x841c447,
+};
+
 static const struct renesas_soc soc_rcar_m1a __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen1,
 };
@@ -299,6 +309,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A779A0
 	{ .compatible = "renesas,r8a779a0",	.data = &soc_rcar_v3u },
 #endif
+#if defined(CONFIG_ARCH_R9A07G044)
+	{ .compatible = "renesas,r9a07g044",	.data = &soc_rz_g2l },
+#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
@@ -348,6 +361,25 @@ static int __init renesas_soc_init(void)
 		goto done;
 	}
 
+	np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-sysc");
+	if (np) {
+		of_node_put(np);
+		chipid = ioremap(family->reg, 4);
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

