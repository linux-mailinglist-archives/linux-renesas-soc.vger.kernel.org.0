Return-Path: <linux-renesas-soc+bounces-4662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE828A7000
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 17:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4551F217AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF713130AC3;
	Tue, 16 Apr 2024 15:40:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2A125B2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282022; cv=none; b=X2Djb7YjeCcsQI4ErVnd1c9ZXPvzPxJivtX7Ju4CRDwciF5dnKbW03aISr/NgLbC/kRmDw+xU/FeXm5e6cgCK72DpyB3owsolHaS/+n4tBd1dcwgYWTCVpres449EZCDKkoVo27SblO8gcMc2K5K6nt6iSzJbr3GkmCmVe9yxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282022; c=relaxed/simple;
	bh=XYsbBIW98nvB0oBWhwJwax2g/OUkO+0MtmXT8fZzqqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZsoEqWdUoIslffslJkmkZkTmUE1prqd3EdTV3uoHvOlk5i6dFy5T80jjdZCFMXgFaa7ubW0zKo7V4aWhcH5rcD6rJ2Xnwl2S+fwGYs7HMh8KrEerhBhdKIB6i0MrLwexFT6ls/+pL9qZ+T9t6yFTiqPHWSlJO0G6l1pRKY+a1xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id BrgB2C00M0SSLxL01rgBSH; Tue, 16 Apr 2024 17:40:13 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkuF-008IBM-QD;
	Tue, 16 Apr 2024 17:40:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkup-00Ebhh-6B;
	Tue, 16 Apr 2024 17:40:11 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add INTC-EX node
Date: Tue, 16 Apr 2024 17:40:01 +0200
Message-Id: <66aba473186df9a137e7f95393209b23a5916fd1.1713281889.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device node for the Interrupt Controller for External Devices
(INTC-EX) on the Renesas R-Car V4M (R8A779H0) SoC, which serves external
IRQ pins IRQ[0-5].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
IRQ2 was tested on the Gray Hawk Single development board using
gpio-keys.  With the default hardware setup, this causes an interrupt
storm, as expected (pin is shared with MD0).

To be queued in renesas-devel for v6.10.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 530219f21295f76f..bd3955316a88c8f2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -404,6 +404,22 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a779h0", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 611>;
+		};
+
 		tmu0: timer@e61e0000 {
 			compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
 			reg = <0 0xe61e0000 0 0x30>;
-- 
2.34.1


