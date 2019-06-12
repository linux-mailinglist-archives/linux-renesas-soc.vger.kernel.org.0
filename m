Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11425428CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 16:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437343AbfFLOZn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 10:25:43 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:57300 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726533AbfFLOZn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 10:25:43 -0400
X-IronPort-AV: E=Sophos;i="5.62,366,1554735600"; 
   d="scan'208";a="18291138"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Jun 2019 23:25:42 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 184DD4009BD1;
        Wed, 12 Jun 2019 23:25:39 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r8a774a1: Add CPU topology on r8a774a1 SoC
Date:   Wed, 12 Jun 2019 15:20:52 +0100
Message-Id: <1560349255-26336-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
References: <1560349255-26336-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds the "cpu-map" into r8a774a1 composed of multi-cluster. This
definition is used to parse the cpu topology.

Based on work by Gaku Inami <gaku.inami.xw@bp.renesas.com> for r8a7796 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 4b1332f..e6ea5a1 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -102,6 +102,32 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a57_0>;
+				};
+				core1 {
+					cpu = <&a57_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a53_0>;
+				};
+				core1 {
+					cpu = <&a53_1>;
+				};
+				core2 {
+					cpu = <&a53_2>;
+				};
+				core3 {
+					cpu = <&a53_3>;
+				};
+			};
+		};
+
 		a57_0: cpu@0 {
 			compatible = "arm,cortex-a57";
 			reg = <0x0>;
-- 
2.7.4

