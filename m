Return-Path: <linux-renesas-soc+bounces-29367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNyFAR4+tGmKjgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:41:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C4287422
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4A86301136C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE703C9448;
	Fri, 13 Mar 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZGj35T3t";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o218skv+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E353C7E12;
	Fri, 13 Mar 2026 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420046; cv=none; b=bF/sTryxGX5VyAul8MBZURPzdNR3wUlwuRE6hw5FstWAqB0YJ1HdvcGp6UgeGpAk8z7JzB6d3VSSAhDpdxvFaxiJEGecvNdIbuozAyc2N80QOKDsUBf4c1w+ecy+cfaMl4aDUR1+s9SwFkegyPedqfh9f3K9sj2LRAzoU7hOwnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420046; c=relaxed/simple;
	bh=kLeHD/hMTidF06RFoq6PXaZwtIDsQEiP9sIUmDGYIL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8pACJbveXG+SiG82pyCn0WcXQ9vBXZ8RvcsLO+5OgFtig9z9saDaXkY5wj0maDXKaTiNfLwoC8IxRvAWb3j3Z1Gun0hj0ZzIOvVclUvehet25rPJcOi+yEv9EZxEtoBiQOjcC08/Owdgm70IgjtbdyS3RmA8ZI0KzZtxq65JaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZGj35T3t; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o218skv+; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fXVbR6WXxz9vC0;
	Fri, 13 Mar 2026 17:40:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmfDud7/vj53ZDYfVvEyX3xy5JPfLlI3+SZjlGxlJLk=;
	b=ZGj35T3tusMVvrO6yQWyfepb2e9Hm/oaOWt8/hvNNQSjB2ZKk9RTV9hiN8BJYkUI1ZE542
	xeJs/keY6e4NKNNW417gDBmOmfh2WdiI1H1G+x3qkO4cq6gmR4OWhsEhH7zoa0t12lGkj4
	AdyHb8y7PG3b6pap6MBqwnFpmJWdhbzARi+2UWLfonXQT0agXbmoAeyziXj4zalyzpjG2G
	gxKjbHd+eWBaqzrWWWjoNOqPas+jRo4X/QmPkQr3VSbhxRB3pDYgek5A7WQAbxJmrBsq1z
	IuXD99MF8mgjm8MW81J6K9o5R0FemDs47NaYKJFyC5+Ty/luGrIIT1kdzWGJbg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=o218skv+;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmfDud7/vj53ZDYfVvEyX3xy5JPfLlI3+SZjlGxlJLk=;
	b=o218skv+0Qm+US9vfFfa7gbYvOVg83V6U96J6ZxyTPs50Apw9bPb3wGh8SdtKgtqVEitwf
	y/WF9UYOqvBTF9uVLoTaOabrzYbZ123MIw4RLXDnQHFF9sCm3TPjB37S1W4J8tV8NZw/bw
	jCQ5uebtY/JN5b1sVV4RO4d/yEXl13aPNNfalEhJ/mjaK1ZzDWg+c6uxdYHolv7JUDU4QZ
	pPaXBWQT/UbYuUF2D9HHez4l57MP0M2N5SzIwdbiEemk4d725txrQoHAUJwXu8LY/HORPJ
	4OsX9ULBOVRFbua95R5uGXuMu6yBsr5MeEL/Xr0Rpee1r72S1zlRcBs0PBzQaA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec property
Date: Fri, 13 Mar 2026 17:39:06 +0100
Message-ID: <20260313164008.40933-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2c656e22b26b43c5092
X-MBO-RS-META: a36cx7pc3wbwhupfwt86kx9gr1emr6pg
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[mailbox.org,bp.renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29367-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.7:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,glider.be:email,renesas.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: CD6C4287422
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The KSZ9131 schema does not document "txdv-skew-psec" property, neither
does the kernel driver support this property. It does however document
and support "txen-skew-psec" property. Fix what is likely a copy-paste
error from the matching "rxdv-skew-psec" property, use "txen-skew-psec"
property instead of "txdv-skew-psec" property.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++--
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index dd5e4b13f0f86..00e5455ea5abf 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -265,7 +265,7 @@ phy0: ethernet-phy@0 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
@@ -284,7 +284,7 @@ phy1: ethernet-phy@1 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 8ae7b6e3d712e..4643c61cf06a7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -286,7 +286,7 @@ phy0: ethernet-phy@0 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
@@ -305,7 +305,7 @@ phy1: ethernet-phy@1 {
 		rxc-skew-psec = <0>;
 		txc-skew-psec = <0>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index cb5066443722c..880bd3fc9da18 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -142,7 +142,7 @@ phy0: ethernet-phy@7 {
 		rxc-skew-psec = <1400>;
 		txc-skew-psec = <1400>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
@@ -162,7 +162,7 @@ phy1: ethernet-phy@7 {
 		rxc-skew-psec = <1400>;
 		txc-skew-psec = <1400>;
 		rxdv-skew-psec = <0>;
-		txdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
 		rxd0-skew-psec = <0>;
 		rxd1-skew-psec = <0>;
 		rxd2-skew-psec = <0>;
-- 
2.51.0


