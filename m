Return-Path: <linux-renesas-soc+bounces-31988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNQUBKVn+Wmt8QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:44:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742C4C6394
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 05:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E672830347F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 03:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022A03AE709;
	Tue,  5 May 2026 03:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pdKLqa1B";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ihiVPS/4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AA3ACA64;
	Tue,  5 May 2026 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952630; cv=none; b=imgwyUkjPVqy3qG589JwB+tlviNMkwejKJHa+q0sn1/HQgAPpvG/jOFSXsxJ9CIHOwkQHXVRomqQHHl8jYn5NPvFRML7wXIeEWDI6D8d8pEppNQL/HRiKSxL8NtWll+8l128dRwkRBufy8lFtR4dvkA/McbM1GEUbMcWNHkhLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952630; c=relaxed/simple;
	bh=amBzM9tIDb4UBgu2Loqpx9ATbyvUpoSGtf9tTDjlZ/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5gk14k6KrydZT2ILzhyZtmRNgAl81Gu97cXQ6WYKxCBbubsHcf1sIcKoA976+50pl+Ag45fRhAVI8obLfsMDzR2tAscP+6KWetWisogxe2N8xmlgRwA6bv2AqYpadYlmCfEZ8vBFij0IqkaGcglFU9K0cUIP7uv8iN0Rv/128g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pdKLqa1B; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ihiVPS/4; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krg5nNWz9tyS;
	Tue,  5 May 2026 05:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7eGS7acqaq5G9UabRfzoCWYPA+96J2RcOeuG2tL95Q=;
	b=pdKLqa1BMSMqrlKWMfOKOdKpET+Th2cBX1dJlWMBcDCId42vTCZ+p44vWQTFTKOdnOF7gO
	+dBjmK3hfi6OgaH2rksAPaz1YLrVWayHs+t8Cc1RD9x1TF+FilO4f/AWQioKzSwe3E3dGa
	ACgzWwUDctZpe5LlRw9mc/rdRVovjGxHeFcJpAvlzwi1RzUff1aG7DHxWwVQIiia0DXvSM
	WL7zkUe3ZHBsLiF2YS8RQqsdY3BK+y3NUNZbZ4bNdCGT56eps7vlhzEfwxEBrjhJ4yAqQu
	yezznyZxfk+o1JWpSKVcPCF1XaxrK6qnU3CTFR591cxiqqUnKAoXXZj7CWL2ag==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7eGS7acqaq5G9UabRfzoCWYPA+96J2RcOeuG2tL95Q=;
	b=ihiVPS/4CB2nMHNXqDncqBCmavaszfBh10lVs88Au3ZbwAFeAr4Nde6BWdIlOknIB6LlVw
	WAyiW7m9s+UJBvGw/ElaTa2x8kDlpLeVOFh6gonpLplrPjOFwfCk2m4qyfUEOpIbK+i0Qk
	0+/jsLtlvC+tlVsv/+Be5Jzu4m52SoWzAdgrEO3b44bR0v5dvMKaFKFVFAU5yg69TbBFba
	ooJnAVlbX69NEnusGh7cgG6ejhW0QQc/9N23N5oxvRP5PSCwvYeghxv5aKZBoMB18nG7pC
	yci0L0FdvI0wI6msyNGIHTqAf9WNrAEoycSnNLsnj44mwrh+WZxKw7wuv+BUxQ==
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
Subject: [PATCH 04/11] arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:45 +0200
Message-ID: <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: m9sth1a446zs81zeui3ukwxzmidoanou
X-MBO-RS-ID: 7950ed4548224329d87
X-Rspamd-Queue-Id: 7742C4C6394
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
	TAGGED_FROM(0.00)[bounces-31988-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mailbox.org:s=mail20150812];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.774];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,glider.be:email,microchip.com:url,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 343f9610f8924..10c9a2e9ed18d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -119,6 +119,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


