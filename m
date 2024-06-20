Return-Path: <linux-renesas-soc+bounces-6554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9735F910729
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 16:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FB6B285598
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 14:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542A71AE874;
	Thu, 20 Jun 2024 13:57:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835391AE0BD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718891878; cv=none; b=eg3gVh7PPmhvHdSXvoeAJtoQuPbGZSCFRwHpC/qthBdS7Hr5Z0HwFVo5QW8GdgFvorVdAVeP6lqs/tEMsfJyWaxKOPqi+0GPmSeuExdwqtTy6u8dJk6XvRrImhTRFBYsdj13eNuy8psq6ECJhMhkGjO/9FiZ3NsTlDiVWMmAp2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718891878; c=relaxed/simple;
	bh=kYMgednwA+2I+kj7nB8ba74jHkzBglN6eb6bnBzrv2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ss1gLBt5Hnk+TrZYWftUQLU64ArO8e+Lta1trohHtLhOBf8vYVeH8nAi5rJy6kF9/7S7+PlUPrTU2Fl10GWmsJ6FzuDv/JDzrG/tMRCcjag0Tgep6P9wO7DhBpwznNMq724psr9TqLMIf10y1ALfFveaWz9CwHYqoWGECIix3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:260f:cd5c:91b1:523c])
	by baptiste.telenet-ops.be with bizsmtp
	id dpxm2C0070Y0hZi01pxmKB; Thu, 20 Jun 2024 15:57:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKIIM-00058J-3o;
	Thu, 20 Jun 2024 15:57:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKIIM-000CpL-1k;
	Thu, 20 Jun 2024 15:57:46 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 8/9] ARM: dts: renesas: Add interrupt-names to arch timer nodes
Date: Thu, 20 Jun 2024 15:57:38 +0200
Message-Id: <b964e2f916cc23b6272e158c7b24597c971a82a5.1718890849.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718890849.git.geert+renesas@glider.be>
References: <cover.1718890849.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add interrupt-names properties to device nodes that represent ARM
architected timers for clarity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7742.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7743.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7744.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7745.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a77470.dtsi  | 1 +
 arch/arm/boot/dts/renesas/r8a7790.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7792.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi   | 1 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 1 +
 12 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index 9a2ae282a46ba4b1..85261684b5d5fe02 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -58,6 +58,7 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	tmu0: timer@e61e0000 {
diff --git a/arch/arm/boot/dts/renesas/r8a7742.dtsi b/arch/arm/boot/dts/renesas/r8a7742.dtsi
index d55c344c1cd2b151..3a5d6b434d0946fa 100644
--- a/arch/arm/boot/dts/renesas/r8a7742.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7742.dtsi
@@ -1938,6 +1938,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7743.dtsi b/arch/arm/boot/dts/renesas/r8a7743.dtsi
index d917c0a971f51b94..8833898d5557f4db 100644
--- a/arch/arm/boot/dts/renesas/r8a7743.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7743.dtsi
@@ -1846,6 +1846,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7744.dtsi b/arch/arm/boot/dts/renesas/r8a7744.dtsi
index 754859c38a939a90..c66c1102fb7218be 100644
--- a/arch/arm/boot/dts/renesas/r8a7744.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7744.dtsi
@@ -1832,6 +1832,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7745.dtsi b/arch/arm/boot/dts/renesas/r8a7745.dtsi
index 168298300490d31c..6ddde364782b8aea 100644
--- a/arch/arm/boot/dts/renesas/r8a7745.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7745.dtsi
@@ -1636,6 +1636,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a77470.dtsi b/arch/arm/boot/dts/renesas/r8a77470.dtsi
index 2375438d83c9d5b6..a8a12275c98a66c7 100644
--- a/arch/arm/boot/dts/renesas/r8a77470.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a77470.dtsi
@@ -1061,6 +1061,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
index 583b74a9f071c39e..20e4d4c6e7481f04 100644
--- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
@@ -2012,6 +2012,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7791.dtsi b/arch/arm/boot/dts/renesas/r8a7791.dtsi
index de08ceb62230b6dd..f9c9e1d8f669c314 100644
--- a/arch/arm/boot/dts/renesas/r8a7791.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7791.dtsi
@@ -1938,6 +1938,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index 7defeb8e4cd1f499..dd3bc32668b7b31e 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -990,5 +990,6 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7793.dtsi b/arch/arm/boot/dts/renesas/r8a7793.dtsi
index d32a9d5d3faa71fc..24e66ddf37e0483b 100644
--- a/arch/arm/boot/dts/renesas/r8a7793.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7793.dtsi
@@ -1517,6 +1517,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r8a7794.dtsi b/arch/arm/boot/dts/renesas/r8a7794.dtsi
index f37f094cecc8c399..8e6386a79aead35b 100644
--- a/arch/arm/boot/dts/renesas/r8a7794.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7794.dtsi
@@ -1484,6 +1484,7 @@ timer {
 				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	/* External USB clock - can be overridden by the board */
diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 466077a8f0aced3e..7548291c8d7ede43 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -484,6 +484,7 @@ timer {
 			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
 	usbphy: usb-phy {
-- 
2.34.1


