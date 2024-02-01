Return-Path: <linux-renesas-soc+bounces-2221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA628459EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28E51F23F41
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07445D484;
	Thu,  1 Feb 2024 14:19:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4365D486
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797166; cv=none; b=KCgdo6L2DkEiZCttqjPegkyqVWlVZKb547BoHmey9YWKExzyeV1cgDA076ORMqcsafZj0lc+P9daAoSh0CnXc5xAJmtoiEulN/1VVVMcpPaEO4xP2MF78NR2YjBOaGRKLzlVIpdMTczczDcCLbuslTGoXSzop+wnpjk/u1agdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797166; c=relaxed/simple;
	bh=ZoK5QqAiXUC/PFT86/uwfW9hJhdLikCmR8yZjtZhRLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LU2BtTLp4/EpGyo6jvU2ayN+dfIjj9KODWydezLZRTWsYdScc1SfWXhaKrMjeiTq7Bareq98j015bh7sXDvoRBtsQjX3dx1tI7ENIqX2s1IK5P9DTZjeYoIJid5b3OmOrm/2JiABLNOkPuuck9AGEHKgV14ftkuC1slzdrAFqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by xavier.telenet-ops.be with bizsmtp
	id hqKM2B0074efzLr01qKMiD; Thu, 01 Feb 2024 15:19:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXtc-00Gv4c-3P;
	Thu, 01 Feb 2024 15:19:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXuT-00AXdM-30;
	Thu, 01 Feb 2024 15:19:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] arm64: dts: renesas: r8a779h0: Add secondary CA76 CPU cores
Date: Thu,  1 Feb 2024 15:19:17 +0100
Message-Id: <c2a38a0da74915bf2a9171e53886c83a1c732934.1706796979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706796979.git.geert+renesas@glider.be>
References: <cover.1706796979.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Complete the description of the Cortex-A76 CPU cores and L3 cache
controllers on the Renesas R-Car V4M (R8A779H0) SoC, including CPU
topology and PSCI support for enabling CPU cores.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Rename L3_CA76_0 label to L3_CA76,
  - Move psci node to preserve sort order (alphabetical),
  - Drop GIC_CPU_MASK_SIMPLE changes, as GICv3 PPI interrupt specifiers
    have no such masks.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index f47695158d991288..88c5dcbc38d59dab 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -18,12 +18,57 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a76_0>;
+				};
+				core1 {
+					cpu = <&a76_1>;
+				};
+				core2 {
+					cpu = <&a76_2>;
+				};
+				core3 {
+					cpu = <&a76_3>;
+				};
+			};
+		};
+
 		a76_0: cpu@0 {
 			compatible = "arm,cortex-a76";
 			reg = <0>;
 			device_type = "cpu";
 			power-domains = <&sysc R8A779H0_PD_A1E0D0C0>;
 			next-level-cache = <&L3_CA76>;
+			enable-method = "psci";
+		};
+
+		a76_1: cpu@100 {
+			compatible = "arm,cortex-a76";
+			reg = <0x100>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779H0_PD_A1E0D0C1>;
+			next-level-cache = <&L3_CA76>;
+			enable-method = "psci";
+		};
+
+		a76_2: cpu@200 {
+			compatible = "arm,cortex-a76";
+			reg = <0x200>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779H0_PD_A1E0D0C2>;
+			next-level-cache = <&L3_CA76>;
+			enable-method = "psci";
+		};
+
+		a76_3: cpu@300 {
+			compatible = "arm,cortex-a76";
+			reg = <0x300>;
+			device_type = "cpu";
+			power-domains = <&sysc R8A779H0_PD_A1E0D0C3>;
+			next-level-cache = <&L3_CA76>;
+			enable-method = "psci";
 		};
 
 		L3_CA76: cache-controller {
@@ -53,6 +98,11 @@ pmu-a76 {
 		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	/* External SCIF clock - to be overridden by boards that provide it */
 	scif_clk: scif-clk {
 		compatible = "fixed-clock";
-- 
2.34.1


