Return-Path: <linux-renesas-soc+bounces-35068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DuXBGz0aUWqg/QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 18:13:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C11F873C7EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 18:13:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="UhTfV2/J";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DcO9dOtr;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50A10300C904
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B488742DA28;
	Fri, 10 Jul 2026 16:05:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B199E41C2F1;
	Fri, 10 Jul 2026 16:05:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699517; cv=none; b=u9IoE4oJAZJAtBxjZZaPCashUPhBTaDkuyh+W2sGuuK0ugNm2nAILZpDzAN6ybxr7ZBzY8fMQYArtWbHF5oge1UtaOMhnECK4RyaDF+attbqjcuLVGN/jN4TRIIYKuFdwwA+8z1zrp6lj1XjrBWoJV9H0khTbgkrJU7TjGPIQQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699517; c=relaxed/simple;
	bh=hGuCnmWi04i21CpxWSYcl45co3ynhsjIPnzzDfTZQug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+RuwNjKK5Dd6iRLV65vC1uhb0Wo4tC7bEPWcmZ79bQa2ujFlq3mGKVXlnGqt5OwKitdmrA8q8VsmNQEagvgLHQySXStOEMTRjihrxGX9BD+EHdogd/znXaIwFyrdPGy/d4BOPoZthZYiZ/uRkr7GYrvijgrFEHmpoOmngbFAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UhTfV2/J; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DcO9dOtr; arc=none smtp.client-ip=80.241.56.171
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxc9S5FB7zMlHM;
	Fri, 10 Jul 2026 18:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783699500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CDpDNvnQLgyr3quS6qpQbz78QxNofrLSJfp6izl15yU=;
	b=UhTfV2/J/2xUIMLyx/Pg6bZlMlvPlmDRXKVxpNVfAhg5/XtppmIfYV3eZT0BdiK1fre65r
	JiKF2k0gsIMpJjt11n6RXzQdqbk2NHDwIYU0SieXyzwTLMCQ0jKR1HhHiD8aRkNH5FfDBl
	Yl+mPLA1WC80AgxyIQGAbRRlUaAgCwPWbgH2PizKcppUjOlVKuJlSSQgzSTsJQuNfG/5BZ
	CWr2reeIwtLsHFTbw5MJEkuyU4Ck9xlgaMhaO7WyNeCDTijkvQHyeZ/1x75JnxRBSWUN4E
	pQGqu45dXNA1oCogHGCogfZhuNtMSemdIMDjrRaIf0QT3lsKXxJLUzmQqsJeTg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783699499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CDpDNvnQLgyr3quS6qpQbz78QxNofrLSJfp6izl15yU=;
	b=DcO9dOtr8TKd17O+sfatk3fhp0+Uo3dTlCsP6X1vYumIVvylmZrX/giraWxzQj3iUSA+9j
	khxV/qgqlxP6p2g8NpkowuGUN3BqanVwRLNXluEAHiUTN5GcnXWR6JBA1RJAlQ606wV8iE
	JgZH3Sse6edKRPk3ttvzawDlLeQXywBYF9P1+jkzHXUGAxfaw58ORz3dxsiPuxwO6fnsWb
	DK9hhNT7k7KAUZULFznV7vmuXh9Z6LgeOEYphSn7g3HYYAd9pdeRA74VUiSxea9KKDJ8Wv
	KAyrah0S9lQnjixccU+vc71Sheldi0dx33foco8pVj7W2KhviSx+tpE06Ael8g==
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
Subject: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
Date: Fri, 10 Jul 2026 18:04:22 +0200
Message-ID: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a2ef8dc264d8dc852ff
X-MBO-RS-META: 37psgr9x8kskyk9qu5wto58symqtbngb
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[mailbox.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35068-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C11F873C7EA

The DBSC5 DRAM controller protects DRAM content using inline ECC.
The inline ECC utilizes areas of DRAM for its operation, which are
in the DRAM address range, but must not be accessed or modified.
Describe the inline ECC carveout areas used by the DBSC5 controller
on this hardware as reserved-memory, which must not be accessed.
Include DRAM areas which are unprotected by ECC as well, those are
parts of the DRAM which directly precede the ECC carveout.

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
V2: Include the unprotected data areas as well
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index d2b3fc08954a1..0ab303863155e 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -107,6 +107,47 @@ tee@8c400000 {
 			reg = <0x0 0x8c400000 0x0 0x02000000>;
 			no-map;
 		};
+
+		/* DRAM controller inline ECC areas */
+		ecc@10cccc0000 {
+			reg = <0x10 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@12cccc0000 {
+			reg = <0x12 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@14cccc0000 {
+			reg = <0x14 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@16cccc0000 {
+			reg = <0x16 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@18cccc0000 {
+			reg = <0x18 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@1a66660000 {
+			reg = <0x1a 0x66660000 0x0 0x999a0000>;
+			no-map;
+		};
+
+		ecc@1c66660000 {
+			reg = <0x1c 0x66660000 0x0 0x999a0000>;
+			no-map;
+		};
+
+		ecc@1e66660000 {
+			reg = <0x1e 0x66660000 0x0 0x999a0000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.53.0


