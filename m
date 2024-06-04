Return-Path: <linux-renesas-soc+bounces-5832-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 658CA8FB9EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFAF11F26722
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B4114A60A;
	Tue,  4 Jun 2024 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+nJ/McF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF59149C7E;
	Tue,  4 Jun 2024 17:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520750; cv=none; b=DxsHVDnRyPPWZtjBdHlCdQ7EOQKG4vl0X29mGFUKBK7ReYMiWIVMNMDpkSJDUKoc0TkidgYOUxpjbfo4GDYZmLQoSvI1r2XajtvylDkARhD4JKXKFtNhqQwhzoOhYwYXGSFnNhx/JcUaT1nzR51nHPX/UwPb2e4kv0tPQM+rNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520750; c=relaxed/simple;
	bh=BdtUkINd2898uGY8MVy5MoOpjeLTkKmcgrIY3WZHniM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VdBXfglETehD7YfI0TChP9a9t7lFF1EmbZVJ3N2OPunQFHXwuXKOfGjrdu5rW2MRp0UEJDAICSn0OUUO4439nayAY2zv6/k9l6hvFMnh6s4mM+I/vthEYzUaMRKMQZepSFy46haRPNNSGceD4/olsqOFwgxqFB8ZP4OKybG8ZgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+nJ/McF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso3047742e87.0;
        Tue, 04 Jun 2024 10:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717520747; x=1718125547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0qGKDiX/TYXDKoMBt+mb5N3Bx9uezd6zh4HUi/zIvI=;
        b=S+nJ/McF4vHTE+NEPMyCO1e578uz2A9qnqlYoOzddQGNyPf2aNPLd9M24P48SJEkTa
         gHaxD0pF0MS3aJthJ7nla0YDluoMMoRA6cAUhWZEBmUNrb3wS5bIGxx7g8wetOhRp8C4
         MjUiCAmMGL07enVus1syPFBiTQkM6fZWZLl3jPNzBP2lCT8B2DtZaSCwUrNoK2Pussk/
         tYHFTMR5GIu1/c8M1zhIaaiMyVdfjJ2vdPahezv1u4aAtjrxLIwTTmWVSh8M5jgw1AHg
         wdcg8Qu43zBNEfIxyNmJLUyudMuv9chzYEG578eW+TAqxihq/OnJxA6v/5ooKW9KmZM9
         oRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520747; x=1718125547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0qGKDiX/TYXDKoMBt+mb5N3Bx9uezd6zh4HUi/zIvI=;
        b=mu9qNIyoAizxBbBFYQ5LD7LtMQDQ7yPQkRGVBXHtelI3tt7n4VbqHS7/pHwgcUJ1hb
         eINN76Lvb3otFncDZzxgqi8yjQ72Fje0u/d3cP87lmuUcgCqIdWxgerC/X1w2YMy/4Wn
         /iWCDjLUqCfaQpwkHSRFN3hVTT2UZTTjcMzSo2EyT3eDZjEehGk5ys/TvwN98EL3pRyW
         U2Wkg2eHmt4gBQtaJEh9z/9/vmhaED9kJCkpKMIo5GfdJpHa4q8O8BkVqiy728RFXdkG
         zM8MnJbPHNtKjbY8mw4QhcasC/oIlqCMUQbaf0Uro+BqOb82mEXaRBOrjjft6DqF57c0
         R4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPm/pRurXkM2rlPFapIDmLFRa7+Gvenb2ZxaLMuNRJ6YKHvO4qIDezgPHS2Mn5BXMN5VXZzdUH22lI8X7ZoKvPsH47iXwLGVGoToaseQqqfVh31lPPhcMOco2GFjiGy9/mLjqvLEvR1q1U1BH/uOnM5PocwICP2aAMwK9LXJT/WFCg7RGMKWM0CrQu9aUO+soJPv23k3rj+bnZs6a+tMg+wAJ0eNFxKNJf
X-Gm-Message-State: AOJu0Yw2lgxHOb93BF9UkHSGy/kEdFJsFvMFwRp+3Sar1I7VfRhxqsiG
	EKDRRkpo/3rn69HbMhLTnwzfE0x5SX2uTw4EmvxgUViLNl50Sbyt
X-Google-Smtp-Source: AGHT+IEdznc/06tFtVxgu3Tt2Ks6nXKtgTC5fEd4fT7CgrWMOIc4EGyOD7SpMYpsY8DEEtw/HSCGrw==
X-Received: by 2002:ac2:5593:0:b0:52b:9956:541a with SMTP id 2adb3069b0e04-52bab4c967fmr108108e87.21.1717520746861;
        Tue, 04 Jun 2024 10:05:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f2asm12244077f8f.3.2024.06.04.10.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:05:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 4/5] dt-bindings: serial: Add documentation for Renesas RZ/V2H(P) (R9A09G057) SCIF support
Date: Tue,  4 Jun 2024 18:05:12 +0100
Message-Id: <20240604170513.522631-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Serial Communication Interface with FIFO (SCIF)
available in the Renesas RZ/V2H(P) (R9A09G057) SoC. The SCIF interface in
the Renesas RZ/V2H(P) is similar to that available in the RZ/G2L
(R9A07G044) SoC, with the following differences:

- RZ/V2H(P) SoC has three additional interrupts: one for Tx end/Rx ready
  and two for Rx and Tx buffer full, all of which are edge-triggered.
- RZ/V2H(P) supports asynchronous mode, whereas RZ/G2L supports both
  synchronous and asynchronous modes.
- There are differences in the configuration of certain registers such
  as SCSMR, SCFCR, and SCSPTR between the two SoCs.

To handle these differences in the driver, a new SoC-specific compatible
string is added, ensuring proper handling of the unique features and
register configurations of the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5
- Included RB tag from Geert and Conor

v3->v4
- Appended the interrupts instead of adding SoC specific
- Added restriction for clocks and reset

v2->v3
- Added SoC specific compat string
---
 .../bindings/serial/renesas,scif.yaml         | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index fcead2150874..afc7c05898a1 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -80,6 +80,8 @@ properties:
               - renesas,scif-r9a08g045      # RZ/G3S
           - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
+      - const: renesas,scif-r9a09g057       # RZ/V2H(P)
+
   reg:
     maxItems: 1
 
@@ -94,6 +96,9 @@ properties:
           - description: Break interrupt
           - description: Data Ready interrupt
           - description: Transmit End interrupt
+          - description: Transmit End/Data Ready interrupt
+          - description: Receive buffer full interrupt (EDGE trigger)
+          - description: Transmit buffer empty interrupt (EDGE trigger)
         minItems: 4
 
   interrupt-names:
@@ -105,6 +110,9 @@ properties:
       - const: bri
       - const: dri
       - const: tei
+      - const: tei-dri
+      - const: rxi-edge
+      - const: txi-edge
 
   clocks:
     minItems: 1
@@ -161,6 +169,7 @@ allOf:
               - renesas,rcar-gen3-scif
               - renesas,rcar-gen4-scif
               - renesas,scif-r9a07g044
+              - renesas,scif-r9a09g057
     then:
       required:
         - resets
@@ -210,9 +219,30 @@ allOf:
       properties:
         interrupts:
           minItems: 6
+          maxItems: 6
 
         interrupt-names:
           minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,scif-r9a09g057
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        interrupts:
+          minItems: 9
+
+        interrupt-names:
+          minItems: 9
 
 unevaluatedProperties: false
 
-- 
2.34.1


