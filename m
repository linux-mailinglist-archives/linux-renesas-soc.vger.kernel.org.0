Return-Path: <linux-renesas-soc+bounces-33750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q8cdEL38J2qk6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:45:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD765F983
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:45:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RnHEGmiV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FC393052888
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AC63FFF9E;
	Tue,  9 Jun 2026 11:39:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48E38B7BD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005146; cv=none; b=fI2LhaYdDRwoeXkXu8KZ5KLmahN5jxzFzLiHvgFQsMgScm+6LHL9JQHVVt/XpjnE0YADiplaa88HM0vz5kgQrMGACd3G3Dlkr45fxOsijLWXauLYKazXh7u0ZNid5Z87rvAJhF5nC3a/uxb+XC12W0n+vAF/L1no5fdumQ/jms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005146; c=relaxed/simple;
	bh=hFuaXMBuOsZvycVnG5qVkZeVz5/9NRuZ7/y9BtjtH7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OI0VxxlDjYNlXCvkbgCt1Z3MPx9pjMvcf/xYP8hIHHi7cXtwBQGGpJz5PBL4d6u+W/vP2RQ12vtRQgR4j6Z768kFz1nm7BB73gnh9kQAXTXMnvtnbCNdfmkmy2nByVt7f+kjt+Qm11VoCj2w17dFSBqs0ZDYqFZ0PiXgFbLiKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnHEGmiV; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c3184c71so41061135ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005143; x=1781609943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ABlpN+jPxbmTB0MnLce2t9pp9M98KB9DN7jc9qFYRY=;
        b=RnHEGmiVLLbjOKUrJPpus7niF8zeafRAphwpPiN71X9degIXm87nX8M23Uxj3rhFHc
         KIeysW1KX7lo8DcVFrPli3Mjs2RhRFLtYUsSA4Bu4SQAfLo/PS4PEoM/iqOQxsLqGqCQ
         zCqXsWziXItLQNR7ZcerxBSK9B1dNq2sAcSAiUUto2ImRb6HfUPipqsceTjrQlEm+dc2
         se3rPlHIvoisMdn6vsIzfccMAlglboYrkwDMHUB5ryyPwJTOXuNvkiLzLf+z7/7/gNll
         vL0CMYVl/ubTyjj4WDoNQJUHcjDejki0bypBOsDYhcWbbJqnjwIETh5plRwVRwny41FP
         N0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005143; x=1781609943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ABlpN+jPxbmTB0MnLce2t9pp9M98KB9DN7jc9qFYRY=;
        b=roG9PKUVumh+raIYWoEUyjCJlS7dxVhsQcDRXzHj/OlKvPwjDg5maJ5nBm+zsbVgoo
         aIfQPTCC1rj6HLg2QtxMHsVAJJmbS20OlSEm/HENsYPBdI658E4cwW1nt67wNUOG3SW7
         KnorqSrHMEhuQ2HZondFF56cVgcTTsQRNvnJhTv+97iTy1nnXrI/EPXfkyL+Mz31S9sm
         c1j3/yIRA/W+6OQofpvRA5ukd/1p+trBM/CM5BkzVv3zKJb8WBAcyG54lNKGkJFkA8fE
         GOLZ+UhKSbZ8DqyaE8Kdr4YKso0Al37dkgy69eYEYvO+MGr4UkinZRfv0MlYZ9FOYFeV
         m7rg==
X-Forwarded-Encrypted: i=1; AFNElJ9GUen4giZmC63E/qQMcD+8VVImPt4IAyPdM/U6OqvKUH3YVpkRfnHyZpX0/7gdkYKNFCT3WkecFHs52jRZ4LhJXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXjXYOD8Lftn4ZBz5gS2w4SCWq1Amd+78YkDh1CwSmYN6MTAw
	y1Ve5rGEyIg7GSlJetOygCboeXUzD53Q6DIu2SZPbFTzwTYevOGEaSsF
X-Gm-Gg: Acq92OFUox0Il3nHutVtLZ49IEel46UQEayl5+CXgaJUy/ZrJfRY69Cp7I4SgE7l+VG
	Bu4W9UJWYAoNA6LE28a3tUu3kbd3/PBKGkFvsU+ZQcxpRq5Dwb39blWc9Ur3a05OCZNEG67F2ci
	aehrRHh7Ah8d1hXnUyV37E8iDQg0BCn5dCgP4w/Q/ycbOIgMm/cMyJQMiGshv0i6k4PUh3F4biE
	kIWbFbiXneSJIMjQ9MUBAD6SHuVYrgOJho0cWvMUWa6OCRx7IvAPhEGWlI4CNQujRcwfRr/bL/I
	CvLPNksmcECdDEPZ/TKeUJNEruu67uSqpqWIYomZQyo5S8dkRLCbv3Jefwv804ovdpD3Pd2gx/A
	d+uz5KYt/UpI42CHmfRwmcDKSNzUtD6kxuAnuIUGw/wzPNWpjAGeg16D1WSdGHd9bhXgkYhX2a5
	8NXcqTUQ2mMA9Wv2evnh6rLgYprkeh/Wc9RdD9aizcbF7keeK39DKlBAIjokdovsfS7nmN
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id d9443c01a7336-2c22a8ab1a9mr174051145ad.9.1781005142987;
        Tue, 09 Jun 2026 04:39:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:02 -0700 (PDT)
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
Subject: [PATCH v6 01/11] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
Date: Tue,  9 Jun 2026 18:38:26 +0700
Message-ID: <20260609113836.45079-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33750-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ADD765F983

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
The hardware supports several valid clock configurations. For example,
when both FSIA and FSIB operate as slaves, only the fck and spu clocks
are required. When a port operates as a master, it can use either an
internal clock source (ickx + divx) or an external clock source
(ickx + xckx). Therefore, while fck and spu are mandatory on r8a7740,
the remaining clocks (icka/b, diva/b and xcka/b) are optional and depend
on the selected master/slave configuration and clock source.
Both sh73a0 and r8a7740 define the SPU DIV6 clock control register at
0xe6150084. The binding therefore documents the clocks supported by the
FSI driver for these variants.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - DT binding updates (drop uniqueItems, commit message) based on 
   Krzysztof's feedback.
Changes in v4:
 - Update dt-bindings based on feedback from Krzysztof, Rob, and Geert.


 .../bindings/sound/renesas,fsi.yaml           | 60 +++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..803945b7f82f 100644
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
@@ -69,6 +91,30 @@ required:
 
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
@@ -77,7 +123,11 @@ examples:
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


