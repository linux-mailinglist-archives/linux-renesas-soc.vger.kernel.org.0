Return-Path: <linux-renesas-soc+bounces-2219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576E8459EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD99D1F23FDE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932F65D499;
	Thu,  1 Feb 2024 14:19:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ABD5D48A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797165; cv=none; b=rjDlJKV2iortH+bX1qEG1uwZUx4PdhsJQuLYBmwflcYQKOA+LsHP4rjnABh91ZcDbTTO4owPusDsHwZM3KGtljWOdepStNNXUEKb2f2Gw+HC0xFmXU3Sf8kj5Aes3vBpv6uX27ExonctY/tIRZ2cg5LsySdLBjesoy8PCIP6ClI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797165; c=relaxed/simple;
	bh=OFrPToGeevujQS1JabxDYjkzzcy/ZA8B8JVFCIId3B4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+yzEzDrQLOjy0dOVCPNbayQOubFA9PeOHtl3alILir6OSKqizci95B0ylSMGERgeuHVw+uCtKaZnUhk74A6zX0yt2S9F0snGTNnoFL6VD6Z3jjS7Pa84ifTIzl+ZATewlCDOyw1gcL7Z3tSmCcWBMnJJUdgyEcn4HK2Iup/ZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by laurent.telenet-ops.be with bizsmtp
	id hqKM2B0084efzLr01qKM6S; Thu, 01 Feb 2024 15:19:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXtc-00Gv4i-4c;
	Thu, 01 Feb 2024 15:19:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXuT-00AXdR-3k;
	Thu, 01 Feb 2024 15:19:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a779h0: Add CPUIdle support
Date: Thu,  1 Feb 2024 15:19:18 +0100
Message-Id: <848d176bdbcaf3bc44e5dae555afa9c812a19fd1.1706796979.git.geert+renesas@glider.be>
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

Support CPUIdle for ARM Cortex-A76 on R-Car V4M.

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 88c5dcbc38d59dab..b3255bba69e3e6da 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -42,6 +42,7 @@ a76_0: cpu@0 {
 			power-domains = <&sysc R8A779H0_PD_A1E0D0C0>;
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a76_1: cpu@100 {
@@ -51,6 +52,7 @@ a76_1: cpu@100 {
 			power-domains = <&sysc R8A779H0_PD_A1E0D0C1>;
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a76_2: cpu@200 {
@@ -60,6 +62,7 @@ a76_2: cpu@200 {
 			power-domains = <&sysc R8A779H0_PD_A1E0D0C2>;
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
 		};
 
 		a76_3: cpu@300 {
@@ -69,6 +72,20 @@ a76_3: cpu@300 {
 			power-domains = <&sysc R8A779H0_PD_A1E0D0C3>;
 			next-level-cache = <&L3_CA76>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_SLEEP_0>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CPU_SLEEP_0: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <400>;
+				exit-latency-us = <500>;
+				min-residency-us = <4000>;
+			};
 		};
 
 		L3_CA76: cache-controller {
-- 
2.34.1


