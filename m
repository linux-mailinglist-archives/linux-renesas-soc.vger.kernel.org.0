Return-Path: <linux-renesas-soc+bounces-34321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P+/gKStbOWofrAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:56:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8F6B0E3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:56:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ip7zgYnq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDD69300D563
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6239A3CB2E0;
	Mon, 22 Jun 2026 15:56:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C33CAE74
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143779; cv=none; b=nJX9szcc3fcjPribBcuxUQGaq7h8ssnlbM+DLBWvXbg3IN/+HLfXCU3ppL8WFiTx/B6EFSEUmRuB7VMIu/UAxtdKqbO/kPQSh6bmf262ncXeYU25Uw/hvWGlBWE/SkoVOedYp6MwXKdJyqC7wf9Cudi3MxzkRp60J5k0n23QpLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143779; c=relaxed/simple;
	bh=01QyoOiHtEG2EC1p1GpSPzcUpaa4tNP56rPDmKiOKn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TcWQNeha4R1wehGXg+GtIu3TUWPdE50V4UfrUftoAAGZL8PnhVhQjDGJz8RdrYuu/FI89sxNUvZFFjBVrM8ZsHFuU3/3+0We/bNugvnjpxN7f8zz66mCakkYlG6I+XYIra2E3tYEdQUM5IZht69mPTlApSMuPj1VsyLE3RkK8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ip7zgYnq; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49241896317so16526255e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143776; x=1782748576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4iVk6bE8U64F219gl5pT5drhN9256KmsHF8cPmZUBE=;
        b=Ip7zgYnq53UA70h2pc3tfallH5Jyz8uPyD5vEB0Ol1FYxLukwJAXD0ISepn/z3ZNuh
         PYYkXkGR5SpZv+iaztYz26sgrilzaletS0/JDDUA7rK10BxNossHMopxcxvdMiSSalh7
         Sf8+Y5F2KL4JavZ16tGdnyBNNcI+QahK7N96BMFMDSSpb8hOiYKkpMNlTddVb1zhUnmU
         Opv1u2nk+LTZQ8a2BBGi0f5hR8FDR0Xl6ui6WG27Dw+f/UbLTPxAu9vSoU3oZMLtALth
         dmOMUrqF1c1YLwJfZIUsGAH4UaqQYPn14UsHJeeRwDWfVz2O6lIwQhS1DQgZ5tGieXET
         iq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143776; x=1782748576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4iVk6bE8U64F219gl5pT5drhN9256KmsHF8cPmZUBE=;
        b=knFjBgAFSIEInuUqIdjd6ie8IMHXKlw9wG4cjZsooytuQHjJLj+GFTj/mQ3zQnEclN
         2BHjyAEedOVcL0/gSwxrDbzT0DpxF+AKcZba3yxKvmIHliwSbBwOKuxyCHWF0O+sKw9V
         IiRQWI8/QNk7gMApLj6iXTpYHQkv1mjdT9s5XOUEU+Hn2YLIsGMhDKKjg04kdtFVGspu
         jYdLQ7M69ssgTRXkWTPB9azGXc6HxIqGhy1IfPa+UT5yyAwyVoxRO8uoKGWY2Zlosid8
         qcEE+Uy3AnqzvE0LwzdZPySqJEOu5V3mMhTO4WMopeAGIXCw04IbWClGtSn3QzG3HC9T
         EdEg==
X-Forwarded-Encrypted: i=1; AFNElJ/Hf5lbwNGxAKY+p6WWfvMSqliuzvja2FWhlrCxJwR+GBWTX4O8BikGKYqD2kMTBSpoobmHqBr84v09tvPp4Gt6nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwk/VC65V+GZcvRbkw5o54GvF/F+/d/kyAzdwlcKtgCDSoRe3+
	wE1jxhX/zg3b5kCrBj6Vlp6oF3RbuBkZMxk0Bo2CdsMIZBu8gwdlm/RU
X-Gm-Gg: AfdE7ckKkBRpBnSpF1XsW3/PAl2yuQlXgqreoc+KmxVkb1bM6Y9bu6dOCDJfTFkuejv
	n+tDXXE6JqyuJTa88E/hrlJ7OwM1egFerFOSAIH8eHaVbV2x7tk6p78hI+P9Q0dF9KaQWo6CAnS
	N5vhAO7NR+XthRQrDwPO5awn81ARjw1OIlDSh6HysJHkojF6n/VQ5accq0vzppfVmY601wyg4yG
	3ccWsL1B2exMW3dNziQWqaVl3t1gHGCWHFtajP751f4WY5znCW8SS+Ywj5evXL5Rtab7loh1M/j
	ArozP8VZ+ByphTceXHb89nrwk1JqOuX5OV+LiBaaK1Ue85J4ymlz2ckdFPi5AtTEB1WWtL41wkB
	fnoVIKJUjhVAHUCsNtVLSp2NUpyUgjRwYLgzh+JiBn0Jr3/oeJRqLzzYnROo+6U9Nd2HwqS0I6y
	jbFdlrKsCRD8MtGf0FepRj/qHwXaMWty65Ds2SVg==
X-Received: by 2002:a05:600c:c48e:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-4923f5a8fd6mr252871425e9.33.1782143776289;
        Mon, 22 Jun 2026 08:56:16 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:15 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v18 01/12] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
Date: Mon, 22 Jun 2026 16:55:52 +0100
Message-ID: <20260622155610.184271-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34321-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,sang-engineering.com,vger.kernel.org,gmail.com,microchip.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBE8F6B0E3A

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
controller is similar to RZ/G2L but has five clocks (core, clkh,
cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
It has an internal divider for all modes except HS400, and a 2048-bit
divider compared to 512 on others.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v17->v18:
 * No change.
v1->v17:
 * Collected tag.
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


