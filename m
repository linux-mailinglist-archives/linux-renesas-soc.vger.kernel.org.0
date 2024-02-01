Return-Path: <linux-renesas-soc+bounces-2213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251E8459A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC6E2841D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED8C5CDDC;
	Thu,  1 Feb 2024 14:09:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE28D53374
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796567; cv=none; b=nCIC2bryjF2bM33fM5dTluOOmpgGh1WlsbbVmD2QSrLev6FDZ4pZImJZXKlMl5s4xcHMm1JTYuveoAQ5vV3++I24Zep3BmfkPADp+0t9xjntfDS54NGk3a2Htj3iqCau6RPBVNv6krIU2jMYMw941I+B0SBxUeWdVj8U0go69Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796567; c=relaxed/simple;
	bh=Jo4gecPn7yPWu4vkfdUm16qI3Xa767OwVa8GWORBZ0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hkvJ1G8AQ+HpApdISk3Hzk0UQReiIbINRPVNoTwkHJ44nOdb4NZDbPtnzHMQR5RZsgtBMnbzPerj9ENz8sefZnW1aehwVXE1Wl9BvqJgIrnaciLuqMoE4fnnonAHcxFJUOeFN+gFE1l/7oilD/5BS4AgPX13chxH4qfouaZSZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by albert.telenet-ops.be with bizsmtp
	id hq9M2B0054efzLr06q9MUA; Thu, 01 Feb 2024 15:09:23 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXjw-00Gv3n-7r;
	Thu, 01 Feb 2024 15:09:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXkn-00AXWj-6K;
	Thu, 01 Feb 2024 15:09:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Minh Le <minh.le.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add RWDT node
Date: Thu,  1 Feb 2024 15:09:16 +0100
Message-Id: <43bb03f3baa87b4be8ce953b1955df6b89387e4c.1706790320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706790320.git.geert+renesas@glider.be>
References: <cover.1706790320.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minh Le <minh.le.aj@renesas.com>

Add a device node for the RCLK Watchdog Timer (RWDT) on the Renesas
R-Car V4M (R8A779H0) SoC.

Signed-off-by: Minh Le <minh.le.aj@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Split in separate commits for SoC and board support,
  - Use TABs for indentation,
  - Add missing interrupts property.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index f59d0dd25ca93822..f5a688e300d29a73 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -59,6 +59,17 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		rwdt: watchdog@e6020000 {
+			compatible = "renesas,r8a779h0-wdt",
+				     "renesas,rcar-gen4-wdt";
+			reg = <0 0xe6020000 0 0x0c>;
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 907>;
+			status = "disabled";
+		};
+
 		pfc: pinctrl@e6050000 {
 			compatible = "renesas,pfc-r8a779h0";
 			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
-- 
2.34.1


