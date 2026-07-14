Return-Path: <linux-renesas-soc+bounces-35190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AjyLNgI0Vmpq1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:05:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD0A754D55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:05:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qsdQJtWQ;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nWg6s7KM;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 482BF3069247
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA114472785;
	Tue, 14 Jul 2026 13:03:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474B46AF02;
	Tue, 14 Jul 2026 13:03:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034233; cv=none; b=dS6FovTUls7H3FN2Zyj8V8L7C5m2mnTSja4uxQxSITpazgFWaAAmJAQlxLf1STJzhriiHvVG8OSd8IJt9da125BkJdmq03SPI5mi3TerlFbQJv+FyixgEO/3Ew72fsZ/1PRFWGJA5K7yPSawprOdxb9LWB4SJxJv5EXyDWVWCCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034233; c=relaxed/simple;
	bh=fip8VgCDcHZ/37oCo7mvBsYLi7s5LcYhqK8ZjlwdsY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWjkaLdIFoFiRxhJm0zjzWoGQUEAjExTdUzk3AhF1bzksSjQ29VAaDwhoLTxE+58/eq4jLGczq7xJjQq+RdXXZH1I2NJHOk6Rrz1R7Kj9xpIOF97+h6cnnCujwos2RT3p1UDj1uI0Cht7mT2HDFH2xKO4qJSegK0qpli70nBVMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qsdQJtWQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nWg6s7KM; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gzzyP1NkKzKw4l;
	Tue, 14 Jul 2026 15:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QiLzIZX0BYLiz73cVxR+m2oxNcIlhqb4JWhtNdrz7g=;
	b=qsdQJtWQb+d2QU7wO5SgqY3MeVj9rb+NSxQVuLbV3d5dCSJSJa+jF5LcwnOpGQ0kAw0Evw
	BEfSw8eDPl+Tx7rHWVNtTBvIawdw/i/wZFc+rPJR62F/nLY0Zn2DQtkkcm0X8dU7eA4uoj
	ZkG3dHR6zBlvr1ma4Ll8wBdF3nyx2045CXu/Y2HotnyVUMc4C1q6Lc2kbCAFMnCVBJ7ZqY
	FftJyKBHIKJvzt33h4OGUpDCQg2CDAf/BCeuxKf0//nnp/3ndwxy53fgz2AKEISGMJv67V
	0T3zcGs0li8Y8s9Ahw8pFpzoRumCveyeM5RltgE5Nc5/7KsXyEi8iTwQzj/0ww==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QiLzIZX0BYLiz73cVxR+m2oxNcIlhqb4JWhtNdrz7g=;
	b=nWg6s7KMB9MqZBhGSHGUOJykW0o8o23Ar0UnJP3IOxY7GOV9KKCu4veTe7Xq8bq6Cyi61r
	dDVBLrzQiLtn4kVrozrgDyZQxjhUVGfXM5F6OhlFz8DvOLfO7x7oeo7WPAxncWUN/nR4kt
	QmnrW1Dgkb2k2b1VMy1BXJa9/c03SlJNmoYHfKLtcSbt1oCY2oHKHyXz4IcF0INICDTGo/
	DSB8yTxJysf1ct6o8dhqERlkz5+Y/Vy7oJhoJyCYvIaxcAv+P3kRW1v4Uph5T0xDaXHUTz
	zvnLlMo5RcByOCCxW1lPZrwwVA4AouEF/y9cYmTRx/JwJ7SEXBqD5E8R/QW1Rg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm: dts: renesas: armadillo800eva: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:02 +0200
Message-ID: <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 877d854e8eaeff3eff3
X-MBO-RS-META: ue93fxosbyq8r1y5c563e3rwmo5wqa49
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
	TAGGED_FROM(0.00)[bounces-35190-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,vger.kernel.org:from_smtp,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CD0A754D55

The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
long should the system wait after deassertion of the PHY reset and
before start of communication with the PHY via MDIO. Opt for 300 us
which should cover every timing option, including the 16 us delay
required for MDIO to switch to 25 MHz listed in Note: in Chapter
3.8.5 RESETS.

The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
supply voltages to reset high is at minimum 10 ms. Set DT property
reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
spell out how long the reset has to be asserted, but this at least
covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf

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
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 1d56bdef54539..eb65a54d0e511 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -194,12 +194,14 @@ &ether {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.c0f1",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		reset-gpios = <&pfc 18 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <25000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &extal1_clk {
 	clock-frequency = <24000000>;
 };
-- 
2.53.0


