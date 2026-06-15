Return-Path: <linux-renesas-soc+bounces-34037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F2jaK2EfMGoMOQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:50:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC2687E5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:50:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oya6tk5W;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BBE530DBE0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2410540758D;
	Mon, 15 Jun 2026 15:48:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935A3404BC8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538502; cv=none; b=FKRPpgRch2gMpKpLgBkmocysdgu+XQ3ghpv6LulcL+L/ezKd/1InnFjDOlfSdAhgoEccGRvmufMjmvklRWPKpgZ87XkqYORXi24AvxHDRXsra/1+Q2GDe7hQm6JpLgyUqkTcxb1MB9XQxNTnwS/xUz1YiiDWVGABatqhmYEXWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538502; c=relaxed/simple;
	bh=i0epigYQSf6nodYrIVmZxJadmqWcGELiZNYUZq0FVfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/MCWhXDtN9E776Xbz2RflYcQTY1EOQDliUozFb6QFgIedhKT9T96F8Xs0HlWb1/XOqIWoXpZzGd3UJqJg8BjdyAmGXusQjORk9AIHVvxN6u8kpF/ZsjYtlbunuebJ4V52p1J7Hp9DMPtc3d+xtum0cC+ZafaHRaSJ0azLQGJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oya6tk5W; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so26901235e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538499; x=1782143299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6TqdYR7EjMTpHsjbl3Oaxm9i/7wwH40MmAvo6XkU6A=;
        b=oya6tk5WPsFdMxBAzLZxTqF5CNPi25TxzEVJIPdXn1eGkjcz3LIdYSILyfV6mB8DCn
         HqX6cX1R35+olDhoFLA+niKfwVQ8goyWH6C0s1fcbWaIlog1Si4WgaagFtLR/4PpYGu/
         yC9O5aMx0OoXoOORnhnvM7qrDRh7DBr41jPnPGhMkI40VpKJ5sLz/c0bAHKjEjDMkpRY
         V22YXEFYYd/z+D08CqQNpxUM1eA39H7lInADFBwwVTkGgImel6LMg/oYaesrWUIucWfL
         iqIoUVkl6zyTgHmj4ppXpkMGTnFscrAU4FzPxMGpeRBe1jM3VnxBg5e76IyhBHjCjlkC
         58fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538499; x=1782143299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+6TqdYR7EjMTpHsjbl3Oaxm9i/7wwH40MmAvo6XkU6A=;
        b=EFIkkW3wzPpknPMReorrbk7/UFf6D027BkYK5atl6GTjDiBMs9t6/q0/7DmQ/L+MXb
         bvDSQpdEeneTg9/CN9sOAf+ppB8Wr95fK/qv1OPdY5BaobsxusFLASpN9+EGg/5a0HvD
         qek8gVTbH8ffjgLG5QvoDLdClVTNxXBEsjiAoHGcjKs4MkKuBIIi7xG3UZgn66uLhMoU
         d0gAPVfth9qsBWK7XU22nltUyjZ9SfnU7YueZywezcMNzqCIQIxSnbvpAUMMiDORzmlN
         vEvWZ1S6rHs8daKQTkLkzsrtNzXi0XPqnv777sWl/pcffZOc2EC4+dWJqRdBLwZcP/Tq
         XoGg==
X-Forwarded-Encrypted: i=1; AFNElJ/VUKBwmECsg/E73anUYuTie2AAofIpi0pmgOSLptare+0XIzSgTDU4IgA8nM1Fdn+Z5qbkjxcccVMFBESqsnsyNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8L61GB5rgNj7df2JIXp5pUyxwWdrT6SAq5UgQFo9F3VEDL8XD
	kfz0GcqPukK5xtqZwjf2fDTPgMVVpKO7VwDKOGX7Oye/Sg6g+1atoXyU
X-Gm-Gg: Acq92OETZZpsvl6ymmRqsI2QRablo1LgOGLpFIBqREsrDOsgmXv/i3O0MsHxiVMqelQ
	TxukNtemp7LCk6Xu1E9ka/G3Gnq1DmqIA0Mvmb7EIQgfm7CRk2AQiphwLAtxng8JwuGV37egYi7
	CNer6cfErLbvXneLax1llwBr9XAlfF/3K/ABqdfhZgBNANSsf+dQLs3FUXDSpQyoI3mKVDYd0Oz
	qKIHWa/k0+ajJy0lPJ2AVMYuHGXb3dzv4Av+Z6eDfLGDoaU4KNpnbXPQBsTWDt1Lwa/kbfiuQ1d
	uNRy2ge6W5Gla46WKnNiRVPNXm+Tcg8HsZAYmVAc0i0NVLI2fOnSiTAGSisIvLc8rrsqlykWjOd
	JbV/CpW34u3rEhWuRXa8rswhHODZ5Jahzoe3qYRP7LZ2u71Jmj51k3cK9gsyZMxb7pDJD+V0iQ8
	bJxRD4Ln0UuArb0c0Cr6gF2mUykv8PZxtS/Sm05Prp5+u/thH8rkRwQx0h00FrwJ90MC5ghSvVg
	y2Cxo2N4Mg7LUVoZSMBj5b++fARMxJnrE7Q
X-Received: by 2002:a05:600c:81c5:b0:490:ea88:9d4c with SMTP id 5b1f17b1804b1-4922016094fmr111312015e9.32.1781538498881;
        Mon, 15 Jun 2026 08:48:18 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 01/12] dt-bindings: rtc: renesas,rzn1-rtc: Add RZ/T2H and RZ/N2H support
Date: Mon, 15 Jun 2026 16:47:54 +0100
Message-ID: <20260615154805.1619693-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34037-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10FC2687E5F

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add compatible strings for the RTC block found on the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike RZ/N1, they do not implement the RTCA0SUBU and RTCA0TCR
registers. This is not a limitation for Linux support, as these
registers are not used when the RTC operates in "scmp" clock mode, which
is required on RZ/T2H and RZ/N2H due to their 195.3 kHz input clock.

The RZ/T2H RTC variant also supports a 1Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual.

Update the binding schema to require the additional clock inputs used by
these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/rtc/renesas,rzn1-rtc.yaml        | 35 +++++++++++++++----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
index 1860f0e4c31a..ea7b039a91e7 100644
--- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
@@ -9,15 +9,19 @@ title: Renesas RZ/N1 SoCs Real-Time Clock
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-rtc
-      - const: renesas,rzn1-rtc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-rtc
+          - const: renesas,rzn1-rtc
+
+      - const: renesas,r9a09g077-rtc
+
+      - items:
+          - const: renesas,r9a09g087-rtc
+          - const: renesas,r9a09g077-rtc
 
   reg:
     maxItems: 1
@@ -54,6 +58,23 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g077-rtc
+              - renesas,r9a09g087-rtc
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0


