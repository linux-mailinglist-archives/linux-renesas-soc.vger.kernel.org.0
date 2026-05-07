Return-Path: <linux-renesas-soc+bounces-32227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB5kFXZo/GnzPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 016474E6BE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79484302733A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716B53E8C62;
	Thu,  7 May 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PF/YFgVM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA13E8688
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149463; cv=none; b=sGheVXGufS0ErApQFvzP+UxrTW0eCFMzzKkV31FO1fRrvw4CBrmkYMREvCF3bxM0Sb6fUcD+OQ44/pXnLeN5/bkSnTRvQidjDBITyPG4gKBGMAhpv9SU5gL6eLVJXCQzwj7EYFg79n7TyvdxlO/tHwQo0Yz/wisHBHOme1TKUUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149463; c=relaxed/simple;
	bh=xLItpHp5TBBqQSHKt1AyvZMI6BdB7ounnndiLRLnbDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BrCMYwl/3sniu1xgkp8wi6hF5yI/E6v61P0lAxinrtXMbBQIDc7go2fNQVz9ZTK/xmDre5lq6fnydGj2p1FBwFce4Zgkp+duzOE0lWpFSfuo9ZQBXN3979bvtlzZwK/QYkmYgYXCwArRtPRp0hQtzmBIcoqe+XFnc68L7aS/+Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PF/YFgVM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=x204kEcNWD8l+gW3+BddW44FnBixr/W4KRcDG6+368o=; b=PF/YFg
	VMI9zfymicWCDKyvkXcHDgN5qfNSAjUfFChDw4MtwVYY139coRmmjV0GxfiBsDsW
	2hhnb9lsvtsh4d/YMfutjJST+GlP4gEMBkq9aOT9ZHt+weWF/U+WQl3pcUNYG/TH
	Q5+EV+ZMsD2ckA0i/TzVsVcX/4nmLA3m116By8m0fPfOBNEPwywJsX9sTWyp2FDn
	JR65JoqoIP4Xok51fUYNC+kjoUlQVCiYRWHvVRJoy5wfmToMo866ETqft9C39iYP
	DU763HTxb5THWGtretxq4jFnlCoXstGH9s6YbJyMSLHxhaRyBrQ0dk1FTTtxAt3l
	ZVV8RwGVSXej9hzQ==
Received: (qmail 1070506 invoked from network); 7 May 2026 12:24:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 May 2026 12:24:16 +0200
X-UD-Smtp-Session: l3s3148p1@o9CwrjdR1ucujnu4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 4/4] dt-bindings: watchdog: renesas,rzn1-wdt: interrupts are not required
Date: Thu,  7 May 2026 12:24:09 +0200
Message-ID: <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 016474E6BE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32227-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,sang-engineering.com,linux-watchdog.org,roeck-us.net,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email,sang-engineering.com:mid,sang-engineering.com:dkim]
X-Rspamd-Action: no action

It is now understood how the watchdog can do its job without the need of
an interrupt. So, it is not required anymore but optional.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
index 7e3ee533cd56..0e4b5b529e9c 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
@@ -29,7 +29,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - clocks
 
 allOf:
-- 
2.47.3


