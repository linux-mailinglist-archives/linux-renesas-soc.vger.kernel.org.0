Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDE564E2CAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbiCUPqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiCUPqk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:46:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B69B5640E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 08:44:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="114269460"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2022 00:44:42 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 56B044007539;
        Tue, 22 Mar 2022 00:44:41 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 07/14] soc: renesas: Identify RZ/V2M SoC
Date:   Mon, 21 Mar 2022 15:42:25 +0000
Message-Id: <20220321154232.56315-8-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the RZ/V2M (R9A09G011) SoC.
Note that the SoC does not have a identification register.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig       |  5 +++++
 drivers/soc/renesas/renesas-soc.c | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdc99a05a7e0..19a4423490f0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -308,6 +308,11 @@ config ARCH_R9A07G054
 	help
 	  This enables support for the Renesas RZ/V2L SoC variants.
 
+config ARCH_R9A09G011
+	bool "ARM64 Platform support for RZ/V2M"
+	help
+	  This enables support for the Renesas RZ/V2M SoC.
+
 endif # ARM64
 
 config RST_RCAR
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 92c7b42250ee..9df7bbe86381 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -68,6 +68,10 @@ static const struct renesas_family fam_rzv2l __initconst __maybe_unused = {
 	.name	= "RZ/V2L",
 };
 
+static const struct renesas_family fam_rzv2m __initconst __maybe_unused = {
+	.name	= "RZ/V2M",
+};
+
 static const struct renesas_family fam_shmobile __initconst __maybe_unused = {
 	.name	= "SH-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -153,6 +157,10 @@ static const struct renesas_soc soc_rz_v2l __initconst __maybe_unused = {
 	.id     = 0x8447447,
 };
 
+static const struct renesas_soc soc_rz_v2m __initconst __maybe_unused = {
+	.family = &fam_rzv2m,
+};
+
 static const struct renesas_soc soc_rcar_m1a __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen1,
 };
@@ -346,6 +354,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #if defined(CONFIG_ARCH_R9A07G054)
 	{ .compatible = "renesas,r9a07g054",	.data = &soc_rz_v2l },
 #endif
+#if defined(CONFIG_ARCH_R9A09G011)
+	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
+#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
@@ -371,6 +382,11 @@ static const struct renesas_id id_rzg2l __initconst = {
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
@@ -380,6 +396,7 @@ static const struct of_device_id renesas_ids[] __initconst = {
 	{ .compatible = "renesas,bsid",			.data = &id_bsid },
 	{ .compatible = "renesas,r9a07g044-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g054-sysc",	.data = &id_rzg2l },
+	{ .compatible = "renesas,r9a09g011-sys",	.data = &id_rzv2m },
 	{ .compatible = "renesas,prr",			.data = &id_prr },
 	{ /* sentinel */ }
 };
@@ -450,6 +467,11 @@ static int __init renesas_soc_init(void)
 			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%u",
 							   eshi);
 			rev_prefix = "Rev ";
+		}  else if (id == &id_rzv2m) {
+			eshi = ((product >> 4) & 0x0f);
+			eslo = product & 0xf;
+			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%u.%u",
+							   eshi, eslo);
 		}
 
 		if (soc->id &&
-- 
2.32.0

