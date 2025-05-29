Return-Path: <linux-renesas-soc+bounces-17660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 138DCAC7CE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 May 2025 13:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 516B9A40644
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 May 2025 11:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF52028E5F4;
	Thu, 29 May 2025 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="luI5Snan"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E0C28E5E5;
	Thu, 29 May 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517908; cv=none; b=bYO6CP5pBhKCkFHFGx658Z40GYxFwEIUIH4nM0y1vVQPk8uaBW1rStjxvcK9TINRP9klQ+BYOXf17KZzYpwxhdA92gE6ZKXASy8c2PUz3hcNQ5AMmqIFyfvQMx3qz1pxNvljMYLZttVO8gcwNytqLuRknpkgMRnrM7CipXrVo8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517908; c=relaxed/simple;
	bh=rpsm8eRyeXGMHwqH0z4/V4yOz4McjMeLdc1aaKfmJAM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hv25DDDS0Z42QRqC0JAcoBc0JgDNReNC7vr2AnV14K6hVle7uy+qapNkuKf65vOCiyvv+x5ESOLWNry45exVxNVbg1rIV0lOIYPA8zWkkum/5r1kOolq4ff3O8JUjlRk0LhaA5COz2hd+79PGMdfOhmBy6ufb8VSV+J03TRAcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=luI5Snan; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TBOPh03504642;
	Thu, 29 May 2025 06:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748517865;
	bh=56qRrAtL/a6koU+ClmQ0T5MnkBdpWG/sJANgtbap56g=;
	h=From:To:CC:Subject:Date;
	b=luI5Snan38kNQ+vphh1lKji9/YO3x7//X4p4oebHZ8lkEjIF2yvQsciBH8yUkuK9k
	 AMLL08bddYOX598TBZijLKU8dGX1Ixll7VZVftQHBWHRij2nORFQbFkhkLBTXk31NU
	 siM9pFG3dXuCOKZx68YdFvsYdlscM/r5n1TufYYc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TBOPT2061510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 06:24:25 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 06:24:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 06:24:24 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TBONkn1516428;
	Thu, 29 May 2025 06:24:24 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
        <devicetree@vger.kernel.org>
CC: <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>,
        <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <imx@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <dianders@chromium.org>, <linux-kernel@vger.kernel.org>,
        <max.krummenacher@toradex.com>, <j-choudhary@ti.com>,
        <ernestvanhoecke@gmail.com>
Subject: [PATCH] arm64: dts: Add no-hpd property for all ti-sn65dsi86 bridge consumers
Date: Thu, 29 May 2025 16:54:23 +0530
Message-ID: <20250529112423.484232-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

In the SN65DSI86 DSI-2-eDP bridge, HPD is not supported as of now.
But DisplayPort connector_type usecases does need hpd to be enabled.
In order not to break any platform from those driver changes, add
"no-hpd" property to all the existing sn65dsi86 nodes (that don't
have it already) as hpd is not being used there anyways.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Upcoming driver changes that will break platforms if we do not have this
property in all the existing sn65dsi86 nodes that assumes hpd is disabled:
<https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com/>

(sc7180-trogdor-ti-sn65dsi86.dtsi, sdm850-lenovo-yoga-c630.dts and
sdm845-cheza.dtsi already have this property.)

NOTE: Grouping the logical changes together in a single patch even though
we have multiple vendor dts. I hope that is not an issue.

 .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts     | 1 +
 arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts             | 1 +
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts                 | 1 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi             | 1 +
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts            | 1 +
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts        | 1 +
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi           | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
index 0f48c32bec97..6a7d7db3ef8f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
@@ -292,6 +292,7 @@ edp_bridge: bridge@2c {
 		vpll-supply = <&reg_main_1v8>;
 		vcca-supply = <&reg_main_1v2>;
 		vcc-supply = <&reg_main_1v2>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..599a53969326 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -147,6 +147,7 @@ edp_bridge: bridge@2c {
 		vpll-supply = <&reg_main_1v8>;
 		vcca-supply = <&reg_main_1v2>;
 		vcc-supply = <&reg_main_1v2>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index 672ac4c3afa3..8fa18273684f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -384,6 +384,7 @@ sn65dsi86_bridge: bridge@2c {
 
 		clocks = <&rpmhcc RPMH_LN_BB_CLK3>;
 		clock-names = "refclk";
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 0916fd57d1f1..a115e3fc4cb9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -214,6 +214,7 @@ bridge@2c {
 		vpll-supply = <&reg_1p8v>;
 		vcca-supply = <&reg_1p2v>;
 		vcc-supply = <&reg_1p2v>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 6955eafd8d6a..fcc2d8edd464 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -349,6 +349,7 @@ bridge@2c {
 				vpll-supply = <&reg_1p8v>;
 				vcca-supply = <&reg_1p2v>;
 				vcc-supply = <&reg_1p2v>;
+				no-hpd;
 
 				ports {
 					#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 4d890e0617af..8b9592b87366 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -460,6 +460,7 @@ bridge@2c {
 		vpll-supply = <&reg_1p8v>;
 		vcca-supply = <&reg_1p2v>;
 		vcc-supply = <&reg_1p2v>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index b4024e85ae5a..686a37a8680f 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -256,6 +256,7 @@ bridge@2c {
 		vpll-supply = <&reg_1p8v>;
 		vcca-supply = <&reg_1p2v>;
 		vcc-supply = <&reg_1p2v>;
+		no-hpd;
 
 		ports {
 			#address-cells = <1>;
-- 
2.34.1


