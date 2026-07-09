Return-Path: <linux-renesas-soc+bounces-35003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bnL1KfEcUGr9tQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 00:13:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 024AC735F2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 00:13:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OqvJPZhI;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DHl5iHBZ;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDE83020D40
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 22:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB273B42D0;
	Thu,  9 Jul 2026 22:13:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4C3449997;
	Thu,  9 Jul 2026 22:12:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635181; cv=none; b=UB5pE1xiMdiR1Ljy46UnKe2tsIoq2i02pIxV70z6ylTEiqq9HG8LBj7Bn8pLcptI1+18PIsjpelmJ4PsHwqswg3kIKHV/yydIroZA6+HSIONxy7rIRlVN+lXvGuow7kZUq0BWkzAVLWwAYV/C84gBgx+ueyd614t+ARW4zRf6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635181; c=relaxed/simple;
	bh=5/rCRI3UZ45EfEwK6TTp7JRSRgCGf2m9q/mNeRMDj1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHyLVemS1eTsirf4NwHpKqS+0xXv3TbEH53W+noq176vgorVRYT1pcnVe4qj89G6MED1UYwR2/U5TtiJLDekkS0dnq7+SRBs2PKlrVRrmWCQ+yznLjHZKpwPshz6HIDafAT3rhv7XBY1gLqy7u/ZeZ59003ZGBA7JmLl2crq1bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OqvJPZhI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DHl5iHBZ; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gx8NS4jDdzKnR7;
	Fri, 10 Jul 2026 00:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783635176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=laLRk3O1bPDNGHI/gc/k6EDjwMB+P9jDPSaWLIRQBbw=;
	b=OqvJPZhIiakwtCop6MXeEMt/soVSIahHllBwACDTaxN+2QwcFt2Wh6NafVwkj6QxTTdFR7
	uq7ex/AKbTFMye2Le8u31XmMtt+l5pWdWILFQoaWhCD3FL3Ss4hovXj5VQCoCaL5CorxVj
	r51VM2FT52f59V/54rYVwWFpJzRLPnWutP1RHAyPxMKQWEW1eZXcHN41uOs1xePiEXAcOa
	xsYjXNCPoA6wzO90KsSiulqw4YqGWKChGUyKe3rxgKPM34IzEQBqw2frKjpgxXMxdrFupO
	J0WSHSTGO53Ka7sL1IgbTVnLUlbXb7F7dzboWyXCvlBzRdfe3jWsuuRIZSYloQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783635175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=laLRk3O1bPDNGHI/gc/k6EDjwMB+P9jDPSaWLIRQBbw=;
	b=DHl5iHBZuPMJ33GHGleJrtpeJzBwFkFvJztFvwlkPGoyPQpEE9E4SLab+fzrQVyd0MDknn
	4gsxYj2Zudf1S+pprtoDwjKNjUJvsjfLETZclIk3CJlev33PclRiWsjVybn0tJsQMl83Cc
	nj3zxRLIKrJjMlF8Jqv9XfhoyxrOBZxvGZcnSLV9c6QqB5FIhPA0/kpHuPgZ91GIvtzywB
	mLEOhbvwUt6LJ670o5Ro+hEkTwGmelvoJ15dg9ChTK7HgTR4pDyjjR3p6ObVXWFS4oH2pM
	hxr5BjymqQpGtehVhnCC/p0M5QQG9HsihuUaUOSbyWQgxHOzopooOpI4PHs9NA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
Date: Fri, 10 Jul 2026 00:12:16 +0200
Message-ID: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 64a105b4cf20af77a8f
X-MBO-RS-META: gte15z866jw5dyzru7hp41k38a9ssom7
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[mailbox.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35003-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:stable@vger.kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 024AC735F2F

The DBSC5 DRAM controller protects DRAM content using inline ECC.
The inline ECC utilizes areas of DRAM for its operation, which are
in the DRAM address range, but must not be accessed or modified.
Describe the inline ECC carveout areas used by the DBSC5 controller
on this hardware as reserved-memory, which must not be accessed.

In case of high DRAM utilization, unless the inline ECC carveouts
are properly reserved, Linux may use and corrupt the memory used
by the DBSC5 DRAM controller for inline ECC, which would lead to
the system becoming unstable.

Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
Cc: stable@vger.kernel.org
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
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index d2b3fc08954a1..f073145a682bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -107,6 +107,47 @@ tee@8c400000 {
 			reg = <0x0 0x8c400000 0x0 0x02000000>;
 			no-map;
 		};
+
+		/* DRAM controller inline ECC areas */
+		ecc@10cccd0000 {
+			reg = <0x10 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@12cccd0000 {
+			reg = <0x12 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@14cccd0000 {
+			reg = <0x14 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@16cccd0000 {
+			reg = <0x16 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@18cccd0000 {
+			reg = <0x18 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@1acccd0000 {
+			reg = <0x1a 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@1ccccd0000 {
+			reg = <0x1c 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@1ecccd0000 {
+			reg = <0x1e 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.53.0


