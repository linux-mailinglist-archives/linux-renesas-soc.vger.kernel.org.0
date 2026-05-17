Return-Path: <linux-renesas-soc+bounces-32727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJz1MT4gCmrkwwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 22:08:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A27563AE8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 22:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7A8630028BB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 May 2026 20:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F930BF6B;
	Sun, 17 May 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ON+4ZOdD";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CcC7WRiX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639EE223708;
	Sun, 17 May 2026 20:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048507; cv=none; b=grFgS4Qj1ICgmgFzrSzqbrYXEPmwqUs9ssMiEtCseTDqsfKXbt60N2I/gYsCTbPZCHmnFA/ZtROBdpmBrEc9i88EiiHcGceNBCvPHC3nImKWFJoXB6tVj35e11RtEJnvo90SCYpgLrsoBjseDBevhmL/pOLD1qVE00ZYfhxlBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048507; c=relaxed/simple;
	bh=65zKbn26QK62Gg3960MexvoTIM5YXLr7mBBeYXUIdKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zj/wDidkU/EXSoEYReIpTJSCD4HcpjRIS2SXht9BbRxjhuWy6DSoyzDiKq2CvP3NktDNJ9VH9wmzEujF3zci9CMy+BFTb3sBECTV0FTo0Q2F65ECimNRPGz20oD3Lbxc3Q65PalQo6w5afKMHY3Eu3vPpivygBzZ4WDziLX4Qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ON+4ZOdD; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CcC7WRiX; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gJX7B09s4z9vTD;
	Sun, 17 May 2026 22:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779048502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l4wFVxQBgL8B6DVjVkF6XY4KfSRZqxPxMXAGErUdUOE=;
	b=ON+4ZOdDioAhwgYq6wu2cWAZ3cNX+m+ypBoHVg81Nv3MXcUxvt/woO+rGux6YwY3FiDJHa
	m03vd9UcQ7DiPJG5gZT27AXBo6k6nrldJdGaevjzPr9T/TEOXS7YwUQv6BRX2ciOL/PqEL
	tjmFaGUIkztIeX3oQ404Uj8XHm2IZ12HKSJr8Bxw7NIPs3bgN1ynk+l2HY2X5X4/9h78/6
	JyCZ0GlRsfvc6kL1/keCF+ZoSmhDiSt0UYWY7VtB0ubkuODxg5sLZCGTL9zQ7K/7bQ+JfU
	fPaJM1m/IAz0wmbmp566FhWzELv0+RpaR7Nt2mAiLVwGC9JrxkVMeTPxugREVw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CcC7WRiX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779048500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l4wFVxQBgL8B6DVjVkF6XY4KfSRZqxPxMXAGErUdUOE=;
	b=CcC7WRiXiGfj9qB3IEUc4W9PX+ThhzSiQxdNpIUcfFltXLJW6dDgJsPmiX5Xv/Mm0QdsEK
	CuP1hqrGnmuje1VrxDDNnh4zFy9xW+3oiRnjUnXSTrd1BG0VJQiVVZVun/cTVU5KSKwAoP
	MTjaOmbG/8Uz07ukSTjcwLUJo7dzPSRko/d3UL9raDkLOkr504tVEfysJ5wKEk9OlY5bzL
	y03hd15AGO6KCSsK+ENunR410Tm4sr9Kv+rapXxpfl6Q/Woy9spJ/dDy+hAsADCjOIi2ob
	97Q7hoOmMSD0xb4YSQP65Kbu1iYqT6MBrDaHNE0nIebsRubHXfjX/SiP+8EdGA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a78000: Describe all reserved memory
Date: Sun, 17 May 2026 22:07:40 +0200
Message-ID: <20260517200814.21624-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3e02abafad4a71cb2b3
X-MBO-RS-META: xrb9uyt3n4p1aa9mmtafi9o74nrhuoq8
X-Rspamd-Queue-Id: 69A27563AE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32727-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fully describe all available DRAM in the DT, and describe regions which
are not accessible because they are used by firmware in reserved-memory
node.

Replace first memory bank memory@60600000 with memory@40000000 and a
518 MiB long reserved-memory no-map subnode. This memory region is used
by other cores in the system.

Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
SCP, TFA BL31 and TEE.

Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
round up to 512 kiB is slight future proofing.

Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
entire OPTEE-OS TZ protected DRAM area.

Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
any way with any new reserved-memory {} node to reserve memory areas
used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
those areas, which lets Linux use all of the available DRAM as it is
described in the DT that was passed in by U-Boot, including the areas
that are newly utilized by TFA BL31 or OPTEE-OS.

In case of high DRAM utilization, unless the memory used by TFA BL31
or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
unresponsive.

Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Run checkpatch, fix indent
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index a721734fbd5d0..ed027a6c356ed 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -20,10 +20,9 @@ chosen {
 		stdout-path = "serial0:1843200n8";
 	};
 
-	memory@60600000 {
+	memory@40000000 {
 		device_type = "memory";
-		/* first 518MiB is reserved for other purposes. */
-		reg = <0x0 0x60600000 0x0 0x5fa00000>;
+		reg = <0x0 0x40000000 0x0 0x80000000>;
 	};
 
 	memory@1080000000 {
@@ -65,6 +64,36 @@ memory@1e00000000 {
 		device_type = "memory";
 		reg = <0x1e 0x00000000 0x1 0x00000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* First 518 MiB is reserved for other purposes. */
+		firmware@40000000 {
+			reg = <0x0 0x40000000 0x0 0x20600000>;
+			no-map;
+		};
+
+		/* Parameters set by IPL. */
+		parameters@8c100000 {
+			reg = <0x0 0x8c100000 0x0 0x00008000>;
+			no-map;
+		};
+
+		/* TFA BL31. */
+		tfa-bl31@8c200000 {
+			reg = <0x0 0x8c200000 0x0 0x00080000>;
+			no-map;
+		};
+
+		/* TEE TZ DRAM. */
+		tee@8c400000 {
+			reg = <0x0 0x8c400000 0x0 0x02000000>;
+			no-map;
+		};
+	};
 };
 
 &extal_clk {
-- 
2.53.0


