Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1177225F63E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgIGJUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:18 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49605 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728379AbgIGJUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:14 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56565798"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:08 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D1B3840065CD;
        Mon,  7 Sep 2020 18:20:08 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 09/14] soc: renesas: identify R-Car V3U
Date:   Mon,  7 Sep 2020 18:19:45 +0900
Message-Id: <1599470390-29719-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for identifying the R-Car V3U (R8A779A0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/Kconfig       | 6 ++++++
 drivers/soc/renesas/renesas-soc.c | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 7d63a13..e0c39efd 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -272,6 +272,12 @@ config ARCH_R8A77995
 	help
 	  This enables support for the Renesas R-Car D3 SoC.
 
+config ARCH_R8A779A0
+	bool "Renesas R-Car V3U SoC Platform"
+	select ARCH_RCAR_GEN3
+	help
+	  This enables support for the Renesas R-Car V3U SoC.
+
 endif # ARM64
 
 # SoC
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index f815a6a..0f8eff4 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -200,6 +200,11 @@ static const struct renesas_soc soc_rcar_d3 __initconst __maybe_unused = {
 	.id	= 0x58,
 };
 
+static const struct renesas_soc soc_rcar_v3u __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x59,
+};
+
 static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.family	= &fam_shmobile,
 	.id	= 0x37,
@@ -291,6 +296,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
+#ifdef CONFIG_ARCH_R8A779A0
+	{ .compatible = "renesas,r8a779a0",	.data = &soc_rcar_v3u },
+#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
-- 
2.7.4

