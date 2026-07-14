Return-Path: <linux-renesas-soc+bounces-35191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xDbpNyg1VmrG1QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:10:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7268A754E1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hV1xh2eE;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CSkuSS+i;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0397F30DB46A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E2D44CAE0;
	Tue, 14 Jul 2026 13:04:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00CC38CFFE;
	Tue, 14 Jul 2026 13:04:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034282; cv=none; b=OqmAfOF4kgCdqUtNsZNZb7oSiiVfq2e3RbnsnhnZ3aJN8ij8UMeqkXlRDy2SfoSQ0y6GCkRYgtnGUegWSdCuLOaJYmLVV4pdvef+Vrsb2RI185VvVynAOjmdTBdYlu9Qg+q76YL03scpNxop37nANULf8UZ56+8Ju8OEXrxJXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034282; c=relaxed/simple;
	bh=NH0p7UDYB2M1usWjhixieXfSety1mIYtsOvAThFJ6c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJ56Ii6T4pjKgAtMeiPfNBvCny3arLP6qDJi47/hyoeMCO3qiTB5Qr9XH/tC5N6ctBrB6DlnRq7+np/5ffhDxuerI2qrU2aV7HRi3g5cO4gbKkL0wb5OxBP/B0My7+9wnGn3qGJ1krut7bZTu8EYCfWgKeGdVs0BNowbDoxn7Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hV1xh2eE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CSkuSS+i; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gzzzV42BXzMlTh;
	Tue, 14 Jul 2026 15:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EVne6v+WJjnFyalBsEVSGk40M4U34bdUdr0DOqywwyA=;
	b=hV1xh2eExXPMdD1GyvniGTVFfkCdC57CsExIhFdEpRvthIXWFElOlL5Jh3oFntolcLSMPr
	75zVC8K5h3fNRT64VTv1OVZHW3cAlmUDyZ4fdHFPbKmdofZ8hJS5C7xmN4phk6CZBUT7ix
	hgy6ni3mNYDmUA0zEQ86neYHFwHbnirKZB/VtO0GsL2qZzBATZbbjadNZl/XHTF7K4n3OB
	JCvFpoie92Ck+TYeCNFNgEur9g1yAM4/wKb03sW1YQMaeM0ZStVLnj48VO2HVaCyhBc4VV
	DYj48Jaxkb6+yfLOd34+kNZtvfDwVQqPKhpqzqP4kbty5V81UyIDvUyVvMQOmg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EVne6v+WJjnFyalBsEVSGk40M4U34bdUdr0DOqywwyA=;
	b=CSkuSS+i+EMPxhLKfXXAKM6WEyHZu47cBkuAhtCeM3wbfgty8EeFL6ljLwGOioScSL7BQn
	wxrXc0p1AcGwRW360/noYHCWfnBz0l1buS7mzyEBUUbYhj7Xye1uzL8Quw2iBcXbyRX2mv
	QFcnv28Qik8hwUTXO+RWivPXQjbn8IrKAR0gVawVoYf0fUh94gtsyHH6RNXWmUuikM77TD
	2a6Ji+8uO102zsl0+AHln/YKZpwuTbBzl4mzwF7Ui2LrtDX/jfr0lZpIiVo6TuzUYJqDiN
	zQeqDepS17zC3sWpZhbnDElsnptY9n72etCuiSKru3Fe79hvS+DQnH6uYZZVfw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/9] arm: dts: renesas: lager: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:54 +0200
Message-ID: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 93110a46b0bd6b25939
X-MBO-RS-META: 7ernc3k9ijyha7d51sjx173qk6mfk9e4
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
	TAGGED_FROM(0.00)[bounces-35191-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:mid,mailbox.org:email,mailbox.org:dkim,vger.kernel.org:from_smtp,microchip.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7268A754E1F

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
 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8e76655016755..86548859e803d 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -687,12 +687,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 0 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio5 31 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0


