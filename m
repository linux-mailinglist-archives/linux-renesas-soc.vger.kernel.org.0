Return-Path: <linux-renesas-soc+bounces-2223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6E8459EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19F6E1F24273
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA34C5CDF5;
	Thu,  1 Feb 2024 14:19:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67C5D47C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797166; cv=none; b=d470uqLsEvowa7eGwC/vjuP06cKuFVoYw5MPb0wQqPq0JhclGhnjcQZhB9SuOX7oY0WuDiHX/HRCoLxU0l0aeiiqPfDGKh+iuNbCxHhg5eCgTET5GJ0FJLbv3BQDN96btMjJVePryyXOoOca3+vg69aFbhyeTD9HxkvLeSBRzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797166; c=relaxed/simple;
	bh=DLIELGt0bbpiOhEQ1TDs4yiSw25rRIA23Ysdzrz3f/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LefxMOoXfXOPL2L2E/JJrUuQQGtdpSWKEQSyqIk/kGPq4NdOR2X2mlNeRnDkYvHDQ+WSvFS9yW+dIwgD621u9lm9q8CPsVPndw1rbTwDSl6hKD5DFh60qgeXhebBGaiuMHVFtCj8KgpFqNnaxj48XM4+XoGAdvzskhoszNYF7t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by andre.telenet-ops.be with bizsmtp
	id hqKM2B0054efzLr01qKMYG; Thu, 01 Feb 2024 15:19:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXtc-00Gv4r-6n;
	Thu, 01 Feb 2024 15:19:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXuT-00AXdZ-5r;
	Thu, 01 Feb 2024 15:19:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a779h0: Add CA76 operating points
Date: Thu,  1 Feb 2024 15:19:20 +0100
Message-Id: <736b5836ec2b54e8b36712866309dc1b7ee1fc48.1706796979.git.geert+renesas@glider.be>
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

Add operating points for running the Cortex-A76 CPU cores on R-Car V4M
at various speeds, up to the Normal (1.0 GHz).

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 622775f6160f55bd..4e9e487ec51661fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -14,6 +14,22 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <825000>;
+			clock-latency-ns = <500000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -44,6 +60,7 @@ a76_0: cpu@0 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a76_1: cpu@100 {
@@ -55,6 +72,7 @@ a76_1: cpu@100 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC1>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a76_2: cpu@200 {
@@ -66,6 +84,7 @@ a76_2: cpu@200 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC2>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		a76_3: cpu@300 {
@@ -77,6 +96,7 @@ a76_3: cpu@300 {
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC3>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		idle-states {
-- 
2.34.1


