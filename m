Return-Path: <linux-renesas-soc+bounces-33429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMTuL0bXHmodVwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 15:14:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43E62E5EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 15:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MvWJ3mfB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88781301AA6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 13:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085793E008F;
	Tue,  2 Jun 2026 13:13:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95DC3D1A86
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 13:13:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406016; cv=none; b=W1DD9I8e/K2OJKuRy/X0fi3NysP0Bj+WVsZvGIJcz5cF/kCmmIbFR/xm4T0gs61ZtTHswCSHkJApuVbZw8kbxLK3OFBk76KxuxHqec9HTmFao4NX+PTmVNQyFvo3i0lf0Q8A02frvRHNyLw3++WAKIlMeCPOPXfl1CUY5YzRQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406016; c=relaxed/simple;
	bh=eWPy+VzuovJm+ElD2gK6/fOIlHy+EasXmbIJDRlJmhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9H+R7vwO1Q16dJxBdp8oZx7JouzNELqtU1zFoY8yyp+tdNkKwoFRUgxoNMHDhQMPqLgehXOL/fh6sXgk4KVBwMcZIueKhfJ/ywZ5N/2mzqoW6y0WZ34t+TsQ7qg48TRSt7ay9ANKR+eFL/H8ykR3uuYxz98puxQ2j85RcUw4oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvWJ3mfB; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b3e03939so3542645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780406014; x=1781010814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jTfcCRizo1BCoCuZvjrGsrottsZL+2Hdq3AL0290nzE=;
        b=MvWJ3mfB+zivYWrpj9uxYW0OOM8dcNtNZIbJqE46l8Ej89uSmkKCHKqrFcNbjO53ri
         zNI1NJhM4SGQPAIdiD5mKoBOcOfFgj0Ivb2r0a1kSpyQ4BXntEavxrEpZ9KOi0p31+RJ
         prdc7tSXRlZ6nDT590WBeSPWyKf9U5XKqiaoMyQ4GXVTgADfjrHL39LDqcmnB2ZaLLOU
         lRzTn2F1LOCVk+aU4fxz/VL01gGu7tcWXsjUjuHHsOzxDa57R/I9kUNBuIzUE6XuU2FP
         ipGNk82+tgTbJxePfGRPqv0EJ/H6zjE2jhly8zOuWaOAKWHIQbWMqYpa31eZMb16BfFM
         6COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780406014; x=1781010814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTfcCRizo1BCoCuZvjrGsrottsZL+2Hdq3AL0290nzE=;
        b=jXkF5e82VkKv/JUpsZgMuaKTTnESQezpPKKg40xj9R6xl50HkGlM4KMdKbRmFdbs5x
         vzM3n9awGnSrQDQJP25dfjF8xOieZHGPXBHML9rlFGxZZSwejB2xMo5OR872rAWGY3wl
         TvS+y8NLImWhbeRePTxIITFvU8i6YYV74hHz5TILSJkNPn6l1I31cnqU6rObp/RDL3HN
         N90r+TmWOU04YGeRpFPi555+v3yCXjIPt0FH2HzjpNvoBkQNGPl/tzka+APp9ZOl9RVe
         guce0TWNUx1L0aF8cykDGd7WI6ySM+XNjzVr8RJaWUA/lJd1jz96cHZO591ezik/lFXj
         8BJA==
X-Forwarded-Encrypted: i=1; AFNElJ8I57QM6h+D7aGNgL+i2XZNIK1Ksn8xr5QlScCnH/Oh+5UoE3kNdRCgNlUeBxMMXnjIhMVgruO3thyg4yE78fiSjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlxZ8upZMuVJ37++AFfYFKWXXaZCPITzTyN7zY7wQsfHPdy0P
	VRicC1z5/DaA549hMR355+jeByqNtDoUlbGIgp9cp/ivs+LnsA2qiHtnyuW+DQ==
X-Gm-Gg: Acq92OHwJq2bG0Xm4FjMdvTJ3N5mnP2nuMe6miewrOFNdZczFT1vPZMSxAijTqPTuaF
	kV5zfzhvkNUlAX+Qw7p7zMKpYW1wL5Dy1xngvmRKOVZ+PaJIsVZ2LcCw0NiJ4TSWgvlDya9kPPn
	KRvmkLsmvaS4Bd+xDikUCgqO0nw6ok/bhuvIW+y4E9i5DU2plFFw5RFij51BUqjn/lC4kXEUFTu
	Ex3yj4bB/HofeecOLExUufeZg2m/O4Dxw+631OMjbsCQusoBr3PptpWtPPEzS4eAJDIKO7+PNni
	KU7bxgA2ZIKpeXaaT4vCPMYiJcYdGT/XhKFzZAJ7rLCdJ/7PP0X99CoX6tqDtUNV9q3miwBXgzr
	uVid1gcRBrSvtV2h/oQ+yWkco9rDLvvpZhjwwgUw+HVzREyxuyqLwvQFPxeZP41LzVgBQzxf8+4
	/AhakJCpNVPt5RbC00ZLiIW61CX0MGKl9p/iKuB7dIBg==
X-Received: by 2002:a05:600d:6405:10b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490b0ea300dmr44802245e9.15.1780406013876;
        Tue, 02 Jun 2026 06:13:33 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a700:7301:dd72:88d8:481a:904e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13f91sm86589155e9.3.2026.06.02.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:13:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: mfd: syscon: Make ranges required for renesas,r9a08g046-lvds-cmn
Date: Tue,  2 Jun 2026 14:13:29 +0100
Message-ID: <20260602131331.90756-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33429-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B43E62E5EE

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a conditional schema rule to the syscon bindings that requires the
ranges property when the compatible string contains
renesas,r9a08g046-lvds-cmn. This ensures the LVDS common control block
on the RZ/G3L SoC correctly declares its address translation, as the
device has child nodes that need a valid ranges mapping to be described
in the device tree.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..cbf83a06ae25 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -269,6 +269,8 @@ properties:
   resets:
     maxItems: 1
 
+  ranges: true
+
 required:
   - compatible
   - reg
@@ -276,6 +278,18 @@ required:
 allOf:
   - $ref: syscon-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-lvds-cmn
+    then:
+      properties:
+        ranges: true
+
+      required:
+        - ranges
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


