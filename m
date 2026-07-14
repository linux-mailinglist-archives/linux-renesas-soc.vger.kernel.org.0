Return-Path: <linux-renesas-soc+bounces-35202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oFXSE8U0Vmqp1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:08:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E2951754DE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:08:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Af54Un0G;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=V6LaFXM2;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C257E3039765
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4A74657F5;
	Tue, 14 Jul 2026 13:05:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E4453497;
	Tue, 14 Jul 2026 13:05:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034349; cv=none; b=uVVAZT55yHt8qnHmUXkprVw9c4kvprkJoYGexjkr4PubrFlDf9OqSxYgdWZAw1VyM6IekI1dA5d4vBQ3ervw9cjT0VJ/6Ca7OB5ZGvvaMRTiJZAIdyNDGilhX+eLhi0mVs7Y8RF0t5gTPeNtF27+z4HSvi1VmNw/+qIKSsAujHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034349; c=relaxed/simple;
	bh=4MPw1VMsxv2Gqokll7zTIYYLVZPmA6lN8j4JEBD6HSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMz2I0N/61i0sNXS+dbOlpB4OaQ4x8Pf5Li4fG3wLpD3vPx2X//l+oo8QGwAijKt7i4BqmgA1pZ9tz4Q7cdsCIk+1WEN92bEGPRrh/5S0EAQJOYUWaDw/t/Mgiid6UyOEeEA/cF2OyoeTM1ZWczNU6k0FycUqu8RGOh45hYTO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Af54Un0G; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=V6LaFXM2; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h000n5njHzMlV5;
	Tue, 14 Jul 2026 15:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtBaYTpQ2+EKQzLC2rq0fDxMm0BG4JHJD/eHUR6sp4s=;
	b=Af54Un0Gasiptj3vxhw/JB+iJfG2DSbzzVg3QUceNOH0O1GPm8cC3+QG7wpQdzh5VTAIjs
	z9rEtIalSwab6MjRzmXvdB4aAPpFyYpv6FkwQvsCSKFfjIV5FsERzGH78K55jo+Mia8+/t
	/868ROE8DnyzzWoSlPZXNnFa3XYS5FGu0P3AVSKMWoK11JCw5crRhuMCwYBectNjyh+lGA
	IVkZpnhdckeydZ8RG5NoFj7Yc3d/1QhHQvRL9ZxGOKWHMgTZlMvDJec7+WZeYQupjmPHzy
	257KjuW5AsqM8FT2Pz/F9TElo+qLaVCyGl6hmWytEHs15GIy8uJCt2+Y6SYUUw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jtBaYTpQ2+EKQzLC2rq0fDxMm0BG4JHJD/eHUR6sp4s=;
	b=V6LaFXM2Jfj1LxFqYs7KQcguefx8tJOLi/alWaKiaJG0yJzGp/8zF2ZclKfY1CJ32Kh4id
	wuiULoBWewgr8HlfGNq1Wx5NybzQyv2B73JEdP9WEJimjsBUGqC8FbSbShnoFjOGdgE0Nr
	1f63QthHbTOWTake4BI1FOtnBCdJwqIaevbOt6Qut15aYAwXExxUY+WQlr8oYzO22anIcJ
	YxzPe1mJ7r5ig5hSzqhO2hHkIuE8lHD2YwLHfHyUOS8Jm5PgRkP0WwOGw/3M/r/PYEVbiZ
	LWrA3FtxgoHASjRnuVarOcWE0f0+RWCKX840x+nHg1tCbEGy5bEaB5DJVwp7uw==
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
Subject: [PATCH] arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:05:28 +0200
Message-ID: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d8efed93b3dc8ef9cd
X-MBO-RS-META: iwbu3zffk1xnaopoaew7i1d8js7ftn4g
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35202-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:email,microchip.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2951754DE1

The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
POWER SEQUENCE TIMING INTERNAL REGULATORS does not indicate how long
should the system wait after deassertion of the PHY reset and before
starting communication with the PHY via MDIO. Opt for the same value
as used for KSZ9031RNX, which is 300 us.

The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
POWER SEQUENCE TIMING INTERNAL REGULATORS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9131RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

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
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index f8442b6a85a75..8723e7a76c9dd 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -60,12 +60,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &extal_clk {
 	clock-frequency = <16666666>;
 };
-- 
2.53.0


