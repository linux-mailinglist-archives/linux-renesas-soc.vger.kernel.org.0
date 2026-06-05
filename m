Return-Path: <linux-renesas-soc+bounces-33611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gKwLSPBImrldAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:29:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D8664823C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FcjVb9CS;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0622C3023171
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BFE3C2BB0;
	Fri,  5 Jun 2026 12:20:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B587395AE6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662023; cv=none; b=p4zHeZ1gpMQAgDNx6vZQ8SbAInhTLBKFsHHQCONNgBPZgqKxt3DcjVH+InSLIBppz0Yt1wmZ8cUWlb+fvWwtybo2ZfrcsCLNvbTPsvW8lSPHJXgGkR92S1uY2ekW56cXI2+iYrPKbcS5CabYbYgjqLW6W+oWkH8l42rsR/C9KKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662023; c=relaxed/simple;
	bh=oMzP/wOfJx1MRfMRoBSuTkFbbK2LuERI2OFuLB/LIio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaGK58xrSI2j+ABUMms59vpUG5YfwFcvbeR4utKsQZTKUVTw0fTriDNC9qoozXNb30A00oaq71WoPBVOdiP4P6A3OzFsyVdE6nAqgcUl/gO7U8sFJ3u3Z9OhCm1EJsOE0mpH6tRKYeRrNFb57vzK1hp4XYZR+d9KZbq9ZT6mfmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FcjVb9CS; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c85822059d8so1184427a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662020; x=1781266820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEv6Gx13HTQhXkhds+jiesB3Dn5KZs+v55Em0FBOv6I=;
        b=FcjVb9CShOQ5fFEYe9cmZd+RqTJNjn425nsEIHP9zAxdrWTRPliTVRoVbidO/0kfPi
         ZQ2E8CkI1t7QrhrBgHC/jPjoK1wf1hFOmiw7nS8+EKZ2lyRapOdjYCGaxPqgf/Q2mmWe
         7uVITbzZx4DL2FDiGU3fLYgU+bcTFQLKkxR9B+9/SpPmS4IawxEDElfe5biaGM4IuZ7e
         hSledsgOJGwXYf7lhKe5XJNtDQdKaYejOeChbZFuQa7Y8/5y8rn42BHUWtKyaSNASqYH
         piNqj1C+4wd8Y508oWNZ6nm5tYRS7EwelEo8q6Fzf4tWIxoq3D5wrvA7WWA5mXcrnhWy
         owaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662020; x=1781266820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEv6Gx13HTQhXkhds+jiesB3Dn5KZs+v55Em0FBOv6I=;
        b=NdWUQBtonNPdiiUC2tRi45x4Ly7ExfC0lCgwVQbJhtIIGTtNN67UZxF0lGZEkDhW2S
         0sq1RA22XiCb51VfuYYPxetAam6VV7+nyJBfD+yWZz7+n3cpRwn8fakGiSKCAy1bbvui
         3rp8lmXDcuj0cdZXxzN6YyiU56LJTd3rxOhMhl6yfcTUhmk2J53I2kbYd67/93o4b3Hl
         bk4+fdMsqMmb+Yw3wWv3UZlDBtmjsGQJNDndiCR6B6TCfewqJweTSY/p8quCEML+bQaC
         elT86OzOEgs+YJ9oSAgP4xf1ju8RKrxm5affSjzn8fPVufOEQJLSwAcb47ISGHtv9hq5
         2xWA==
X-Forwarded-Encrypted: i=1; AFNElJ9JHmef1JGH+/JERtj7WpjOp4XwE+pADxpMQKL1nMr+SpuvliUA0g69TdiZHBSClVfrTlUPOBr9t14dJHs4sAmdrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo44jtGCctbrayD3LDS1CRXhi9/Of5/cd0gh514M9UHT+lsahZ
	BHp5h4y3WuSlA03GU4jfKdnoslpdn3YTblbnfz4gey746WzyimVLrO/s
X-Gm-Gg: Acq92OHIzWc2Z3b2K8vzpWBKxcqMXpfs4rgvt2Jlr7+dzAQ2dnwCu+ctDeZrO+bvBgL
	NObcDsVh7DQyagZsLaesFfVsO0tAGNYDmjebGyE6cxelHobxbf+jHTQAHMh+dWyaGDqkkddmOPN
	dMen+DlI1XZSWAPuCi7oglz8dIca9LimuMvU6JEcMH45+wxVpCJbJs9ORQsbUfuaCxnNROMbSsp
	T8WIuHDCu0+nZgzwYo9UWu8Il9mSblLhcHnV2vO2XlU20Lfpn3lhCpBdj34Ll4reKoZZ9lIFj9j
	nFKsil5m0JFiqzY47wCeRjMZUuEMD4vksRbI5qXKjl0g26tAFzpbJqA5DfbACiuWPtvHZ1qfyHG
	+j++mj/h4H84hL8/boqsjwKTEpzuWyrXKnMEPy5JzkRqmb2kuCjv1kAuNXE/aNhl+YLsU8iJW3o
	mx9ZX70PTWjQzZRqPZrq6UF+StuoIOlwyF/pF8NF4l5Dn3qRc9iMRqECzQ3CqMats1o4N8yQl3u
	/3WD/U=
X-Received: by 2002:a05:6a00:2ea9:b0:841:d7f6:7297 with SMTP id d2e1a72fcca58-842b0f0994bmr3355005b3a.40.1780662019396;
        Fri, 05 Jun 2026 05:20:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 01/10] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Fri,  5 Jun 2026 19:19:45 +0700
Message-ID: <20260605121955.105661-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33611-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55D8664823C

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support multiple clocks to properly describe the
hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock.
  - FSI dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.
Both sh73a0 and r8a7740 define the SPU DIV6 clock control register at
0xe6150084. The binding therefore documents the clocks supported by the
FSI driver for these variants.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v4:
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.
 
 
 .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..b966b55ff772 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -9,9 +9,6 @@ title: Renesas FIFO-buffered Serial Interface (FSI)
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   $nodename:
     pattern: "^sound@.*"
@@ -38,7 +35,32 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main FSI module clock
+      - description: |
+          SPU bus/bridge clock. On R8A7740, this clock must be enabled to allow
+          register access as the FSI block is connected behind the SPU bus.
+      - description: CPG DIV6 functional clocks for FSI port A
+      - description: CPG DIV6 functional clocks for FSI port B
+      - description: FSI dividers for port A used for audio clock generation
+      - description: FSI dividers for port B used for audio clock generation
+      - description: External clock inputs for FSI port A provided by the board
+      - description: External clock inputs for FSI port B provided by the board
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - fck  # Main FSI module clock
+        - spu  # optional SPU bus/bridge clock
+        - icka # optional CPG DIV6 functional clocks for FSI port A
+        - ickb # optional CPG DIV6 functional clocks for FSI port B
+        - diva # optional FSI dividers for port A used for audio clock generation
+        - divb # optional FSI dividers for port B used for audio clock generation
+        - xcka # optional External clock inputs for FSI port A provided by the board
+        - xckb # optional External clock inputs for FSI port B provided by the board
 
   power-domains:
     maxItems: 1
@@ -69,6 +91,31 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      required:
+        - clock-names
+
+      properties:
+        clock-names:
+          minItems: 2
+          uniqueItems: true
+          items:
+            - const: fck
+            - const: spu
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+            - enum: [icka, ickb, diva, divb, xcka, xckb]
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7740-clock.h>
@@ -77,7 +124,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                    <&fsia_clk>, <&fsiack_clk>, <&fsidiva_clk>,
+                    <&fsib_clk>, <&fsibck_clk>, <&fsidivb_clk>;
+            clock-names = "fck", "spu", "icka", "xcka", "diva",
+                         "ickb", "xckb", "divb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0


