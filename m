Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDEE452C05
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhKPHqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:46:03 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231272AbhKPHpr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:47 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100767145"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3D3FA40083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 09/16] soc: renesas: Identify R-Car S4-8
Date:   Tue, 16 Nov 2021 16:41:23 +0900
Message-Id: <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig       |  7 +++++++
 drivers/soc/renesas/renesas-soc.c | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index ce16ef5c939c..9915b953e9a0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -256,6 +256,13 @@ config ARCH_R8A779A0
 	help
 	  This enables support for the Renesas R-Car V3U SoC.
 
+config ARCH_R8A779F0
+	bool "ARM64 Platform support for R-Car S4-8"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A779F0
+	help
+	  This enables support for the Renesas R-Car S4-8 SoC.
+
 config ARCH_R8A774C0
 	bool "ARM64 Platform support for RZ/G2E"
 	select ARCH_RCAR_GEN3
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 7961b0be1850..857a42a82747 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -33,6 +33,11 @@ static const struct renesas_family fam_rcar_gen3 __initconst __maybe_unused = {
 	.reg	= 0xfff00044,		/* PRR (Product Register) */
 };
 
+static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
+	.name	= "R-Car Gen4",
+	.reg	= 0xfff00044,		/* PRR (Product Register) */
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -214,6 +219,11 @@ static const struct renesas_soc soc_rcar_v3u __initconst __maybe_unused = {
 	.id	= 0x59,
 };
 
+static const struct renesas_soc soc_rcar_s4 __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen4,
+	.id	= 0x5a,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -319,6 +329,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A779A0
 	{ .compatible = "renesas,r8a779a0",	.data = &soc_rcar_v3u },
 #endif
+#ifdef CONFIG_ARCH_R8A779F0
+	{ .compatible = "renesas,r8a779f0",	.data = &soc_rcar_s4 },
+#endif
 #if defined(CONFIG_ARCH_R9A07G044)
 	{ .compatible = "renesas,r9a07g044",	.data = &soc_rz_g2l },
 #endif
-- 
2.25.1

