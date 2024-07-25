Return-Path: <linux-renesas-soc+bounces-7502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 043BD93BE24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 10:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE47B1F22D91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 08:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA60218FDC6;
	Thu, 25 Jul 2024 08:46:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C109018FC78;
	Thu, 25 Jul 2024 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897182; cv=none; b=i1HzAWIDKD8gca3Zi7yvTf4bch03MMEq2ga6RARgB/B4p02aKa86LSycgmKHx+NMllkTa51JCuxaTMl8YiUBtnVZiQIQD6+Y9R8mFOScwCc0qMoUO1PegP+2VyDgEriTR6z8QgoKRXV3nntHDFYhMlMBrpj7seH2iqHk/gtE560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897182; c=relaxed/simple;
	bh=Axg6Tr+e3vOSKZSFYX0jjF09QIltBaVfNGnXcYUpYkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BftU3hM6uNcdw43Devhv1bkk/ipl2nHpbVlgukFSKsXv+8VFQ5AEbXOYsZL+hVfzs6KXZd06AP3GKUJlfCxZKsl1cOMQ7lNfD5QGKlHvVuTFqaSJ0FgNgbpVYGvFS7o+Q911eIPWlhaKVajwTnj7f0/n5s9gIzwyHylquZ8rx4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="212736815"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jul 2024 17:46:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9FAF74009673;
	Thu, 25 Jul 2024 17:46:16 +0900 (JST)
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
Subject: [PATCH 3/3] arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
Date: Thu, 25 Jul 2024 09:45:56 +0100
Message-ID: <20240725084559.13127-4-biju.das.jz@bp.renesas.com>
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

Enable HDMI audio on RZ/G2LC SMARC EVK. Set SW 1.5 to OFF
position on the SoM module to turn on HDMI audio.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  3 ++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 37 +++++++++++++++++++
 2 files changed, 40 insertions(+)

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
index f21508640b6e..dc5d976e9316 100644
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
@@ -48,10 +58,16 @@ &canfd {
 };
 #endif
 
+#if (!SW_I2S0_I2S1)
 &cpu_dai {
 	sound-dai = <&ssi0>;
 };
 
+&ssi0 {
+	/delete-node/ port;
+};
+#endif
+
 &dsi {
 	status = "okay";
 
@@ -104,6 +120,15 @@ adv7535_out: endpoint {
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
@@ -177,6 +202,18 @@ &ssi0 {
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


