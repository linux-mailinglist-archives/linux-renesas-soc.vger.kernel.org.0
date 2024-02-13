Return-Path: <linux-renesas-soc+bounces-2735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0D853EF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 23:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3956A1C236E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BD9626C6;
	Tue, 13 Feb 2024 22:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tv00lH6Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AE4626A1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707864198; cv=none; b=GVD/IHdvA35r8MTDmK1qntV9Wo6zEge7o/ZDSOJk45lIt6NhYs7Sc3AvnVOPsrCiSz9dAha+a3pcpBBBGdrPJOvT5vKYasOGRE8d1fbmpZlxBy8LtMiVdGrk1On1NCYWgQVWeceFHSdQXHRnX1KNjlDJnXgaVYec00gV+ECIx0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707864198; c=relaxed/simple;
	bh=pWp+tXQctzEqAM/CF5O21s2acTxsVceiF1r91c4i/pI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ln5kZaMeZojFIUteJVaOyv7GxTc5rZRtngx1L/v1fnLhX/ahDpmNelP4MV3ewhXf7kBr10ssYBm6In52kZLrHxS5VVrI3Jo8MXIKHTxViaQ0Hvq92QMdVpCZkpOM4hUZAGk/GVLs5xbtHTGADuc06dSSNm2o4KuCF5DrSxu/mZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tv00lH6Z; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56001d49cc5so6112867a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 14:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1707864194; x=1708468994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MprekKUYvieyAi7zHmSOMoBKcpCjJo78zAPQVlUu7ao=;
        b=tv00lH6ZGroGySKmajEX3mbdhPQoW7gJTYr2g7RxJ0JbTLjaP3Tja7XpDrSM1LRu7E
         ckTJ78FfqjdZwMCggg/5qUdt0AU9aZmZm6B7+yMbMsW9LUM9/uUvd9fijhlGL7OPcb67
         NH7ycrOp1/xBQ03IADGuVbbQCu2+8bEDjNnWQH9wCfpHhmLOfmGAZIg6iPAd4OxA94P8
         MorIQeDzQqkG1A1C7ii0ilI/aOch+1+AofQeHj6Y9ghFrIkLi5IlXCTRTGv5sUgzb5+5
         9ZB+Bctuh4kmejT1P7ndEXxUCiAudI+sveGl8gMOMe+0+6KugN2BwicAyzGX8l6oZcV6
         iNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707864194; x=1708468994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MprekKUYvieyAi7zHmSOMoBKcpCjJo78zAPQVlUu7ao=;
        b=KriW8+bdyLtTubvsc53G2zYezbLDxCaPAps20rNya6BdPCkFHqc9cgCWdiu4IYbuor
         BUDrHD7eaFP3PdYxqY9NylSuZmiaN1kmUDC6fgJob4+sNRKNakhuxgkdAezeFDsgKb+m
         g4hNuuxbU61C+ojIbj2Yt/eYOEUxMMXPERI2EzBOknFzEaDKdHB9qyKlD+YsuiqNdaLX
         WbVtDVOIHgIWu3pLMFaRqk/YFD11zmUwQn9aQo9t031cHdW14N96ons7d01F6Gv468kQ
         CcjfXqedseLZUu7v05eVtilHQObOuHW7cu3HGDs9J+LCyed5wZ/gSx7pqjOC0PVnv3By
         oj9A==
X-Forwarded-Encrypted: i=1; AJvYcCW3qzf/P3qPD4gvZuRR8v92nYcVkoIDXriY+IhV/iAGz1SLpfBpbfPDTMa2pSXuUFhO5CvP9Vf9uoDEVKMlAJiom66f2AY5NOLd8GNVWyDvTBc=
X-Gm-Message-State: AOJu0Yzfn7GiFUOa29b41K1bM+tAOd3/fT1bZ93PfPcEcu8TH/nmE5eq
	ngISm/kIGGLLMf9onRwdKuaJDWmXEQL82XXKFRFHAGQKmeZmhJNL9QDZeddAzpM=
X-Google-Smtp-Source: AGHT+IEYDNKXoG0X7+W19pc+hFS+upYFMzqcTM8esd0wsiYL/A6e0Mj6kF/uUC/rVFYWgeJ9vt0tqQ==
X-Received: by 2002:a17:906:c347:b0:a3c:7c22:c320 with SMTP id ci7-20020a170906c34700b00a3c7c22c320mr429231ejb.77.1707864194488;
        Tue, 13 Feb 2024 14:43:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtcZW2+khluxvQxqENYtQAqp3aCD104Uj+/qKtfTug5Jx00+mr7ogNQaqtquBDgKv1QXcaFA6SAJFzC7FKT6c0xndEIRog04MIjepuhxyAkg0GxqB3rC1ZXwKJas3v6CKz++i5MHMkhXxThruVgBJg681dbMWLPuXT44feQSvMflyjXl28zZ2Wal/Jj5TxAIMDex0Pvku0hWIZjRtiJfXlMPLj7ggZ/CaXE/KtJaaZr5n8YzwdImJcGDr7sqMG/I1Fgfi0zuzwTdM+hOVZyfkL+i8LGzX9ju0boVVkHUqCTyTZIPM=
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id cw15-20020a170907160f00b00a3d004237ebsm1064899ejd.212.2024.02.13.14.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:43:14 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] dt-bindings: renesas: Document preferred compatible naming
Date: Tue, 13 Feb 2024 23:42:59 +0100
Message-ID: <20240213224259.2967533-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compatibles can come in two formats. Either "vendor,ip-soc" or
"vendor,soc-ip". Add a DT schema file documenting Renesas preferred
policy and enforcing it for all new compatibles, except few existing
patterns.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- Add missing minItems.

* Changes since v2
- Improve the select so it matches on any compatible containing a
  component specific Renesas value.
- Make the regexps more compact.
- Define MaxItems to allow the increased selection to work.
- Add rmobile and shmobile prefixes.
- I did not take Rob's ack from v2 as the schema changed a lot after
  Geerts review.

* Changes since v1
- Split the "SoC agnostic compatibles" section into two to make it's
  intent clearer.
- Improved the documentation for each group of compatibles.
- Reduced the number of regexp to create a larger target area. As
  suggested by Krzysztof the goal is not to validate each SoC name but
  check for the correct order of SoC-IP.

* Changes since RFC
- Moved to Documentation/devicetree/bindings/soc/renesas.
- Changed the pattern in the initial select to match on .*-.*.
- Added a lot of missing compatible values.
---
 .../bindings/soc/renesas/renesas-soc.yaml     | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
new file mode 100644
index 000000000000..a5fcd471983d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SoC compatibles naming convention
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description: |
+  Guidelines for new compatibles for SoC blocks/components.
+  When adding new compatibles in new bindings, use the format::
+    renesas,SoC-IP
+
+  For example::
+   renesas,r8a77965-csi2
+
+  When adding new compatibles to existing bindings, use the format in the
+  existing binding, even if it contradicts the above.
+
+select:
+  properties:
+    compatible:
+      contains:
+        pattern: "^renesas,.+-.+$"
+  required:
+    - compatible
+
+properties:
+  compatible:
+    minItems: 1
+    maxItems: 4
+    items:
+      anyOf:
+        # Preferred naming style for compatibles of SoC components
+        - pattern: "^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$"
+        - pattern: "^renesas,(condor|falcon|gr-peach|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$"
+
+        # Legacy compatibles
+        #
+        # New compatibles are not allowed.
+        - pattern: "^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$"
+        - pattern: "^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$"
+        - pattern: "^renesas,em-(gio|sti|uart)$"
+        - pattern: "^renesas,fsi2-(r8a7740|sh73a0)$"
+        - pattern: "^renesas,hspi-r8a777[89]$"
+        - pattern: "^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$"
+        - enum:
+            - renesas,imr-lx4
+            - renesas,mtu2-r7s72100
+
+        # None SoC component compatibles
+        #
+        # Compatibles with the Renesas vendor prefix that do not relate to any SoC
+        # component are OK. New compatibles are allowed.
+        - enum:
+            - renesas,smp-sram
+
+        # Do not fail compatibles not matching the select pattern
+        #
+        # Some SoC components in addition to a Renesas compatible list
+        # compatibles not related to Renesas. The select pattern for this
+        # schema hits all compatibles that have at lest one Renesas compatible
+        # and try to validate all values in that compatible array, allow all
+        # that don't match the schema select pattern. For example,
+        #
+        #   compatible = "renesas,r9a07g044-mali", "arm,mali-bifrost";
+        - pattern: "^(?!renesas,.+-.+).+$"
+
+additionalProperties: true
-- 
2.43.0


