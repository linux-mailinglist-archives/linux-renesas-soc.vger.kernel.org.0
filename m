Return-Path: <linux-renesas-soc+bounces-32679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDk/FUAYB2qYrgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:57:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D355005B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA2EF30FD84F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBBF8481FA5;
	Fri, 15 May 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuubbMaP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D465F481A96
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845930; cv=none; b=FlWGzfRAM3vXfthJTMQ9msw/kkmfFfYj2vAIhUey5yujTuFWpZB02P18FitRZ9zgzJEyicl8cjo07PtOsKh7MwOBa4J8ruPieAop3Dk47i68z8tvHbc0NGHleYFZf4K7hMXquEago5R+gIhGz3aOUhbMn2eefWxCF7XwrXCbpCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845930; c=relaxed/simple;
	bh=feO571qSHMBhSw9FnUvtJU58ZnElf8PURjLCSOnDmEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YM+7qFQIkc0vUGBeSlvLy5NneDwqvQ+KhXG1t88NyNx7qmXTi91YiaSRCmA2gAuo1IN+cItXNbkSvmjZy8nklh4cvRxv1QxIb1dCfc3rAuqdnvxaXSkRtCAs9qRy3KO2EfSor0qr8xEwQGhcpU5Q3EcNGBl9zBNfMpQypdGHTa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuubbMaP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso49620315e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2026 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845927; x=1779450727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aMCoyazuJELtNjo3L9VuPYC5o4Q8/gFp6bEqHTv1GE=;
        b=QuubbMaPlfVkeVXwR3fRF/bMhYmvqDQM2PQFbDrxeajpb4mq92zhUwDliQ8SF/Z5eA
         A4OU42uj6SUaf7leHM9V6ToMcUWleiBCS3Gf8rRoXo2IsSJjsbUDlM//O3PSvtPhNMZv
         R0oTfavgawjFF4bNsSex6Yh2qV5FqCLy8r96jUEGYt5OwONQpb44RBijcDvohUE9dBhZ
         IKsS6fAV4jtu9W6hICVBRBaUccMJnKSfwFSQI61kkZtdYuHmd6nmdCNE9nTsNDG6xe7M
         WQ7ZD9CMwL6mXkGj44Z0xu30dCpVH3Ap2UUoWaK6WrurG6uFPDpjwbPLYtze3KVSE6Ma
         1MWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845927; x=1779450727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0aMCoyazuJELtNjo3L9VuPYC5o4Q8/gFp6bEqHTv1GE=;
        b=jxAWe73lTkgwy97X/qMIbvItYGAiK7BfXVD426hYjhQ9VWYUqnfhWlWGcGE4HC5FLG
         ySh1p0B64RN19AVh/ChfvOxw3s9KAwoQMvpUFqXv4aguhhJi2hEsZNUJTNDdT+XCiPf0
         J2soSrku9a9NJCvg5FCcIf6KRNwo60nhQjlDzT4iwh4hCUURkAC0AlIe8AlJ7sfe+jXu
         0DDymT4JNvr+0aPyKa1lmc3JWYRlhqQimVaVjLcqvjIxFlByeCCZo5xHr6/7LofU6lIX
         mcw9mVzjJeU8SXesWm33Tf3LT5zPXRy0yQp0IK/izQ+ImWNYmVCFc0tSDGjUB1F/jWVj
         QGwA==
X-Forwarded-Encrypted: i=1; AFNElJ98hrcliZRot96gIundjGhSAbvFSJQoYDKjcB2w7rb1Oxs9B5HwWauI2XohtucBNz9xOcvHwxNWvXhhQ3/PAmIJCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlDLcxInk9q6c0edpe8k8GEcEeCwlK5a4nJkzU3g1NaXk2PP5
	u5N9WN5qjyI5zc7MDqqjr0iONYkdVSfIx1Z3/TtRPSKYiZy7KhO2KlSp
X-Gm-Gg: Acq92OHeRTGwjualbiJseKLO8SmpWfu+qqXvw2qf246KtYWaIrP0svUZ4iFi25bZr01
	2xZt7SuYTXBkBwP03DT4zXEEmKE7VIIDNv1wN+TdZwUI7+q+aVh7jpGEZhYpzHaK2za/J6wdGLr
	Nuwex9vjByjdcDvruzBrbvuesqbNlfhHYgZREr2Gw/ZK8209Rbny64VKCmQmrZTvvx6zN8dfKx0
	MmNq7LYaRok25CoKCjatMA8wvBH2Kr6OHkWI9ATNCCDLlJS8Y4GenxtBWBM4dDIXr5GCuA95I0E
	sarYUyfNUNsGUD7d0OqWOVfUDQqVyc6KLS0TY4nj5VhyiinsR68TXcqjdlBcxfGTVqRyURNKXS7
	Z3Zk+SFtAO2UjfRLtfcJcmA0M5NapuHGVdtjLuHhNXiLbO4ojp8jUpyJkE/Qayycw+24QXkiI8J
	PCe2ZsySJd7bSp1oEmM//v9jBMinf7BtQ2hh90MkXsg/M428CXuckgnbneM1wNwZYA7jKw9fEDX
	5U16N5w+MlJC1pEucAhxOGLS1obmVV1lj3dV/EGNcQRy+M=
X-Received: by 2002:a05:600c:c173:b0:48f:e230:c3f8 with SMTP id 5b1f17b1804b1-48fe661b50amr50941855e9.30.1778845926951;
        Fri, 15 May 2026 04:52:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c85a:b53f:fa7f:6b1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm58376215e9.14.2026.05.15.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:52:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Fri, 15 May 2026 12:52:01 +0100
Message-ID: <20260515115202.1515577-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6D9D355005B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32679-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.

The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
bits, however the hardware actually supports only a single bridge
channel (channel 0), matching the RZ/T2H design. The references to
channel 1 and its configuration bits will be corrected in a future
revision of the HW manual.

Update clock/reset constraints to handle the SoC differences.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added restriction for resets and reset-names properties to have
  maxItems: 1 for RZ/T2H and RZ/N2H SoCs, since they only have a
  single reset.

v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
 identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob due to above changes.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
---
 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..cdeca4c795f3 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -30,6 +30,8 @@ properties:
           - enum:
               - renesas,r9a09g056-xspi  # RZ/V2N
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
+              - renesas,r9a09g077-xspi  # RZ/T2H
+              - renesas,r9a09g087-xspi  # RZ/N2H
           - const: renesas,r9a09g047-xspi
 
   reg:
@@ -53,28 +55,38 @@ properties:
       - const: err_pulse
 
   clocks:
-    items:
-      - description: AHB clock
-      - description: AXI clock
-      - description: SPI clock
-      - description: Double speed SPI clock
+    oneOf:
+      - items:
+          - description: AHB clock
+          - description: AXI clock
+          - description: SPI clock
+          - description: Double speed SPI clock
+      - items:
+          - description: AHB clock
+          - description: SPI clock
 
   clock-names:
-    items:
-      - const: ahb
-      - const: axi
-      - const: spi
-      - const: spix2
+    oneOf:
+      - items:
+          - const: ahb
+          - const: axi
+          - const: spi
+          - const: spix2
+      - items:
+          - const: ahb
+          - const: spi
 
   power-domains:
     maxItems: 1
 
   resets:
+    minItems: 1
     items:
       - description: Hardware reset
       - description: AXI reset
 
   reset-names:
+    minItems: 1
     items:
       - const: hresetn
       - const: aresetn
@@ -109,6 +121,34 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a09g077-xspi
+          - renesas,r9a09g087-xspi
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+    resets:
+      maxItems: 1
+    reset-names:
+      maxItems: 1
+else:
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+    resets:
+      minItems: 2
+    reset-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.54.0


