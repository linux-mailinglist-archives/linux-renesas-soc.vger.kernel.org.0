Return-Path: <linux-renesas-soc+bounces-7500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116E93BE23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 10:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFE17B22E9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 08:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9008E18FC9F;
	Thu, 25 Jul 2024 08:46:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2D818F2D8;
	Thu, 25 Jul 2024 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897179; cv=none; b=WiK2HC/z4yB8sHz44qw5LwMO0C3Xhxw5yKDOmvKmDRXssNceYAAzjCLuuaxzHiOrYNLSNtEPmEFsBWrN9R43/X6cVkG5d1XviydJtdfA7QRXZGr1YKq/LHu+btfWmp2lOKIAr/q2TDxyx3q4V52UEKzoZr7flodwIWc0yOrdi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897179; c=relaxed/simple;
	bh=r5eY13D6o1L81MVRIQ9J5IsRXN9RjDgoKUIjoWolO1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etVK5zS6KvcZcpAHne8czQ0/ELMLliC5pidj3F7el+A9KsB8322Ew0l8cGRPHibQpVNx8N6v1alfIQnZhc5VRbSCeTRVOKU8/vrZ3lGAJ9JWijE8d/+o8zkb0/UawZe4yDwM+RNkmMkucgRdbl+vAfHyILKH1Px0pMwFzxYev4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216694965"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 17:46:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A7FB400F7B2;
	Thu, 25 Jul 2024 17:46:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Date: Thu, 25 Jul 2024 09:45:55 +0100
Message-ID: <20240725084559.13127-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
References: <20240725084559.13127-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable HDMI audio on RZ/{G2L,V2L} SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  7 +++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 30 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 18c526c7a4cf..8c80bd0df5da 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -143,6 +143,13 @@ ssi0_pins: ssi0 {
 			 <RZG2L_PORT_PINMUX(45, 3, 1)>; /* RXD */
 	};
 
+	ssi1_pins: ssi1 {
+		pinmux = <RZG2L_PORT_PINMUX(46, 0, 1)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(46, 1, 1)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(46, 2, 1)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(46, 3, 1)>; /* RXD */
+	};
+
 	usb0_pins: usb0 {
 		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>, /* VBUS */
 			 <RZG2L_PORT_PINMUX(5, 0, 1)>, /* OVC */
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 887dffe14910..ee3d96fdb616 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -30,6 +30,12 @@ hdmi_con_out: endpoint {
 			};
 		};
 	};
+
+	sound_card {
+		compatible = "audio-graph-card";
+		label = "HDMI-Audio";
+		dais = <&i2s2_port>;
+	};
 };
 
 &cpu_dai {
@@ -88,6 +94,13 @@ adv7535_out: endpoint {
 					remote-endpoint = <&hdmi_con_out>;
 				};
 			};
+
+			port@2 {
+				reg = <2>;
+				codec_endpoint: endpoint {
+					remote-endpoint = <&i2s2_cpu_endpoint>;
+				};
+			};
 		};
 	};
 };
@@ -170,6 +183,23 @@ &ssi0 {
 	status = "okay";
 };
 
+&ssi1 {
+	pinctrl-0 = <&ssi1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_cpu_endpoint: endpoint {
+			remote-endpoint = <&codec_endpoint>;
+			dai-format = "i2s";
+
+			bitclock-master = <&i2s2_cpu_endpoint>;
+			frame-master = <&i2s2_cpu_endpoint>;
+		};
+	};
+};
+
 &vccq_sdhi1 {
 	gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
 };
-- 
2.43.0


