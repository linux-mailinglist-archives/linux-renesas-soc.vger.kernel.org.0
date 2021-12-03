Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972284676CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380597AbhLCLzj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:55:39 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:30036 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1380596AbhLCLzj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:55:39 -0500
X-IronPort-AV: E=Sophos;i="5.87,284,1631545200"; 
   d="scan'208";a="102302884"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2021 20:52:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.66])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A6DC84016D6B;
        Fri,  3 Dec 2021 20:52:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator
Date:   Fri,  3 Dec 2021 11:51:54 +0000
Message-Id: <20211203115154.31864-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add vdd core regulator (1.1 V).

This patch add regulator support for gpu.

On the H/W manual nothing mentioned about gpu
regulator. So using vdd core regulator for gpu.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 41fdae7ba66b..9112e79079a1 100644
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

