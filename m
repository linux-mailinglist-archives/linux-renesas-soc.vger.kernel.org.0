Return-Path: <linux-renesas-soc+bounces-31968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLA9L+kk+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:59:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D044C4AAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67FDD304C045
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4744538CFEF;
	Mon,  4 May 2026 22:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h2hxO2DK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="txQ2/3g/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745EC38CFFA;
	Mon,  4 May 2026 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935441; cv=none; b=NVNHUYvouwndl6D1LmYolyNYmVoUMFxMzuhKfRKb97yp103emR7graNBoiePHVHVvLKFflS9QqQgNM3RNdMvciDb0+ZIvWJwzSR7U0pl4NHcRkZA4HuTexJwZDZMgYu79M6tVd8n6N6kv3NYuIfgXDnlJ9NWKsqplh7lM23PtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935441; c=relaxed/simple;
	bh=5O7bYFVwiv0QUcBpnXzIkPUWzb0B9/T1D5OOP1jBC6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWp0PPlYzniP9BHKfrNFZi2N901ACql2e29Gx42KqlmgHgo781hv5EUgoOfcUfiYpwUII3wLuJB5WJs34u8Q7KRyfBSV2cD8jIs8slBMT+2XNCVZkggFOXNytSuMSpaX9iqIsCnhrx7iI/o8o68iStOxMNprBWY1TvPmrsZa15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h2hxO2DK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=txQ2/3g/; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8cV55rLvz9tsm;
	Tue,  5 May 2026 00:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/H0+X+c437l0EYCtxYEpfFo28iZfiYo11e2Ws+OVLY=;
	b=h2hxO2DKaqIaR0ZuNR1+z2X0rShshWYzZMpA3nv2U4j+DcujuNBB/XIQ9ITP3NjLxHeVlW
	oWR3OTr117TZ9tMuIbWR61kt7ufIfFK7xVpEOPH8mAi2SnUv9vXhcv3/ugw6T2mBvS4T39
	uCFhsRTDrlsrg4iMYvXlEzShvLrurbxCiH0vpCJKB7QuTs0IBAIyzLZ1VkPutkaQaJrgGy
	tL87AX0L6kI1Cg0phDSja3X78ZCmfEczw7IGc2VxHhv3EBkzL5QkmszZ/xccwxHHgg3j7p
	5nzRG40ED9wLr9T0DwUhy2OU9pc06q9jBkVP+hVqFF4FV9A1TrSZHyEAgqq2NQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="txQ2/3g/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/H0+X+c437l0EYCtxYEpfFo28iZfiYo11e2Ws+OVLY=;
	b=txQ2/3g/HzqCuVuW+NlgDOmb/3/5LIkc+7ucVcc8z+h7DPLcD8DsBn9uZaVSLW2YGXveEb
	7SmHhzdN+qRHAQgk5WOCQh57QyiByUozfa9nsf51xBpar6iPBAEyvlGyA/QQaf+91M7WsD
	ZJnEuzNkp406bwO+xrU8JGsM9arI3xJb6aouPMzpfZuAFugsThleynLKb8zU5em06eS/3O
	g7i89BPdBdoHQzcltW1QRWz9/2sLSYuz81j7UltX2XrvyyaGU+85lEYtGvrJDfavBM/3w1
	6jhjBz22GQsBf3nBIuUpNmMgRX5zq/88PG2+hCNYadRny0B6wHvGig6AuarbPw==
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
Subject: [PATCH 3/5] arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:53 +0200
Message-ID: <20260504225704.115125-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7e4553e5af6d4220dad
X-MBO-RS-META: 8g54wgunnw41hpuj9nngnapgkuu96qzz
X-Rspamd-Queue-Id: 24D044C4AAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31968-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,4f:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]

Use standard clock-controller node name for the CS2000-CP.
No functional change.

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
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 8bfc66b8ef865..acce3c0452f4a 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -50,7 +50,7 @@ &i2c2 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


