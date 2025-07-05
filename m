Return-Path: <linux-renesas-soc+bounces-19275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E24EAAFA14F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590C43A8B53
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BBA1CEEBE;
	Sat,  5 Jul 2025 19:09:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEA1C84CB
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742575; cv=none; b=kJLKDg1xmjryVIIcKyynsNHsYAFu2gZw5pYOK+i9jvk6JKUlyPlWbOvbH4B2KdhcoZ4dO7dH4KSrTfxJabBAnwRCYNlCiTl955d9g6xWG59BjymcCNStF0+u2GRFkcqngGmCC0NoEvF7Oe/ve6BEHtTT62ZGcCwcQzh2SHK+Qqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742575; c=relaxed/simple;
	bh=sZfwkV9T3IOdwUrtrV9lLKz+9fb+HXkUumwHPFPoe5A=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=BRWnWqZIi9rs7Ex2G1sCAKVmN5dnK7yzbUNQ8JMaPDld+B3OhMgzLmK9Pn6hQpau3S0SBO7muT9PR/jeCSF8lFZEndQxmVclfWt+nXatpaYBny0Pnbtd+uZrahWz+Gw+KZNmn4btNXwH9NllhzKT3LlWlydfxQtk/0VFYc+GEP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d3f192a64eso200083785a.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742572; x=1752347372;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzKpRcEmc4OfyEBuLF2/nElHzG6TDnezVmnQrOsN8H0=;
        b=sAhe/tEvFnz22A0g45O7eJXvlRSqEY6028I8hh9t2kFX6zWtZy2a89hrC/jZ5YJpdY
         MytcZNnpBVz24/9YUl35MhLCfwC/wwtKH9ecHbkSF4yBrb3Y0oQA0dXqXaAa2BGFlvQI
         z2hZMYA59+NAnEZ26ifLP9DVRqEt5hLcMFnurZ+9oUJfwmQJZIpV127f/37ww6ML3X49
         OY32xgaXfs0C4suzpw5hCs9GsAj0ZstCPFsGa6eInzxFottf6+s3A8/J5x7anX40FbVS
         RVtaRvhBc/va2PP55Nvp65CPAP4WqEhlpCjcJwZ44F6l7bFWXytiyaiYOItSVjssWWxI
         0VMA==
X-Gm-Message-State: AOJu0YzbQQCwYpKim+HrL51vIxzx8FpRNetoqBxOhxev6onskA81adT/
	EqcgqS82U/s6q5JKUmIEqaev6ZJZ+OajeVNvgvVJ7MjRGXW83I7xhw58ydzh7iU/
X-Gm-Gg: ASbGncu1YBzcsot8TTtqVd6LKd67L/ikgVxF1i+yC064M+g+cogudPbM3wjApFbMAZQ
	Kke71n9sCL3IbRtE7JMhCOPYN+lPPgj1LXWSWj0Q3raXv5VlJcqpWohPrKBqgGs4J3bAKQvqy5Q
	65oCglGFkEBtJfpONcgJSev1frhf7z46YreP5IMXz9xJnoX8xJgST+0eoOCWtNG9Q7urC7KBenu
	VuWEdFuNXt9/DDI67mwHFq9APgx9cwtEWB2y7NICoiQiCVuuavs84ppM8BYwnDERH8uAJMbNt77
	oWc14yjQZ7Ks2UEENUCkeGl6BQcYmTvVskafWcPD4DhQL/ryZ7pQ/ZePH/ohFIp6g+goOQsc3Qu
	HPcUqs4e91nJD
X-Google-Smtp-Source: AGHT+IEtocTnYwTR1JhxIBwnd87ij0BhBUCAOWNHYsuf/wmoT7bQcdMG7/0UTELWhoKSpIZ+Y++GeA==
X-Received: by 2002:a05:620a:46a0:b0:7d4:5abd:6859 with SMTP id af79cd13be357-7d5f16ec1a8mr535953385a.46.1751742572014;
        Sat, 05 Jul 2025 12:09:32 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7bc91sm346628085a.56.2025.07.05.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:09:31 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:09:29 +0200
Message-Id: <175174256950.83411.5319298494550248866.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 6/6] ARM: dts: renesas: rza2mbtc: initial board support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add initial support for the RZA2MBTC board which is based on the RZ/A2M by
Renesas Electronics. Included in this patch are DTS nodes for serial console,
on-board SPI flash as well as RMII Ethernet.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies to next-20250704

 arch/arm/boot/dts/renesas/Makefile                  |    1 
 work/arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dts |  133 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 
--- 0006/arch/arm/boot/dts/renesas/Makefile
+++ work/arch/arm/boot/dts/renesas/Makefile	2025-07-05 22:03:46.456578459 +0900
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r7s72100-gr-peach.dtb \
 	r7s72100-rskrza1.dtb \
 	r7s9210-gr-mango.dtb \
+	r7s9210-rza2mbtc.dtb \
 	r7s9210-rza2mevb.dtb \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
--- /dev/null
+++ work/arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dts	2025-07-05 22:03:21.996442287 +0900
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/A2M BTC board
+ *
+ * Based on RZA2MEVB, Copyright (C) 2018 Renesas Electronics
+ */
+
+/dts-v1/;
+#include "r7s9210.dtsi"
+#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
+
+/ {
+	model = "RZA2MBTC";
+	compatible = "aprg,rza2mbtc", "renesas,r7s9210";
+
+	aliases {
+		serial0 = &scif1;
+		spi0 = &rpc0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>; /* EXTAL: Y2: ECS-240-8-47B-7KM-TR (24MHz) */
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
+&rpc0 {
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
+				label = "mcuboot";
+				reg = <0x00000000 0x00018000>;
+				read-only;
+			};
+			partition@18000 {
+				label = "mcuboot-scratch";
+				reg = <0x00018000 0x00008000>;
+				read-only;
+			};
+			partition@20000 {
+				label = "mcuboot-primary";
+				reg = <0x00020000 0x00060000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "mcuboot-secondary";
+				reg = <0x00080000 0x00060000>;
+			};
+			partition@e0000 {
+				label = "u-boot-env";
+				reg = <0x000e0000 0x00010000>;
+			};
+			partition@f0000 {
+				label = "factory-data";
+				reg = <0x000f0000 0x00010000>;
+				read-only;
+			};
+		};
+	};
+};
+
+&ether1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eth1_pins>;
+	status = "okay";
+	phy-mode = "rmii";
+
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.c0f0",
+			   "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&pinctrl {
+	scif1_pins: serial0 {
+		pinmux = <RZA2_PINMUX(PORTJ, 2, 4)>, /* H1:1 PJ_2 (TxD1) */
+			 <RZA2_PINMUX(PORTJ, 1, 4)>; /* H1:2 PJ_1 (RxD1) */
+	};
+
+	eth1_pins: eth1 {
+		pinmux = <RZA2_PINMUX(PORT3, 3, 1)>, /* ET1_MDC */
+			 <RZA2_PINMUX(PORT3, 4, 1)>, /* ET1_MDIO */
+			 <RZA2_PINMUX(PORTK, 3, 7)>, /* REF50CK1 */
+			 <RZA2_PINMUX(PORTK, 0, 7)>, /* RMII1_TXDEN */
+			 <RZA2_PINMUX(PORTK, 1, 7)>, /* RMII1_TXD0 */
+			 <RZA2_PINMUX(PORTK, 2, 7)>, /* RMII1_TXD1 */
+			 <RZA2_PINMUX(PORT3, 2, 7)>, /* RMII1_CRSDV */
+			 <RZA2_PINMUX(PORTK, 4, 7)>, /* RMII1_RXD0 */
+			 <RZA2_PINMUX(PORT3, 5, 7)>, /* RMII1_RXD1 */
+			 <RZA2_PINMUX(PORT3, 1, 7)>; /* RMII1_RXER */
+	};
+};
+
+&rtc_x1_clk {
+	clock-frequency = <32768>; /* RTC_X1: Y1: ECS-.327-12.5-1210-TR (32kHz) */
+};
+
+&scif1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif1_pins>;
+
+	status = "okay";
+};

