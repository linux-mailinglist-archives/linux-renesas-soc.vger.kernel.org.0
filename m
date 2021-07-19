Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE913CE0EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 18:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346417AbhGSPS6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 11:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345666AbhGSPQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 11:16:48 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F88C0AC0D9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 08:10:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by baptiste.telenet-ops.be with bizsmtp
        id X3ek250042WKXR1013ekiB; Mon, 19 Jul 2021 17:38:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLv-000skt-MP; Mon, 19 Jul 2021 17:38:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLu-00Ajkm-Fm; Mon, 19 Jul 2021 17:38:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 02/10] soc: renesas: Identify R-Car H3e-2G and M3e-2G
Date:   Mon, 19 Jul 2021 17:38:33 +0200
Message-Id: <42b4578ab4739cb48ec3aed0a447fc40c34de1e5.1626708063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626708063.git.geert+renesas@glider.be>
References: <cover.1626708063.git.geert+renesas@glider.be>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Drop new fam_rcar_gen3e and soc_rcar_[hm]3e, just use the existing
    soc_rcar_{h3,m3_w},
  - Add Reviewed-by.
---
 drivers/soc/renesas/Kconfig       | 2 ++
 drivers/soc/renesas/renesas-soc.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 71b44c31b012dd24..07e0ecd64319da63 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -208,6 +208,7 @@ config ARCH_R8A77951
 	help
 	  This enables support for the Renesas R-Car H3 SoC (revisions 2.0 and
 	  later).
+	  This includes different gradings like R-Car H3e-2G.
 
 config ARCH_R8A77965
 	bool "ARM64 Platform support for R-Car M3-N"
@@ -229,6 +230,7 @@ config ARCH_R8A77961
 	select SYSC_R8A77961
 	help
 	  This enables support for the Renesas R-Car M3-W+ SoC.
+	  This includes different gradings like R-Car M3e-2G.
 
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 8310fce7714e9d21..dab9f5a0aad00233 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -284,11 +284,15 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #if defined(CONFIG_ARCH_R8A77950) || defined(CONFIG_ARCH_R8A77951)
 	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
 #endif
+#ifdef CONFIG_ARCH_R8A77951
+	{ .compatible = "renesas,r8a779m1",	.data = &soc_rcar_h3 },
+#endif
 #ifdef CONFIG_ARCH_R8A77960
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
 #ifdef CONFIG_ARCH_R8A77961
 	{ .compatible = "renesas,r8a77961",	.data = &soc_rcar_m3_w },
+	{ .compatible = "renesas,r8a779m3",	.data = &soc_rcar_m3_w },
 #endif
 #ifdef CONFIG_ARCH_R8A77965
 	{ .compatible = "renesas,r8a77965",	.data = &soc_rcar_m3_n },
-- 
2.25.1

