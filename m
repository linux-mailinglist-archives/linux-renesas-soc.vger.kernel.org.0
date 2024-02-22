Return-Path: <linux-renesas-soc+bounces-3099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6739D85F98C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE3F1C22E7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 13:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DA813667E;
	Thu, 22 Feb 2024 13:21:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7607133284;
	Thu, 22 Feb 2024 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608098; cv=none; b=iti7YJA5nkywljDZMrEK/n3b0HAtN6BXnIKDT3rbsjuLMxpyxl5wWVuV8isxVr8Y+85AfR3fXWVpuBFc0YaM9V24cLrDlWcUka1OfFJLbJikWVAs/n51A/XVZmtntzx7dj5hdNr8L2zrVIjvY/d8wJOtxqGscyLzVY8m9V4HNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608098; c=relaxed/simple;
	bh=gC0P/VCzIiqQby+KHwqvr+i5jExTxdRfkFhqjPdlopA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BEKG7esJidXZ3d3xDcodjFDUJ9aUmA4mXpAXeTa4OfXw0ZwZzDEtsmSFheOQVQsKw7JH56KByFVCT+FwRIti/mcn47z3UgCVLVHzaEEUpfFkkVhe9a/5qpS0uiQEKrTx74BoHJ/KapuiJOIrGgux85ad6oVGjGHSi8t3aGPZ0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; 
   d="scan'208";a="198860346"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2024 22:21:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CBF9640062BB;
	Thu, 22 Feb 2024 22:21:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v9 3/3] arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI
Date: Thu, 22 Feb 2024 13:21:17 +0000
Message-Id: <20240222132117.137729-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222132117.137729-1-biju.das.jz@bp.renesas.com>
References: <20240222132117.137729-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DU and link with DSI on RZ/{G2L,G2LC,V2L} SMARC EVK.

Move DSI port properties from board dtsi to SoC dtsi and then link with DU
and after that enable DU on the board dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Moved port properties from board dtsi to SoC dtsi
 * Linked DU with DSI in SoC dtsi
 * Enabled DU on the board dtsi.
v7->v8:
 * No Change.
v7:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 14 ++++----------
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 14 ++++----------
 4 files changed, 46 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 66b47812da9b..be6dc3f01d38 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -793,6 +793,22 @@ dsi: dsi@10850000 {
 			reset-names = "rst", "arst", "prst";
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
 		};
 
 		vspd: vsp@10870000 {
@@ -839,6 +855,9 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					du_out_dsi: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 74a75a42ccc3..7442ae7dff45 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -798,6 +798,22 @@ dsi: dsi@10850000 {
 			reset-names = "rst", "arst", "prst";
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
 		};
 
 		vspd: vsp@10870000 {
@@ -846,6 +862,9 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					du_out_dsi: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 37807f1bda4d..887dffe14910 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -40,17 +40,7 @@ &dsi {
 	status = "okay";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			dsi0_in: endpoint {
-			};
-		};
-
 		port@1 {
-			reg = <1>;
 			dsi0_out: endpoint {
 				data-lanes = <1 2 3 4>;
 				remote-endpoint = <&adv7535_in>;
@@ -59,6 +49,10 @@ dsi0_out: endpoint {
 	};
 };
 
+&du {
+	status = "okay";
+};
+
 &i2c1 {
 	adv7535: hdmi@3d {
 		compatible = "adi,adv7535";
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 859bc8745e66..f21508640b6e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -56,17 +56,7 @@ &dsi {
 	status = "okay";
 
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			dsi0_in: endpoint {
-			};
-		};
-
 		port@1 {
-			reg = <1>;
 			dsi0_out: endpoint {
 				data-lanes = <1 2 3 4>;
 				remote-endpoint = <&adv7535_in>;
@@ -75,6 +65,10 @@ dsi0_out: endpoint {
 	};
 };
 
+&du {
+	status = "okay";
+};
+
 &i2c1 {
 	adv7535: hdmi@3d {
 		compatible = "adi,adv7535";
-- 
2.25.1


