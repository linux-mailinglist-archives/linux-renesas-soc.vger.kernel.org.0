Return-Path: <linux-renesas-soc+bounces-13154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE80A35A86
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 10:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADFE23AD354
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 09:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB9223F422;
	Fri, 14 Feb 2025 09:42:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CBE241660
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526139; cv=none; b=VEQr1gbsajW49qnyE+5sSe8O5yuyCO4xi4BLogeqRaXDYFoHZyF/144h12XXYH4qDTR0giNU2mgbHFA7r8AjfElbYvrW1itCsmr/IzEp3zerqet5dUeL7z116O2LZrnqV0z8KEGyLg3HNV6PjsEZP3vCkzO5kafpWeIs7ydEExo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526139; c=relaxed/simple;
	bh=eXfeyXIOBKg7bIwINN+nZAJVj7Fi6EoT/vbIpEehkCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpuZOhA4OVWxAw9y1ApwNNAez7ojSKVfoYusDOCIR48DBVkqoVGpKF4J3/1jQXNAuv40JkNykgL2gpKlwBRbko+IYovwRob761iJgrxkV0sIAyKG6Srh3pqOOOay6VHJgqTGzZtspL0Y4//NUYyTn9tJ/++nzxi5UT7n2iNZhos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YvRsg4JkZz4x1sS
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Feb 2025 10:42:15 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:6395:73cc:7fc4:4cab])
	by albert.telenet-ops.be with cmsmtp
	id DMi72E0091MuxXz06Mi7Ja; Fri, 14 Feb 2025 10:42:08 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisCj-00000006Xjm-3TOO;
	Fri, 14 Feb 2025 10:42:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tisD1-00000000ggb-0ErY;
	Fri, 14 Feb 2025 10:42:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: renesas: r9a06g032: Drop snps,dw-apb-uart compatibility
Date: Fri, 14 Feb 2025 10:42:04 +0100
Message-ID: <e290dd28ecb68b4e164172a905da18a5a2d438a1.1739525488.git.geert+renesas@glider.be>
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

    arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: serial@40060000: compatible: 'oneOf' conditional failed, one must be fixed:
	    ['renesas,r9a06g032-uart', 'renesas,rzn1-uart', 'snps,dw-apb-uart'] is too long
    ...

As per commit 72b0505f0830df95 ("dt: serial: Add Renesas RZ/N1 binding
documentation"), the RZ/N1 UART is a modified Synopsys DesignWare UART.
The modifications only relate to DMA, so you could actually use the
controller with the Synopsys compatible string if you are not using DMA,
but you should not do so.  Hence the first three UARTs (which don't
support DMA) were added with a "snps,dw-apb-uart" fallback, to use the
existing Synopsys DesignWare UART support.

Since support for the RZ/N1-specific compatible value was added to the
driver a long time ago (commit 2ff5fa7f742ab0c6 ("serial: 8250_dw: Add
compatible string for Renesas RZ/N1 UART") in v4.19), the extra
compatible value can be dropped safely.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Alternatively, the bindings[1] could be augmented with an extra section:

    - items:
        - enum:
            - renesas,r9a06g032-uart
            - renesas,r9a06g033-uart
        - const: renesas,rzn1-uart
        - const: snps,dw-apb-uart     # RZ/N1 without DMA

and perhaps extra logic to prohibit the dmas property when both
renesas,rzn1-uart and snps,dw-apb-uart are present.

Given the complexity of the latter, I went for the simple solution.

[1] Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 87e03446fb4de705..fc523106c2a4c6a0 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -171,7 +171,7 @@ usb@2,0 {
 		};
 
 		uart0: serial@40060000 {
-			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x40060000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -182,7 +182,7 @@ uart0: serial@40060000 {
 		};
 
 		uart1: serial@40061000 {
-			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x40061000 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
@@ -193,7 +193,7 @@ uart1: serial@40061000 {
 		};
 
 		uart2: serial@40062000 {
-			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
+			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";
 			reg = <0x40062000 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
-- 
2.43.0


