Return-Path: <linux-renesas-soc+bounces-8215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA8A95ECBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC0C281744
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F4313D8B3;
	Mon, 26 Aug 2024 09:08:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658A413D880;
	Mon, 26 Aug 2024 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663298; cv=none; b=iPFq3IreuB7pGyAkD0k+ywsqh/WCVzo0ZwCX1fSgXHcbyPZPfD8jU2K8fGQ+B1wQmb6tX8PPbYhBpPMvayJ4kWtS62kIZeHgJGOHSlciydMsUftpPuinOI8MuHD2D9bJyKn/JJOLRGrR9ooLeAr63cFrkGTrRpWIClVZfoqO85Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663298; c=relaxed/simple;
	bh=Ye/42hokrfmovfnq9R+W9hx6eagaPmP5ImW+WKL3H34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/BI1ZdoRkMCnfiFqyJqLxbrYFV3cxKfH0Lc5vfio8SZ4cf7mWbT89YAofc2uw8uAXn1UY7aJ8XCc/BEzD2JZAUCE/iKOu/+sngWqsOOwPWyltysjFQrYEu0IjiJDyC62699jmBv1r6C7qG+KT6uXUcwdIhr+FITYAJLGpWA9Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,177,1719846000"; 
   d="scan'208";a="216583881"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2024 18:08:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.68])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 64C614007554;
	Mon, 26 Aug 2024 18:08:12 +0900 (JST)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
Date: Mon, 26 Aug 2024 10:08:00 +0100
Message-ID: <20240826090803.56176-3-biju.das.jz@bp.renesas.com>
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

Enable HDMI audio on RZ/G2LC SMARC EVK. Set SW 1.5 to OFF
position on the SoM module to turn on HDMI audio.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped deleting ssi0 port when SW_I2S0_I2S1==0 as it enables only
   when SW_I2S0_I2S1==1.
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  3 ++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 33 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index 0b90367b6d1e..ee5bf2c58051 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -47,6 +47,9 @@
 #error "Cannot set as both PMOD_MTU3 and SW_RSPI_CAN are mutually exclusive"
 #endif
 
+/* Please set SW_I2S0_I2S1. Default value is 0 */
+#define SW_I2S0_I2S1   0
+
 #include "r9a07g044c2.dtsi"
 #include "rzg2lc-smarc-som.dtsi"
 #include "rzg2lc-smarc.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index f21508640b6e..377849cbb462 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -33,6 +33,16 @@ hdmi_con_out: endpoint {
 			};
 		};
 	};
+
+#if (SW_I2S0_I2S1)
+	/delete-node/ sound;
+
+	sound_card {
+		compatible = "audio-graph-card";
+		label = "HDMI-Audio";
+		dais = <&i2s2_port>;
+	};
+#endif
 };
 
 #if (SW_SCIF_CAN || SW_RSPI_CAN)
@@ -48,9 +58,11 @@ &canfd {
 };
 #endif
 
+#if (!SW_I2S0_I2S1)
 &cpu_dai {
 	sound-dai = <&ssi0>;
 };
+#endif
 
 &dsi {
 	status = "okay";
@@ -104,6 +116,15 @@ adv7535_out: endpoint {
 					remote-endpoint = <&hdmi_con_out>;
 				};
 			};
+
+#if (SW_I2S0_I2S1)
+			port@2 {
+				reg = <2>;
+				codec_endpoint: endpoint {
+					remote-endpoint = <&i2s2_cpu_endpoint>;
+				};
+			};
+#endif
 		};
 	};
 };
@@ -177,6 +198,18 @@ &ssi0 {
 	pinctrl-names = "default";
 
 	status = "okay";
+
+#if (SW_I2S0_I2S1)
+	i2s2_port: port {
+		i2s2_cpu_endpoint: endpoint {
+			remote-endpoint = <&codec_endpoint>;
+			dai-format = "i2s";
+
+			bitclock-master = <&i2s2_cpu_endpoint>;
+			frame-master = <&i2s2_cpu_endpoint>;
+		};
+	};
+#endif
 };
 
 #if (SW_RSPI_CAN)
-- 
2.43.0


