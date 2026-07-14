Return-Path: <linux-renesas-soc+bounces-35201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aI2kLgc2VmoM1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:13:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A21754EF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:13:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lM1R9OcM;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L6OMjVBs;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECE67308EA40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B879D47B426;
	Tue, 14 Jul 2026 13:05:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7A47B434;
	Tue, 14 Jul 2026 13:05:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034332; cv=none; b=oE+VS33ZStNFiQnH09PAThJjT/N/aZelwzD+a+UyUMVSw5g1FebIGwVtztbYAmlwiQ9+iyDCK3Sur6SUZRpaWtIrTazKT/LAWFN5hlKRhPuzVcRMWxAlLRAlA/CukSKhEzfRX70CLTA3J0wimr/uTZD3/yPuBqiEdUUaN+y2yzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034332; c=relaxed/simple;
	bh=MKafQ2xMEf1J5JGLnC2EmXJQYgtuSHd8eV6hadsCP7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n25MJHJqKswgZG8golx6WvYqIyknmLWlATSkr1cDWx2U93f2WntCUVbhL39aZEh6xyOQalZZ4ZVL6BA2hN56GdcbPqZP1HTx2I/JMpF63AdcuW329JNI6xRbHC0fXqkIF8SH6poX78dUIpx43n/5ouAPjO1wwpHoJg4KGAldttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lM1R9OcM; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L6OMjVBs; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h000S25LKzKv6w;
	Tue, 14 Jul 2026 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=;
	b=lM1R9OcM7/j6sZj+sIPbEFx+Ax8Y/8SH0Sz7RSaGbqW+czsZadXp2mWdFuepJyrL2sx55d
	Z3QaeWOAA64AovSFC2Une3LSCMOsa7psybzATg9LTy6aGZQeAVd18UHBA01ke3qqFgaB9a
	W4Q6JBXO6Li4PSGoo284jP7h2PQZ55Ds+8c8RcFYn/dMDlUxVYvbkjfT98e0GXR1b6Ougs
	pqaLfKEnssw1kSCWW8DZ7ClSY5RAqalS/7IhY+hvG3ea/vT6zmwAvFJD5LZT3T16enJQdk
	s0ok6lgJ6vh682iK9iwtEhu5lrQObPO/wIs9RW/BMKDntavWnAXiqbc7asjiaA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=;
	b=L6OMjVBsyzwsVKDL2kL03YQRGeY4X7CdWYkpO1yzg3MILKfKhU+E8cKstk9Bw1xgLLFLV+
	D5nsvWdQja9V8HPX4qSosrXMnVFZVqL9uLpf/NzMgqtfxXlpLmpo17dE8bQXQhAIesmTi+
	2oV5lT329lEWJGvI/6/T6Nb2wxhTcFhBidR8OSZqxydUadahLqoSEMv2M717u79PJJKDlt
	/J85eO5LfI4xq0f+vP+SfO5bdAG1sn1tKd0NgYGK15rr2baoMJMbuhcouiVG/7vP4IxWH4
	bQ4m1F2aorXModGt9R1KxDcOI3yfGK+3Zgts7afMnYnyme6iDR2lyA9iFgQEhA==
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
Subject: [PATCH 2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:58 +0200
Message-ID: <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d20c130be33f70fa70f
X-MBO-RS-META: twbnhowye6ybzzzuns4d9twi9fokanr8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35201-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,glider.be:email,pine64.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32A21754EF5

The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
(Hardware Reset) states that the PHYRSTB pin must be asserted low
for at least 10ms (Tgap in Figure 10) and the system must wait at
minimum 30ms (for internal circuits settle time) before accessing
the PHY registers. Use 15ms and 35ms respectively to provide some
additional margin.

[1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf

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
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 83b6c04274ac9..58b787db0f24f 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -25,12 +25,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <15000>;
+		reset-deassert-us = <35000>;
 	};
 };
 
 &can0 {
 	pinctrl-0 = <&can0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


