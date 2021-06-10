Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28103A2871
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhFJJjm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbhFJJji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:38 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F24C0611C3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by michel.telenet-ops.be with bizsmtp
        id FMde2500K0wnyou06Mdel3; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDX1-F6; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTlR-No; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/14] soc: renesas: Identify R-Car H3e-2G and M3e-2G
Date:   Thu, 10 Jun 2021 11:37:15 +0200
Message-Id: <8e5f14d720f6462fbbcd2caed26c57f1d81166bb.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the R-Car H3e-2G (R8A779M1) and R-Car M3e-2G
(R8A779M3) SoCs.

As these are different gradings of the already supported R-Car H3 ES3.0
(R8A77951) and M3-W+ (R8A77961) SoCs, support for them is enabled
through the existing ARCH_R8A77951 and ARCH_R8A77961 configuration
symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Question: Should we drop fam_rcar_gen3e and soc_rcar_[hm]3e, and just
	  use the existing soc_rcar_h3 and soc_rcar_m3_w?
---
 drivers/soc/renesas/Kconfig       |  2 ++
 drivers/soc/renesas/renesas-soc.c | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 4fe0247189a615b0..089c7c50e3ca4c3b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -213,6 +213,7 @@ config ARCH_R8A77951
 	help
 	  This enables support for the Renesas R-Car H3 SoC (revisions 2.0 and
 	  later).
+	  This includes different gradings like R-Car H3e-2G.
 
 config ARCH_R8A77965
 	bool "ARM64 Platform support for R-Car M3-N"
@@ -234,6 +235,7 @@ config ARCH_R8A77961
 	select SYSC_R8A77961
 	help
 	  This enables support for the Renesas R-Car M3-W+ SoC.
+	  This includes different gradings like R-Car M3e-2G.
 
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 0f8eff4a641a21b7..2851fd9c44ce8e3f 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -33,6 +33,11 @@ static const struct renesas_family fam_rcar_gen3 __initconst __maybe_unused = {
 	.reg	= 0xfff00044,		/* PRR (Product Register) */
 };
 
+static const struct renesas_family fam_rcar_gen3e __initconst __maybe_unused = {
+	.name	= "R-Car Gen3e",
+	.reg	= 0xfff00044,		/* PRR (Product Register) */
+};
+
 static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
 	.name	= "R-Mobile",
 	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
@@ -205,6 +210,16 @@ static const struct renesas_soc soc_rcar_v3u __initconst __maybe_unused = {
 	.id	= 0x59,
 };
 
+static const struct renesas_soc soc_rcar_h3e __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3e,
+	.id	= 0x4f,
+};
+
+static const struct renesas_soc soc_rcar_m3e __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3e,
+	.id	= 0x52,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -275,11 +290,15 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #if defined(CONFIG_ARCH_R8A77950) || defined(CONFIG_ARCH_R8A77951)
 	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
 #endif
+#ifdef CONFIG_ARCH_R8A77951
+	{ .compatible = "renesas,r8a779m1",	.data = &soc_rcar_h3e },
+#endif
 #ifdef CONFIG_ARCH_R8A77960
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
 #ifdef CONFIG_ARCH_R8A77961
 	{ .compatible = "renesas,r8a77961",	.data = &soc_rcar_m3_w },
+	{ .compatible = "renesas,r8a779m3",	.data = &soc_rcar_m3e },
 #endif
 #ifdef CONFIG_ARCH_R8A77965
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
-- 
2.25.1

