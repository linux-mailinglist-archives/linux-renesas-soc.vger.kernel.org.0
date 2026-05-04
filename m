Return-Path: <linux-renesas-soc+bounces-31965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kt3AZMk+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:58:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762C4C4A42
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3FC83038F7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A292138B14E;
	Mon,  4 May 2026 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wTzBxyL1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GoSkeMm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231A238B7D1;
	Mon,  4 May 2026 22:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935334; cv=none; b=PM3aVdvehrbJqOgXg/UktyG9rEF0co/gTZMFyM+Whz/skzxWYQywr4tcZWcDskTsqamcRqH5wvxbxbWtHhRCcLe0fZ6iy7fSbOCGDVXwCLhA+WZ9DmvksdqBcmJVw6oD+7X1DGuu7/9GuN33jMscS8aW8Me/baP4yhFxmZh2v7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935334; c=relaxed/simple;
	bh=onQPRPPcsr17KhNS/IYz0iKMq9UCFaOTAXyew1Da4Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSXVe1CDH87bZi6rWKw8ZPxOIgQMGB5mTu1UoMve85uue2XoXZRXoXmULow47GJFEDHhIuandTbcRDB0iFOiMupeerqCAHD09VnxtTue+/HJtmtwFH5t83t/BPmCrxfSkK7CxWFCkwjomdpDS0xK81BbuDmAdsoc30Dmn2Gwkzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wTzBxyL1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GoSkeMm2; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8cS2742Jz9srB;
	Tue,  5 May 2026 00:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9eV2D3TS7gKH+wZUMRrIiQzv2fQ9qi/JsMp4cHZiF8=;
	b=wTzBxyL1yJCkJPTOjiUTIFlEfa6+afpwGxjzHivw2MZXsmy8rr20XpdQjJWc1P7hNS+9oK
	7fCe/S5nJgB3nbSrziU0YcD22lH3z0UIZz1kp8vruIS3a+6iUJha+dBGXyci4QpNTD4IIx
	jxcdjyURK3IWk1eoqNA2xhGS2akJ3at75mTfbtf1Oq+0ZXwU0sqFq5tCZ6QHLxSM7aVdSW
	43fBxzBeQL7+RDq0nKaxJHgA9kjNf3IjM/Oq/yulSKk1lpvV0XLKNfA3bneuzMJv9erW6z
	B/Aobl6QtlcwC3rI8rUMWokwsEhVf415OT5g9gZVL6HExM5Xax49Ftc33Z57pg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9eV2D3TS7gKH+wZUMRrIiQzv2fQ9qi/JsMp4cHZiF8=;
	b=GoSkeMm2hoQQ10LB6KEGtCDKnxk/D2yQtbD/J+O9IsJezeyEHtSA3K13cUiqwerYbiZCZK
	hnNjdW9fR2LA2ERMUUR/Z6iKwNrI3XU2w6rEuAHHRR2IeGDN5xjmze9SEWr7ZdzhfHwTrk
	tGD4kImiMvFbN1pXlRXHhSkCYML4rZiBsA/eRm8jd4rjlffvIasuvipEHnjcLTiOsqHkjH
	7Km55M2JTfE79EJuTxMtXgCv2VbgTuLwiIinj/j+F3u0AXDuExGMpfUccbw6IrUzhrRHnW
	eRegjYIWsqGm1269ZSTAo/9fqWz5DtqK7YFdjG9p+uRfBPt7SOQquz6uTm5UOw==
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
Subject: [PATCH 2/2] arm64: dts: renesas: salvator-common: Sort sound node
Date: Tue,  5 May 2026 00:54:43 +0200
Message-ID: <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: o7kfb6w1ysnwmkt1m3sicx3punoa5myn
X-MBO-RS-ID: e175057cfe656f826ea
X-Rspamd-Queue-Id: 7762C4C4A42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31965-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Sort /sound {} node in the correct order alphabetically.
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
 .../boot/dts/renesas/salvator-common.dtsi     | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e505161caa675..0b29bf9564eb1 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -211,19 +211,6 @@ reg_12v: regulator-12v {
 		regulator-always-on;
 	};
 
-	sound_card: sound {
-		compatible = "audio-graph-card";
-
-		label = "rcar-sound";
-
-		dais = <&rsnd_port0	/* ak4613 */
-			&rsnd_port1	/* HDMI0  */
-#ifdef SOC_HAS_HDMI1
-			&rsnd_port2	/* HDMI1  */
-#endif
-			>;
-	};
-
 	vbus0_usb2: regulator-vbus0-usb2 {
 		compatible = "regulator-fixed";
 
@@ -281,6 +268,19 @@ vccq_sdhi3: regulator-vccq-sdhi3 {
 		states = <3300000 1>, <1800000 0>;
 	};
 
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "rcar-sound";
+
+		dais = <&rsnd_port0	/* ak4613 */
+			&rsnd_port1	/* HDMI0  */
+#ifdef SOC_HAS_HDMI1
+			&rsnd_port2	/* HDMI1  */
+#endif
+			>;
+	};
+
 	vga {
 		compatible = "vga-connector";
 
-- 
2.53.0


