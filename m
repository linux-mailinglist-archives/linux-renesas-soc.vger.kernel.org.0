Return-Path: <linux-renesas-soc+bounces-31991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBnINO1n+Wmt8QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:45:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 554654C6408
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5446F304F00E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7CA3B9D96;
	Tue,  5 May 2026 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Pull76nJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MUerl1Zx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5B23B6371;
	Tue,  5 May 2026 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952635; cv=none; b=AU6VE8kgT1AuyGjxXDVIwgV3vRU8gVuRqxGk7aACd+p1rs1+9ch1HBuw02r2fwQbG5UIKJ8buV4yCyVfqUHYgmDnmaqwBTCIUK27UBrN/RqRha/DJYK2F531t7LlSLswGXIhG+44y6sY4Y3KII0SdPY3zXF+FgS5NRTfz+VJD5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952635; c=relaxed/simple;
	bh=fDOEi+Aq5NzdtBKIIh3gfp348g+/wbJHKJyNsDPl7tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHPtN3ItqO8W3b3TftQ6bJH+rO7N0gPUr//yC+Y7PeJr5vb42DNmkua1t5lGaoTl8KcPBcc6e6EZVIan0CyvJzwHZtg8KHY3y9ejsVvRAZW0BkOdG9H+K2t2Qqkfy7Hi39aMB9yGLuuJnICJ+0fAH1t0BFimdSwnBq0+DrqDQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Pull76nJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MUerl1Zx; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g8krm23m2z9tgZ;
	Tue,  5 May 2026 05:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHIDLb+i1jfPZrKXryOfk6JpigCT9IGdYyMM3y5DI+s=;
	b=Pull76nJe1Lk9Ez4HIqTPra3hdBz49swW8WQWEpkd6bwn7E6SPtRWQgIR7vktVA0jrny0I
	eb/nqeuwPBIw2iM2Ged18Qcf8gN94LmMaV+mqUxzREf7zb8JynHEG4MaemceTCs6qODvaj
	KeLigrLAbLUVAwFv+kEdbCtvo6jdnTrP2ASPqZ45HRVTPgshWxrfM2Tx1NDogFa7xURAxe
	qrEcv5/oJMG+k9k7kzNsxaNo7oIg61m6LaIuP35IrZwmB7Xbr39yFRkfEgvD/iGc//voRo
	vlWUtsL2b3TpNUFD3FtFnoEJ+uYUcFa2E/94n4ld/0U5q4Z97W8ZKhN3hVsUQQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MUerl1Zx;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHIDLb+i1jfPZrKXryOfk6JpigCT9IGdYyMM3y5DI+s=;
	b=MUerl1Zxa4YzbNVwb28gD/T2RCciNwMXoFscdrnIYPxVrqpZmPZzZ1zggXCNJkjx2RvADq
	ZtVC4N0yW+hrp70dKWPaNAHU6sIyLsIV49Lvl1y214tgY0jDpp1jiqYlvHZrR27za9g5gf
	3j+chdZQw6ENQog8FbT7TB252l7BV7OIkWRdqoo3VbD9gIKv5pwPGT+tmAKnG1rgUrmRnC
	cL4C1YW7RXJx4A1XsgoyXVNL8HhO4tEPIrAxdskCzI4SphZGCaJA8CQSNcmd/2iTT2QNMx
	qDVzKoXBNE4/vtCjZQzTHGyCAbEQR2h78s2Qkj82ZjV+G/jSQY2iBEdFEJh/vg==
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
Subject: [PATCH 06/11] arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:47 +0200
Message-ID: <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3cdfe458e5e35da172d
X-MBO-RS-META: 3jmdtg7h7rhayz7pqabmgmf7mj9edpar
X-Rspamd-Queue-Id: 554654C6408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	TAGGED_FROM(0.00)[bounces-31991-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mailbox.org:s=mail20150812];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.777];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:url,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,glider.be:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

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
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index e3725304fed0b..52462e61b7194 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -126,6 +126,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


