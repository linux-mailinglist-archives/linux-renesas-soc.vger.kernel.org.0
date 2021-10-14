Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF99842DBF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 16:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhJNOqW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 10:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhJNOqW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 10:46:22 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375DFC061570
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Oct 2021 07:44:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:ad48:4534:27c0:db4b])
        by xavier.telenet-ops.be with bizsmtp
        id 5qkE2600L0SQF6f01qkE6A; Thu, 14 Oct 2021 16:44:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mb1xu-004qMm-2D; Thu, 14 Oct 2021 16:44:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mb1xt-004Abq-Hx; Thu, 14 Oct 2021 16:44:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add missing camera regulators
Date:   Thu, 14 Oct 2021 16:44:12 +0200
Message-Id: <300149c730931914b77e17df6bcce89b67c3005f.1634222546.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make dtbs_check:

    arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'AVDD-supply' is a required property
	    From schema: Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
    arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'DVDD-supply' is a required property
	    From schema: Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
    arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dt.yaml: ov5640@3c: 'DOVDD-supply' is a required property
	    From schema: Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml

Fix this by describing the missing regulators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
[PATCH v2 27/52] dt-bindings: media: Convert OV5640 binding to a schema
https://lore.kernel.org/all/20210901091852.479202-28-maxime@cerno.tech/
---
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts  | 16 ++++++++++++++++
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi    |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 7e7b1028108dd133..75258f480a99a57c 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -44,6 +44,22 @@ mclk_cam4: mclk-cam4 {
 		#clock-cells = <0>;
 		clock-frequency = <26000000>;
 	};
+
+	reg_1p8v: 1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_2p8v: 2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
 };
 
 &avb {
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
index 70c72ba4fe724a70..40cef0b1d1e6267f 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
@@ -17,6 +17,9 @@ ov5640@3c {
 		reg = <0x3c>;
 		clocks = <&MCLK_CAM>;
 		clock-names = "xclk";
+		AVDD-supply = <&reg_2p8v>;
+		DOVDD-supply = <&reg_2p8v>;
+		DVDD-supply = <&reg_1p8v>;
 		status = "okay";
 
 		port {
-- 
2.25.1

