Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5904C979C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 14:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfHUMpR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 08:45:17 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:44228 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfHUMpR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 08:45:17 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2997D3C04C1;
        Wed, 21 Aug 2019 14:45:14 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Pdu8FHjSrpOt; Wed, 21 Aug 2019 14:45:08 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 1AC493C0012;
        Wed, 21 Aug 2019 14:45:08 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 21 Aug
 2019 14:45:07 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
CC:     Michael Dege <michael.dege@renesas.com>,
        <Andrew_Gabbasov@mentor.com>, <george_davis@mentor.com>,
        <tfranzen@de.adit-jv.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [RFC DO-NOT-MERGE PATCH] arm64: dts: renesas: R8A77961: Add Renesas M3-W+ (M3 ES3.0) SoC support
Date:   Wed, 21 Aug 2019 14:44:41 +0200
Message-ID: <20190821124441.22319-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Similar to the revision update from H3-ES1.x to H3-ES2.0, the update
from M3-ES1.x to M3-ES3.0, in addition to fixing HW bugs/erratas, drops
entire silicon IPs [1-2] (for cost efficiency and other reasons).

However, unlike in the H3 ES1.x->ES2.0 revision update, the M3-ES3.0
came with a new SoC id, i.e. r8a77961 (according to both [2] and
the updated SoC HW manual Rev.2.00 Jul 2019). The choice to allocate a
new identifier seems to strengthen the HW differences between M3-ES1.x
and M3-ES3.0 (as it is the case for M3N/r8a77965).

Given the above, there are several ways to differentiate between
M3-ES1.x and M3-ES3.0:

A. The BSP way [1]. Move/rename r8a7796.dtsi to r8a7796-es1.dtsi and
keep using r8a7796.dtsi for M3-ES3.x.

Pros:
 * Resembles commit 291e0c4994d081 ("arm64: dts: r8a7795: Add support
   for R-Car H3 ES2.0")
 * Reuses the r8a7796 (e.g. sysc, cpg-mssr) drivers for r8a77961 (i.e.
   minimizes the bring-up effort)
Cons:
 * Deliberately diverges from the vendor documentation [2] by
   ignoring the new SoC identifier r8a77961, i.e. leading to
   inconsistencies in the names of the drivers and DTS

B. The approach taken in this patch, i.e. create a brand new
  r8a77961.dtsi (similar to r8a77965.dtsi).

Pros:
 * Reflects the reality documented by HW designers [2]
 * Maintains drivers/DTS naming consistency and avoids mismatch between
   documentation and code
Cons:
 * higher bring-up effort than (A)
 * more discussion is needed on whether it makes sense to separate:
   - DTS only
   - DTS + Kconfig (ARCH_R8A77961)
   - DTS + Kconfig (ARCH_R8A77961) + drivers (sysc, cpg-mssr, other?)

Comments appreciated!

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77961.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
new file mode 100644
index 000000000000..7f784619be32
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the R-Car M3-W+ (R8A77961) ES3.x SoC
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include "r8a7796.dtsi"
+
+/*
+ * Here comes the delta between M3-W (M3 ES1.x) and M3-W+ (M3 ES3.0)
+ * described in:
+ * [1] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=8ba438fd03d5
+ *     ("arm64: dts: r8a7796: Add support for R-Car M3 ES3.0")
+ * [2] [Confidential] Engineering Change Notice for R8A77961
+ */
-- 
2.23.0

