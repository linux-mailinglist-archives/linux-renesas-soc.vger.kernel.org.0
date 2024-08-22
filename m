Return-Path: <linux-renesas-soc+bounces-8073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F195BBD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 18:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA02AB29D9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 16:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B6B1CCEEB;
	Thu, 22 Aug 2024 16:23:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B751D130F;
	Thu, 22 Aug 2024 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343831; cv=none; b=cB6GegOg8IxUvhRGDz6SvXkybpCQWyWUJWAL7MKsE1afgiuQ3K8aF7z/FiEPVyHu+qRV5Vt1NeIh+q7gTfiFqFuN8YRK0i3UIAS8z32CvJsXGgUmTdCrh449fXVn3cS2KSVVYElVqM0W/tqylD9pRrDUIySH7EruPeoU3aAqLhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343831; c=relaxed/simple;
	bh=1i8I58KyaP3zLylkEXd1YFeJEEPobmG7XbfyVam5tHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uly/5QOB5njoEzfWMs+xzGx6D8PYUtkl8kOyPqSkon+gtc7tI4UgU3Yu7sG0A8erJ8J9Z+eDOUQdl6j0WKakMRGyUNCwWzu0iKrOCCLJ3KOd8DwURE65/V1C5F+JCOiEO46Bfb2qYLbrbDNzfgt7FmPJh/otqZymBj72TCyvbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,167,1719846000"; 
   d="scan'208";a="220284630"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Aug 2024 01:23:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C22134007CF2;
	Fri, 23 Aug 2024 01:23:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Date: Thu, 22 Aug 2024 17:23:17 +0100
Message-ID: <20240822162320.5084-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DU and link with the HDMI add-on board connected with
the parallel connector on RZ/G2UL SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Restored ports property in du node and port@0 for DPI interface.
v2->v3:
 * Replaced ports->port in du node as it support only DPI output.
v1->v2:
 * No change.
---
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 8e0107df2d46..233f0c1074d2 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -35,4 +35,115 @@
 / {
 	model = "Renesas SMARC EVK based on r9a07g043u11";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7513_out>;
+			};
+		};
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			du_out_rgb: endpoint {
+				remote-endpoint = <&adv7513_in>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	adv7513: adv7513@39 {
+		compatible = "adi,adv7513";
+		reg = <0x39>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		dvdd-3v-supply = <&reg_3p3v>;
+		bgvdd-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7513_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7513_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	du_pins: du {
+		data {
+			pinmux = <RZG2L_PORT_PINMUX(11, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 4, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(12, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(16, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(16, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 3, 6)>;
+			drive-strength = <2>;
+		};
+
+		sync {
+			pinmux = <RZG2L_PORT_PINMUX(11, 0, 6)>, /* HSYNC */
+				 <RZG2L_PORT_PINMUX(12, 0, 6)>; /* VSYNC */
+			drive-strength = <2>;
+		};
+
+		de {
+			pinmux = <RZG2L_PORT_PINMUX(11, 1, 6)>; /* DE */
+			drive-strength = <2>;
+		};
+
+		clk {
+			pinmux = <RZG2L_PORT_PINMUX(11, 3, 6)>; /* CLK */
+		};
+	};
 };
-- 
2.43.0


