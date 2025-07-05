Return-Path: <linux-renesas-soc+bounces-19274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB23AFA14E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D1FC4A77AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD1D1CEEBE;
	Sat,  5 Jul 2025 19:09:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71DD1C84CB
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742567; cv=none; b=obo4lYglw7nRo1nLgwp+h0eoAfTfEcE1ty9un0JVOnj0Op1DIb7SXQJa7ewuj7kE5tYuFo+g1N/AQx6kjMp5DI/lskfB/trH5Zoi3SsshoJkA+1JLZBRTsToC9kVP6MRAmeht5xAhIZ2kXvAemM4fcj09DiP9YnG57ninhYhh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742567; c=relaxed/simple;
	bh=2ELZjulQXdUnNeieK5z6/8yL6afdQvElIpqL9HJ8YHI=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=Qlv89gRV0r1TJ6arWXzAUPNK4cy4HScN8th4sHV2EEMdnR1FBGpf9ggx9TeOqum+zh7xuiGP43AI+8czUpcXLK2lCSsWnfoSmYDrdaSty67vSQXgNY8GBX08IuCc1yU3W+37xJslTnB936hoHI9gscloryTuE/r0avVzQOvFzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6faf66905adso14558086d6.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742565; x=1752347365;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBSxCnHwKAnh1F9+bgDzR1HilE/3JgnVIG0vawvtQJQ=;
        b=a4bBpXXbbUFeuOhSC1otj9BDn+OwbfXnCADugkk8FeyOPLqpSd0Jr3Rqb+tUBq36yZ
         54rt5CdMOu+tjp0fspS0ti9iV5AjlPy84MzgflpjuzgQofDj177lAcRn52fYwuYfARni
         p0SYP+yEdLosuGF2UiETA+XAUyZdIja/5g9zaUb+USOgAcxUvh8ogrtrDAowh3DXUXJn
         kF1lV0i4oFHAsBck+gyud0KipFFcAHaMeBPBh3QOl4SyEJDJH40elroDfQZGk/53t9jm
         J5Mpytpuiogs5Kwyn34hagn6ZqudiwdIDUKKlCF4nMEzhe8Gg0t4xdMBNUO8VKQR3Yzy
         rEpA==
X-Gm-Message-State: AOJu0Yzfd5OZVmCcqy7vZzqkexdKzukjnG76W/dSQ4DX/AnspHuIoH0m
	AcjYmbItRi5PMtT+woq31GIYsnxRsuSeh/j3LUzW6D5h4gOyqQx2kxo50d14yUjA
X-Gm-Gg: ASbGncvnq7VcQQQMsIhFlhZomrl5uIROtxIw+oLVgHckShAIkx3Q6PhSCrO2fvvINni
	IRlAY67QYMO9/5xt4l1FCq5VM9sk4LqyF9g9CS4wovdBzD6en80ORX35qk5sNxGgTu4HQ3ZmyOd
	iFoh8gqPoEbXd3AgznKVEZo+isstU9h2dDqfm5pM1UOqO6AweRkmbf7Mf1GhhASdEaxanfZ8nXN
	a0aZnkhvzZGHqB5wCaxv+T+F27WVMbB79iEM9lfxajKeK6ABGAYiSNPbVNlPPxuZWbfPtC6I+iQ
	+q3sSDtA8Y3WGImcbug/NlpBbt+A2Vlrhf99M1Sqrs0n0coyQqFomtaNItC/Hd0zzj94meiCz1N
	iD2WFFjexluqD
X-Google-Smtp-Source: AGHT+IHAxhAg0rj9ThzpRFZANrjgzdhiOsyur9WpDPqlAnCNoQGH1ZVUgyzOmXtSPygpyVWyzyOVsA==
X-Received: by 2002:a05:6214:5884:b0:701:50f:4f4f with SMTP id 6a1803df08f44-702c8b71e3fmr102933036d6.3.1751742564481;
        Sat, 05 Jul 2025 12:09:24 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4ccd35dsm32888416d6.32.2025.07.05.12.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:09:24 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:09:21 +0200
Message-Id: <175174256197.83411.17862990607564379077.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 5/6] ARM: dts: renesas: gr-mango: initial board support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add initial support for the GR-Mango board which is based on RZ/A2M by Renesas
Electronics. Included in this patch are DTS nodes for serial console as well
as MII Ethernet.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies to next-20250704

 arch/arm/boot/dts/renesas/Makefile                  |    1 
 work/arch/arm/boot/dts/renesas/r7s9210-gr-mango.dts |   87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 
--- 0001/arch/arm/boot/dts/renesas/Makefile
+++ work/arch/arm/boot/dts/renesas/Makefile	2025-07-05 21:57:56.886566015 +0900
@@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r7s72100-genmai.dtb \
 	r7s72100-gr-peach.dtb \
 	r7s72100-rskrza1.dtb \
+	r7s9210-gr-mango.dtb \
 	r7s9210-rza2mevb.dtb \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
--- /dev/null
+++ work/arch/arm/boot/dts/renesas/r7s9210-gr-mango.dts	2025-07-05 21:56:25.214033636 +0900
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the GRMANGO board
+ *
+ * Based on RZA2MEVB, Copyright (C) 2018 Renesas Electronics
+ */
+
+/dts-v1/;
+#include "r7s9210.dtsi"
+#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
+
+/ {
+	model = "GRMANGO";
+	compatible = "renesas,grmango", "renesas,r7s9210";
+
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;	/* EXTAL: X2: FCXO-07(24MHz) */
+};
+
+&ostm0 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	phy-mode = "mii";
+
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.c0f0",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&pinctrl {
+	scif0_pins: serial0 {
+		pinmux = <RZA2_PINMUX(PORT4, 2, 1)>,	/* TxD0 */
+			 <RZA2_PINMUX(PORT4, 1, 1)>;	/* RxD0 */
+	};
+
+	eth1_pins: eth1 {
+		pinmux = <RZA2_PINMUX(PORT3, 3, 1)>, /* ET1_MDC */
+			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
+			 <RZA2_PINMUX(PORTC, 0, 3)>, /* ET1_TXCLK */
+			 <RZA2_PINMUX(PORTC, 4, 3)>, /* ET1_TXER */
+			 <RZA2_PINMUX(PORTK, 0, 1)>, /* ET1_TXEN */
+			 <RZA2_PINMUX(PORTK, 1, 1)>, /* ET1_TXD0 */
+			 <RZA2_PINMUX(PORTK, 2, 1)>, /* ET1_TXD1 */
+			 <RZA2_PINMUX(PORTC, 1, 3)>, /* ET1_TXD2 */
+			 <RZA2_PINMUX(PORTC, 2, 3)>, /* ET1_TXD3 */
+			 <RZA2_PINMUX(PORTK, 3, 1)>, /* ET1_RXCLK */
+			 <RZA2_PINMUX(PORT3, 1, 1)>, /* ET1_RXER */
+			 <RZA2_PINMUX(PORTC, 5, 3)>, /* ET1_RXDV */
+			 <RZA2_PINMUX(PORTK, 4, 1)>, /* ET1_RXD0 */
+			 <RZA2_PINMUX(PORT3, 5, 1)>, /* ET1_RXD1 */
+			 <RZA2_PINMUX(PORTC, 6, 3)>, /* ET1_RXD2 */
+			 <RZA2_PINMUX(PORTC, 7, 3)>, /* ET1_RXD3 */
+			 <RZA2_PINMUX(PORT3, 2, 1)>, /* ET1_CRS */
+			 <RZA2_PINMUX(PORTC, 3, 3)>; /* ET1_COL */
+	};
+};
+
+&scif0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif0_pins>;
+
+	status = "okay";
+};

