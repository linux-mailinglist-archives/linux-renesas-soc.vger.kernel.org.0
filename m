Return-Path: <linux-renesas-soc+bounces-4213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC40895581
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 15:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8EF1C2088E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 13:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240C582D86;
	Tue,  2 Apr 2024 13:36:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813260DE9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712065009; cv=none; b=cM2h1/PVc1AwZ0JMbki2WMuq4CrKbS7OH4c2xwe7RkEqfS+ago/761Ta+xNWRsJr5Bk7wWr9XPMA6yhOJpbZgPWrv63HiOQhAOh1zc56PdmhZZ2tyO7lTrYUBECGbNNso7gvFT0N6ZOXKP5A2h3ooXjS9FWbQaT/Aqm1wy7H4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712065009; c=relaxed/simple;
	bh=pwZHdPnPX0Wt7DXHoK+YmO2S0EFc+qJIfeY9k9Ql824=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sWR1miR9izOe4fO82juQutG7HLNijxHEDPuJ1Qh4hVvNc96P2buy6YExE2EeiX4lIrgBjpYfLY+924lYgK6CdyT80eZ1LJEsrE/AznCRY5eugyXfMjaVYaFYbNtj+jwH/Ipbk8+ArkmrT7KxBMFVNheSj2xrvkW+yFNglDvVA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id 6Dck2C0050SSLxL01DckKg; Tue, 02 Apr 2024 15:36:44 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rreJE-00G29A-ID;
	Tue, 02 Apr 2024 15:36:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rreJf-009oWQ-Rj;
	Tue, 02 Apr 2024 15:36:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: r9a06g032: Remove duplicate interrupt-parent
Date: Tue,  2 Apr 2024 15:36:42 +0200
Message-Id: <7ac440ec923f5d781a93c4344d6fedf280c3fa72.1712064816.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the "soc" node already specifies the GIC as the interrupt-parent,
there is no reason to repeat this in any of its subnodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.10.
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index fa63e1afc4ef4c92..45f60eeeaaa1d320 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -319,7 +319,6 @@ dma1: dma-controller@40105000 {
 		gmac2: ethernet@44002000 {
 			compatible = "renesas,r9a06g032-gmac", "renesas,rzn1-gmac", "snps,dwmac";
 			reg = <0x44002000 0x2000>;
-			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


