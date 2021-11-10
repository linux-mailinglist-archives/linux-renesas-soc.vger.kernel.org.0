Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212EA44BD33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 09:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhKJIpc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 03:45:32 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:28298 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229781AbhKJIpb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:45:31 -0500
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; 
   d="scan'208";a="99779190"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2021 17:42:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DADAE42412DE;
        Wed, 10 Nov 2021 17:42:41 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM
Date:   Wed, 10 Nov 2021 08:42:32 +0000
Message-Id: <20211110084232.652-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110084232.652-1-biju.das.jz@bp.renesas.com>
References: <20211110084232.652-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable OSTM{1, 2} interfaces on RZ/G2L SMARC EVK.
OSTM0 is reserved for TF-A.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

