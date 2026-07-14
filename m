Return-Path: <linux-renesas-soc+bounces-35189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3jeDhQ1VmrD1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:09:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78B754E0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="MZxc/I/q";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FGCVV2uO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E3930CB3E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03F047276D;
	Tue, 14 Jul 2026 13:03:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3BC466B4C;
	Tue, 14 Jul 2026 13:03:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034231; cv=none; b=DaJgo2uQeOharRe5mI4GAp5Nin0U+zSmMFX+NuzrVvwOc7lQzmh4MEgkyKIbZFzQn4YUycNyewhpl5GMgEwBAwK9o1Q65nTONIQ2Chkt15LoVeZ08bJQtGjSp0EVnib7AUw5Pl6Zv6VTvb0A8GYAKS6bD3xVgEsUII3tl4QrsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034231; c=relaxed/simple;
	bh=r7/DFFOiBZZ6Q3DeSuI8G+Veljz9pPAyCisILMx3k6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnNTRYfPG/1Hvfb1F9zpr6AlWq7gzVWTy36DHM0xlQQBoqXFgZcckV1OJb5AWl4HjXbUErO+x8gS+sWTt2BZudDNSDJGURbSIDzKgf/gRbdaic/Ai4xFrmKy5CT+RS+mzNqGsvSGDel7TlRnVfoO6Zo8fDrt2OnsHyZzNPbwBQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MZxc/I/q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FGCVV2uO; arc=none smtp.client-ip=80.241.56.171
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gzzyL4By7zMlG1;
	Tue, 14 Jul 2026 15:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eg2J22pv0EeOUfxPi9LM1hfuqMseecX+7PDPMI1icGM=;
	b=MZxc/I/q6RkWmunmFE2cVidS53qzIS32iszUHWGuSBi7TaGlGanbU88UqzGj0qTjxAuKlM
	kB6DuFJHZiou3G/erRT1JO5BzrMjbPnr7ycCeSvfUB0h/GrINSki1VX8ZCLmPBpgUj9ssF
	rEPoV36YtsEBSbQAQQqYLcueql45gjTKtBv80Y6+ijJuCFDns0RzT97YdF2VTMiYvG2xC9
	MKWax2hbU+V18+sAtAUF0nY6GxVNSDymxVrJzK/qWtllEcM132A0OYa1E4aO0T+2F1fkWy
	kDJvK7IXmjsc9DvyC9+JyoLnmZaTryDn1N8ncsz+yCEmfLid6paA1rql2qw6jQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eg2J22pv0EeOUfxPi9LM1hfuqMseecX+7PDPMI1icGM=;
	b=FGCVV2uOKO9+4IEYjxdVIDOqbyVsUbTb0wdkS2RYrz73606aw2tvTmdSRvQuanYemn78Sb
	SGsA2X4NimVcabcS85+LjKq8nUgtL+u+4AQ5vUkO0EtjITy6hft2BUyT4d2XVxWOE3FAgB
	lwMOIq0MwpkW76wbTDUvNU2J4+8nihgGeShKKB/40tJ4DgC+GmCo23jzcSGsYERD7OXFT9
	wY8Pb9C6we5IQPRwE8EHS8mknKJS06yJGTYgCAr0OFi39CdNbU8krf0n8KlNgKops+W+UW
	ISeNDRjEnhKHW3TG6UEOJ4tn2hvbnvTQmm58+zH051Gc4cYR1JuKq5g2pJBoSw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:01 +0200
Message-ID: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 07c814e049ccf7dfdf7
X-MBO-RS-META: uzejgmi3ro9qn95mmhsacqxn1fyed6im
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35189-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,microchip.com:url,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C78B754E0D

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
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
index 23ddec2176857..2477db9e5aaca 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts
@@ -128,8 +128,10 @@ phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.c0f0",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 
 		reset-gpios = <&port4 2 GPIO_ACTIVE_LOW>;
 		reset-delay-us = <5>;
+		reset-assert-us = <25000>;
+		reset-deassert-us = <300>;
 	};
 };
-- 
2.53.0


