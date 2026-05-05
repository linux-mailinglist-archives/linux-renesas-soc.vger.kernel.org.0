Return-Path: <linux-renesas-soc+bounces-31996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDD9Dndo+WnA8QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:48:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B514C647A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7C47307246A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509733B6349;
	Tue,  5 May 2026 03:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oLSL65Uv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kZ+0ehCm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BFA3BFE5C;
	Tue,  5 May 2026 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952648; cv=none; b=aK3ilChuhgegXVjK+X/Om0El7OUOH8N1Wz/0OVS8dFTV2ODnMJw3rvCJPDah9VxMR8/W3ixXTq841gMnGPU5BK4DowaYRG1EX/qoI5cDmnClv4kf0uFcoltGh3OUGgP3Quwhyzix5rabbXSraxtOHxPxrN67H19FtkaeAfD1kII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952648; c=relaxed/simple;
	bh=8/OT+6MgMkaeIPy8tLBM2JUR3lMlzfK++fkIZT1vOmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V4MbTOOsg1RncI97wN8+j5RPuiNSeO8y6zrSxtFRHXQOzJLpy8xPmkh3LDLfmrfqu+n4iIUEfcvzBsW8DRTXHHF6dOlxBway+r6NX6sW5vLaMR19Wk+/toZLcYoB3XFeJGd0ilJAlDDvx4UyQCxwMjiqG+VTgHmmWCSzEm3+Sz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oLSL65Uv; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kZ+0ehCm; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8ks02mJ8z9tQt;
	Tue,  5 May 2026 05:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m74OQYKUXFFOiQNF59JcHanEYm/tE0exDQOuRLJjFs=;
	b=oLSL65UvwJ+yvDI2HcguKPfgzmI87OVDfzEA8jQOuoB4goW8mokJenNVxR9kaLPv4r/ojS
	Zta0Fy03u7VT73PyNco+XiXgHaVerZ9IXV/XQphhR6bhyIh3Iw80lclbeEHX9JwNcEX0+O
	zNQUzZtTSYPEbwLdBqCU6XcO5TsAE5eRBysgKx/bPZCMF6ZWrEmSiQuqVk54Hfv16d7CAZ
	8B3RrqH8HsVzYkyx/VYseBG60xzyI2V5fUIL3Hx/sAhlsrOSeY5JRcVrOBK1QwsOxHiECF
	kjy9nFQdnO++xEQj8dkOc5P6mf/L1q0Quj8cbe3kXkICIWB+Cn2GirT4q5jOHw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m74OQYKUXFFOiQNF59JcHanEYm/tE0exDQOuRLJjFs=;
	b=kZ+0ehCmohar/6f72/mQ4nTuQMCL6RXwOYS+F5zZVLeOqCn6B/kEaiZMb+32sux4xZ/pr1
	FDMMYNT59euH6vpzVlFLRLfieptRSwiN7aPLWsIdK8Jv0X7opJ7KQChcxArQxlExCe7Fqo
	cKOrJlCA7S7GFZDHoSk9d3d45Qolbv1N6IdNbtJK0LR0ToIohRj735Uu9zSrGUg/PHrVqT
	YNBmJTz3eJw8h3piH6DM1+/KRkRda3SNG32kPMbqaN/TdccLCx6K3+SSh1Pi7wsTLdY+pj
	NR8b/KBPB2yoBgHNt/N/lMxusbRaiZu9z6PJscd7fb77khCNQ4T+BwaLKe6j4Q==
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
Subject: [PATCH 11/11] arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:52 +0200
Message-ID: <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9b29a8112ffd5352392
X-MBO-RS-META: 4a5qc889kq1kq3ho7iq6urqypgq6wmzu
X-Rspamd-Queue-Id: A3B514C647A
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
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-31996-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	R_DKIM_ALLOW(0.00)[mailbox.org:s=mail20150812];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_SPAM(0.00)[0.776];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]

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
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 792a4aa8f4a9d..274493720b14e 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -213,6 +213,8 @@ avb0_phy: ethernet-phy@0 {
 			reg = <0>;
 			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
 		};
 	};
 };
-- 
2.53.0


