Return-Path: <linux-renesas-soc+bounces-10800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B60E9E1527
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0A61613A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFBA1E25F5;
	Tue,  3 Dec 2024 08:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FtQMVagw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8171AB6EA;
	Tue,  3 Dec 2024 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212981; cv=none; b=Z7/vwekePL45DI7iDQUNBORkR5y3ZBBInCIRxxX4oMrXUMlAJ4VVFUcYNb2W9yfeIP6qSI9u0pPjSo23HWA4xd88NDfs4S/E6KbFcRe7QQJYwQc/VIx8KHFz2FqThFbthQseHjsSYhKaRsVoH9NBcXBZQDaFs8gX4E89we1CSHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212981; c=relaxed/simple;
	bh=7z6/EAnT7VsSyYSmFx1O+9nGFu4lUDeRzP91zNyEoSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwx2KnPMnEMe3nxleP7LImtfTVWDMeA9DtNo0Z4hQeVxOLHS/lxFQeW/iU1gv9Cx9cKpi0k9s2aUHdu1EYucByc3RHSQ8aAvX5KaURpxepbJblK6oNzgTBi4SWKRtP9KjW+DYuYNgmCD3Ydz+58mcuNB4gQWJaI337MXae0OU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FtQMVagw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD5A9FC5;
	Tue,  3 Dec 2024 09:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212948;
	bh=7z6/EAnT7VsSyYSmFx1O+9nGFu4lUDeRzP91zNyEoSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FtQMVagw1Xka630s8e9EA8GAY8nIVm2UgMXZ6DUPRpui2NjyYceB6lWFoyUEgfunl
	 suglfdn1xx/z1w/4xsI3+maUkv0q55yeR+z0vo47V/YcfcMeDRgPIK6tnbfjtvhBLj
	 B28jGFGnvilRy5fKFr0HvdDLaBgjxNhJ4sEmKJHM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:42 +0200
Subject: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/iTNN3gFzdKBzcdbMuJkel0BN+dgFjVgvK5qDPf9lBQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsf+8tuNFXEnXx33H/UJARul4NXBtLotKVGC
 cdOdiEB6CmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HwAKCRD6PaqMvJYe
 9dwJEACS8+VfqzeZ7oDbidTXVXZvzcIdWM94ohHMXEHRUiwkHgT6zFpPDyv3iilBcNd0pB7bsoH
 j6Mr3JarPdMQMAhllZjo4wLzwXT/MdeEqHI4h2WVS9Ua0ev9nuy7LQ7/kjQsI2aSQgFJjy6gRh7
 qoQtqBkmKtYXxcrlPGYo/W2Em77w1AT2Ai1DPlwiNtmP3/OXnUXNB6S6ke1OLo/oYeqfS1A0Nco
 J3NTSfDygPIkTOBOK+2Ux/ELZeJqybH47ZZznTTci1KBseduSzoIdS51aC7IicwGzCWhQqrWHpD
 R5BvDUeO2E2iHCANJ2qbu72gPpxB3USTThkfoczX0+wIrnfjt8i0rSgHAz3kIHfmnm+p+AZn2rR
 x11Ik8Cb43Ldo4Sef4JFcc7v4yLGS3QWU6msaQuOkDYoeh6yZo03v8zaS8Dd90Krh2uCtmkq/ow
 nVNBKTPaPbDHNJV9dx+fnwzAXDLTaKKxzCc9DFcFzaJqsF/gNGpjIYdk33EVzNHq9nbiOW5E38/
 8NwpMYdfsAH8fwVOIob+Tsy39E1u5B6dVt1MeYa+Lb6ee3pJ8PEY+cG/sPAb3+lCKRD6MoFpwQb
 dhJU0/77EvOsC2eEY/dS1r+Kt64iiPpoJsDPllajx1fEfSsftfrThBjiGFVkmIbJKys0D5tMVd1
 PNMHCRXq1QWDYEQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add the device nodes for supporting DU and DSI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 12d8be3fd579..82df6ee98afb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
 			};
 		};
 
+		fcpvd0: fcp@fea10000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea10000 0 0x200>;
+			clocks = <&cpg CPG_MOD 508>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 508>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x8000>;
+			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 830>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 830>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a779h0";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 411>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 411>;
+			reset-names = "du.0";
+			renesas,vsps = <&vspd0 0>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi0: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
@@ -1996,6 +2044,35 @@ isp1vin15: endpoint {
 			};
 		};
 
+		dsi0: dsi-encoder@fed80000 {
+			compatible = "renesas,r8a779h0-dsi-csi2-tx";
+			reg = <0 0xfed80000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 415>,
+				 <&cpg CPG_CORE R8A779H0_CLK_DSIEXT>,
+				 <&cpg CPG_CORE R8A779H0_CLK_DSIREF>;
+			clock-names = "fck", "dsi", "pll";
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 415>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

-- 
2.43.0


