Return-Path: <linux-renesas-soc+bounces-12791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD4A23D27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 12:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D619C7A4FA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 11:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8071C2443;
	Fri, 31 Jan 2025 11:29:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923AC1C173D;
	Fri, 31 Jan 2025 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322952; cv=none; b=PDykL5YIRaUJrwszLXFB2lDmDtbh2LPfc7cWCBRJmtKZxOtjUCQ8rMp8UlFnjgHKtaFaOH4mrXFWJlqrZR1IHYHQwbBAQdRzVtrKhSNIb9YvGrf4RyjgFG1TmOVn4wB5ZFAIRdQ6d2I7oBsCpYrQNIpw5lVn2DAG6J3QKsEIl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322952; c=relaxed/simple;
	bh=i1uj7+Uas0u6N3Sko6/zoEab3vA4a3EBIJ2E5MD2fhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzf/cvFzLdunFKe5R5kGdg/UqSiTV45M1C+gNfcFVguVpZaSy0HET7jApG5RmMzhSMd0F4mrjcZqSCeymcpON+q0MXyo4jWV1G3rA6FAeCz9iwcH7nFgneu5RpXmBa9fu5hmY1ACDyGeqC779LxpXHCStqi9xBykE8d7d7U9r+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: c5rCoLmwTg2G+3RwrjQPWw==
X-CSE-MsgGUID: 7sf8hJ92Q4SLXxuQeCLpsg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2025 20:29:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8F56A42E4450;
	Fri, 31 Jan 2025 20:28:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal regulator
Date: Fri, 31 Jan 2025 11:28:46 +0000
Message-ID: <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
References: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for enabling SDHI internal regulator, by overriding the
status on the board DTS, when needed.

While at it, rename the gpio regulator label vqmmc_sdhi1->vqmmc_sdhi1_gpio
to avoid conflicts with internal regulator node names.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 21 +++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  4 ++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index f7a2f8ca864f..3b8dae0b2eb6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -602,6 +602,13 @@ sdhi0: mmc@15c00000  {
 			resets = <&cpg 0xa7>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			vqmmc_sdhi0: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
 		};
 
 		sdhi1: mmc@15c10000 {
@@ -615,6 +622,13 @@ sdhi1: mmc@15c10000 {
 			resets = <&cpg 0xa8>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			vqmmc_sdhi1: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
 		};
 
 		sdhi2: mmc@15c20000 {
@@ -628,6 +642,13 @@ sdhi2: mmc@15c20000 {
 			resets = <&cpg 0xa9>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			vqmmc_sdhi2: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0b705c987b6c..1ecea3872e94 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -53,7 +53,7 @@ reg_3p3v: regulator1 {
 		regulator-always-on;
 	};
 
-	vqmmc_sdhi1: regulator-vccq-sdhi1 {
+	vqmmc_sdhi1_gpio: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI1 VccQ";
 		gpios = <&pinctrl RZV2H_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
@@ -244,7 +244,7 @@ &sdhi1 {
 	pinctrl-1 = <&sdhi1_pins>;
 	pinctrl-names = "default", "state_uhs";
 	vmmc-supply = <&reg_3p3v>;
-	vqmmc-supply = <&vqmmc_sdhi1>;
+	vqmmc-supply = <&vqmmc_sdhi1_gpio>;
 	bus-width = <4>;
 	sd-uhs-sdr50;
 	sd-uhs-sdr104;
-- 
2.43.0


