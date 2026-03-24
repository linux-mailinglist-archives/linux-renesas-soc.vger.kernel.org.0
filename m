Return-Path: <linux-renesas-soc+bounces-30196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ELFBpcXw2lCoAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 00:00:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4331D944
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 00:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89D7E311790A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 22:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD27E3C7E0B;
	Tue, 24 Mar 2026 22:58:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AEF3C7E08;
	Tue, 24 Mar 2026 22:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393084; cv=none; b=t6iqHMx2bN0fejkF5+q+L0Y6weOh/79UlYemCTBdW/9TXxuFMjXd0Q1nbcO8wV3wHynI5xhGvuV5sEQu8xfYgCVfvLPqGLwt3ubGYIldhTMhBNmsJ+vn+dGVtz8c8GeX5xSeilwUNYRDl9lWi4qDU1vG3DPuluk1rJwrrmBJWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393084; c=relaxed/simple;
	bh=lK8enCH9Mq/ykr9gHpVCWCtvGBLudclG3Jad4gdM9+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSQNL9NvmiSAF4rIn4bQsoj/4jJOLLctcf0IccnjvExTVUJugEesTF16jmkIN8yP6JztYZClNPsgkycrTmj7eGl4yAHBvqMhVvCXs0+cN5r9rfjPLTDjmXgZiEwVoCBDKZHXdazkZEwEvQ3gdaTpj9Pf9E2NfwvrWp6j96nW2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: sx4OHp5cQ82O3F0fKoVjmA==
X-CSE-MsgGUID: ac/HC4SBRJmm2Cq/EZrs9A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2026 07:52:54 +0900
Received: from mind-2s.example.org (unknown [10.24.0.35])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1C48D400B54B;
	Wed, 25 Mar 2026 07:52:50 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes
Date: Tue, 24 Mar 2026 22:52:34 +0000
Message-ID: <20260324225239.19136-2-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com>
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30196-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.219.186.0:email,0.198.94.208:email];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid,11c00400:email,12c03000:email,11c00800:email,0.198.93.64:email]
X-Rspamd-Queue-Id: 11D4331D944
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 CA55
cores and 1 CM33 core.

While the user manual doesn't explicitly specify which cores
should have access to particular watchdogs, it turns out that
(similarly to the Renesas RZ/V2H(P)) it only makes sense for
Linux to use WDT1.

Remove DT nodes wdt{0,2,3} from the RZ/V2N SoC specific dtsi
to make it compliant with the original design intent.

This change is harmless as there are no users for the nodes
being stripped out of this device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 30 ----------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 9192c5bf7e59..40525470194e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -599,16 +599,6 @@ ostm7: timer@12c03000 {
 			status = "disabled";
 		};
 
-		wdt0: watchdog@11c00400 {
-			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
-			reg = <0 0x11c00400 0 0x400>;
-			clocks = <&cpg CPG_MOD 0x4b>, <&cpg CPG_MOD 0x4c>;
-			clock-names = "pclk", "oscclk";
-			resets = <&cpg 0x75>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
@@ -619,26 +609,6 @@ wdt1: watchdog@14400000 {
 			status = "disabled";
 		};
 
-		wdt2: watchdog@13000000 {
-			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
-			reg = <0 0x13000000 0 0x400>;
-			clocks = <&cpg CPG_MOD 0x4f>, <&cpg CPG_MOD 0x50>;
-			clock-names = "pclk", "oscclk";
-			resets = <&cpg 0x77>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
-		wdt3: watchdog@13000400 {
-			compatible = "renesas,r9a09g056-wdt", "renesas,r9a09g057-wdt";
-			reg = <0 0x13000400 0 0x400>;
-			clocks = <&cpg CPG_MOD 0x51>, <&cpg CPG_MOD 0x52>;
-			clock-names = "pclk", "oscclk";
-			resets = <&cpg 0x78>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
 		rtc: rtc@11c00800 {
 			compatible = "renesas,r9a09g056-rtca3", "renesas,rz-rtca3";
 			reg = <0 0x11c00800 0 0x400>;
-- 
2.43.0


