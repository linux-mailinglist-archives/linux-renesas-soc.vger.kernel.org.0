Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A98354CBD6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiCCMOl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:14:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233079AbiCCMOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:14:41 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F048C15678E
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Mar 2022 04:13:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="113048370"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2022 21:13:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2CA5B42F4DB2;
        Thu,  3 Mar 2022 21:13:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/7] soc: renesas: Identify RZ/G2UL SoC
Date:   Thu,  3 Mar 2022 12:13:41 +0000
Message-Id: <20220303121346.4769-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303121346.4769-1-biju.das.jz@bp.renesas.com>
References: <20220303121346.4769-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the RZ/G2UL (R9A07G043U) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig       |  6 ++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fdc99a05a7e0..f81905d86986 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -296,6 +296,12 @@ config ARCH_R8A774B1
 	help
 	  This enables support for the Renesas RZ/G2N SoC.
 
+config ARCH_R9A07G043U
+	bool "ARM64 Platform support for RZ/G2UL"
+	select ARCH_RZG2L
+	help
+	  This enables support for the Renesas RZ/G2UL SoC variants.
+
 config ARCH_R9A07G044
 	bool "ARM64 Platform support for RZ/G2L"
 	select ARCH_RZG2L
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 92c7b42250ee..2138edb1d97c 100644
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
+#if defined(CONFIG_ARCH_R9A07G043U)
+	{ .compatible = "renesas,r9a07g043u",	.data = &soc_rz_g2ul },
+#endif
 #if defined(CONFIG_ARCH_R9A07G044)
 	{ .compatible = "renesas,r9a07g044",	.data = &soc_rz_g2l },
 #endif
@@ -378,6 +390,7 @@ static const struct renesas_id id_prr __initconst = {
 
 static const struct of_device_id renesas_ids[] __initconst = {
 	{ .compatible = "renesas,bsid",			.data = &id_bsid },
+	{ .compatible = "renesas,r9a07g043u-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g044-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a07g054-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,prr",			.data = &id_prr },
-- 
2.17.1

