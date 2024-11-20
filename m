Return-Path: <linux-renesas-soc+bounces-10635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAF9D3864
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 11:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41970B21946
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCA9199E94;
	Wed, 20 Nov 2024 10:30:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE6156669
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Nov 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732098658; cv=none; b=L7FnA9cbOjCGI/luP0KQR/9Nnxnig/aNvSPHpBzXBVJwCEIMZAv/r5yjoZJ90NL0LVwyXuchSe1AtIFCgbcLamk6CfBoBab8dR7HSJuxnzHHRXbt+zDP2mrDlWlD+qAzAPJV82POEpdlejiM7tA/dkDHl7ERNvtPsEYGBQF7kCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732098658; c=relaxed/simple;
	bh=gQX5Y5VtwYzDgJZysAQCpuO0Sdmwez6CqZ2bCZbHUNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f8GY3D+udixsp6AqEb5auDj8qiiOKyWaP2oW4hSUAu/GTZ+6fAEXJsEAOpxQWI386vnIo+Hcyg2Dc4K8yhgUYO4bSvEpIlcuHZxeVj8AFhlpbOvZ0ZMXC8U4S5UW6ilYhEG+aUF2cwTy4xBqcJF1vTm6bRUmeKHwPtyyypnncsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:35da:ab43:467b:7991])
	by michel.telenet-ops.be with cmsmtp
	id eyWn2D00f3gUftr06yWnEw; Wed, 20 Nov 2024 11:30:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhya-007bk2-8e;
	Wed, 20 Nov 2024 11:30:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhyx-005W42-Hn;
	Wed, 20 Nov 2024 11:30:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r7s72100: Add DMA support to RSPI
Date: Wed, 20 Nov 2024 11:30:46 +0100
Message-Id: <dfafc16b840630f20e75292d419479294558e173.1732098491.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMA properties to the device nodes for Renesas Serial Peripheral
Interfaces.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.14.

Tested on RSK+RZA1 with Renesas YRSK-LCD-PMOD (Okaya 1.44" 128x128 Color
TFT LCD) expansion on PMOD2, using r7s72100-rskrza1-pmod-spi.dtso and
r7s72100-rskrza1-pmod2-lcd.dtso from my renesas-overlays branch[1].

Without DMA:
  - Screen refresh is visible and takes ca. 1s,
  - "modetest -s" causes 163930 interrupts,
  - workqueue: drm_fb_helper_damage_work hogged CPU for >50000us 19
    times, consider switching to WQ_UNBOUND.

With DMA:
  - Screen refresh is instantaneous,
  - "modetest -s" causes 100 RSPI and 14 DMAC interrupts.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index b831bbc431efb93e..1a866dbaf5e93423 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -238,6 +238,8 @@ spi0: spi@e800c800 {
 				     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI0>;
+			dmas = <&dmac 0x2d21>, <&dmac 0x2d22>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -253,6 +255,8 @@ spi1: spi@e800d000 {
 				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI1>;
+			dmas = <&dmac 0x2d25>, <&dmac 0x2d26>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -268,6 +272,8 @@ spi2: spi@e800d800 {
 				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI2>;
+			dmas = <&dmac 0x2d29>, <&dmac 0x2d2a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -283,6 +289,8 @@ spi3: spi@e800e000 {
 				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI3>;
+			dmas = <&dmac 0x2d2d>, <&dmac 0x2d2e>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -298,6 +306,8 @@ spi4: spi@e800e800 {
 				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&mstp10_clks R7S72100_CLK_SPI4>;
+			dmas = <&dmac 0x2d31>, <&dmac 0x2d32>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg_clocks>;
 			num-cs = <1>;
 			#address-cells = <1>;
-- 
2.34.1


