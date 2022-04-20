Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06645083D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376901AbiDTIqD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352524AbiDTIpx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:45:53 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B9C63B3EC;
        Wed, 20 Apr 2022 01:43:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="117435987"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:59 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC15D40062B6;
        Wed, 20 Apr 2022 17:42:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 10/15] soc: renesas: Identify R-Car V4H
Date:   Wed, 20 Apr 2022 17:42:50 +0900
Message-Id: <20220420084255.375700-11-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the R-Car V4H (R8A779G0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig       | 7 +++++++
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 422c8da82fad..e94ea3d6dcb0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -247,6 +247,13 @@ config ARCH_R8A779F0
 	help
 	  This enables support for the Renesas R-Car S4-8 SoC.
 
+config ARCH_R8A779G0
+	bool "ARM64 Platform support for R-Car V4H"
+	select ARCH_RCAR_GEN3
+	select SYSC_R8A779G0
+	help
+	  This enables support for the Renesas R-Car V4H SoC.
+
 config ARCH_R8A77980
 	bool "ARM64 Platform support for R-Car V3H"
 	select ARCH_RCAR_GEN3
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 30192a099d38..5b995952a747 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -241,6 +241,11 @@ static const struct renesas_soc soc_rcar_s4 __initconst __maybe_unused = {
 	.id	= 0x5a,
 };
 
+static const struct renesas_soc soc_rcar_v4h __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen4,
+	.id	= 0x5c,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -349,6 +354,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A779F0
 	{ .compatible = "renesas,r8a779f0",	.data = &soc_rcar_s4 },
 #endif
+#ifdef CONFIG_ARCH_R8A779G0
+	{ .compatible = "renesas,r8a779g0",	.data = &soc_rcar_v4h },
+#endif
 #if defined(CONFIG_ARCH_R9A07G043)
 	{ .compatible = "renesas,r9a07g043",	.data = &soc_rz_g2ul },
 #endif
-- 
2.25.1

