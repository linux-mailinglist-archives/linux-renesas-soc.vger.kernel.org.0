Return-Path: <linux-renesas-soc+bounces-31160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPzBDiEp2WkPmwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:45:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0523DA99E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E5E030BC8FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91A83DE447;
	Fri, 10 Apr 2026 16:37:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D623DBD4E;
	Fri, 10 Apr 2026 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839051; cv=none; b=fJ5Qxligca4VMifsulbG6TyeMHAiedrhLC6JDnlzF85ibUbE4Ny2Bb3Vjv9CzTn00Z9xrONDaRYMpUkvJ2y9IR2wt2mJ93e7pFRhWVvIrVwBoYUa5zEBJpzvgW9MRfXyF9z2FZGJDP3EHpFLoil/RVRsOVog2Smo0muxdbDSMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839051; c=relaxed/simple;
	bh=jtYBzjlxgYDZzV1vg7fYzI7AuWlb3elTzNXnXhfyjtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IC9g9UrX9GZoeSPpGtxuMrpYSf7a9eeoHr5Iv+9gGrpW4AsDnyyMP/m+rtEwzrPPtl6XL4z+xSuasHgwevYBWxafqigYR6Qe4GNqCW8+USgqW+DlEcCIY0wY9Bp5II/vtAVMjvcEbCtip4NoGHTKWe5KJKLoMQgjX5xO2rhKtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: gEGNgo83RjO2Pgc1cVm6AA==
X-CSE-MsgGUID: q0dUoP6ASXC/mv+1VO27Fg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2026 01:37:29 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.85])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6211E4006DC3;
	Sat, 11 Apr 2026 01:37:24 +0900 (JST)
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
Subject: [PATCH v2 10/10] arm64: dts: renesas: r9a09g087: add MTU3 support
Date: Fri, 10 Apr 2026 19:35:30 +0300
Message-ID: <20260410163530.383818-11-cosmin-gabriel.tanislav.xa@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31160-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	DBL_PROHIBIT(0.00)[5.93.129.48:email,4.242.122.192:email];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid,5.93.79.48:email]
X-Rspamd-Queue-Id: DF0523DA99E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Renesas RZ/N2H (R9A09G087) SoC has an MTU3 block.

Add support for it.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index f697e9698ed39..c64b532f3d234 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1119,6 +1119,74 @@ gic: interrupt-controller@83000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		mtu3: timer@90001200 {
+			compatible = "renesas,r9a09g087-mtu3",
+				     "renesas,rz-mtu3";
+			reg = <0 0x90001200 0 0xb00>;
+			interrupts = <GIC_SPI 420 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 422 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 423 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 424 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 425 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 429 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 430 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 440 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 441 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 445 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 446 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 450 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 451 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 454 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 455 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 462 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
+					  "tciv0", "tgie0", "tgif0",
+					  "tgia1", "tgib1", "tciv1", "tciu1",
+					  "tgia2", "tgib2", "tciv2", "tciu2",
+					  "tgia3", "tgib3", "tgic3", "tgid3",
+					  "tciv3",
+					  "tgia4", "tgib4", "tgic4", "tgid4",
+					  "tciv4",
+					  "tgiu5", "tgiv5", "tgiw5",
+					  "tgia6", "tgib6", "tgic6", "tgid6",
+					  "tciv6",
+					  "tgia7", "tgib7", "tgic7", "tgid7",
+					  "tciv7",
+					  "tgia8", "tgib8", "tgic8", "tgid8",
+					  "tciv8";
+			clocks = <&cpg CPG_MOD 200>;
+			power-domains = <&cpg>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		adc0: adc@90014000 {
 			compatible = "renesas,r9a09g087-adc", "renesas,r9a09g077-adc";
 			reg = <0 0x90014000 0 0x400>;
-- 
2.53.0

