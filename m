Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4B32629901
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 13:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbiKOMin (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 07:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiKOMim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 07:38:42 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62EF1245
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 04:38:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,165,1665414000"; 
   d="scan'208";a="140115177"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Nov 2022 21:38:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2DE4F421874F;
        Tue, 15 Nov 2022 21:38:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v3 2/3] soc: renesas: Identify RZ/V2M SoC
Date:   Tue, 15 Nov 2022 12:38:26 +0000
Message-Id: <20221115123827.736141-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115123827.736141-1-biju.das.jz@bp.renesas.com>
References: <20221115123827.736141-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Phil Edworthy <phil.edworthy@renesas.com>

Add support for identifying the RZ/V2M (R9A09G011) SoC.
Note that the SoC does not have a identification register.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
[biju: removed config changes ]
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Removed KConfig changes as SoC config already present
 * Fixed an extra space before 'else if' statement.
---
 drivers/soc/renesas/renesas-soc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 621ceaa047d4..468ebce1ea88 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -76,6 +76,10 @@ static const struct renesas_family fam_rzv2l __initconst __maybe_unused = {
 	.name	= "RZ/V2L",
 };
 
+static const struct renesas_family fam_rzv2m __initconst __maybe_unused = {
+	.name	= "RZ/V2M",
+};
+
 static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 	.name	= "SH-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -171,6 +175,10 @@ static const struct renesas_soc soc_rz_v2l __initconst __maybe_unused = {
 	.id     = 0x8447447,
 };
 
+static const struct renesas_soc soc_rz_v2m __initconst __maybe_unused = {
+	.family = &fam_rzv2m,
+};
+
 static const struct renesas_soc soc_rcar_m1a __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen1,
 };
@@ -380,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #if defined(CONFIG_ARCH_R9A07G054)
 	{ .compatible = "renesas,r9a07g054",	.data = &soc_rz_v2l },
 #endif
+#if defined(CONFIG_ARCH_R9A09G011)
+	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
+#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
@@ -405,6 +416,11 @@ static const struct renesas_id id_rzg2l __initconst = {
 	.mask = 0xfffffff,
 };
 
+static const struct renesas_id id_rzv2m __initconst = {
+	.offset = 0x104,
+	.mask = 0xff,
+};
+
 static const struct renesas_id id_prr __initconst = {
 	.offset = 0,
 	.mask = 0xff00,
@@ -415,6 +431,7 @@ static const struct of_device_id renesas_ids[] __initconst = {
 	{ .compatible = "renesas,r9a07g043-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g044-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g054-sysc",	.data = &id_rzg2l },
+	{ .compatible = "renesas,r9a09g011-sys",	.data = &id_rzv2m },
 	{ .compatible = "renesas,prr",			.data = &id_prr },
 	{ /* sentinel */ }
 };
@@ -485,6 +502,11 @@ static int __init renesas_soc_init(void)
 			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%u",
 							   eshi);
 			rev_prefix = "Rev ";
+		} else if (id == &id_rzv2m) {
+			eshi = ((product >> 4) & 0x0f);
+			eslo = product & 0xf;
+			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%u.%u",
+							   eshi, eslo);
 		}
 
 		if (soc->id &&
-- 
2.25.1

