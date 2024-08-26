Return-Path: <linux-renesas-soc+bounces-8216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE595ECBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E3C1C203F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9A513F01A;
	Mon, 26 Aug 2024 09:08:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B88113E8AE;
	Mon, 26 Aug 2024 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663301; cv=none; b=FldRoFTfTzzlj29DL3KL5Hnx5fBAJdgN7g3kkzbqcImm90+oeN8uQreeKweGiMmylhJXr24JneXRuOY+9EYdaXuvbzbvx0GNjI4sNy5WWplmUWoMiR2oyz3HJEyHcxoT92eltx1x6AZ3AEJvTh3JoAicAuJqVOdkf/1/+VLFxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663301; c=relaxed/simple;
	bh=9g4Z2BS4YevR77wP1EA7gzY3bEMh8Xe8K+iXUPcpCpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpkjXhiQ+MT7Ks4vchiAtIqRhBeniORCZnRcXDhvUPBYR7PwiC0xppGeEEAYGn7PT9wCxSWmOQpYw26EjqkAHyCzUNb6zkEApWlR8Rn6MiCCAwTWWnGn5c4/W8IZ8/T5G/i5lW6YziNi4WnDoTqiL1QmsaIFtiodZ1uabXTy0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,177,1719846000"; 
   d="scan'208";a="220556651"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2024 18:08:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.68])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ED05D4007554;
	Mon, 26 Aug 2024 18:08:08 +0900 (JST)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
Date: Mon, 26 Aug 2024 10:07:59 +0100
Message-ID: <20240826090803.56176-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826090803.56176-1-biju.das.jz@bp.renesas.com>
References: <20240826090803.56176-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Dropped SSI1 RXD pin as it is not connected on carrier board
---
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  6 ++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 18c526c7a4cf..e9f244c33d55 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -143,6 +143,12 @@ ssi0_pins: ssi0 {
 			 <RZG2L_PORT_PINMUX(45, 3, 1)>; /* RXD */
 	};
 
+	ssi1_pins: ssi1 {
+		pinmux = <RZG2L_PORT_PINMUX(46, 0, 1)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(46, 1, 1)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(46, 2, 1)>; /* TXD */
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


