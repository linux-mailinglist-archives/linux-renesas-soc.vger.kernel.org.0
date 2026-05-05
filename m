Return-Path: <linux-renesas-soc+bounces-31993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A1DB8Rn+Wmt8QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:45:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21D4C63C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56C8B301D58B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8DE3BE635;
	Tue,  5 May 2026 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ST8hI8hw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="E2a1A1JL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B01D3AE709;
	Tue,  5 May 2026 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952640; cv=none; b=gXsHbhq/so0qQVZpZK+Ex4/X3ZdLZMNL+u/XvurMHDFITwRiOzdmwVKpbfGqBPZBONgh9OLpPu+zCgLYam2WCNoHI5OMJtteK3TyxM9ylmVHtwou3Lu4QlDwb8pEQXHAqWHI2dV5Zssxu39b9BGqH3fkGQI4rWNturRTZNutegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952640; c=relaxed/simple;
	bh=h2DpSxvQ4Ry6kBJYSPrn3xL7BbkJ21bWd2JwXpu+R40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=flK3lqtQTlMVaVDvEcaUlUxiI+sDQQXp88NC2yXg12QhZPHbLCuQspTOkW3qgp+tZ4BzQ9q0n2VYR8xXvDKiW9oms2y0i3iYtFhXjkFXxdbaW7TjJ+vOqjZzm47eZEKr+88QV46KE+8VIbmkdEnj+TOZ0hKmTjDva1E6Aoamkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ST8hI8hw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=E2a1A1JL; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krs0QG5z9th7;
	Tue,  5 May 2026 05:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W3WIxgiIre34DOdHyKWuUPtLKlUjwAROtJmGpAoj6U=;
	b=ST8hI8hwbJInDwfAHHMwIW5gzZgqJ22Jvs7yDMsXSNVq4YKDJEucNVctKQEGtFQBpBrzlz
	rnDdJv895gFex1HVpm9sO8pNIboI//EvI+B2X31BvhCqQCPFSMZKfo+XuykTokdFSOJmMD
	w+Ik+kRAPWo6hthG6a0DHrJmxzXd4YlTwCgG2+JO1pOYSXYdx99DhLjv8glZPa3JPGZaA9
	3ld2ZEXufXlt+GY9nJKGTkaAYWi5tnRZzXb7q1ZIRl35K3SLJeaQKWQptUA8wqpm8jXYqh
	T+A4mL/+3NzaMZrA84523pnUUZz67/D2enKU0okJgCc34otAlvyvGY6bIUJW5w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=E2a1A1JL;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W3WIxgiIre34DOdHyKWuUPtLKlUjwAROtJmGpAoj6U=;
	b=E2a1A1JLFQ8YP6JQKsnkw8V0SCsaaoTZQgNdeSeDfQJ3rOhkNmNBV5jLg43Mwi6lQMgbLG
	/EsdA97SSw2M+aWo3ZdP+lhl32YSSL24KMaQ2B2g7KfpRah6gMIs03a5bf+Kh4nMmB8CPr
	I4FTNdEJcd4ew6+XXThf+wwUhyPJU1zCT2CF+mnoX1z6ydjMoKEMvFl1ZABLfuZkgCvroU
	GETZ1Om5DpF1Tt5jFQ+QNydyWlhxNd3rapFD4mmPHZHNkIYKS4NRYi6ysa0aebCr5DmY2+
	/5er2fopODAwNQgq6qM3qW/Y9tk9lpHEXqDfhRlUPwehkf/OUgnvsnaA6lrDdw==
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
Subject: [PATCH 08/11] arm64: dts: renesas: draak: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:49 +0200
Message-ID: <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: q5z68dduynyb75rct9d38gzc5zaxy3uf
X-MBO-RS-ID: f68902710217a6e3f45
X-Rspamd-Queue-Id: CD21D4C63C2
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
	TAGGED_FROM(0.00)[bounces-31993-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mailbox.org:s=mail20150812];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.776];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,glider.be:email,microchip.com:url,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

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
 arch/arm64/boot/dts/renesas/draak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index c83c97d991133..80f0d83dd6766 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -249,6 +249,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio5 19 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio5 18 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 		/*
 		 * TX clock internal delay mode is required for reliable
 		 * 1Gbps communication using the KSZ9031RNX phy present on
-- 
2.53.0


