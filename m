Return-Path: <linux-renesas-soc+bounces-35255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jDgDG8ZmV2qvLQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:53:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF8075D20A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b="itmohP Q";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C083017783
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56451437102;
	Wed, 15 Jul 2026 10:53:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E26435A93
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 10:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112834; cv=none; b=GznX8fp/dOZWPBl6FSppL3uxafWe+49g0WdLDrRHINPZ/t3sDy6YlgHvbqjT629DKmzX59lbNnx4vkZQwBVcC4sdzTEsiPm0pkx++tUetkfmlDwC0+rqTmaRUCi3Qt6N91u8duQIsWp7MlCMYucMsQHF5IkvIOW+CtEXw3heWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112834; c=relaxed/simple;
	bh=VYaNehHZfey9hQ2LPiz2P5PVyulFZrTujSAfkLpIgT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tb2g+SvFz5psD2pBXbUrhQxcnD8wwP5AsC99fuWW5mslqJZzvxX1LZ6P4ktNsJ8fZ5dcvVfdN45mtOeBFOcg9TGrD3y7Vl7U88QiWTTDLZLaWtLyDuSqbKliytW42d3Wt3Onfs9X9CLJYc8lZZwAfhQLGGTGWJ9dhQp1gSUhvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=itmohPQY; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=z80esgxY8k1SXoq3sL/sFu/PAwMONvCDDC37DQ1P5vw=; b=itmohP
	QYVa79OF3ZoaQEHKMqEGyNbbeWeWjEfxbmRbEgPTlEebWvH3c4IS9mgfJBzx0Sj8
	h1Dfe8WrS9Q+OfttVToeASvwt7yRJh1s8T7Ex7jzpzjOKBs3pNN4nubzeQJeybcZ
	ZMRwUrgVI5ZbgmEovLp0PEnkAj/K5fK7/ANf7zJUEXF6pttonsfKrG0mwRvVqFLe
	aMX5Opdi6w4YPjCSMlShfyuiAk7RGTOXvHoZoq/+rY+qSlKrTO2LUXcU7eBfQbAT
	sOObSU7MWVtnPxAgkZGZEUWz+rCGtA8EWp1IWplI1A+5IzjJ7j2iij1PxHIAMxNs
	P9OIuDid7Nb1jM4A==
Received: (qmail 654766 invoked from network); 15 Jul 2026 12:53:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 12:53:41 +0200
X-UD-Smtp-Session: l3s3148p1@SJH5IqRWPrMujntW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: renesas: lager: use inclusive wording
Date: Wed, 15 Jul 2026 12:53:08 +0200
Message-ID: <20260715105306.25147-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715105306.25147-4-wsa+renesas@sang-engineering.com>
References: <20260715105306.25147-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35255-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wsa@sang-engineering.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[sang-engineering.com,glider.be,gmail.com,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EF8075D20A

The feature is now officially called "target" in I2C documentation.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index ad12c46eaed0..46c3f4f7c335 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -304,11 +304,11 @@ gpioi2c2: i2c-9 {
 	/*
 	 * IIC0/I2C0 is routed to EXIO connector C, pins 114 (SCL) + 116 (SDA) only.
 	 * We use the I2C demuxer, so the desired IP core can be selected at runtime
-	 * depending on the use case (e.g. DMA with IIC0 or slave support with I2C0).
-	 * Note: For testing the I2C slave feature, it is convenient to connect this
+	 * depending on the use case (e.g. DMA with IIC0 or target support with I2C0).
+	 * Note: For testing the I2C target feature, it is convenient to connect this
 	 * bus with IIC3 on pins 110 (SCL) + 112 (SDA), select I2C0 at runtime, and
-	 * instantiate the slave device at runtime according to the documentation.
-	 * You can then communicate with the slave via IIC3.
+	 * instantiate the target device at runtime according to the documentation.
+	 * You can then communicate with the target via IIC3.
 	 *
 	 * IIC0/I2C0 does not appear to support fallback to GPIO.
 	 */
-- 
2.47.3


