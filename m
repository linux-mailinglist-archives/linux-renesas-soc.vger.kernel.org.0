Return-Path: <linux-renesas-soc+bounces-31970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDDfL2kk+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:57:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E14C4A29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 948DB30091DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1A838C426;
	Mon,  4 May 2026 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AyZ1zB5+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="adU2rUiK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00138D6B8;
	Mon,  4 May 2026 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935448; cv=none; b=CB422uhMclYaX1rt8RSPKK45N901NEnY+Au0XUdh+eotMWWl+bDc6yHI3of15ODEzhbgJrjCmyeAKH7OQa7+0xPcd+2G56QEhbmkIZPev64kC1BDZB34MY0E4NgtCMsTLCrjbEPL2sbllHCKdcM/4A+qbxQxGSe3iGq8DRO17Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935448; c=relaxed/simple;
	bh=RNW+VFRX9rA7IsBBSNNN9ao1MW8FZTvFzAtsfGJrMxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcpWk5uMJY4aaNvW8+8W9NcxlsiySxJBweD28aCwOcwJdnumodM5YZ8w0SqMGRlcBu1iamR7KkI8trphr0ofy6NUeKlz0crJMZEnd9JETkZaNWmdaTuLb/HNkghBRn35raK4ZwIP8NgGbvAcwc7wD4bTCNv2itzKtw5EgquO0Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AyZ1zB5+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=adU2rUiK; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8cVB2MKMz9tyw;
	Tue,  5 May 2026 00:57:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONlp9b1BBI6f716sKEiSIPM1GeGje3EDpZgOtfKwV74=;
	b=AyZ1zB5+bX3joWBG7eQ0CfJDuh5DTnpo/KmahNOGX3BW7+7JVHfE6pHkSvTgfLoBc4iiCx
	UJyqSx1VCD8HB8S4RupBZsQnexBAqiNn2IoFeodDuzsOZtkBBPJpILnMCJA6Qv6wNFMatt
	0po6wc4mPIzvg6Ul7E6/7WHFdZKCylXZlq8LxUdi/8lD2hh6ZLeuIsbhH3iltCcMWv2wP3
	unzps6KQJGBeGhcM3vr1HUB+vZT6JG6cMOU2haEupaTVi4uOxFfRPWxCVhvpOFr+l9doeo
	c+NWEqDjMJs27FC963Vtp10fTh/2FAC+r05vOYXCxB+U5t14a37sWUAp7aMzTw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONlp9b1BBI6f716sKEiSIPM1GeGje3EDpZgOtfKwV74=;
	b=adU2rUiKQpz57mNrgpnoTZG1uhVfxt5StL+ItgOySe/PhZWL0OAVibglQ475NF89DMg13J
	wxC4HR63xgQ9J5lV4Y9wQPH2NiddSrrtANjA4y8QNaSE3wjHncwUQt5gNB4Q32cL1Bu4sR
	UeObThw7SZ8fudDtijYsGfCWm+ImXcSmFROQ6HtnlxBQihsdnf7W6FPmiAan7WgF+G+B9U
	4NWW/g0+qZgZO+W8hS9Fyoco+RG8BcfknA5NHwpXIFU4dmV7gJE+XJ7MIrZP2SivmAp2IT
	MFXWKG5gDtYSskDanETBeYUjrR/o1pGt/KCxgRPealQle2fWCK3eL3uxXUyA9A==
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
Subject: [PATCH 5/5] arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:55 +0200
Message-ID: <20260504225704.115125-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yndyu5wue89wcaj8nqais4ojgwgkk74s
X-MBO-RS-ID: 5077995fc196c0f2ef0
X-Rspamd-Queue-Id: C47E14C4A29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31970-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,0.0.0.10:email,4f:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 67fd6a65db897..ae36a2e66948e 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -221,7 +221,7 @@ ak4613: codec@10 {
 		asahi-kasei,out6-single-end;
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0


