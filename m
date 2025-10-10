Return-Path: <linux-renesas-soc+bounces-22882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD19BCC9B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 12:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6CF189F8AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 10:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C02286897;
	Fri, 10 Oct 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uQjrqzsg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98CE2853EF;
	Fri, 10 Oct 2025 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760093516; cv=none; b=EJ4m0g3eoaargWRTYWdUFO8uWWBEHIACgdCryVaUKMF81eVvWYbE2P3lvgBn/nyDJM8GEK9d62bWgC77ftqeqFCMTR+uBWAMZyD4tHJqTxd4csFoDGm52HZZOhGwejnKMUbm7TnMts/iMmhQ9/qhYdDiuQbZTfQ2Ud1POSCmiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760093516; c=relaxed/simple;
	bh=QiauRhmx3mG/Wv/1yV+N++0tFCy/i8PiZIVrRfvC1PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZMh4ElNgFQvivUGWQgXc9anV6jhDcyjRRAteROAxgDedar0IJAwGqpdyeITLw+2SFkKN41e8QwNAbxqyqX0ZsVg7EjGTQcTBxNAEvVmLIc4XRsd/vmsweyrolIl/wOIle1lrxYIEwZgjcgyPXhMQVif2IVDjKgrIRpb0MJKtRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uQjrqzsg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B899593;
	Fri, 10 Oct 2025 12:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760093417;
	bh=QiauRhmx3mG/Wv/1yV+N++0tFCy/i8PiZIVrRfvC1PI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uQjrqzsg+suiPydYC0ckV10HoZHvS3yTWRhMYpU2OEly2G7BWWIXgY7QIU74McAT9
	 YFws9I/OJd67zi0OvVixTBq9m2f5zQbdUJurBRhokWqCG9/VX4hmkikKor74V0LcAd
	 Tx5W9uKw4xduPCY7rd3aIQvurZqkVYkeIrI6Fhdk=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 10 Oct 2025 11:51:30 +0100
Subject: [PATCH 1/3] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-kakip_dts-v1-1-64f798ad43c9@ideasonboard.com>
References: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
In-Reply-To: <20251010-kakip_dts-v1-0-64f798ad43c9@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=QiauRhmx3mG/Wv/1yV+N++0tFCy/i8PiZIVrRfvC1PI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo6OVHpcIl7tfGGU/+TQ7QJfzps43yfNo0p8ujA
 i0xewiECWGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaOjlRwAKCRDISVd6bEV1
 Mlb3D/4xjq/UX255kLwmhFiRJG6vS8CNkFXRFL4Y8OHH4bsJR1bOXIiEGq6aROSyaBMR+eOrogA
 rUJZkQ5nBwaKuALrOH7RoarPYs+NTBXmbnwkGfyXuTVvexaoAXr7QgyYTSGh8VbUYI71CeVqWw2
 HuMIsBLOH3QvX1m71+ta/I1IJdbGNNqY0UUcgW3oJZYXWUKEOUc81y4Qs4GbXtrUxkjBCalsPZr
 Ci6iHlxtMu/Wnk+oJmAvihwearff0sFdg/FW+jWV7TEN6R8RTKcm+K+7Kr3uojgl8ZYOHKnAzBx
 We246a22XPA3UW/YQ1SsjNkWw/GUpxTQ0Ce7W5RSIhM5s9dKsorruj4/ch9h3nlLhM3qIGwKSKR
 VVnwQD5uX3kqnE8gFC1AV6O2FLdrmC+kAOM35UT12GRth+zHJIUB/HbNAWbOoOjlEvL98dLySmy
 DldxXMq0R+yHShlxUvT9Qr6OSWamIVwyqsJ7YbxCvtpIB91W3xVWcHxQViWhu2ZfA6eeqsGIHuK
 VSP71O4L2Rspy5GLnH8c3hpq3Hb2MEEhumsqC4INkmkyUju1Wg9XVNwx/la1BifeKapM5tMZwhB
 z1X7wLcv79nzra2JRTkJJaTpFznU5/1J20jcZchqA0RnHDO+AQG0nGUna+W6CEEO7/8jfzAHixQ
 jxhtub9q3M3TmZQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add the Input Video Control Block and Arm Mali-C55 ISP to the device
tree file for the RZ/V2H(P) SoC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 630f7a98df386ba05fe4fe69e9ff425c545b5d0d..2ed6711b07ceac76911e7690fd2cb64c114a0e1d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1298,6 +1298,58 @@ queue3 {
 				};
 			};
 		};
+
+		ivc: isp-input@16040000 {
+			compatible = "renesas,r9a09g057-ivc";
+			reg = <0 0x16040000 0 0x230>;
+
+			clocks = <&cpg CPG_MOD 0xe3>,
+				 <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "reg", "axi", "isp";
+
+			power-domains = <&cpg>;
+
+			resets = <&cpg 0xd4>,
+				 <&cpg 0xd1>,
+				 <&cpg 0xd3>;
+			reset-names = "reg", "axi", "isp";
+
+			interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+			status = "disabled";
+
+			port {
+				ivc_out: endpoint {
+					remote-endpoint = <&isp_in>;
+				};
+			};
+		};
+
+		isp: isp@16080000 {
+			compatible = "arm,mali-c55";
+			reg = <0 0x16080000 0 0x200000>;
+
+			clocks = <&cpg CPG_MOD 0xe2>,
+				 <&cpg CPG_MOD 0xe4>,
+				 <&cpg CPG_MOD 0xe5>;
+			clock-names = "vclk", "aclk", "hclk";
+
+			resets = <&cpg 0xd2>,
+				 <&cpg 0xd1>,
+				 <&cpg 0xd3>;
+			reset-names = "vresetn", "aresetn", "hresetn";
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			port {
+				isp_in: endpoint {
+					remote-endpoint = <&ivc_out>;
+				};
+			};
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {

-- 
2.43.0


