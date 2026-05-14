Return-Path: <linux-renesas-soc+bounces-32624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHliORbGBWrDbAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:54:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9D541F91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 14:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B317300DDD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 12:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0543A298CC4;
	Thu, 14 May 2026 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rtYJOeaH";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FgGv+/Ua"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F7286D5C;
	Thu, 14 May 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763226; cv=none; b=dcFoJT81axIvS5xfQfgOGtKSCq49iFiMicwY4O/bhseM4sJLmwZFM+78Mb2VWOCKKxeqXto8DvUNrOp70ya/VLc3EJOhw88gvsBPy0o9vSQhpnoGTBQu2QIyfc8aTDMjAlADE/00kRWJPWsKPbmyLOM4VjvDxl6fzO6LrMQ1Q2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763226; c=relaxed/simple;
	bh=oNn3w9bmvj5Ag9ts6zbpeXiSEhaLbcFAOmPFjRwxyMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P60nTWFjvao7egwmF3ez+0oGIjyM+3NpQHNymAzDxItzejMGehPsRhtbtomAmbGKiZAKPgyPgez3A1JM3U3l+N/qgUBZdfe+TPTDl1gHes0RBKyq7n4F0v1uotxLAk+KANjb4en6Tu1f/khttf9ldmMhPgBDSsbHbiU0L7xGxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rtYJOeaH; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FgGv+/Ua; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gGVcv4WLVz9tvF;
	Thu, 14 May 2026 14:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778763215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UHmiCWR0BD8AAt0d/+D6Dm6Xr0telhLVotHuENhq3CQ=;
	b=rtYJOeaH9551PM8icB9+/T5CMJde9sMKKxRZ2hA2vxE3BTkB0qsQRjKm8t73fKSrejzNJI
	GNDcgoohr/4uuvnrTzxFqYob1hXWgHsAds7Zz4qHsrXu7FJ+EaA1LOEhPxk1ZVYZlZGxLT
	fB8s644Q4RgOoll6kkn+WSjjScKJgDArIjJ9MzQhgpWNwbgaHwFosDKvxA26RLsVoMF30C
	wer+hRWIZucoXnksWBpXuFUtthxAAhprIYETSWgBaY+ibSs+0jPf36it8Cj7akRz0WHsu2
	wQXIM5s314kfyVzkOcvbdgbkYl5goucE4jWy6smH1TdGtWt8qmq5+VI7SF9kZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="FgGv+/Ua";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778763213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UHmiCWR0BD8AAt0d/+D6Dm6Xr0telhLVotHuENhq3CQ=;
	b=FgGv+/UaaA1FrJ2PTQGZHjHVgfmj6Duif0TgB7L/gXkW3tbwUCZO4/tkuQNsNn8Hf7GDCS
	Vlpg1N4+6FlBxxuSJxxQO7KvOqsZ3fVNxUYIykdu4ePXmvsmzqYrBSt9rD3ZMEDGyO1CNN
	cnTn8BRVLtqxJoHvg0J14vr7ErHgjOxb7LCyl1sLiz5W8qmw2LaXcAAPBVzNajt1HuDT+2
	Co9/PPsMG1g6BOf0wBNf1aiN1jdMA+S8y1gNvze20hKEU6sEz7SXMCNnis/Jb0+Ax+iBGN
	r9XsKF6K1WNaJv4Yv+yZ4lz1Odomdmv5nntmSypqD1+IfOf7LfB2ikaLcBw8Og==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor description
Date: Thu, 14 May 2026 14:53:06 +0200
Message-ID: <20260514125328.20954-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: f4t9kpem6b31uiyxzjhci76j4kc6iz93
X-MBO-RS-ID: fea83fbeaf2ff1a254c
X-Rspamd-Queue-Id: 58E9D541F91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,renesas.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32624-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[2.83.23.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,arm.com:url,glider.be:email,renesas.com:email]
X-Rspamd-Action: no action

The Renesas R-Car X5H (R8A78000) SoC contains Arm CoreLink GIC-720AE
Generic Interrupt Controller with Multi View capability. Firmware has
access to configuration View 0, Linux kernel has access to View 1.

The Arm CoreLink GIC-720AE Generic Interrupt Controller Technical
Reference Manual, currently latest r2p1 [1], chapter "5. Programmers
model for GIC-720AE", subchapter "5.4 Redistributor registers
for control and physical LPIs summary", part "5.4.3 GICR_TYPER,
Redistributor Type Register", "Table 5-50: GICR_TYPER bit descriptions"
on page 200, clarifies register "GICR_TYPER" bit 4 "Last" behavior
in Multi View setup as follows:

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

[1] https://documentation-service.arm.com/static/69ef3c1cd35efd294e335c43
    Arm® CoreLink™ GIC-720AE Generic Interrupt Controller
    Revision: r2p1 / Issue 12 / 102666_0201_12_en

Fixes: 63500d12cf76 ("arm64: dts: renesas: Add R8A78000 SoC support")
Acked-by: Marc Zyngier <maz@kernel.org>
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
V2: - Update GIC-700AE documentation link to generated PDF
    - Update commit message to match the PDF
    - Add AB from Marc
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


