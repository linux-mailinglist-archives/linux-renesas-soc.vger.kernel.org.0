Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229A94D9D76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 15:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349050AbiCOO2H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 10:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbiCOO2H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 10:28:07 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD45554FA2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Mar 2022 07:26:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,183,1643641200"; 
   d="scan'208";a="113582333"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Mar 2022 23:26:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AF5874325461;
        Tue, 15 Mar 2022 23:26:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/7] soc: renesas: Identify RZ/G2UL SoC
Date:   Tue, 15 Mar 2022 14:26:39 +0000
Message-Id: <20220315142644.17660-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the RZ/G2UL SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * Changed compatible from r9a07g043u11->r9a07g043.
 * Changed the config from ARCH_R9A07G043U->ARCH_R9A07G043
 * Changed sysc compatible from r9a07g043u-sysc->r9a07g043-sysc
v1->v2:
 * Change compatible from r9a07g043u->r9a07g043u11.
---
 drivers/soc/renesas/Kconfig       |  6 ++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdc99a05a7e0..63477f05fbaf 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -296,6 +296,12 @@ config ARCH_R8A774B1
 	help
 	  This enables support for the Renesas RZ/G2N SoC.
 
+config ARCH_R9A07G043
+	bool "ARM64 Platform support for RZ/G2UL"
+	select ARCH_RZG2L
+	help
+	  This enables support for the Renesas RZ/G2UL SoC variants.
+
 config ARCH_R9A07G044
 	bool "ARM64 Platform support for RZ/G2L"
 	select ARCH_RZG2L
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 92c7b42250ee..30192a099d38 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -64,6 +64,10 @@ static const struct renesas_family fam_rzg2l __initconst __maybe_unused = {
 	.name	= "RZ/G2L",
 };
 
+static const struct renesas_family fam_rzg2ul __initconst __maybe_unused = {
+	.name	= "RZ/G2UL",
+};
+
 static const struct renesas_family fam_rzv2l __initconst __maybe_unused = {
 	.name	= "RZ/V2L",
 };
@@ -148,6 +152,11 @@ static const struct renesas_soc soc_rz_g2l __initconst __maybe_unused = {
 	.id     = 0x841c447,
 };
 
+static const struct renesas_soc soc_rz_g2ul __initconst __maybe_unused = {
+	.family = &fam_rzg2ul,
+	.id     = 0x8450447,
+};
+
 static const struct renesas_soc soc_rz_v2l __initconst __maybe_unused = {
 	.family = &fam_rzv2l,
 	.id     = 0x8447447,
@@ -340,6 +349,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A779F0
 	{ .compatible = "renesas,r8a779f0",	.data = &soc_rcar_s4 },
 #endif
+#if defined(CONFIG_ARCH_R9A07G043)
+	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_g2ul },
+#endif
 #if defined(CONFIG_ARCH_R9A07G044)
 	{ .compatible = "renesas,r9a07g044",	.data = &soc_rz_g2l },
 #endif
@@ -378,6 +390,7 @@ static const struct renesas_id id_prr __initconst = {
 
 static const struct of_device_id renesas_ids[] __initconst = {
 	{ .compatible = "renesas,bsid",			.data = &id_bsid },
+	{ .compatible = "renesas,r9a07g043-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g044-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g054-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,prr",			.data = &id_prr },
-- 
2.17.1

