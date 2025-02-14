Return-Path: <linux-renesas-soc+bounces-13153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D86A35A84
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB1F318905EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F690241673;
	Fri, 14 Feb 2025 09:42:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7635223A9AA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526138; cv=none; b=sQ3UmjeAqwj7l4uIuWdiosaPZFQV2NJChMy35kFYNkdh5cFur8Zu8zHAPNPFI3fj3wAVIGeVhpgVUsTqSqvr/6wspuwYuEMMnfsjplmjXLT6rlFPTbNRSMwAXz7gnL1rLReI1fFl5OCVsW+5g5osTDmSwNLupf5yY8fD0e7yaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526138; c=relaxed/simple;
	bh=8k+NU+/0uqZFr2UdsDW/kOxEr4reqzjxJAbx7dqhIaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agF9Pt6tvoWPy5V7yzxkMNXB2HtPp72lYK+eNRbWER+7FdceuYmBcsIyrS42LE9GFImepkkBU/tG4ltFhxYS8HujM8bLa6HTyHXjXToCU5QYQ3rw20NqhJVn+2VEfihL6b5QlhJG0haOBUkaYfnESO/thaAGgtpX96l95iDGyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YvRsf5Bhgz4wxPQ
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 10:42:14 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6395:73cc:7fc4:4cab])
	by baptiste.telenet-ops.be with cmsmtp
	id DMi72E0041MuxXz01Mi7PJ; Fri, 14 Feb 2025 10:42:07 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisCj-00000006Xjj-3LeY;
	Fri, 14 Feb 2025 10:42:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisD1-00000000ggX-05HU;
	Fri, 14 Feb 2025 10:42:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Fix UART dma channel order
Date: Fri, 14 Feb 2025 10:42:03 +0100
Message-ID: <bcb604ad6e567de4e0410756ba840c82a32ff7d3.1739525488.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739525488.git.geert+renesas@glider.be>
References: <cover.1739525488.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make dtbs_check:

    arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@50000000: dma-names:0: 'tx' was expected
	    from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
    arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@50000000: dma-names:1: 'rx' was expected
	    from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
    ...

The DT bindings specify a fixed order of the channels in the dmas and
dma-names properties, while the Linux driver does not care.
Get rid of the warnings by changing the order in the DTS to match the
bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 7548291c8d7ede43..87e03446fb4de705 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -211,8 +211,8 @@ uart3: serial@50000000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART3>, <&sysctrl R9A06G032_HCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 0 0 0 0 0 1>, <&dmamux 1 0 0 0 1 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 1 0 0 0 1 1>, <&dmamux 0 0 0 0 0 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -224,8 +224,8 @@ uart4: serial@50001000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART4>, <&sysctrl R9A06G032_HCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 2 0 0 0 2 1>, <&dmamux 3 0 0 0 3 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 3 0 0 0 3 1>, <&dmamux 2 0 0 0 2 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -237,8 +237,8 @@ uart5: serial@50002000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART5>, <&sysctrl R9A06G032_HCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 4 0 0 0 4 1>, <&dmamux 5 0 0 0 5 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 5 0 0 0 5 1>, <&dmamux 4 0 0 0 4 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -250,8 +250,8 @@ uart6: serial@50003000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART6>, <&sysctrl R9A06G032_HCLK_UART6>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 6 0 0 0 6 1>, <&dmamux 7 0 0 0 7 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 7 0 0 0 7 1>, <&dmamux 6 0 0 0 6 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -263,8 +263,8 @@ uart7: serial@50004000 {
 			reg-io-width = <4>;
 			clocks = <&sysctrl R9A06G032_CLK_UART7>, <&sysctrl R9A06G032_HCLK_UART7>;
 			clock-names = "baudclk", "apb_pclk";
-			dmas = <&dmamux 4 0 0 0 20 1>, <&dmamux 5 0 0 0 21 1>;
-			dma-names = "rx", "tx";
+			dmas = <&dmamux 5 0 0 0 21 1>, <&dmamux 4 0 0 0 20 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.43.0


