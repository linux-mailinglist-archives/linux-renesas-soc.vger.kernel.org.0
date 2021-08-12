Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFFA3EA372
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236865AbhHLLYx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhHLLYw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:52 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51426C061798
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id gbQQ2501Q1gJxCh01bQRYk; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002Fim-Lq; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-00742t-HO; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 02/29] soc: renesas: Identify more R-Car Gen3e SoCs
Date:   Thu, 12 Aug 2021 13:23:52 +0200
Message-Id: <ccf2206b24147b3d977e4119bbdefaedceb28644.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the remaining R-Car Gen3e SoCs: R-Car H3e
(R8A779M0), M3e (R8A779M2), M3Ne (R8A779M4), M3Ne-2G (R8A779M5), E3e
(R8A779M6), D3e (R8A779M7), and H3Ne (R8A779M8).

As these are different gradings of the already supported R-Car Gen3
SoCs, support for them is enabled through the existing ARCH_R8A779*
configuration symbols.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop new soc_rcar_*3*e, just use the existing soc_rcar_*3*.
---
 drivers/soc/renesas/Kconfig       | 7 +++++--
 drivers/soc/renesas/renesas-soc.c | 7 +++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a736b32555f21904..7f7c8f72d5f2b67a 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -191,6 +191,7 @@ config ARCH_R8A77995
 	select SYSC_R8A77995
 	help
 	  This enables support for the Renesas R-Car D3 SoC.
+	  This includes different gradings like R-Car D3e.
 
 config ARCH_R8A77990
 	bool "ARM64 Platform support for R-Car E3"
@@ -198,6 +199,7 @@ config ARCH_R8A77990
 	select SYSC_R8A77990
 	help
 	  This enables support for the Renesas R-Car E3 SoC.
+	  This includes different gradings like R-Car E3e.
 
 config ARCH_R8A77950
 	bool "ARM64 Platform support for R-Car H3 ES1.x"
@@ -213,7 +215,7 @@ config ARCH_R8A77951
 	help
 	  This enables support for the Renesas R-Car H3 SoC (revisions 2.0 and
 	  later).
-	  This includes different gradings like R-Car H3e-2G.
+	  This includes different gradings like R-Car H3e, H3e-2G, and H3Ne.
 
 config ARCH_R8A77965
 	bool "ARM64 Platform support for R-Car M3-N"
@@ -221,6 +223,7 @@ config ARCH_R8A77965
 	select SYSC_R8A77965
 	help
 	  This enables support for the Renesas R-Car M3-N SoC.
+	  This includes different gradings like R-Car M3Ne and M3Ne-2G.
 
 config ARCH_R8A77960
 	bool "ARM64 Platform support for R-Car M3-W"
@@ -235,7 +238,7 @@ config ARCH_R8A77961
 	select SYSC_R8A77961
 	help
 	  This enables support for the Renesas R-Car M3-W+ SoC.
-	  This includes different gradings like R-Car M3e-2G.
+	  This includes different gradings like R-Car M3e and M3e-2G.
 
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index dab9f5a0aad00233..7961b0be1850922d 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -285,17 +285,22 @@ static const struct of_device_id renesas_socs[] __initconst = {
 	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
 #endif
 #ifdef CONFIG_ARCH_R8A77951
+	{ .compatible = "renesas,r8a779m0",	.data = &soc_rcar_h3 },
 	{ .compatible = "renesas,r8a779m1",	.data = &soc_rcar_h3 },
+	{ .compatible = "renesas,r8a779m8",	.data = &soc_rcar_h3 },
 #endif
 #ifdef CONFIG_ARCH_R8A77960
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
 #ifdef CONFIG_ARCH_R8A77961
 	{ .compatible = "renesas,r8a77961",	.data = &soc_rcar_m3_w },
+	{ .compatible = "renesas,r8a779m2",	.data = &soc_rcar_m3_w },
 	{ .compatible = "renesas,r8a779m3",	.data = &soc_rcar_m3_w },
 #endif
 #ifdef CONFIG_ARCH_R8A77965
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
+	{ .compatible = "renesas,r8a779m4",	.data = &soc_rcar_m3_n },
+	{ .compatible = "renesas,r8a779m5",	.data = &soc_rcar_m3_n },
 #endif
 #ifdef CONFIG_ARCH_R8A77970
 	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
@@ -305,9 +310,11 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #endif
 #ifdef CONFIG_ARCH_R8A77990
 	{ .compatible = "renesas,r8a77990",	.data = &soc_rcar_e3 },
+	{ .compatible = "renesas,r8a779m6",	.data = &soc_rcar_e3 },
 #endif
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
+	{ .compatible = "renesas,r8a779m7",	.data = &soc_rcar_d3 },
 #endif
 #ifdef CONFIG_ARCH_R8A779A0
 	{ .compatible = "renesas,r8a779a0",	.data = &soc_rcar_v3u },
-- 
2.25.1

