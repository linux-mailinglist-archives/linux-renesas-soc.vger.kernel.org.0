Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503A93A2869
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFJJjk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhFJJji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:38 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C57C061226
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by michel.telenet-ops.be with bizsmtp
        id FMde2500J0wnyou06Mdel2; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH86-00FDX5-B7; Thu, 10 Jun 2021 11:37:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTlu-QN; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/14] arm64: dts: renesas: Add Renesas R8A779M3 SoC support
Date:   Thu, 10 Jun 2021 11:37:19 +0200
Message-Id: <2d20f62935bd675f97da2b028b328779c952c94e.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car M3e-2G (R8A779M3) SoC, which is a
different grading of the R-Car M3-W+ (R8A77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

