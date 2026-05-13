Return-Path: <linux-renesas-soc+bounces-32606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICXAMVQABWrxRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:51:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2853BA4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47A343012D69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783D638D688;
	Wed, 13 May 2026 22:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wcAmjRVK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W2ov90Ff"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B746F372067;
	Wed, 13 May 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712658; cv=none; b=dOyK7YoBtz5Bu0oAgb6mL/Sy1CXnsuqXI/n9XDb3aSxjyLRvGlCxRejS1VTNv4mAhVSMfIM7sJyeMgxtwfNl80w68zrUnbr6iXHIWW2T3208hFUbQjSSB3XTL/t9V2W+o9DeOzVaqfLXMfae9fcWNUnA2hvBbEifeZ9qQO8sA/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712658; c=relaxed/simple;
	bh=AXXM6Hbzvq+cBKz44q7RiMmfnFswJfntuDi1oR0ECik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bxnf7gvJfrRQmomO42plZl9aODgRZs/ZAE4DQQRJdogFXsakXCbVSnu4PEklB+1iMka5OnTqdcCvDy1szBo8efHZ2l5HqugYHeBuoB/cfnI/dqJ7H0N9MjoJ8dDzKwdBgHWKqg44wVNnfmQz1LAV9ASgMlYmhGPq/fZ/R0NjO78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wcAmjRVK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W2ov90Ff; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gG7wT0XHBz9v8T;
	Thu, 14 May 2026 00:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778712649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H1qqVgQz94jIQFSkJ/1hbgwJdeHiBuk/T3E4kTorrtY=;
	b=wcAmjRVKKIvAzo9coa2AUtib9WmZjqGs9HZqx0oTMJyM7ewesJkdA5cB91XQJIFJxOtUZi
	UnmUQechNGyPOb03Q9PI9WebK7bPhmaDiMwXbFMgKy0h8iBhSC2Vi26XprieCLNEFUe49x
	zO6gwo8/ajdBFRzXxY4oXZy41wIplvYo4waDIWrENp2a9ej2sFWnX9pFpVrfmhbPEooKcS
	RRuao6PbYhS0u0yzswNCl8FcukgcsJOxMVs67FB8bOSHCIwKozn2i3G6KqSCaVLFcKSyJK
	AGAPYPAF9RSeqv50y7AE/xLILOm2CxVdXzWYybOxuWAf+5drcUmHUcyy3mxVZw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=W2ov90Ff;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778712647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H1qqVgQz94jIQFSkJ/1hbgwJdeHiBuk/T3E4kTorrtY=;
	b=W2ov90FfXYZsBo81P53c4C2fCyYWsUmkYLBJsDby+gNtzIcFvVcpXU7bNiHTwWJB+MSA0+
	A4XnnIeprb1L4YK/K7bjffV5bmZrAk1xNAdKtoyV3VF8Rj4okbJBAqe2g1dx5yA5n+FnpU
	acb0RGCV5ROVO/gjo3l3rut8nEX0V0jeJSGBEOlxjRVxRDUnRVHJcRt9icilmHBoVqOsPd
	Wv83YyhY2SX98OqkptztkC7XDGC/9mN2emW/fYdawvRfbyhlHAfDFTMfoFRc9UaD7pfTEs
	ag63wMIb1ny00o3lJ5rgJ2pMjGDTnLJXCufXrWtyBlxwoDK2LGu9KS1Lsf6x/g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
Date: Thu, 14 May 2026 00:50:24 +0200
Message-ID: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xrxthdf5y4xy8wby13xewwjhafdkup8d
X-MBO-RS-ID: 69ea00e180005b506bb
X-Rspamd-Queue-Id: 62C2853BA4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,renesas.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32606-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,renesas.com:email,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

Describe SMC based PSCI access in SoC DT. The system can interact
with TFA BL31 PSCI provider running on the Cortex-A cores via SMC
calls.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 73be51787265c..d14f0cc0ad360 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -665,6 +665,11 @@ extalr_clk: extalr-clk {
 		/* clock-frequency must be set on board */
 	};
 
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
 	/* External SCIF clock - to be overridden by boards that provide it */
 	scif_clk: scif-clk {
 		compatible = "fixed-clock";
-- 
2.53.0


