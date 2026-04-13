Return-Path: <linux-renesas-soc+bounces-31232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNVRN5HD3Gn5VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:21:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DB3EA86E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E75307BD56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E393B961A;
	Mon, 13 Apr 2026 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXMbh7Xk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9450335838B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074880; cv=none; b=aHSgjusQPXc+f6RXKPaWbU7XCJCmkN9Z2i90AQllnD/R99m9IUFJtqyS/GSgk+KTi1HQqcDbxIqQsOeQDSk5AHedhrlHklLpi+EP+KuSDxW/kTJi8QYBwuxGzzQTy3iaAM96dkmoljk3qSpIkh4BLZmU1+NGLSOxK2LCtopJR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074880; c=relaxed/simple;
	bh=r3lJLyo4pwKES9BKycKLT/FzReE1LAodZaW0RGMG4wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sygcQcZpTuxhmSI8mZVM1liYroWpq+gR75FWIzqrYs1fCZhqfe6Z+M0ksAAwo4ShT4C9pg5KRlCj3Wvn7aoAU47njf2Od+mbTHD8aUCP6yq5VLNq2sNcySQNGWyDhoI7CuqUxYfLt5TeRkeU7G/BOF43Q2+/T+Ya59nwAQBHPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXMbh7Xk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f2aab311eso479547b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074877; x=1776679677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkTJde6ErisNFz71GX/g+WRnRx4lnEoOHW1gq8vDPR4=;
        b=sXMbh7Xku6gnotaijSj5fqL7mkcQeJyGJQzAczF/sOI+mJ/WUFEd9PHllggbZl/xvj
         neWcTmvuK98tpb45QyjupXNi94b6yGOq51QRxAc6oCbJJVYW7Z9yLOWcY11MVI722SxN
         Lid7iaM71hWjAmz+NlB576hRrYl/hSxKwd2I7+12W8ba/EtmqeX1zBgC9e/qMrwxVStt
         ZL5GAG5m+nagL1buW9D6Kt+wcRdKvEHIfqg8Z/mZ2dv63iR18LeEHXYSKj4ZA/HBPRL8
         myah57R0WCb/FjQRUnFZGM1N+UAy+3G1LM5NxfGTQwsQr6BdqzJ5msVv8f5idNW8EcUF
         JTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074877; x=1776679677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkTJde6ErisNFz71GX/g+WRnRx4lnEoOHW1gq8vDPR4=;
        b=O6XkR/7ryG/4WAABQCtgQVt3FzFQkf/TX3DX4KuVe9eWc+oZkW66HQNR0ADVBrk89B
         RWn1z5z3juljwUG1ZHYlXZ3Vinod2/25sCZBu+hhfDJF2YhDHeyYp3snLoQaApcGp3gt
         mS77hed7gHW0KEJm+tk4xNyORspz6h7jyOOEKuALkqnY+ap6Ndobq+AUapxNwj6ntpJG
         kqXvxns3EO+C+vA++yx5OvHh4c6dVkeq5R7CkhklNxU8xew2yA/A0IP2rvh3bsewBxKq
         pDWTCI5DQEWZq+U/g20jojf45mV8idiF71Z3pG82+5gX22QAe+Vyb5EelwTHeI9nAaFh
         DqaA==
X-Forwarded-Encrypted: i=1; AFNElJ/z8IfVtT83chh/Vw3FjVbzINSSyRaZag9It25QJJ/MkXi0dBopnN7/WBtbnzYmBNHhsfEFqM7t9E0az/ss43jh3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwO/uPhyGJMxlW7ioIhxWLz2sVwTzvG0K4hg8KwPHpddHmkb3r
	zzK5tWJj59bLrHQqY2By/SyrLY7ZO3BGYNSg2vGYvchwxn142yDDbylvcwdSSw==
X-Gm-Gg: AeBDieuKX/iDCCKyqq2E11PrhNwd3HryDDIBFuPcekyCQ773odmAwFXcOA8q+0lZ6CF
	BiE89mBMnvL2X6dOV5TP9Lp7ulIndr+j3qJ5b5xfi/xcFAcKmvLGmI9EvssJHD/9UVTbMgNhuzQ
	xWg5QXoMpPoEW+hRtuPn7CUnkWGe36hbMCOunTHAc/cfNDZ+m3JLOvFxK9my5CKJvf30ts+5rj6
	0+a+5/cPdxEycDuUrp6YR2pRlF2VllxfXhNzc3oTBt8APbHpfnQIHRIuQilW37+gzQ4Cim0gFKj
	xemWmx8uvB3VTLwnfveEeLilf1RgWDkrTjvbnU8XB9zdcMIIbiFes5ow5hKqGjcCgMJUgXm8Q9+
	sYrrIhMrznpMIJKEumqQQplOyTfXBgswkwgCXJt087ysXDXTlgN4oLKSZeRO+Y/Ds6vVSbP/8ef
	BG1le3JDxyMca9tBKXzIREmj9ksOLDFRykGlf7+l+2jr5eloQpc3C1viLyyQ==
X-Received: by 2002:a05:6a00:84c:b0:82f:4cc9:186d with SMTP id d2e1a72fcca58-82f4cc936a7mr445459b3a.46.1776074876725;
        Mon, 13 Apr 2026 03:07:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for multiple clocks
Date: Mon, 13 Apr 2026 17:07:00 +0700
Message-ID: <20260413100700.30995-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31232-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 4C1DB3EA86E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU bus/bridge clock to be enabled before
accessing its registers. Without this clock, any register access leads to
a system hang as the FSI block sits behind the SPU bus.
Update the binding to support a flexible positional clock list to properly
describe the hardware clock tree, including:
  - SPU bus/bridge clock (spu) for register access.
  - CPG DIV6 clocks (icka/b) as functional clock parents.
  - FSI internal dividers (diva/b) for audio clock generation.
  - External clock inputs (xcka/b) provided by the board.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Rename FSI module clock to "own" to match driver.
 - Add "spu", "icka/b", "diva/b", "xcka/b" clock names.
 - Use YAML anchors to constrain clock-names properly.
 - Add "if" rule to require "spu" clock for r8a7740.
 - Update example with full clock configuration.
 - Clean up schema by moving allOf location.

 .../bindings/sound/renesas,fsi.yaml           | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..d0ae54f3d321 100644
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
@@ -38,7 +35,36 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    description: |
+      Clock driving the FSI Controller. The first clock must be
+      the module clock ("own").
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    description: |
+      Names of clocks corresponding to entries in "clocks":
+      - "own": Main FSI module clock (must be first and always present)
+      - "spu": SPU bus/bridge clock. On R8A7740, this clock must be
+        enabled to allow register access as the FSI block is connected
+        behind the SPU bus.
+      - "icka" / "ickb": CPG DIV6 functional clocks for FSI port A/B
+      - "diva"/"divb": Internal FSI dividers for port A/B used for
+        audio clock generation
+      - "xcka"/"xckb": External clock inputs for FSI port A/B
+        provided by the board
+    minItems: 1
+    items:
+      - const: own
+      - &fsi_all_clks
+        enum: [spu, icka, ickb, diva, divb, xcka, xckb]
+      - &fsi_no_spu_clks
+        enum: [icka, ickb, diva, divb, xcka, xckb]
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
+      - *fsi_no_spu_clks
 
   power-domains:
     maxItems: 1
@@ -69,6 +95,27 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,fsi2-r8a7740
+    then:
+      properties:
+        clock-names:
+          minItems: 2
+          items:
+            - const: own
+            - const: spu
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
+            - *fsi_no_spu_clks
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
+                     <&fsia_clk>, <&fsib_clk>, <&fsidiva_clk>,
+                     <&fsidivb_clk>,<&fsiack_clk>,<&fsibck_clk>;
+            clock-names = "own", "spu", "icka", "ickb",
+                          "diva", "divb", "xcka", "xckb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0


