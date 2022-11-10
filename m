Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B9B6246D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 17:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiKJQYu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 11:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiKJQYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 11:24:49 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 30BE215708
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 08:24:48 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,154,1665414000"; 
   d="scan'208";a="142191733"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2022 01:24:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6838C4006286;
        Fri, 11 Nov 2022 01:24:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 2/3] soc: renesas: Identify RZ/V2M SoC
Date:   Thu, 10 Nov 2022 16:24:42 +0000
Message-Id: <20221110162442.103527-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

