Return-Path: <linux-renesas-soc+bounces-20706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F69B2C532
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 15:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FC9F3B141E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 13:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BF4340DA6;
	Tue, 19 Aug 2025 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F9LfaG0w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5021341ABF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609386; cv=none; b=ipZTzwfij09WoS2qTHVZTudt3i0XpDuZskMJ6FIwL7A06Ec0t8aFSFN+Jsve2BKk5xe8aY6BKTe1QHTTi7lSD5GKsO+NwUiytowdQssMeVSOH0YxQ9ZMsNjXr4qCbDqMgyahg4oc9bx0hqJGn8sz17NIw3AjYkZvfNJbRcoyF3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609386; c=relaxed/simple;
	bh=FlJ31Q4r8DtWEP1JWYKS9HEZuRwP5fOwwXXSziAxGiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DB2ORY6vq5N5Se4tn0++aTD6R8VeIFfGVNloQBuS6NSdpCFxPoGJRZ44B8rB9aiRtlL+rarXhVTlnOJN+qMf3LOQRx5jle8LijeGQLs3l5oS1Ehvoi853FGGumC9c2f2Qg+M2vf7x+Hw48w16l+/Nrf/vL0ms2bAGlMzgdSZgfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F9LfaG0w; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78d1695so69632866b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Aug 2025 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609383; x=1756214183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAyUsYNwkYrgmyUPFJBgMUOEuaiMdUtsvQFJPoQdWaM=;
        b=F9LfaG0w0vsm2D//Wfq3ELbR4tEE+9O+wEY4cdy0e3nKsMdBIpB5uztGYSue7yTkgQ
         VmFxGWwGf6sQcRd4Pp/r/zXared4QSaDyoEYnBc4IJFZTbsnhezudFJyULA2iewctR5L
         WChtNjeQrMecHIArOx1ds81Uzz133D1qDvElVdFw9+Xozw+lC7cFN7wtuH3a9mpb1xyO
         HNgdVapuUUjYm+wq4iMeF3J2Ndb+OjExTQzWTB8nuhv0Bz7KXbtMHUtgGTtVX5Li8pAf
         zI1J8RA1URyAjvOjQB7sIKY7vr/7md5NOri3Z+Ae7brxkn6/dFXa4qNRQhLKdWiO++ZK
         xt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609383; x=1756214183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAyUsYNwkYrgmyUPFJBgMUOEuaiMdUtsvQFJPoQdWaM=;
        b=aDMspqxu0xewLK2aRFtVQJvVm2gz4I1twCoT2D2WMKbX8qkstyR7pZguQXi6KIT0FT
         bY2qMzfjFl5ppaE/Jorc5k7NGqIebZlaUsqQGGnBuLnL6d5bYmoZfH+plYY2VCKmstbR
         9ZJ7/NWKnZInXwclKdmmH05l6Su/PP71sQzyEIUHA9DBKBR1ptS5V88mwoAvGj6lywOC
         WTQ3AubIxLmd8oQnFzyZiV1NIdW6myF2sXUMj7IxRgLwwcQ/5wXJrnp4gOlGkPGEMBS2
         97POntknO01nGjImSJjyGMOSn2GTEhUFwesKKfD1c/4YxCpynLeQOPDKIUdOZO33iJpK
         LHTg==
X-Forwarded-Encrypted: i=1; AJvYcCUEy/o9pYQet+RuvE2oE1U5rzab+JPNLA89HsP9+Fcbgu9vrzuaiJVVwJHsJfyPgZ6UgjEWW2TkhStZzACuDAuN/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+uE2dLnswc0/842XkkVDGrHAjxMDcXY8NZsxc9Kc3b3VUCsZ
	UdQFwY/n1LRSO27DDpwEmu5lWUhmLeS/xoOO53hs/ZuobvEDINr2RtRUpuOdXtJrku9V+zcbOX/
	2S5Jw
X-Gm-Gg: ASbGncuE21jgcDs/a8ekcWWHcfIrQJE1IT6AcV6XQHxCaSlLCQF9VF7d3TYc8v9KI2K
	v/1KiFy23BKxMbft56i9TtlHv2cjwP7P/IokAvVSM7DKMHM6l2Rcc9I2XmC/21Fm4dT7skZEPUF
	B4BP/mWDVO/iRcOXzlJ38yTNsMJCInqBm/4WPTJKROlxznSPj5MfkmNrjI/ZjWhCY7tFhHB+Am5
	oVyEEZYxiJPiiK+wqXxabKF7SjqFz4gbTGwhwOPamJ+fCi9UJXUmiUckgSLEGSj2ahrsdZqf5+r
	M44EKMgyFApPlx9lkIwAZHxc8O7/e63U0qGLWJVn2KWh+w0TVFNgngxmIA5wSAsfCiHSoafj+tJ
	HSDkiOeQNY7Mzy0PQQAOknyHSGEYAxXENLg==
X-Google-Smtp-Source: AGHT+IGicKFJYlSBqndrUCzc72c9FauFKrC2A7g5lsSNLNB3PYbxEyMtEg/eIuHm3Z90cDguU2Hd0A==
X-Received: by 2002:a05:6402:5215:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-61a7e782ac9mr1067731a12.7.1755609383348;
        Tue, 19 Aug 2025 06:16:23 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a755ff4f1sm1779671a12.19.2025.08.19.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: renesas: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:20 +0200
Message-ID: <20250819131619.86396-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5392; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FlJ31Q4r8DtWEP1JWYKS9HEZuRwP5fOwwXXSziAxGiw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHkjDm3kaqBkQYubub/eePmSOb+rw2NpsfmNb
 Iltt+bgNYyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5IwAKCRDBN2bmhouD
 159fD/9oOreHQKUT23cIrD6stunETQgDTwYGUX+YY/clIG0HB4WEcjo+SvL/HYWJ0h21wPGx9jA
 LnOb+zyKYNw2t5B9vMAijjBmrTa74n6hBKdRiE+jpdQiwRIiRAto4tI8/U4wB+ZW+l7PYWN8RPD
 0TbwPuGnVu+gHGzUEMfQxo6E0NIvDysGnYS5L5F+zENATNM9TFCR+O0NC8MHlbu8mkoCCdGfkoM
 kBWxIU+uIeq1FoklPf1wxBddVrHCalam1bFUUOvoGtUJGOx50ZWHhOyE9WJs0HDKQLeR6STlxlx
 deQS0g8grQk3Fo1DE3Hp8bJXlcDNPhUmMYr/eZe7nbQrLxOPmi/wRel2B7yMsRWoGtIv/kmmTWt
 3CoCmSEDq9C7s+8BAyekU2vjbcCIz2O0bN7B7qTA5+ijyv9S0GfP1DMIWVaorXItGlT6fuT58j6
 CJa+XSaPT22dotHPo5N5DfrEPy1z2NFoQGCluRf0du6i5PEvAWSTQtg3HOjJZ8Oow8AHf0U0o67
 R2CUR7aj5wBrlQAkS8KG1pOD1JooQmkM9sJqxzFWieB9d9BGnRTv03Nm68cDmETwQhvwY9BM1s8
 P2riWvMzD8HjDLh9TyzZz7GnGFe0Jc7PRnAueI/NwZEtO+H/nP71aa+MIm94LSDqQu9Z8CcUpXb SiX+miFwMl7IEbQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi       | 16 ++++++++--------
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts  |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi       | 16 ++++++++--------
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts  |  2 +-
 .../boot/dts/renesas/r9a09g057h48-kakip.dts      |  2 +-
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 10d3b9727ea5..50a3d42d192c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -735,10 +735,10 @@ eth0: ethernet@15c30000 {
 					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
 					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
 					  "tx-queue-2", "tx-queue-3";
-			clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
-				  <&cpg CPG_CORE R9A09G056_GBETH_0_CLK_PTP_REF_I>,
-				  <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
-				  <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
+			clocks = <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+				 <&cpg CPG_CORE R9A09G056_GBETH_0_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
+				 <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
 			clock-names = "stmmaceth", "pclk", "ptp_ref",
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb0>;
@@ -836,10 +836,10 @@ eth1: ethernet@15c40000 {
 					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
 					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
 					  "tx-queue-2", "tx-queue-3";
-			clocks =  <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
-				  <&cpg CPG_CORE R9A09G056_GBETH_1_CLK_PTP_REF_I>,
-				  <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
-				  <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
+			clocks = <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
+				 <&cpg CPG_CORE R9A09G056_GBETH_1_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
+				 <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
 			clock-names = "stmmaceth", "pclk", "ptp_ref",
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb1>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 03aeea781186..066e66b5d51a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -334,7 +334,7 @@ sd1-dat-cmd {
 
 	usb20_pins: usb20 {
 		ovc {
-			pinmux =  <RZV2N_PORT_PINMUX(9, 6, 14)>; /* OVC */
+			pinmux = <RZV2N_PORT_PINMUX(9, 6, 14)>; /* OVC */
 		};
 
 		vbus {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 6d0c6449b9ff..e66f5654f2ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1083,10 +1083,10 @@ eth0: ethernet@15c30000 {
 					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
 					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
 					  "tx-queue-2", "tx-queue-3";
-			clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
-				  <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>,
-				  <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
-				  <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
+			clocks = <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+				 <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
+				 <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
 			clock-names = "stmmaceth", "pclk", "ptp_ref",
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb0>;
@@ -1184,10 +1184,10 @@ eth1: ethernet@15c40000 {
 					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
 					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
 					  "tx-queue-2", "tx-queue-3";
-			clocks =  <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
-				  <&cpg CPG_CORE R9A09G057_GBETH_1_CLK_PTP_REF_I>,
-				  <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
-				  <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
+			clocks = <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
+				 <&cpg CPG_CORE R9A09G057_GBETH_1_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
+				 <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
 			clock-names = "stmmaceth", "pclk", "ptp_ref",
 				      "tx", "rx", "tx-180", "rx-180";
 			resets = <&cpg 0xb1>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 5c3f4e471e3d..5c06bce3d5b4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -353,7 +353,7 @@ sd1_cd {
 
 	usb20_pins: usb20 {
 		ovc {
-			pinmux =  <RZV2H_PORT_PINMUX(9, 6, 14)>; /* OVC */
+			pinmux = <RZV2H_PORT_PINMUX(9, 6, 14)>; /* OVC */
 		};
 
 		vbus {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index f6f2cb7d2d25..adf3ab8aef2b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -84,7 +84,7 @@ &ostm7 {
 
 &pinctrl {
 	scif_pins: scif {
-		pins =  "SCIF_RXD", "SCIF_TXD";
+		pins = "SCIF_RXD", "SCIF_TXD";
 	};
 
 	sd0-pwr-en-hog {
-- 
2.48.1


