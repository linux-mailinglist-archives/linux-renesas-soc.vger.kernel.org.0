Return-Path: <linux-renesas-soc+bounces-16823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0211AB02D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 20:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C251B18987C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 18:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9448E2874EE;
	Thu,  8 May 2025 18:31:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A66320458A;
	Thu,  8 May 2025 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729086; cv=none; b=QIzQxeoTR4wvcvh6sxY9WmAeALVLFm8JZGeR6fNO+lRzQQ22s0q8cIgCUDT/3h+AWHh6UaBl4bHpuP+UUjiyQrR24s8+zCblhp6fMSm6SmZe+8Y6ZSCYzQema4gXt5cUSQcDvpb1SIwjBiR8XdGZp82vPHWJPGdRV1KNKYrT6xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729086; c=relaxed/simple;
	bh=1Muu8ezW0Spl/Uwaw3LwoMpmyf43nfHybzezDqrekmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qE4Y+FM6r/O545HA80lkx+tRU937fI1uYXRYoBywYbwG+Vm7aXDdKkYKX6pz/KA9m0/vMSHVSwgkyrj9CtcmTjGDLVZveAcc1ZS/mZYGpBntl4X0VgONYRT4OizjAu6vd9Us2bSn7z+koKUx5EvdjKUKUnBFv6lLBxwoyuGVOgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: o/P8UTZmS52jo82/0imOJA==
X-CSE-MsgGUID: 8cKFdbzDQv+nJ+EJk9O9EQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 May 2025 03:31:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.89])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 62501405C6DD;
	Fri,  9 May 2025 03:31:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg3e-smarc-som: Enable serial nor flash
Date: Thu,  8 May 2025 19:31:04 +0100
Message-ID: <20250508183109.137721-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
References: <20250508183109.137721-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Renesas at25ql128a flash connected to XSPI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 43d79158d81a..db128388dcb6 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -182,6 +182,15 @@ sd2-pwen {
 			pinmux = <RZG3E_PORT_PINMUX(K, 2, 1)>; /* SD2PWEN */
 		};
 	};
+
+	xspi_pins: xspi0 {
+		pinmux = <RZG3E_PORT_PINMUX(M, 0, 0)>, /* XSPI0_IO0 */
+			 <RZG3E_PORT_PINMUX(M, 1, 0)>, /* XSPI0_IO1 */
+			 <RZG3E_PORT_PINMUX(M, 2, 0)>, /* XSPI0_IO2 */
+			 <RZG3E_PORT_PINMUX(M, 3, 0)>, /* XSPI0_IO3 */
+			 <RZG3E_PORT_PINMUX(L, 0, 0)>, /* XSPI0_CKP */
+			 <RZG3E_PORT_PINMUX(L, 1, 0)>; /* XSPI0_CS0 */
+	};
 };
 
 &qextal_clk {
@@ -245,3 +254,40 @@ &sdhi2_vqmmc {
 &wdt1 {
 	status = "okay";
 };
+
+&xspi {
+	pinctrl-0 = <&xspi_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		vcc-supply = <&reg_1p8v>;
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip";
+				reg = <0x00060000 0x007a0000>;
+			};
+
+			partition@800000 {
+				label = "user";
+				reg = <0x800000 0x800000>;
+			};
+		};
+	};
+};
-- 
2.43.0


