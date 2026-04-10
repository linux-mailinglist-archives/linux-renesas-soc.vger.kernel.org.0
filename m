Return-Path: <linux-renesas-soc+bounces-31158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBtNH6kp2Wm1mwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:47:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B13DAA75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2BE030075EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E0A3DDDBD;
	Fri, 10 Apr 2026 16:37:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB3F30CDAF;
	Fri, 10 Apr 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839037; cv=none; b=FlOtEQ25Qlvb4dC9x+U/uCPTHga4USXxU9053Qh9RJgqJ1Uf+jeKKYgOzEDQUGozPO2rLZAhkI2lHBY4OAMtzS/I5bwShR5aOtye7ZH+hsZirERZYujUaLsaGWA9HiMxuKZ1wjerfgsXPersP7xQzDZIvu151PAZAIuzMWhM2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839037; c=relaxed/simple;
	bh=pIfxUBnevC9isWgRz3icQRT/7NeBYsi/yYeyxy7uCLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBSGOKlQ+tbMzpME6a5AXv3WXiJjsiqfVri6G5rqIbax1IebtiVf7Axzc2kr0JIWXfYybFnr7oghYtXJOZ6U0DAYhyRVvt64e9K4dBDDAxO4RBepK2OYBWGxypojEHhJXQWVRtSI1vMf7Z6RBoVmZBw7Sa/99tg2+PA1H9ygrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: nXvvath4Se2W/n7YsAgYlg==
X-CSE-MsgGUID: ogTMoCJiQ/ai+/OPfL2u6Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2026 01:37:15 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.85])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 03A914006DED;
	Sat, 11 Apr 2026 01:37:09 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 08/10] arm64: dts: renesas: r9a07g0{43,44,54}: remove TCIU8 interrupt from MTU3
Date: Fri, 10 Apr 2026 19:35:28 +0300
Message-ID: <20260410163530.383818-9-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31158-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,0.152.155.48:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C46B13DAA75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The TCIU8 interrupt used to be documented in earlier revisions of the
user manuals, but has since been removed. The corresponding entry is now
marked as reserved in the interrupt mapping tables of all supported
SoCs.

 * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
   Rev.1.40 User Manual
 * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
   Rev.1.30 User Manual
 * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
   and RZ/G2LC Rev.1.50 User Manual
 * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
   Rev.1.50 User Manual

Remove the TCIU8 interrupt. This does not cause any breakage as the
driver does not make use of the interrupts.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * reword to mention that TCIU8 used to exist

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 5 ++---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 5 ++---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 593c66b27ad12..7bc37e1015a47 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -120,8 +120,7 @@ mtu3: timer@10001200 {
 				     <SOC_PERIPHERAL_IRQ(209) IRQ_TYPE_EDGE_RISING>,
 				     <SOC_PERIPHERAL_IRQ(210) IRQ_TYPE_EDGE_RISING>,
 				     <SOC_PERIPHERAL_IRQ(211) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(212) IRQ_TYPE_EDGE_RISING>,
-				     <SOC_PERIPHERAL_IRQ(213) IRQ_TYPE_EDGE_RISING>;
+				     <SOC_PERIPHERAL_IRQ(212) IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
 					  "tciv0", "tgie0", "tgif0",
 					  "tgia1", "tgib1", "tciv1", "tciu1",
@@ -136,7 +135,7 @@ mtu3: timer@10001200 {
 					  "tgia7", "tgib7", "tgic7", "tgid7",
 					  "tciv7",
 					  "tgia8", "tgib8", "tgic8", "tgid8",
-					  "tciv8", "tciu8";
+					  "tciv8";
 			clocks = <&cpg CPG_MOD R9A07G043_MTU_X_MCK_MTU3>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G043_MTU_X_PRESET_MTU3>;
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 29273da819951..799a974c4dba1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -220,8 +220,7 @@ mtu3: timer@10001200 {
 				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
 					  "tciv0", "tgie0", "tgif0",
 					  "tgia1", "tgib1", "tciv1", "tciu1",
@@ -236,7 +235,7 @@ mtu3: timer@10001200 {
 					  "tgia7", "tgib7", "tgic7", "tgid7",
 					  "tciv7",
 					  "tgia8", "tgib8", "tgic8", "tgid8",
-					  "tciv8", "tciu8";
+					  "tciv8";
 			clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 0dee48c4f1e44..0dc4c3c8c06b2 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -220,8 +220,7 @@ mtu3: timer@10001200 {
 				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
 					  "tciv0", "tgie0", "tgif0",
 					  "tgia1", "tgib1", "tciv1", "tciu1",
@@ -236,7 +235,7 @@ mtu3: timer@10001200 {
 					  "tgia7", "tgib7", "tgic7", "tgid7",
 					  "tciv7",
 					  "tgia8", "tgib8", "tgic8", "tgid8",
-					  "tciv8", "tciu8";
+					  "tciv8";
 			clocks = <&cpg CPG_MOD R9A07G054_MTU_X_MCK_MTU3>;
 			power-domains = <&cpg>;
 			resets = <&cpg R9A07G054_MTU_X_PRESET_MTU3>;
-- 
2.53.0

