Return-Path: <linux-renesas-soc+bounces-35192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EbB2CUk1VmrO1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:10:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A4754E39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:10:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vEjOeSwg;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hwsVcsE5;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4140530E7802
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0A446AF14;
	Tue, 14 Jul 2026 13:04:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E555646AF0E;
	Tue, 14 Jul 2026 13:04:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034288; cv=none; b=PROKg6TJVKusS+LlYaLCRo6M0hDIZtYXyPRjXI2l54cXT4AoxXEH8oClzUmC4S2fqYla4ABVGMZGGX5jsH3Khyot96KonT2pTFBV4GUYgDnLOByIQYgFOF2nCZUmj6Jg5J1qGUlRBnimE0mSDgSCfZNRTg/ZR7HMdItd6qDeWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034288; c=relaxed/simple;
	bh=taLv/NHXzUfwPp4BmA+AcjGSqLQ8m3xenjXb28vCXOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lebDSGNfdmHoMcqKcETAUlw/CRxvSAG1msrqSL9/3hxF1q0h7EmAYtGipTJoQIksKrcEGyyogSyJ52vjmtaGHgL0BbU919NerMRu8P08E6TRDm1yM93qCw3wee/MRKiWpTX987irYxnqNGxzDKJZ1+puA84C8pitxZtKkCF8+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vEjOeSwg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hwsVcsE5; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzzzb5LWqzKmyK;
	Tue, 14 Jul 2026 15:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=;
	b=vEjOeSwgbriNhwC0sNf933PK1Ddp7QnGRpnu78amq9fi5J4WdrdZvi5PFAz5FKjjTkhX5m
	0Uyyi0bRVOHVXmiUAhyCtuh5QyGdiienBLPmriOBkiWVs1wGGzO8VnHFXMlyPNCUkCjBwE
	ekQCLgbFs1H/v45hjV8j/lxfbm02ZG3rJvakKZVapLArNZ3M6SD/0FUHiepbWywtBcev6x
	xovGTDFhltv/TU2AElI/n5bh2zoyaMb8/ZV59KJJ764pDxzhcw2Str8zSFZvBlAbSQPA7G
	lKjOJ4RkjZTsrby763qv1VaWl5UCzKcP/QuR5REyvf1FRLxPwTSKq1cZxRzWfA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BJobMhO8Q4Mao+C+vcQ5vLWeHC+VhP4x4j9L0XJUdc=;
	b=hwsVcsE5u0gTNkGdl6tTbFiN5a4Kz8R4I4Nniwe/EXLh9YDC35zSh+P77fZpnHdLYTOVOQ
	T7/GAaFGMFOOgY9lV5Uay7dWtAukwhmSu2oj0QDCCT0Sn4EfjvfMW+3s0FvhQC5HtkDlO+
	5MvNZ2Muc7xX70KbUafbP8GUBj8snhOJ6tus20rc5kxnTwtlY8GS0z9ii0lgV49StR6j3e
	ywrBwOse29oXNBJP/7BV8kQXTjEUUfmHL7zV3/9XUcADL88CpeTdUnRPmGmvFLflRaPHk1
	B2WRI4fqcdU6UsGgT97KOXs+BITSFrkyjZy+fkco90tLWHYJnpwM8hTWCk3MeA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/9] arm: dts: renesas: koelsch: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:56 +0200
Message-ID: <20260714130429.11214-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2c8c949d0327fe1a3ac
X-MBO-RS-META: zby49muz9hgdi9kdnob1qtk9uzt8qdhw
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35192-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,vger.kernel.org:from_smtp,microchip.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C4A4754E39

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
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 48db62e0ff874..54148a5ddff7b 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -678,12 +678,14 @@ &ether {
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
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0


