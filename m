Return-Path: <linux-renesas-soc+bounces-33718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UM2KGkhtJ2oWwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:32:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC365BA48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:32:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mu3Uxzca;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 746D1301CFB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC9D32F76D;
	Tue,  9 Jun 2026 01:31:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6835732B121
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968697; cv=none; b=EmO1pdhx3mWDlN88FTboZgcMhr8iR7vK/3Ze4SZuu3bx5c40a+i/5ShHvdP+Mi1gMI+Qfka2cC+dJrcOQm1NsNMSW9lEJXf4yfWoNbr8OYJyquTR+S0vMx4iM7nFk/EH8EmNzE0FA35/DuJWiQ1SvZ2a0hZqE1mg48Snv339OmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968697; c=relaxed/simple;
	bh=wrpwFKkIZo/+BJHnbehZY+5qtwnBH5pbVivYfsnCCkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTCbDwISUiVEQQdX5ADiyDxGs1OXAbanOmfjFyzoxj2+XNXXTCiDdayyXDIoVxGKx0yU6Mf69aryczYdFT024WIQitoEZgS1399ZscPHh8d5Vn+lKaWyfwCfOC9oe+EttZ9hFyOA05AqlaAcr7/6hSpup4elVY4kiPHli1jsoic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu3Uxzca; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so40924465ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968691; x=1781573491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Zg5GMFb64gMq7K11JlRqMEO4YXM4lX5yZVioY/q1Lo=;
        b=mu3UxzcaDOzYGMqPVh0Xt64xiHInA+oa4plEip8uTegbEfyl5L73sT52SH1snCD+NI
         Ip8/cnV2SXDB4RtGp8PuV+L5oMVRUUiZjiTXvxfw3Y7Upg8h4rFfts/fp10fYZULl4bz
         TEISiMxs+vpQI5zUJ2rlPRrNZi38g+GEsCquKnq6h5SbSPJrClEZRJO1svGvG9ispkir
         O9+KyxHc4RbrZB91wf/8Ti3/CrvPmNNczQyg/IKgoIQ67HqIHHEmh0CiieB2DAZEBuha
         /WaGUd+EUWIpS59dLWn1jdPPIKmt9ByNpNkYX6LzgPZllFM0jxbyPKLKvCoW34YIDxaw
         toaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968691; x=1781573491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Zg5GMFb64gMq7K11JlRqMEO4YXM4lX5yZVioY/q1Lo=;
        b=X/O2PsyR8A5NBURmlcyeMjiot0voaw/LpSbQ14PgQA2NpXtOVV8V01xfvBjWRNZxc/
         dZcEu00/VRRQKHR1l5eUTzH0C1fZIA2r1hjdVHNr3h6ZtLTQ8fxoxhDHSLCOVUKvAjGE
         E+do/QBiqIPyBmr9JDRFqH2HpIrEilKGfOEwpjyrOIzZZcJdhySg1kfFCuJMAtgBAYEa
         oxMII99HhKDLMdsrtFfbutwo2kU/VdOUhQnWz1n+HRvQcYuTNO/3DIdaMKrCdalQaxNt
         R5Tvhv16uthldMLeyKs3YUx0603vq9Ckttqt71X/O0ta2VnVy22vI1OP/k9biXqmkARs
         yjxw==
X-Forwarded-Encrypted: i=1; AFNElJ+XX/yFLsgecZTPgwMRAoDI1l2sFOwJOIlQsdBsxArNQktreiwrQwNkv+IKYfPf/aSf2YVNxYQnghZfW/fjzKqABw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2m54+1ToaH3so84eHwS9I0ailmCjfoRYElUjVIN6olbiSKVEh
	TWYU5jJYQFmzSNObk98z5SnDFjzLBH5UCFgLRm269OpW6mBsNdlVCN6n
X-Gm-Gg: Acq92OGBIisktoUa5dHEvbgETQcD2GmOatco8Bv79LtXKnOkoKsCammjvjs4DTekUfF
	EXvjH8ecN5F6o2fJltOGljqCz+y1JExfbc8SDl91v1t0pDbyBBzSbp09RHpod00PUYz2ve93KA3
	Av0CD84RqDYlKrI5bv1BiyPZqa4S3YqPeUIcACIVhSq3WdFpBZCZ7FB5xM43mseyIjQhxE2DZAb
	tjb7rw4V85Ndl449pW7LZ5zMMTgSghdcDYVZfuCeDkpgpKWT41Y/kmWg4yoeXGq1IpJAY9fn/zP
	7qB65xT0ZQ8gKCibl5ci/Z2oGHVxi9sO5YDd5FO1AZt/3224o19NNtozS6kbOA7/jep2lqQjv7N
	icJ8Q23DlZAU4u8GKzzuxe9pyJv2IKAdicV3U4eoRHFWbBIZvDX56GbLcmaZ6cNsUqDDxqEAiXR
	3D/sNv3npr7aBcsgv117JljNW4P6GyXpoSprDkKZPYz2tFo3kDt4i/lFGt38LcnU9Cy4Z2
X-Received: by 2002:a17:903:1a70:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c2245a35b5mr152134705ad.27.1780968690526;
        Mon, 08 Jun 2026 18:31:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:30 -0700 (PDT)
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
Subject: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Tue,  9 Jun 2026 08:30:57 +0700
Message-ID: <20260609013107.5995-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33718-lists,linux-renesas-soc=lfdr.de];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBFC365BA48

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


