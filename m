Return-Path: <linux-renesas-soc+bounces-23672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76770C0F213
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 17:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAE434FF404
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C958F3254AB;
	Mon, 27 Oct 2025 15:47:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23D230EF90;
	Mon, 27 Oct 2025 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580060; cv=none; b=DaVpajw6pl4FjMgImLbkatFjLIKY31bVg8t6tsDQot9nPdrGXgJNECw+ZVOwggjUyZAapZnPpECunW8YMNzzQOkAEDdKUt6UCVdHLgExSXyJZ7lqb4BgYv6X7DEYakYe2PgY9DCegrbT2T8Q9fLw4J6zl2bnz0b+nzqnJK9OhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580060; c=relaxed/simple;
	bh=mGUciF3i4HcZ9+i4FTS11qFbyqz1m1Y2M7eeaaypznk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxy2BJyoGlJF6tGwuWP5y3ki6UNbLOxLcmwjvoVYP2YLDEk4rFRk3cySpRbmA21UF7N+YFClsEyQ3kNWakpqOPpuQ0fO2c4CDBHQU8+C2Ou1HxbyHnW+IpRfFB764EZj1F1ZUfg/tT9y72XdAyr094vGRdBzZph4NMFSdJb3Vhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vsWKUWx0QWKb8+Q5uTh5+g==
X-CSE-MsgGUID: 3dnCNAGhSP6s5dIbzapN/A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Oct 2025 00:47:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ACEB5400A67C;
	Tue, 28 Oct 2025 00:47:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 19/19] arm64: dts: renesas: renesas-smarc2: Enable rsci{2,4,9} nodes
Date: Mon, 27 Oct 2025 15:46:06 +0000
Message-ID: <20251027154615.115759-20-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable device rsci{2,4,9} nodes for the RZ SMARC Carrier-II Board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 40 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 12 ++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 12cd488f5dfa..301eb6d47861 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -38,6 +38,9 @@ / {
 
 	aliases {
 		i2c0 = &i2c0;
+		serial0 = &rsci4;
+		serial1 = &rsci9;
+		serial2 = &rsci2;
 		serial3 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -141,6 +144,26 @@ nmi_pins: nmi {
 		input-schmitt-enable;
 	};
 
+	rsci2_pins: rsci2 {
+		pinmux = <RZG3E_PORT_PINMUX(1, 1, 1)>, /* SER2_TX */
+			 <RZG3E_PORT_PINMUX(1, 0, 1)>, /* SER2_RX */
+			 <RZG3E_PORT_PINMUX(1, 2, 6)>, /* SER2_CTS# */
+			 <RZG3E_PORT_PINMUX(1, 3, 1)>; /* SER2_RTS# */
+		bias-pull-up;
+	};
+
+	rsci4_pins: rsci4 {
+		pinmux = <RZG3E_PORT_PINMUX(7, 7, 5)>, /* SER0_TX */
+			 <RZG3E_PORT_PINMUX(7, 6, 5)>; /* SER0_RX */
+		bias-pull-up;
+	};
+
+	rsci9_pins: rsci9 {
+		pinmux = <RZG3E_PORT_PINMUX(8, 3, 5)>, /* SER1_TX */
+			 <RZG3E_PORT_PINMUX(8, 2, 5)>; /* SER1_RX */
+		bias-pull-up;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
@@ -172,6 +195,23 @@ sd1-data {
 	};
 };
 
+&rsci2 {
+	pinctrl-0 = <&rsci2_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+};
+
+&rsci4 {
+	pinctrl-0 = <&rsci4_pins>;
+	pinctrl-names = "default";
+};
+
+&rsci9 {
+	pinctrl-0 = <&rsci9_pins>;
+	pinctrl-names = "default";
+};
+
 &scif0 {
 	pinctrl-0 = <&scif_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index a296c2c1c7ab..305215cdaeb3 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -89,6 +89,18 @@ &i2c0 {
 	clock-frequency = <400000>;
 };
 
+&rsci2 {
+	status = "okay";
+};
+
+&rsci4 {
+	status = "okay";
+};
+
+&rsci9 {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.43.0


