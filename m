Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1F3456350
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhKRTVi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:21:38 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:63244 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231479AbhKRTVh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:21:37 -0500
X-IronPort-AV: E=Sophos;i="5.87,245,1631545200"; 
   d="scan'208";a="100723284"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Nov 2021 04:18:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 077DE40104F8;
        Fri, 19 Nov 2021 04:18:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM
Date:   Thu, 18 Nov 2021 19:18:25 +0000
Message-Id: <20211118191826.2026-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211118191826.2026-1-biju.das.jz@bp.renesas.com>
References: <20211118191826.2026-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable OSTM{1, 2} interfaces on RZ/G2L SMARC EVK.
OSTM0 is reserved for TF-A.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Geert's Rb tag
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 7e84a29dddfa..3bea97f16557 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -130,6 +130,14 @@
 	clock-frequency = <24000000>;
 };
 
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
 &pinctrl {
 	adc_pins: adc {
 		pinmux = <RZG2L_PORT_PINMUX(9, 0, 2)>; /* ADC_TRG */
-- 
2.17.1

