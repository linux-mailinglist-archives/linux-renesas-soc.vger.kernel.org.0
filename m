Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F424699FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 16:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345682AbhLFPEr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 10:04:47 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:49581 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1345215AbhLFPEH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 10:04:07 -0500
X-IronPort-AV: E=Sophos;i="5.87,291,1631545200"; 
   d="scan'208";a="102563461"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2021 00:00:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.57])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1C6AF43B6D95;
        Tue,  7 Dec 2021 00:00:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator
Date:   Mon,  6 Dec 2021 15:00:25 +0000
Message-Id: <20211206150025.15703-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
References: <20211206150025.15703-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add vdd core regulator (1.1 V).

This patch add regulator support for gpu.

On the H/W manual nothing mentioned about gpu
regulator. So using vdd core regulator for gpu.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Rb tag from Geert.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index a4fc9517a0de..4ce799314f0f 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -52,6 +52,15 @@
 		regulator-always-on;
 	};
 
+	reg_1p1v: regulator-vdd-core {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.1V";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
@@ -130,6 +139,10 @@
 	clock-frequency = <24000000>;
 };
 
+&gpu {
+	mali-supply = <&reg_1p1v>;
+};
+
 &ostm1 {
 	status = "okay";
 };
-- 
2.17.1

