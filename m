Return-Path: <linux-renesas-soc+bounces-2957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94B85A6B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 16:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90763B209F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 15:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E93637705;
	Mon, 19 Feb 2024 15:00:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E237708
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354856; cv=none; b=pHAZUm49g40JydXZ1pUyL/RO23g3lSX/lGywTF0ftE8hG0yvO2DNK0laRqqFVR6QS/4b1CYwbtDviAypjw/gyhWwaa9Y5lae1TQrRklUYYGE0Se/Uf33pXI791BdjK9moDhBA3ALq925GqcXYFT26cdd8y+M+fHFhnIJVKIHkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354856; c=relaxed/simple;
	bh=gfS9iggLyPR+dY9OWlZ/ebeagi3neEOuh8Ml1YxDDuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AuwFeIc1OciDF2EzgG6GD8hhb38qxUJeUYndgxKeyhZa2w6efuiUCcrgGBfO3TcVzJBlRwIVuBy56Wh9I0Yy0erJk2GdH41AvNat7JM1TY2Ib69VKkcfXXEzOuHgDHNHmOh9lEeRYd7OP9MAGzAXEd5VHZaJIt79B8xIIhQ/Lcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a66f:1f5b:42c8:e3c5])
	by baptiste.telenet-ops.be with bizsmtp
	id p30l2B00D1N8lK50130lQ9; Mon, 19 Feb 2024 16:00:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc58H-0016gS-9g;
	Mon, 19 Feb 2024 16:00:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc58P-007Th4-3a;
	Mon, 19 Feb 2024 16:00:45 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add RPC node
Date: Mon, 19 Feb 2024 16:00:40 +0100
Message-Id: <26f9c5d5a7944db3813ed53459aa9c5767c1bdc0.1708354463.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708354463.git.geert+renesas@glider.be>
References: <cover.1708354463.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add a device node for the SPI Multi I/O Bus Controller (RPC-IF) on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Drop undocumented clock-names property.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 46c586f4e326959f..11885729181bc903 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -621,6 +621,22 @@ mmc0: mmc@ee140000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a779h0-rpc-if",
+				     "renesas,rcar-gen4-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x04000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 629>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 629>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


