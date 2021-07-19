Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581813CE0E8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 18:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347052AbhGSPSq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 11:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345538AbhGSPQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 11:16:47 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B789EC0AC0D8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jul 2021 08:10:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1844:c86f:c84a:fde8])
        by xavier.telenet-ops.be with bizsmtp
        id X3ej2500E2WKXR1013ejKb; Mon, 19 Jul 2021 17:38:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLv-000skv-3u; Mon, 19 Jul 2021 17:38:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m5VLu-00Ajl1-I8; Mon, 19 Jul 2021 17:38:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 04/10] arm64: dts: renesas: Add Renesas R8A779M3 SoC support
Date:   Mon, 19 Jul 2021 17:38:35 +0200
Message-Id: <bbb3131ccdd615b59c46297c2ea37147c7ff84e1.1626708063.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626708063.git.geert+renesas@glider.be>
References: <cover.1626708063.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car M3e-2G (R8A779M3) SoC, which is a
different grading of the R-Car M3-W+ (R8A77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779m3.dtsi b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
new file mode 100644
index 0000000000000000..65bb6188ccf5470a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m3.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the R-Car M3e-2G (R8A779M3) SoC
+ *
+ * Copyright (C) 2021 Glider bv
+ */
+
+#include "r8a77961.dtsi"
+
+/ {
+	compatible = "renesas,r8a779m3", "renesas,r8a77961";
+};
-- 
2.25.1

