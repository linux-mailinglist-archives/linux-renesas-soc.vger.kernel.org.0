Return-Path: <linux-renesas-soc+bounces-35200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s2m6Hmk3Vmpy1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:19:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537C754FF6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:19:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vAU5rAbA;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gw4XFAcc;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 872DF3298D41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBF1477993;
	Tue, 14 Jul 2026 13:05:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422C477994;
	Tue, 14 Jul 2026 13:05:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034329; cv=none; b=YGCmIRhpjtlXrYboOio0QMKAClM5WamiBOfy3O+p9bhT0Lc45GGbLKsrnJ0UMYNImqWwX7RApMCNeW5oZqx337wsuSSirihlhMK0DYl5SACPiIyljmppXfcIc3uXccUxYaACAD9A8Uk1n8Y2jenVn9pH+CW6SqHXNzbkO8TIg1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034329; c=relaxed/simple;
	bh=HqTKOQ3soUBKlPoHyAEKydk+DaknayEetmDcdY5+uV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h03c0VsqNBec9m9jRfSgdkSHcfdFhpBd0li4SFuBYyK98EjSpDkhYbezz7GK9oWA7onVcIpVjkUUu6mFwtppuVLFDK/DS9YMFJox8r5G4zypPzMVE60Mak/S+bMEgl9MrD5lkuxVXMYgR9slJx2P2MylA6CldV/by7/SJhDtSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vAU5rAbA; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gw4XFAcc; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h000N6wNVz8v9C;
	Tue, 14 Jul 2026 15:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8vHA1cpXKh35T7zr8/1wgjPgJVq9DuTAI2cDYumRPFc=;
	b=vAU5rAbAoIv5ZBsGDt8Gu4mxuF0CBYCtILz7z5lzwKbYXzOto91xBL/u1ZYdGcwYU8QOeC
	DiVdbzClGnIl7vyzbGmtmSU4E+unbvfBtRLmInKc1MCvrN3rI3UV+zrAJgOZsGI1V2maqx
	V2+m3Va1bgVIUsYIu040umLmr0zPJRjzAAewdDMEhFVS5OhjioBm1OCO99YLHrhk42fpP9
	dJDcwokGPGcgVHRFR5e7dM5f8oeqTP5wDmG05rZ6GQ3teaS4TvGxY9bP5koIuqvxGDi4Wt
	VgbZDvHiDcO8zTfuy+u33bdjZpCtVJcvuQe0YhobuNMQE7kCJsvz6HJXh1BmcQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8vHA1cpXKh35T7zr8/1wgjPgJVq9DuTAI2cDYumRPFc=;
	b=gw4XFAcc0sEGKc0YT7BQRNQm+B1q9bZb/UAVBwlyW0HioaOkVrFKgNvxs5OiM9uJ2Weagx
	l2ZC6+9Xg/Ehp5f/VEXlMeSd4iRMILgxB/yWft53rO7cu7B/0bu+Am9H35iooCZjfq5iZz
	i54/Ev9Bb9K/Vrgjm3rdTQh/iUg310jK5JPulrWCzEX9GU7RFS72cjRBtAKpKp6I9g2Gv7
	rvHccdBpDmfc1YdNuJf3isTYTx91OcReT6qZnD5xv8Z/HWru7lJ/5V9kMXelcIrnwyw6Sj
	0D5teTkW2fr6dxGFjk2Ufwnk14IB5YfsyRbhmrQdt4l/LPiA4LZqCDqOJ9vH+Q==
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
Subject: [PATCH 1/2] arm64: dts: renesas: cat875: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:57 +0200
Message-ID: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 17a96ssnytbjkxpbtojr6tez71yddd39
X-MBO-RS-ID: 456c9e2a5ba797afe92
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
	TAGGED_FROM(0.00)[bounces-35200-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[pine64.org:url,vger.kernel.org:from_smtp,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8537C754FF6

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
 arch/arm64/boot/dts/renesas/cat875.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 5815e9d2d8a93..196cf2e6007ea 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -23,12 +23,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <15000>;
+		reset-deassert-us = <35000>;
 	};
 };
 
 &can0 {
 	pinctrl-0 = <&can0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


