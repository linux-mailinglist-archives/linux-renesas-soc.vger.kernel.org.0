Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363CD2A0015
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgJ3IdK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:33:10 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56412 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbgJ3IdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:33:09 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 141BE3C057F;
        Fri, 30 Oct 2020 09:33:06 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PC281Qsg9x3v; Fri, 30 Oct 2020 09:33:00 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 40AE63C0588;
        Fri, 30 Oct 2020 09:31:46 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.94.31) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 09:31:45 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [PATCH v2 2/3] arm64: dts: renesas: r8a77961: ulcb-kf: Initial device tree
Date:   Fri, 30 Oct 2020 09:30:50 +0100
Message-ID: <20201030083051.18752-3-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201030083051.18752-1-erosca@de.adit-jv.com>
References: <20201030083051.18752-1-erosca@de.adit-jv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.94.31]
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Create a dedicated DTB for M3-ES3.0 + ULCB + Kingfisher combo.
Inspire from the pre-existing ULCB-KF device trees:

$ ls -1 arch/arm64/boot/dts/renesas/*ulcb-kf.dts
arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts
arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts
arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

v2: Add "Reviewed-by". No other change.
v1: https://lore.kernel.org/linux-renesas-soc/20201029133741.25721-2-erosca@de.adit-jv.com/
---
 arch/arm64/boot/dts/renesas/Makefile             |  1 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index dffefe030a76..4215b7023d88 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_R8A77960) += r8a77960-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77961) += r8a77961-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
new file mode 100644
index 000000000000..6ec958348eb0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the M3ULCB Kingfisher board
+ *
+ * Copyright (C) 2020 Eugeniu Rosca <rosca.eugeniu@gmail.com>
+ */
+
+#include "r8a77961-ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas M3ULCB Kingfisher board based on r8a77961";
+	compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
+		     "renesas,r8a77961";
+};
-- 
2.29.0

