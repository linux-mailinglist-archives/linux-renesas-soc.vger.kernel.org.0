Return-Path: <linux-renesas-soc+bounces-20097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21089B1DAA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E627224AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 15:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04032264A77;
	Thu,  7 Aug 2025 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qrq4vM6l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA5265298
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579698; cv=none; b=EhoyP8DeUNQyp9PGYbIAJUh5Tu2sbZhiTMWex3mxkf8tMi1JNHaSU/kEj8l0nlM/PxV0uC6L3dI8ncOCh6uQ5/dejNcA//4UAhjtLd0RMfxAAMn8PklqZX/voy/o7cTPnGVeC054d5PgWGAu06ZWYCuL1VIs/YnT0rBrw+lSajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579698; c=relaxed/simple;
	bh=E+hpfolGYZf7sAsbES8oZTsvGW5O/mswdrJw2qpKx5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ho988cUGFnaOVzTi1iWfu5OcwX98GJ6I4Z1O7VMpIONg8ixI3Gx+DU8iWPYO6XzEA11vLGi/KTb2h02W8hS3j1mQ4uxV54rt9RrhKoNIB1qhidlb1+Yf0XxfMVmr3lDgCY31IEdJCc5xhopJZCdybqRN1x5jV64Cf0hPJcafkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qrq4vM6l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sArpFuVDJQmc58YvuDhIXnslLARGT3Kw2MjcBxMYtJ8=; b=Qrq4vM
	6lbuuTdNyahc851rIL47YwsnfFKXkQV7CG0J5azqbggAwdxEMhG4+67M63DLwXsC
	WPz+fOxY2mfia+eGw1TSQEZUykWAChtiA7s0qNMzgooL2z1uOX/BE0L34cxF1cTV
	lbmFI+JXbBJSDPCs7XkvBCuLMIAAWf1AUt6sV4yzSGl33oz0gnSFmd43T25ErQmN
	qnrtykttnadaDEwQlaexk230iJrWupRyOv0rabXBnPaGI/FKHMzL0JAs+z68J0K/
	xC5VRgoF0oeRIco3XYRIAwicf+UNHHYqTmwCSFmBobUanGtom08v3DWAEQQJwuwF
	EW079QYS3NmZ5c3A==
Received: (qmail 1277585 invoked from network); 7 Aug 2025 17:14:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 17:14:52 +0200
X-UD-Smtp-Session: l3s3148p1@sUhN68c7UAnCtheG
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g047: Add I3C node
Date: Thu,  7 Aug 2025 17:14:36 +0200
Message-ID: <20250807151434.5241-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Add the I3C node to RZ/G3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index e4fac7e0d764..d2e5f5980185 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -601,6 +601,41 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		i3c0: i3c@12400000 {
+			compatible = "renesas,r9a09g047-i3c";
+			reg = <0 0x12400000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x91>,
+				 <&cpg CPG_MOD 0x92>,
+				 <&cpg CPG_MOD 0x90>;
+			clock-names = "pclk", "tclk", "pclkrw";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 675 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 678 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 679 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 680 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 681 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 682 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ierr", "terr", "abort", "resp",
+					  "cmd", "ibi", "rx", "tx", "rcv",
+					  "st", "sp", "tend", "nack", "al",
+					  "tmo", "wu";
+			resets = <&cpg 0x96>, <&cpg 0x97>;
+			reset-names = "presetn", "tresetn";
+			power-domains = <&cpg>;
+			#address-cells = <3>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpu: gpu@14850000 {
 			compatible = "renesas,r9a09g047-mali",
 				     "arm,mali-bifrost";
-- 
2.47.2


