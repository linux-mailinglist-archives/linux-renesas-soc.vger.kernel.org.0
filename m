Return-Path: <linux-renesas-soc+bounces-32401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHaQI3olAmqEoQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:52:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D63514AF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B832030882B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32CC4C901D;
	Mon, 11 May 2026 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnt+S7ZL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6284C956E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525473; cv=none; b=cy1ubuWVxgqwiGHWY7/U4NBgXrHt05qMstQ9fAdXp0m8S1064Y4sB9d2Bbt/WvSxhjjnvdqReE6xKJkJgPIyyAo3phAs42hHF+C00TT8rg5s1rZLpYLV3uukwoBXnBRSz9D+wk453rIuqbxTLPdP3C4P/2Nw8mYSwI32M7AO100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525473; c=relaxed/simple;
	bh=ScuSn2Eo3m8qfkPkxLxCk22qONfBuFmTXHK4TsFSyPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkT+hDMH4H0jC6AWD8G/m9sFiNH2Krn/lDWhh5SIE738YNUH4N6HyehA27JHT0SVgAwnm3EZo4dByZxGBKJ/bI5Klt3u6aCe6qWEYuEoNn4TvNSRYsk/jPLv5NVk/mivoMNiNi4F7xDrN3JAchCBvJXu5EBKIuoXsqff9MLCqVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnt+S7ZL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so46137235e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525470; x=1779130270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxgQ/0UOwKXQVRrJFbE40xkB8Pb4iPrDGhrh4gosHyY=;
        b=Wnt+S7ZL9X+xAvlHP4H+8MAKgLKz0gbfGWFbhblcaB/V/wPgIjD5dyWDlrt+udAPXl
         5mSiBNhu0IGG/hn1dl3KaPlIkfHgGqIYKNK/C3dq4Ko4vedapcpSc3z0Frj4aUELQaSU
         rwyi2GE9qjvfdzscIvURQCBXB+4xiRVyUNW7CuSyYrVgijg0Bj8rQ106OXL7555R2BSs
         +Q6JXiceye9oZvmmEOGdHEPQnRJN2SjyaOO5AEUOFTpJhciggJdO2E36qxRI8yuY/8AZ
         wMCKqE8XjSS4x7j3oQuSRd1FmpFoVCP7a4Qm4iDdBbzDuc1zg8iffnXTi+E1hsKz5WXW
         HAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525470; x=1779130270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UxgQ/0UOwKXQVRrJFbE40xkB8Pb4iPrDGhrh4gosHyY=;
        b=YDg2bS0uBH3tMdAThpniqlzL1Xu0oR9Ssx2NGjeCHXubCTiALKJkx24SmpemdXuZY8
         l0jR6o6L44IwlYOY5afyN2Dh3SjeHTzwn+XGnIsiwpZfu8ULqogmoklgg8zOju/lyKSz
         TYCs+cPbJU8XtfvwM4k744be7CEUfYzZX9jizcyXe/8ofGKxDU5d8VKyuF9c0kA5Xg27
         /5ddRdhBmxECF/LQzkMk6Gq1fUQVTVgEzNPDGob339wy7etGyoFJ+wP7ylVSE+ZJC5Vt
         ycOgASN++4oi9Y9Sa5zCfm4M/kbJYVIAgcqiiDitGzVe+zNIiBzuskE+mwxNUtXLDVyy
         Qqpw==
X-Gm-Message-State: AOJu0YzrTr7ZeskaORRATJrVitZa000jL3xXZwGBTNJ2hn67vcG98+e5
	YyNBaLC+zIj4O9UciPJT+oJL7+Tfq3Gr+WskLxN2gKeM2+tIHbTzAUC0
X-Gm-Gg: Acq92OExQt0saikDDYFAAiuccW5ts8RDOwGrMa5n7Y4zy7i9w1Q8XrygG6Xfm9zRTVk
	OcmBKazhhf9e1GaMAgz9Q4R+VPQeLwaSYpl1A6sH89z3K5Np9iDa+CEnMF4yG0SdrTvU4yS6e0m
	8Vq9G9pUzFzCLXIt6+b0K8/FRuL9kBg7aAZjY/sT0uDsAcgCDHxxbJnyXEzBYGHAfCACeARzAc7
	tS5YhfZbmkR3TGSj3RYMmjaTpmf6etCtqKXKk/p4ybdgThPtz8CKKLxrgaU0KooMwhTAxgsJrOt
	EklZ2nToU4kCyb1vguElophjgvLNZzg1DfjA9HY9/jZEyQsqrQiq8YzOn/k6cqPy2aoHKhzkYrC
	60I9Px+tE6oafmnD8Bd2n/5lyIgdrfJVpH4EqbIxaLgMFH0Ofi0UXcSMBWxCNTP+Erw5jaqUiZk
	4VqT9hDqreMpGN1UWTkSki7IBG4N0RZOJJaNoQD/dtRVYzDSAb3NFO/6yaSEyslVTSL0BxS4JCl
	bfgN1WYESPNttNHZYJ7j5UBycxg7eSZuvqyiA==
X-Received: by 2002:a05:600c:4449:b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-48e51f2e67fmr395335165e9.11.1778525469670;
        Mon, 11 May 2026 11:51:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add SYS syscon support
Date: Mon, 11 May 2026 19:50:54 +0100
Message-ID: <20260511185058.1926869-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 46D63514AF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32401-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
resides within the System Controller (SYS) block rather than the WDT
address space itself.

Previously, this was handled by including a second register range in the
"reg" property. However, this is architecturally incorrect as the SYS
block consists of two distinct regions (0x80290000 and 0x81290000) that
contain registers for multiple peripheral blocks.

Now that the SYS driver provides a unified syscon regmap, introduce the
"renesas,sys" phandle-array property to allow the WDT driver to
access its control register via the system controller.

Mark the use of a second "reg" entry as deprecated in favor of the
new phandle-array approach for SoCs that require WDTDCR access.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../watchdog/renesas,r9a09g057-wdt.yaml       | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
index 099200c4f136..2f32c7401def 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
@@ -48,6 +48,17 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,sys:
+    description:
+      System controller registers control the start/stop of the WDT, and halt debug.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to system controller
+          - description: watchdog IP instance index
+            minimum: 0
+            maximum: 5
+
   timeout-sec: true
 
 required:
@@ -73,15 +84,29 @@ allOf:
           minItems: 2
         clock-names:
           minItems: 2
+        renesas,sys: false
     else:
       properties:
         clocks:
           maxItems: 1
         clock-names:
           maxItems: 1
-        reg:
-          minItems: 2
         resets: false
+      allOf:
+        - if:
+            required:
+              - renesas,sys
+          then:
+            properties:
+              reg:
+                maxItems: 1
+          else:
+            properties:
+              reg:
+                description: Deprecated. Use renesas,sys to pass the offset
+                             of WDTDCR register instead.
+                minItems: 2
+                deprecated: true
 
 additionalProperties: false
 
-- 
2.54.0


