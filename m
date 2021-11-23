Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A9645A511
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 15:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237847AbhKWORj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 09:17:39 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:53210 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237798AbhKWORj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:17:39 -0500
X-IronPort-AV: E=Sophos;i="5.87,257,1631545200"; 
   d="scan'208";a="101515735"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2021 23:14:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.159])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C70A1400C45F;
        Tue, 23 Nov 2021 23:14:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable watchdog
Date:   Tue, 23 Nov 2021 14:14:20 +0000
Message-Id: <20211123141420.23529-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123141420.23529-1-biju.das.jz@bp.renesas.com>
References: <20211123141420.23529-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable watchdog{0, 1, 2} interfaces on RZ/G2L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 3bea97f16557..a4fc9517a0de 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -281,3 +281,18 @@
 	status = "okay";
 };
 #endif
+
+&wdt0 {
+	status = "okay";
+	timeout-sec = <60>;
+};
+
+&wdt1 {
+	status = "okay";
+	timeout-sec = <60>;
+};
+
+&wdt2 {
+	status = "okay";
+	timeout-sec = <60>;
+};
-- 
2.17.1

