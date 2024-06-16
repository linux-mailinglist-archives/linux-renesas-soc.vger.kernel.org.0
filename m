Return-Path: <linux-renesas-soc+bounces-6304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AFA909D18
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 12:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C923280EF4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Jun 2024 10:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2453F187329;
	Sun, 16 Jun 2024 10:54:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9A02F2B;
	Sun, 16 Jun 2024 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718535282; cv=none; b=b70YtcW1lYA7PQZUyG36VGdziQzgsM/T1Ptq8hKI8MUkB9pJoR9TcDSPOux8JcX8dsWYdN8GSN47L3AOjCB6YH0okU1N9pR6I+AiJey4xDDOsmO6B/Eiw+Cphn7rsxSJOukocj4gmyzyT4iLBxmFolOZTV5RUU3gU2R1S8VAjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718535282; c=relaxed/simple;
	bh=eP9we5QYCKnEoGvO526uJsKvShiGH8d1PM3heVZ+eoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jK42B8XgGCwgdwpww48BW94JKDC1PO+OaxbW/YeTpP08+7jlSNhU80ve9AAt4RfFs1e/3AxO4bDg3ZeA17o6C8HNPOAfuimgLZ8m+h9LdY41Oq0wWYX66nitxnQHPVMe4fUsdOOPsgxfkQVQnjcaeG1Ga0ug3tTh4+nayoSfYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,242,1712588400"; 
   d="scan'208";a="208104655"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Jun 2024 19:54:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.60])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E35D440CBFD8;
	Sun, 16 Jun 2024 19:54:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 6/6] arm64: dts: renesas: rz-smarc: Replace fixed regulator for USB VBUS
Date: Sun, 16 Jun 2024 11:53:58 +0100
Message-ID: <20240616105402.45211-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * Dropped regulator-{min,max}-microvolt
v2->v3:
 * Upated label name
 * Updated node and regulator name that matches with the bindings.
v1->v2:
 * New patch.
---
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
index b7a3e6caa386..b34855956ae0 100644
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
@@ -139,6 +131,9 @@ &ohci1 {
 
 &phyrst {
 	status = "okay";
+	usb0_vbus_otg: regulator-vbus {
+		regulator-name = "vbus";
+	};
 };
 
 &scif0 {
-- 
2.43.0


