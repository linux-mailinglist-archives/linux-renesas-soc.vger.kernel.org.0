Return-Path: <linux-renesas-soc+bounces-19273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350DFAFA14D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B6A4A77AC
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C7B1CEEBE;
	Sat,  5 Jul 2025 19:09:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAA1C84CB
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742559; cv=none; b=hlDXhfTq8C/AZ1DM/7k5MkHjdknuT50zz486dAwNmXDe9/9dgEkPMNyq573vSxRTEjIqEN5o3uHHdBUgak5T2A29h08Y4Bmf6wxYnGNzvhvup0lJ/2dWDaaTwj4F85IheJVF1+OSbcbhSiBmyPwRdfNpoKehWaxMq1llys75sDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742559; c=relaxed/simple;
	bh=I7Lany95Imdzytds+UsHu9fXm/d4P0pjj4Gi2a0K+zk=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=Yn5UzwqaijUqGRWxe/d/v12EN8jqpRB5xTnePj5jM7oYGwr7jyQ79MOcb6Ju59Hj1XxRM2Q6qZFLvyExBhhiqgc8BnIit7ryy8OulLdMcAkwL8t5vase2VAmwgAsH6/i870NUD3ry9RvX1QKhx+BUH4/MQBOjaZnvu94IYC2YqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a4312b4849so23347051cf.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742557; x=1752347357;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBpuZh7xiVCRZ6b7Ec8yH/E3DM0nvOGZzWfD/9XtALY=;
        b=Is5AfTYfmPEbIW2I4j0gW8SLfj4sSdkjBLfMF1t0pybQYWESJtQGyJHccgVoWGMaMx
         GvVivZM680v77+L6w034jDh7JDXHTNsbfE52Pz53Xb2mFn9TgvUQ/5UbTkuqkwliqswG
         3zec7Cm92daugytmDw+hZ185Bzm6jLSq/D4b5olAQ2weIGEvG8PcU2N+5v4h7ijrtdde
         hbzfYC7CWiE/3Wpol1gREkiwc2gBhmUm0kYd5nXJ2g+hJetHfVNU2jO4r3j5FlXuJb6U
         WLMX8RIO3PUKozUgJf7/Cn5RggQ2T2hZe/Zp20blN3WycOsVZYrUZMzFlHEpFDdML1D/
         +6vg==
X-Gm-Message-State: AOJu0YyVPgst84qxWi+Bd/juLPBC3Eq8xf5vOhm/O4TySZAF7A0G/ijS
	EY9H2FycpsooEuvOOVf4xoOGEHUAT9w2D5mqtD7qiSKOALo6xBx6fU6C7HYJSqNH
X-Gm-Gg: ASbGnctkeUM1gCV4DShTZxSfPTteJzMglt6sqQ9xwQKIx7tyw19uqdbMRjdUiZJXDsF
	hllEZxunXxpmm4uvO/9ybM0PsKhgb+15h7nzVXeE5PB2z5oz0UaKGvPXPTxd2jag6iYmJrIUObF
	9dH1YnSw3jGkz+TkM4kGmGm/FkyMszt3RukQarrPUIZXUDC0nGwqIuiHORWEDb8FI4NcTQ1mHSN
	2T+LmRbPpDU5WEtymV/Kk8q3+ewmkdSmCZDS7T90XQYnCdFhhtcuYd+SdHb1Ar7B9OVUpy1/mne
	bnAxBWOJN//i+LFYVzUGWghMCgBoFwPBikCX4vijGyo0goxVf+uFK9t9Xsg5f/TIwQAYbGP51AG
	Lg2EIcjAT5oer
X-Google-Smtp-Source: AGHT+IECIfmMAf4k18L7fwmtx9QGRJK2iViZ15d4aVgn+t/UGn5L8byFHZwSdWjysYDiK62tFZnEzA==
X-Received: by 2002:a05:622a:1344:b0:4a9:a596:1c00 with SMTP id d75a77b69052e-4a9a68a7148mr47591511cf.12.1751742556968;
        Sat, 05 Jul 2025 12:09:16 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994aa7749sm35087261cf.71.2025.07.05.12.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:09:16 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:09:14 +0200
Message-Id: <175174255437.83411.8624204632703877341.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add genmai board support code to make use of one of the on-chip rpc-if devices
to interface to the on-board SPI flash U6 Spansion S25FK512S-16. Without this
patch the SPI flash is accessible through a memory mapped window, however by
adding pinctrl configuration and a rpc-if device node to the DTS we can now
access the SPI flash via the the rpc-if driver instead.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies to next-20250704

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts |   71 ++++++++++++++-----------
 1 file changed, 42 insertions(+), 29 deletions(-)

--- 0001/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ work/arch/arm/boot/dts/renesas/r7s72100-genmai.dts	2025-07-06 00:02:33.267119292 +0900
@@ -18,6 +18,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		spi0 = &rpc0;
 	};
 
 	chosen {
@@ -25,35 +26,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	flash@18000000 {
-		compatible = "mtd-rom";
-		reg = <0x18000000 0x08000000>;
-		bank-width = <4>;
-		device-width = <1>;
-
-		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
-		power-domains = <&cpg_clocks>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "user";
-				reg = <0x00000000 0x04000000>;
-			};
-
-			partition@4000000 {
-				label = "user1";
-				reg = <0x04000000 0x04000000>;
-			};
-		};
-	};
-
 	keyboard {
 		compatible = "gpio-keys";
 
@@ -98,6 +70,38 @@
 	};
 };
 
+&rpc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rpc0_pins>;
+
+	status = "okay";
+
+	flash0: spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00080000>;
+			};
+			partition@80000 {
+				label = "uboot-env";
+				reg = <0x00080000 0x00040000>;
+			};
+		};
+	};
+};
+
 &bsc {
 	flash@0 {
 		compatible = "cfi-flash";
@@ -273,6 +277,15 @@
 			 <RZA1_PINMUX(4, 14, 3)>,	/* SD_D3_0 */
 			 <RZA1_PINMUX(4, 15, 3)>;	/* SD_D2_0 */
 	};
+
+	rpc0_pins: rpc0 {
+		pinmux = <RZA1_PINMUX(9, 2, 2)>,	/* P9_2/SPBCLK_0 */
+			 <RZA1_PINMUX(9, 3, 2)>,	/* P9_3/SPBSSL_0 */
+			 <RZA1_PINMUX(9, 4, 2)>,	/* P9_4/SPBIO00_0 */
+			 <RZA1_PINMUX(9, 5, 2)>,	/* P9_5/SPBIO10_0 */
+			 <RZA1_PINMUX(9, 6, 2)>,	/* P9_6/SPBIO20_0 */
+			 <RZA1_PINMUX(9, 7, 2)>;	/* P9_7/SPBIO30_0 */
+	};
 };
 
 &rtc_x1_clk {

