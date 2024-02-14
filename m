Return-Path: <linux-renesas-soc+bounces-2765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263DF854A42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92C428DB21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B130C1A58B;
	Wed, 14 Feb 2024 13:18:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2C52F8C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916705; cv=none; b=QgVXW5TNWM8CmsFoJNfJ+pZDzYF5n0dx9rw4AybxYMEJ1X23LQbmwXmYm1b+PvPi7phPHh/ZU95Ya6zfFqOZ1et1ZRin0QAKSwgCtvRMmpDUxhdMhoKfHtcNlEzFMGYvfg85f5aGx9l6xrwlb5ZdeRVgmcoR8sNEyP9Lsqu1P6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916705; c=relaxed/simple;
	bh=hzVdidyYB4KBZZ1SPgJrj5zvmw5Oih9XX1IDoxgp8kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yr1DKKDFyYRAY1sD62N41VhXB2d1coV0lTUkvPlbHAJDjPw6sxxWPQZ5GXABQMnObu97kq7jZ2NXhlOttmad8x04zdiFvnvPqk/M7ngXCf0ttaGSxdIqT7u1Da5KowqnT5ucCZCRkVtht6rtWJts5D1rnruT5hL4YGiNyGLNZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by xavier.telenet-ops.be with bizsmtp
	id n1JE2B00E0LVNSS011JEdg; Wed, 14 Feb 2024 14:18:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raF9L-000d5f-Rs;
	Wed, 14 Feb 2024 14:18:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raF9S-00GvXs-GU;
	Wed, 14 Feb 2024 14:18:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add SD/MMC node
Date: Wed, 14 Feb 2024 14:18:02 +0100
Message-Id: <4433cd73049ae517ea163bc703555ee8d9a4dd82.1707915763.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707915763.git.geert+renesas@glider.be>
References: <cover.1707915763.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add a device node for SD/MMC on Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Add missing SD0H clock,
  - Add missing clock-names property.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 66a93c88f8742431..d50ed1989ef52da7 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -532,6 +532,20 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		mmc0: mmc@ee140000 {
+			compatible = "renesas,sdhi-r8a779h0",
+				     "renesas,rcar-gen4-sdhi";
+			reg = <0 0xee140000 0 0x2000>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 706>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SD0H>;
+			clock-names = "core", "clkh";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			max-frequency = <200000000>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


