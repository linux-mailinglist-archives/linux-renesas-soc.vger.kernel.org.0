Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD104648BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347728AbhLAHgp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:45 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:19074 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1347640AbhLAHgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:42 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102003005"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:17 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9034541FE291;
        Wed,  1 Dec 2021 16:33:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 07/14] soc: renesas: Identify R-Car S4-8
Date:   Wed,  1 Dec 2021 16:33:01 +0900
Message-Id: <20211201073308.1003945-8-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig       |  7 +++++++
 drivers/soc/renesas/renesas-soc.c | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 59a4106a66e9..2cbd03db2cc7 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -235,6 +235,13 @@ config ARCH_R8A77961
 	  This enables support for the Renesas R-Car M3-W+ SoC.
 	  This includes different gradings like R-Car M3e and M3e-2G.
 
+config ARCH_R8A779F0
+	bool "ARM64 Platform support for R-Car S4-8"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A779F0
+	help
+	  This enables support for the Renesas R-Car S4-8 SoC.
+
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
 	select ARCH_RCAR_GEN3
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 7961b0be1850..ecaa073ea2c4 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -33,6 +33,10 @@ static const struct renesas_family fam_rcar_gen3 __initconst __maybe_unused = {
 	.reg	= 0xfff00044,		/* PRR (Product Register) */
 };
 
+static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
+	.name	= "R-Car Gen4",
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -214,6 +218,11 @@ static const struct renesas_soc soc_rcar_v3u __initconst __maybe_unused = {
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
@@ -319,6 +328,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
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

