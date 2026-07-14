Return-Path: <linux-renesas-soc+bounces-35193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 809YNk81VmrR1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:10:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72642754E48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fWKxyWdn;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VLjHKKdJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42C9C30EA29F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED04E46AF2A;
	Tue, 14 Jul 2026 13:04:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED546AEC5;
	Tue, 14 Jul 2026 13:04:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034288; cv=none; b=rkqIU6+yu1U/B5Jd9dSHHLPUb8K0QsU3jrSR3CkCveXzX1orHA39fXff07Fqzlhebb30DjkMm2gcqC8jNRdGAizxEdSz2qlhq4WPlp1gBty+Wrl9el1KLc016ln+J732mjKpN4qeUzCRdmsCtWgRlocQ0sbRI5zVzIx79KPjLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034288; c=relaxed/simple;
	bh=ItMPCuqhHkXCD61w8W9pUVYxw29HsE4eqP6IvBVSXK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlbLCnG5b+6xdPbDsEXoHa1owB96gSylBRv1UwVBSxcdPMgKmIKkMul7UW7fvo4DPUOxayomqH2f2Vr6fyoOTGgJ3vhyeo9RNN1qnePn447Na4Eq2/t4dw+jtTth/bt0J9OYqjIKxQOcZCYaS5I9ntAiHi3TfHJJZpUQUWV4zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fWKxyWdn; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VLjHKKdJ; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gzzzd2JM5zKw51;
	Tue, 14 Jul 2026 15:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=;
	b=fWKxyWdnlHBoxSeGCUjhNxLfbXwQtrzifI0ZoCi3wspLhBt2uElNRiZpMC3EtJeLCNEX+f
	UYUhkkG9u+h94UxDZTAPKE9Rr4VFO37/9NRsH/Tz4nWp8axiaKkc34nuswsL+rOQ45buJt
	rBMbD+1IZ6oO8aAxOQnA1LCODy1oO5B2c+e+FByG83/r2m+wNDqkalc4QnV0PftBsuD3pq
	1cXvKIVIIgCntyrxwRXmUGCoLigrRJdnFkAyYZR47UJBOkZ5ugh1pcRfNRdW88rCxynF5B
	ntAJYkmCUYeiZtMc0lgEB9elOg+iYIVrkAKUdUKTfGL2BGTY15BZWkuOTjIb1w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3U5wVLTIHJcvPryb0DdB5bAnzoh2qzPvSAZ2mXS9w7c=;
	b=VLjHKKdJ+xS7npCRpNYZmCkf2uOq7qnANYvZH51KdHRwZIlEI3B+PQlctefwzGHb8vbU4s
	rFftwHKzKkWjbmh9ceJ6A5vtrzgYMN5no8jISWLEwRCBeuvTAwp5PUg0ravz9de7o3HEy1
	a4aNnmEY2P/4FuLiJ39l5Dg0p6OSx1u2TDt6AA75DZr3onw8bXiSsW35MDPlLB5qjYTOc+
	+vdTS4wY4RkvQm9SyafDyVhJ0t4jtjAPz+sk3NlPj77We4ZyTs+3Kn3s46T7pxRYbxTQPi
	9Yzt2h4lOWqIuUvGd5ZiXIdMPCDpesiXG3jjDCG+HSB3YaO07I7S8HbC2yEWLA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:57 +0200
Message-ID: <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ksjhyk64pemgiie94ooiq65hubhz1jj1
X-MBO-RS-ID: 09d30c1597178f11e5a
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35193-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,microchip.com:url,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72642754E48

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7791-porter.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-porter.dts b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
index 811e263452acd..05989da3be046 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-porter.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-porter.dts
@@ -328,12 +328,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


