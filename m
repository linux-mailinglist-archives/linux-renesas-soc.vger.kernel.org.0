Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262C13EA37C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236835AbhHLLY4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236849AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from newton.telenet-ops.be (newton.telenet-ops.be [IPv6:2a02:1800:120:4::f00:d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4200C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4GlkqF6xBxzMrBb8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 13:24:25 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id gbQR250191gJxCh01bQR5m; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002Fir-HZ; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8ox-00743T-LI; Thu, 12 Aug 2021 13:24:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 07/29] arm64: dts: renesas: Add Renesas R8A779M4 SoC support
Date:   Thu, 12 Aug 2021 13:23:57 +0200
Message-Id: <52aa6dcf6682f54fa2bf53491ef7de5173192a73.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car M3Ne (R8A779M4) SoC, which is a
different grading of the R-Car M3-N (R8A77965) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779m4.dtsi b/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
new file mode 100644
index 0000000000000000..d7fbb6c05502678c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m4.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the R-Car M3Ne (R8A779M4) SoC
+ *
+ * Copyright (C) 2021 Glider bv
+ */
+
+#include "r8a77965.dtsi"
+
+/ {
+	compatible = "renesas,r8a779m4", "renesas,r8a77965";
+};
-- 
2.25.1

