Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17FC3EA394
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236845AbhHLLZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236838AbhHLLYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:54 -0400
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C29C061799
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:28 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4GlkqG2ckMzMrC22
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:24:26 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQS250061gJxCh01bQS5t; Thu, 12 Aug 2021 13:24:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002FjU-Rs; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-00745p-9J; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 25/29] arm64: dts: renesas: Add support for Draak with R-Car D3e
Date:   Thu, 12 Aug 2021 13:24:15 +0200
Message-Id: <78c137e09008d232d4f34fe86cc5a83162ba2393.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas Draak development board equipped with an
R-Car D3e SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../arm64/boot/dts/renesas/r8a779m7-draak.dts | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m7-draak.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index c28c36efa10021c5..6c2810d39f5a7871 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -89,4 +89,6 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77990) += r8a779m6-ebisu.dtb
 
+dtb-$(CONFIG_ARCH_R8A77995) += r8a779m7-draak.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m7-draak.dts b/arch/arm64/boot/dts/renesas/r8a779m7-draak.dts
new file mode 100644
index 0000000000000000..cf9005b32aeb8344
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m7-draak.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Draak board with R-Car D3e
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77995-draak.dts
+ * Copyright (C) 2016-2018 Renesas Electronics Corp.
+ * Copyright (C) 2017 Glider bvba
+ */
+
+/dts-v1/;
+#include "r8a779m7.dtsi"
+#include "draak.dtsi"
+
+/ {
+	model = "Renesas Draak board based on r8a779m7";
+	compatible = "renesas,draak", "renesas,r8a779m7", "renesas,r8a77995";
+};
-- 
2.25.1

