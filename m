Return-Path: <linux-renesas-soc+bounces-33367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP5DEkoMG2ql+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:11:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2360DFC4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18BE9307DFD8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875E9334695;
	Sat, 30 May 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYcOosoH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E10432D7C7
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157313; cv=none; b=fN54LqRokbVmAYVtTf7QvAHpnAkV8VPGgs2IltdfHLPjNzm1gEdQVYe4DULStDcWGkalsfXrQmqRr0vBF+P1BfH87hB1ncs9c1xf9h4yI1tjzV5EFb7EP7YSmRGMEv0ObtoMQ4MKNtoqZK7j3zWQ0U8W7CTmgwDQIMEn6jzW+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157313; c=relaxed/simple;
	bh=LGU3EhNzItmD7/F0QP+/J37ZX1QLxCXHqhE26IfIzsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEGTFTW/xuF/fM2WyJdaGlxWyTFRJgfYult5Xz84wNNeM7zfkqKL1RDJ9jcWDwDbbFtbzzggZE0P2QxpJUQE3as80eS+7vNM5r/g23Krkd84YNDmdj6gshRjqERmscrDNlvsHCy1+aXBmFg3MxBmXXajw8gRCTaPKjPtutoq8nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYcOosoH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eea3448f2so1555100f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157310; x=1780762110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umKfVYTIv6The/YCck3O88OfkMKCNNX7zzNxe0iNolQ=;
        b=IYcOosoHAEoUg/MDxAbVJCb4CygvRqddfkyAIsOnZaoirCGK6C5qXIxeaVkJOKjAqV
         s6ZwLyE8Suf1p9Mq3iYgnmW6oslZCh4juU20JMR4NM2TexFwGEBx8G1CvSMO1sPtp9Y4
         ovUo7IG3iw19Ae8BzfOdJ3BTvGJjH7ESy+XVOc6vAI/iRaGX+72ketXHSL6u+6vVb6aK
         dP7QUVheA6MuNszsgT+uVbDzhqVUxljTelhafsXWyx+L0iZJBRuGaO1FF1izIZe/I9d7
         7DS289yIubELkuNZ9jnE4QTFgjNcqWQgLlSdYzNPktzMmnxr/LaLNNcWcjkiryUnwZYm
         ZGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157310; x=1780762110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umKfVYTIv6The/YCck3O88OfkMKCNNX7zzNxe0iNolQ=;
        b=Pygddducj/4rLMQwDrwiyXRoy64u5iWwOcDhekHKMH+dkS21jCVayMoFenPtXH3dYx
         DiLtKSvU2/h2h+n77HyECA38EP7trxwsns6V648eJwXi2oWkW/9uSIg19ABOHJaZpwP3
         OdOENqbnMALTjq8p+JMwH0V36SwJuoVw4kKsbmnEAzLrey6ap6mx3RAN/hwhxV/Si6Pe
         pDA7KolW/2baXkp3LAUaTKww/DRjHYet1/nNpShrAA2tPO5Z1vq6cwAODN4H+kz6C//K
         JIq1LtbYsP6iseYbczOXMJyuxG7iby39dKUW4i79mYgJMUyy3528qAAhucGmiDnAJ76B
         jYYw==
X-Forwarded-Encrypted: i=1; AFNElJ8dqaXE3M4L/l9cSPXLN0TiHnaJcPufehbFZOc7sePF/yGlOkh3GMAMXFSekuhZp6xocmkCEcklIu0DbHdMiLCpkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Av5ochFtUTjJCIwPY+4k2Rsr0pUbyezpDYwkRbyIqxgd+t83
	eVNrHWaCZeRhFYtDn2jNiUlu9+2rzZ6JFgAx4bAIlYmexqpaHcLfIhOz
X-Gm-Gg: Acq92OGwddQ00KFc8ncdbMl0RhnZ7WTCdGoliFG0EFWUek9r002YV1Bm+ERj79p+AF5
	zY4DJHbEYWDW50x0/Dz4/hUoCYKCVAYIjZGKPMgpTrcKLIguUU4IrX2upb8i0+BcvwBUjDzlYpL
	x+AUVqxgAxT3RG3M6tp3YOdtlq7ohJBbYW0hAbjYdgPTDJNhVMfZejDDm6qahQ6731ED+3TASoS
	sjQlil9Ns6OV+xxptQvshlvNxWVPxxsOmQrjm+9XobpGU4eRvJyeU5Zyd+VBt72oJBG38yGawok
	to/mxoRVXS5sZjPSdxWvtWCFEUObV5v4BLrUpjC20dH3vDf+nMg/Y9lcfyJu1Fe2cHUnyQai3qx
	jlgDmp//fvwQDfaMyWrNr4k9/F0yluv9zvBn5PglGPubNgC52iT0kculueAq21mvGZ/hfguKtXS
	4nrzDDYwdB6vEp9ckvHliavLQ5W8z4XLBTx+LlMw/CKOdr7YNdIOeZ8KyEJb04pvCeB+EP1Q==
X-Received: by 2002:adf:e84c:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-45ef6afbf37mr6578158f8f.11.1780157309895;
        Sat, 30 May 2026 09:08:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/17] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Sat, 30 May 2026 17:07:55 +0100
Message-ID: <20260530160823.130907-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33367-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,sang-engineering.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9CC2360DFC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 +++++++++++++-----
 1 file changed, 75 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 4d66966ce290..16cb395403f6 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,sdhi-r7s9210 # SH-Mobile AG5
           - renesas,sdhi-r8a73a4 # R-Mobile APE6
           - renesas,sdhi-r8a7740 # R-Mobile A1
+          - renesas,sdhi-r9a08g046 # RZ/G3L
           - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - renesas,sdhi-sh73a0  # R-Mobile APE6
       - items:
@@ -86,11 +87,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   dmas:
     minItems: 4
@@ -116,7 +117,12 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  reset-names:
+    minItems: 1
+    maxItems: 3
 
   pinctrl-0:
     minItems: 1
@@ -155,60 +161,101 @@ allOf:
         properties:
           compatible:
             contains:
-              enum:
-                - renesas,sdhi-r9a09g057
-                - renesas,rzg2l-sdhi
+              const: renesas,sdhi-r9a08g046
       then:
         properties:
           clocks:
             items:
               - description: IMCLK, SDHI channel main clock1.
               - description: CLK_HS, SDHI channel High speed clock which operates
-                             4 times that of SDHI channel main clock1.
+                             2 times that of SDHI channel main clock1.
               - description: IMCLK2, SDHI channel main clock2. When this clock is
                              turned off, external SD card detection cannot be
                              detected.
-              - description: ACLK, SDHI channel bus clock.
+              - description: ACLK/IACLKS, SDHI channel bus clock.
+              - description: IACLKM, SDHI channel bus clock m.
           clock-names:
             items:
               - const: core
               - const: clkh
               - const: cd
               - const: aclk
+              - const: aclkm
+          resets:
+            items:
+              - description: rst, Core reset.
+              - description: axim, SDHI axi bus reset m.
+              - description: axis, SDHI axi bus reset s.
+          reset-names:
+            items:
+              - const: rst
+              - const: axim
+              - const: axis
         required:
           - clock-names
           - resets
+          - reset-names
       else:
         if:
           properties:
             compatible:
               contains:
                 enum:
-                  - renesas,rcar-gen2-sdhi
-                  - renesas,rcar-gen3-sdhi
-                  - renesas,rcar-gen4-sdhi
+                  - renesas,sdhi-r9a09g057
+                  - renesas,rzg2l-sdhi
         then:
           properties:
             clocks:
-              minItems: 1
-              maxItems: 3
-            clock-names:
-              minItems: 1
-              uniqueItems: true
               items:
-                - const: core
-                - enum: [ clkh, cd ]
-                - const: cd
-        else:
-          properties:
-            clocks:
-              minItems: 1
-              maxItems: 2
+                - description: IMCLK, SDHI channel main clock1.
+                - description: CLK_HS, SDHI channel High speed clock which operates
+                               4 times that of SDHI channel main clock1.
+                - description: IMCLK2, SDHI channel main clock2. When this clock is
+                               turned off, external SD card detection cannot be
+                               detected.
+                - description: ACLK, SDHI channel bus clock.
             clock-names:
-              minItems: 1
               items:
                 - const: core
+                - const: clkh
                 - const: cd
+                - const: aclk
+            resets:
+              maxItems: 1
+          required:
+            - clock-names
+            - resets
+        else:
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    - renesas,rcar-gen2-sdhi
+                    - renesas,rcar-gen3-sdhi
+                    - renesas,rcar-gen4-sdhi
+          then:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 3
+              clock-names:
+                minItems: 1
+                uniqueItems: true
+                items:
+                  - const: core
+                  - enum: [ clkh, cd ]
+                  - const: cd
+          else:
+            properties:
+              clocks:
+                minItems: 1
+                maxItems: 2
+              clock-names:
+                minItems: 1
+                items:
+                  - const: core
+                  - const: cd
 
   - if:
       properties:
@@ -247,7 +294,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,sdhi-r9a09g057
+            enum:
+              - renesas,sdhi-r9a08g046
+              - renesas,sdhi-r9a09g057
     then:
       properties:
         vqmmc-regulator:
-- 
2.43.0


