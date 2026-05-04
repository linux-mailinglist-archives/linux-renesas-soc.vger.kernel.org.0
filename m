Return-Path: <linux-renesas-soc+bounces-31963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCK1L0sk+Wmz5wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:57:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4D4C49FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 00:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92850301E955
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 22:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1507738B7D1;
	Mon,  4 May 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="H9hQAFCg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Zct78XmZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6324E377543;
	Mon,  4 May 2026 22:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935278; cv=none; b=JoHgnzKYlCUhgb4VSB9YShASngtzqPmXPeZgSVj2wTjDVweVj1pKFF99cWcL1noC9adYr1zjJhwOaIPzrhRDuKttg3bMEu7Lenl76sKNsezhWa5L/NsSQrdRWBDq/JqhpWURYOxA5ECHsk+2JaHVXK/ds5m8rng39m02bPM/k0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935278; c=relaxed/simple;
	bh=TFizqkprizVZ/JVROJeHuo63cZ+5/xDfNZmDvJ9Ml6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMgpsnlJfkRoT6v/tZiNoL5E2y/lVVxpz5zU8+rehQLdXNxDxTgXHcQnmdx2vZYCpZiOMUmTbtBwz0dON8tGFHY/bZihrcCWWsw/9xc7sdEetPaYf9LyZAbizzRmdd8U4Xm8rvSzOu8s6KYqhNoajekttNHmlMr8tCD/UGf//IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=H9hQAFCg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Zct78XmZ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8cQy53D5z9smc;
	Tue,  5 May 2026 00:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CoJTTc4LifgVvH1iZUJDue9e9zSt7Dnw1uU0HFW4Jnw=;
	b=H9hQAFCgFDBHWoHMU9Di6/x+AmBsnCUGRoJKEaxEIlXEDKLNDJxCmbCqMsdWZluujmIkWa
	6aOFqjzQky9wSjowdkIKBSGMI3MyeaEVUwRWT6x8t9iNfLYxoTlIn8ANBH/Gme3iah2nTg
	JIB2iHwOaBIcw3bm/bIoXEkOzbrqnSTgtNXft5hATCrfP2rgF+AUETJhyNR8ZqQOAhzV+8
	gycB+1q+1dnNC2nvt9V9FPvCDWy8jK4qFCDDAor5PhjDR7NiEx7n6n3yG9OrLlUJYm5QgJ
	92NSCFp7LASEJmwjGLgtdHUb5iRR9fvV9Ro0UQ3Rgh+Z7BFbMESiPoVzU3Ye3g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CoJTTc4LifgVvH1iZUJDue9e9zSt7Dnw1uU0HFW4Jnw=;
	b=Zct78XmZHHRIeg+une4mXPEyiOtapbEQaJpMR9ZLypoHtiFZgmMPtNd9TbeD+Mh/YqPh09
	N+8cUptxTBUbRwM4bzDj0nNQ7Wf0BcAwle72YlgOcj9MTp+B+BiDvv4XmlAx9jJfzA1QXj
	PWUstiBRFy4AwNKsJTb7tFJEYy+/gUZOXm77NNl5LJWMOclFDe8FZaHdmnIeMNycyMEIEd
	f6yRZlMd6+OPN9L0BgIu+jrVWRroL8Cu4ESuIrlPPTdSw0zajRq4j+Yu5YoyKu++IHyzb8
	dwScRUMKm1ZIKoiNjaIVa5eCxX2scCxMYIXsiMKt9aAMV2gMlMDWRAPCjCxf6A==
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
Subject: [PATCH] arm64: dts: renesas: gray-hawk: Fix AVB0 PHY node alignment
Date: Tue,  5 May 2026 00:54:11 +0200
Message-ID: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e0f6812975bef9ca280
X-MBO-RS-META: 84iub63huudmao9odd5n1z1htpgr7cpb
X-Rspamd-Queue-Id: 25F4D4C49FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31963-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mailbox.org:s=mail20150812];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DMARC_POLICY_ALLOW(0.00)[mailbox.org,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_SPAM(0.00)[0.557];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,0.0.0.0:email]

Trivially fix PHY node alignment. No functional change.

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
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 2edb5cb3407b4..792a4aa8f4a9d 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -208,11 +208,11 @@ mdio {
 
 		avb0_phy: ethernet-phy@0 {
 			compatible = "ethernet-phy-id0022.1622",
-				"ethernet-phy-ieee802.3-c22";
-				rxc-skew-ps = <1500>;
-				reg = <0>;
-				interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
-				reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+				     "ethernet-phy-ieee802.3-c22";
+			rxc-skew-ps = <1500>;
+			reg = <0>;
+			interrupts-extended = <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.53.0


