Return-Path: <linux-renesas-soc+bounces-32604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGKMFtX7BGrxRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:31:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4153B769
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 794563010221
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1090E37F8A8;
	Wed, 13 May 2026 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hNAMBlxU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lKslt6Q4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365B36F8EB;
	Wed, 13 May 2026 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711503; cv=none; b=jra9d8m+sJc5xK61rnlm6aLM/i2WamOiIkmy0UXqpa5MalD+PrJqGH6pBI0BQqsDdru2qqy5+biYIvEPNWrmIyNLK0SsmIhOnuFiQt9VxnX1gzipV+nKCW7vY7m/jYTtGzBGwXTaJtXU1NKoXa56sTg1Fi5zxO3COp1fz8QgM3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711503; c=relaxed/simple;
	bh=U1R8edRmFcjQFPnsNre+GIRjPI0kbx/WQuaw3rH7YKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xp9R0xOvLyNoxt1qJ96r505RAVPeT1ZmRNIjLKQsRvTNvabtDlivmdR+q8s8txLxxt+bAZu50CVvu1qSV5XHB6U5nn5E1Bo+GQVOvzTlkvpnIE6gcsAj4MOG8+A5tGCyi0uP16MZSBaRljvw6dgD+G0k7DJBIfCyfHaKlz5A02I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hNAMBlxU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lKslt6Q4; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gG7VJ6QrCz9vL6;
	Thu, 14 May 2026 00:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778711496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YaX/Xo+aYjHdQZOl52aRhuT+hJsQaI4oWfGWWCZOJZg=;
	b=hNAMBlxUaqoHIkR0xiFX6TG8ieW3zHxUqwE/3zbedEVYZtohfKC2xboGPytY1wAqVvs4Gr
	Da6zirJ0qUJZE/27hLiC5DhnFfih3tDBNTQdQGYUA3RCpj/REuxu2iy52dAt4CTvYx7n3j
	5KaFNsubSJ2URFXVK0qIqDGTv4ZTWcgZLrkMgNzkvAoCCRwRuQ4GwGrxMasKprtGRaZ9jw
	/P7pcaMieigeFmlGYu7LVhx3vSBi6veNoodSYjBjbTNhm8nb/cOTAiiAX8/+mGPTdFRu/4
	cBwhoEnLlvKRS4xMHENfDCFApb3JiU7/A3+ZhalEVxRHB7BYXtfhg/voljmUNQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778711494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YaX/Xo+aYjHdQZOl52aRhuT+hJsQaI4oWfGWWCZOJZg=;
	b=lKslt6Q4R8iLS52CuB54bOm1JFkDprgAKfhNyEcMbzk/4aNhPyjfSCdad2Jd89wE/UNDu+
	Cz58gpdO5GYMLr7n2M6kEwd5hKGjZFos2O4TCMLFUMFGMTwTkf22h2YLT0U7BEQljaN8O0
	m6nHyQNAnnj29e3FdMk3LA44JtqgSrkhvSAIw8mprBJuehvr6Lc06lMQEGMmQICn2AyIVF
	9hmjbrdQpFeLg3MJYMDHHRkKVAQLisLApHF0opIbJQj3Zkf5Deb37+Rj2abb3ZTE6XCly0
	ZPaxixhvt4yQfeVr5KC3xWNbne1ikrlZ1xO78FVPTj/tnB+DiBkxO2jVLoyLeQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor description
Date: Thu, 14 May 2026 00:30:08 +0200
Message-ID: <20260513223125.43337-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1836kzmypo36jkf9t45gcq77knmzzhm7
X-MBO-RS-ID: 6de09209b627974ea58
X-Rspamd-Queue-Id: 5EE4153B769
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,renesas.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32604-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[2.83.23.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:url,glider.be:email,renesas.com:email,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
Generic Interrupt Controller with Multi View capability. Firmware has
access to configuration View 0, Linux kernel has access to View 1.

The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
Reference Manual, currently latest r2p1 [1], chapter "Programmers model
for GIC-720AE", subchapter "Redistributor registers for control and
physical LPIs summary", part "GICR_TYPER, Redistributor Type Register"
clarifies register "GICR_TYPER" bit 4 "Last" behavior in Multi View
setup as follows:

"
Last
Last Redistributor:

0 ... This Redistributor is not the last Redistributor on the chip.
1 ... This Redistributor is the last Redistributor on the chip.
      When GICD_CFGID.VIEW == 1, for views 1, 2, or 3 this bit
      always returns 1.
"

On this SoC, GICD_CFGID.VIEW is 1 and the Linux kernel has access to
View 1, therefore Linux kernel GICv3 driver will interpret register
"GICR_TYPER" bit 4 "Last" = 1 in the first Redistributor in continuous
Redistributor page as that first Redistributor being the one and only
Redistributor and will stop processing the continuous Redistributor
page further. This will prevent the other Redistributors from being
recognized by the system and used for other PEs.

Because the hardware indicates that the continuous Redistributor page
is not continuous for View 1, 2, or 3, describe every Redistributor
separately in the DT. This makes all Redistributors for all cores
accessible in Linux.

[1] https://developer.arm.com/documentation/102666/0201/Programmers-model-for-GIC-720AE/Redistributor-registers-for-control-and-physical-LPIs-summary/GICR-TYPER--Redistributor-Type-Register?lang=en

Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 36 +++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 3ec1b53d27828..73be51787265c 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -689,8 +689,40 @@ gic: interrupt-controller@39000000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 			interrupt-controller;
-			reg = <0 0x39000000 0 0x10000>,
-			      <0 0x39080000 0 0x800000>;
+			#redistributor-regions = <32>;
+			reg = <0x0 0x39000000 0x0 0x10000>,
+			      <0x0 0x39080000 0x0 0x40000>,
+			      <0x0 0x390c0000 0x0 0x40000>,
+			      <0x0 0x39100000 0x0 0x40000>,
+			      <0x0 0x39140000 0x0 0x40000>,
+			      <0x0 0x39180000 0x0 0x40000>,
+			      <0x0 0x391c0000 0x0 0x40000>,
+			      <0x0 0x39200000 0x0 0x40000>,
+			      <0x0 0x39240000 0x0 0x40000>,
+			      <0x0 0x39280000 0x0 0x40000>,
+			      <0x0 0x392c0000 0x0 0x40000>,
+			      <0x0 0x39300000 0x0 0x40000>,
+			      <0x0 0x39340000 0x0 0x40000>,
+			      <0x0 0x39380000 0x0 0x40000>,
+			      <0x0 0x393c0000 0x0 0x40000>,
+			      <0x0 0x39400000 0x0 0x40000>,
+			      <0x0 0x39440000 0x0 0x40000>,
+			      <0x0 0x39480000 0x0 0x40000>,
+			      <0x0 0x394c0000 0x0 0x40000>,
+			      <0x0 0x39500000 0x0 0x40000>,
+			      <0x0 0x39540000 0x0 0x40000>,
+			      <0x0 0x39580000 0x0 0x40000>,
+			      <0x0 0x395c0000 0x0 0x40000>,
+			      <0x0 0x39600000 0x0 0x40000>,
+			      <0x0 0x39640000 0x0 0x40000>,
+			      <0x0 0x39680000 0x0 0x40000>,
+			      <0x0 0x396c0000 0x0 0x40000>,
+			      <0x0 0x39700000 0x0 0x40000>,
+			      <0x0 0x39740000 0x0 0x40000>,
+			      <0x0 0x39780000 0x0 0x40000>,
+			      <0x0 0x397c0000 0x0 0x40000>,
+			      <0x0 0x39800000 0x0 0x40000>,
+			      <0x0 0x39840000 0x0 0x40000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.53.0


