Return-Path: <linux-renesas-soc+bounces-5959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCD290025D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 13:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E231C20C8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 11:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6F7190685;
	Fri,  7 Jun 2024 11:38:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A50A190060;
	Fri,  7 Jun 2024 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760297; cv=none; b=DpJ+O9rmKcqhQYulfx9uEN4koDiacpk5R0yAOZl3ONS+WjoIG3RuETVlTb5TRMTP3fAI4MUmoqowXKssXijKyv9ucmHZRTus5hpft4mzzS6HjyjSdFtHTjnB3pJoxy6jnG4gpKgQBSz3vQU23NfztQ/8/lP6fIYj2xKwLPjW3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760297; c=relaxed/simple;
	bh=oxKWcpVAXXPyUMCU1E6CBtM5Hu7e1FfDc5YNoyYVX8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gGf86Tn9+X/n1tjqwiLQit5BMEJoMv2HIl8/mpXTd0K5hQJzvFkkytRg4BaOnxEaqkHdmdSUhk21jkG0lxShrFXzefGncOlwPPBWaavP7EYf7+9H3Bnl0Wtgsr24jbGPyzcVWxQ0AR+DjjmY81jzUq8wWVj0tkEJe53kb2RFcjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,221,1712588400"; 
   d="scan'208";a="207084446"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2024 20:38:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C16034005B53;
	Fri,  7 Jun 2024 20:38:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH RFC v2 4/4] arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS
Date: Fri,  7 Jun 2024 12:37:45 +0100
Message-Id: <20240607113745.73934-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the fixed regulator for USB VBUS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * New patch.
---
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index b7a3e6caa386..9105afbd5810 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
@@ -54,14 +54,6 @@ codec_dai: simple-audio-card,codec {
 		};
 	};
 
-	usb0_vbus_otg: regulator-usb0-vbus-otg {
-		compatible = "regulator-fixed";
-
-		regulator-name = "USB0_VBUS_OTG";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-	};
-
 	vccq_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI1 VccQ";
@@ -139,6 +131,11 @@ &ohci1 {
 
 &phyrst {
 	status = "okay";
+	vbus_usb0: usb-vbus-regulator {
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <0>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &scif0 {
@@ -171,7 +168,7 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
 
-	vbus-supply = <&usb0_vbus_otg>;
+	vbus-supply = <&vbus_usb0>;
 	status = "okay";
 };
 
-- 
2.25.1


