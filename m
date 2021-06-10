Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75BA3A2863
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhFJJjj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhFJJji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:38 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F108FC0617AE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by albert.telenet-ops.be with bizsmtp
        id FMdf2500J0wnyou06MdfEo; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDX8-NL; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTmH-SG; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/14] arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3e-2G
Date:   Thu, 10 Jun 2021 11:37:22 +0200
Message-Id: <15db05a1ea11c345acb20fda38edeb4ceac8c0e3.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Premier and Kingfisher
combo equipped with an R-Car H3e-2G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r8a779m1-ulcb-kf.dts     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 2a9119c8651815eb..4fa0d56602684faf 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -65,3 +65,4 @@ dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
new file mode 100644
index 0000000000000000..0baebc5c58b06a34
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3e-2G
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77951-ulcb-kf.dts
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ */
+
+#include "r8a779m1-ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas H3ULCB Kingfisher board based on r8a779m1";
+	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
+		     "renesas,r8a779m1", "renesas,r8a7795";
+};
-- 
2.25.1

