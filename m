Return-Path: <linux-renesas-soc+bounces-35031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xtqQKVLJUGpf5AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:28:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266A739B0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=AAfHbqfT;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Pm10hKbV;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D0B83082BDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14C040759B;
	Fri, 10 Jul 2026 10:23:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709984071F5;
	Fri, 10 Jul 2026 10:23:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679018; cv=none; b=OyqCVLkAPAqsMCg/7gciAq58TL3kG7d10ckntxXVDRf0J5KOjesS4ZiuLcXRGy4YBpVdpTviUqWXXDoK5shhFxS0MMI/n9A41w2fB/eR+2sWOoG6h0JbtDb9qU30PgZAwCu1fPgiR1AclTMAIF0yhxMiG/xwpjJ4Hl/H67iEDrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679018; c=relaxed/simple;
	bh=RAKTEeSeoLlrKHDBTc7eBUZQFZK/4GACdcbJhsXeJfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baKVX4SuWNchOVNHBoJCUlD6yWyF0EnQtcnijANJmxwkBlnBjAcwsp17i868TmaH/Sws/4veqzLJRLAZQQbPl7WbjvzRoXKAYqWhg3WXeoISPE6nKCs/X2b9JEKH87wQwxS1COX4/rSUAUmoUmTyy5yAmxTZm60CQCshCRHfJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AAfHbqfT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Pm10hKbV; arc=none smtp.client-ip=80.241.56.152
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gxSbN4YDrzKvvq;
	Fri, 10 Jul 2026 12:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783679008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IE88QkjLby3ju5RANsjgYMee3nrOo4fYiqaFhPyeHpY=;
	b=AAfHbqfThkPL4tBU9AE1v4dA7cCWLKCR4P8IOdm8qbVkUqhBsq5xG3msrOC5Hr1cImHwPZ
	lIpcvPM79UYhoaW3XFCEJ10twj59mzMsJtjss9Yui/kHg19Si/TVbM/2eExugzpd0mIUcK
	38YHY0UFPzsOpYxzR4kJjpzMf4Jxd9rkGp03RLV0ia4E2GeEGMxWatXyE5pH0v8pMj3f90
	Mg/NP9Z+mxyaUkoFfcS2Sn8l2rkX78ZxJjSz9YxPUamOu12VrQjAS6QBoXX6hAN2JzoL4i
	TyNgpeiki3T7fbwgEvjuh4xvGtjyuE2dHCf+frVGlI3zfWbLc2YceJRKx6rrLA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783679007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IE88QkjLby3ju5RANsjgYMee3nrOo4fYiqaFhPyeHpY=;
	b=Pm10hKbVAKtYgQ6WeIzozwuhHbDVUlowk+Y09dNQJpvTrIg0nGTAGtHzgsnBYOG//s+VBN
	JQ1+KIoHGUntfTVDwKHChCRZ2fqMyE7fIE+lSj55g8g0H0Svdrdg6j0kqcLzB/+xK1bp2j
	zxOUBp8lZm9Ljgb1hUPTtadRtkwSi/1l5z3A7bIjDeHHDOG7qAJ0xswbfvoqdmvnraBoHh
	o8UVB5tO3AUsawZzVl2pHcjvgImxwrbac0aTHtETGns1M4XjNmesOGfJieXX047K0I6vUH
	/87alyURHtOFvW/C+W4sifXNLd1Pi7am3WEqivkVLacBzwEJWn91wChRdEVjZQ==
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: clock: fix bracket
Date: Fri, 10 Jul 2026 12:21:33 +0200
Message-ID: <20260710102132.433276-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8e4a3f9aa7bd5e8cac1
X-MBO-RS-META: 78r3bbajkkmqs1r8sf1pu53udmw4bqro
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35031-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:manuelebner@mailbox.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6266A739B0C

Add ')' and fix sentence structure.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
[v2]
 fix subject
 add reviewed-by
 .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index c84f29f1810f..a14be249fa33 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -13,8 +13,8 @@ description: |
   If you connect an external clock to the USB_EXTAL pin only, you should set
   the clock rate to "usb_extal" node only.
   If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
-  is not needed because this is default setting. (Of course, you can set the
-  clock rates to both "usb_extal" and "usb_xtal" nodes.
+  is not needed because this is default setting (Of course, you can set the
+  clock rates to both "usb_extal" and "usb_xtal" nodes).
 
   Case 1: An external clock connects to R-Car SoC
     +----------+   +--- R-Car ---------------------+
-- 
2.54.0


