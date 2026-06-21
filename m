Return-Path: <linux-renesas-soc+bounces-34262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1OJKJptRN2oDMgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:51:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350A6AA06E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 04:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TEpLUK3n;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=AXeibP7d;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C08AD300AEFA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2026 02:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28C31A6805;
	Sun, 21 Jun 2026 02:51:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976411CA9;
	Sun, 21 Jun 2026 02:51:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010263; cv=none; b=JBnlF2XOsFTqwi1vaoYvN8IJSrmAq2H8tD72fi7V6Dz00H5a/GIUEk09Yq1ooimPbdjRoxsQ5YTDj5tBiFA2GqUTOioJyOu6hIiiWqeaEPIRc626/2y4lT7Kw+G0aDdRLD3cPJLosp1DhahLiJLwUhTpoizr+Wf1PQgVKQWRPNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010263; c=relaxed/simple;
	bh=I+rRvQ9DvPg4MepXgTXUoaYKsK8CS0g+Ro7TSTvZtLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r779U+dIZrGiAmmrh8j0q1adeOqx72FkjFFzlw5yUIAUyHmYckvPd925ceoMsWu33ue/VMuDORjmsXOa0gbWBwXEAcfHOqJMt6+fprmvPSTezhHhwIm9f8EL6w6IGMc6DO2A+dGptjz/h/qV0WJwVoyfGUhbEb8eYYHF8k6xeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TEpLUK3n; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AXeibP7d; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbS325vsz9tQr;
	Sun, 21 Jun 2026 04:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kSewyVdrq5Z8GYr/rDJoeSXs5aNZIEnD4cWp+G2/tF8=;
	b=TEpLUK3nfD/QD9EAX4MjZabWcP3GEACdRIm5f9F8DiaxtfAYQBIb0ILayNGLBmto/9CPQq
	eckqhADRhAkqB67MWbZPnNFL5uNC4+GHm3Y+CYXPhKb9LI2olUXeeOubyWFzDRiW6mPnSb
	uOG9i/YUha/oW8XShNIbzyLsGYmyeEA9ZpbsEaVEbaJaqD0FByLPFyaXw2SU3yDYIC4Xds
	qj1/pRE81hnobdpfRnUOUkRdClZBa0WIwSJZcWbiiIxZm5HgGBWPxRLfzNWbiy33o5ES4P
	Lvni1hL7rujd+RvWf7BhFx5N/dnmv2cwkFqaY8FbaYKE/zm4DwPIYx5E/QfrSw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kSewyVdrq5Z8GYr/rDJoeSXs5aNZIEnD4cWp+G2/tF8=;
	b=AXeibP7dFiyq6WkCd9SOkrtu1OgQFBteCICEsSfJz+00zDHmFdjgBraPKW6x0N007M/DKx
	JNeWNiSFQXwF1sj0EM9TIeTJFOM027PrDu84iHdsN/7gFm6ghrFti8nQkhRhf5GBdBNU9R
	NfFxLK8XNq297WFLR4oYxyZ+2xXFNETPe4424yF24y1U3TgELXe83pyiThop5FpgzWnymm
	fURnb5kyoBtRYzzNDoM/lzIPMyPeBUZ/6SwXUTPQOLwxyiPOB7jBrjjtjWqTEVkKSSoqXx
	cGTdsomu6RjsZPVpJ3N45SNcPGV10F5sadtoZ/hxK5TsFIvU/uXjUSVOYyXrwQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:21 +0200
Message-ID: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a9cff52d3331e015f21
X-MBO-RS-META: gkbhokzjgongtik374dd5xwnmpyrmonp
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34262-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0350A6AA06E

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

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
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 36675f5bcdeaf..e66d86db6e6c4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -262,7 +262,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


