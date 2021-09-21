Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC24413058
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 10:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhIUIro (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 04:47:44 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8367 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231201AbhIUIrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.85,310,1624287600"; 
   d="scan'208";a="94677088"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Sep 2021 17:46:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EEAF44004BBA;
        Tue, 21 Sep 2021 17:46:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] arm64: dts: renesas: rzg2l-smarc: Add WM8978 sound codec
Date:   Tue, 21 Sep 2021 09:46:03 +0100
Message-Id: <20210921084605.16250-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add WM8978 sound codec node to RZ/G2L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 8ecc5b45fc99..85fd6dbabff2 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -65,8 +65,15 @@
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
+	clock-frequency = <400000>;
 
 	status = "okay";
+
+	wm8978: codec@1a {
+		compatible = "wlf,wm8978";
+		#sound-dai-cells = <0>;
+		reg = <0x1a>;
+	};
 };
 
 &ohci0 {
-- 
2.17.1

