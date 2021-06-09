Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649343A1B1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 18:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbhFIQjw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 12:39:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:28273 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232146AbhFIQjv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 12:39:51 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83889904"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jun 2021 01:37:55 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 04F3C40A2A52;
        Thu, 10 Jun 2021 01:37:53 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] soc: renesas: Add support to read LSI DEVID register of RZ/G2{L,LC} SoC's
Date:   Wed,  9 Jun 2021 17:37:16 +0100
Message-Id: <20210609163717.3083-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for reading the LSI DEVID register which is present in
SYSC block of RZ/G2{L,LC} SoC's.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 0f8eff4a641a..8310fce7714e 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -56,6 +56,10 @@ static const struct renesas_family fam_rzg2 __initconst __maybe_unused = {
 	.reg	= 0xfff00044,		/* PRR (Product Register) */
 };
 
+static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
+	.name	= "RZ/G2L",
+};
+
 static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 	.name	= "SH-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -64,7 +68,7 @@ static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 
 struct renesas_soc {
 	const struct renesas_family *family;
-	u8 id;
+	u32 id;
 };
 
 static const struct renesas_soc soc_rz_a1h __initconst __maybe_unused = {
@@ -131,6 +135,11 @@ static const struct renesas_soc soc_rz_g2h __initconst __maybe_unused = {
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
@@ -299,6 +308,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A779A0
 	{ .compatible = "renesas,r8a779a0",	.data = &soc_rcar_v3u },
 #endif
+#if defined(CONFIG_ARCH_R9A07G044)
+	{ .compatible = "renesas,r9a07g044",	.data = &soc_rz_g2l },
+#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
@@ -348,6 +360,25 @@ static int __init renesas_soc_init(void)
 		goto done;
 	}
 
+	np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-sysc");
+	if (np) {
+		chipid = of_iomap(np, 0);
+		of_node_put(np);
+
+		if (chipid) {
+			product = readl(chipid + 0x0a04);
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

