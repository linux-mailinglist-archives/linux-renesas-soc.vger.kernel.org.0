Return-Path: <linux-renesas-soc+bounces-5836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA48FBAB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C0F8B2B576
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE7114A0A2;
	Tue,  4 Jun 2024 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OE5z2INF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144EC5F860;
	Tue,  4 Jun 2024 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522639; cv=none; b=vBSBsaN6+aP/0aWtPcASQNwZh3jf1lp0zbwuUvk6+YjoB+angU2jDL0kW52Q+NHrYnysZIZgw6DajqCaEcLjuX/kwwj1+SjTgzwSGHITspg6uWOTO4APtsiMzmzypzYQjrzAXZ4lTyxrHmNF70S8ishKcqOAzM7JfAubERLa88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522639; c=relaxed/simple;
	bh=09624Uvl4RmQCINwToZEhRJYPakiiQvYLm0KFzqnoLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uaZ7mOrPsbLe2Vn9nfLOjE5A7cQ6IFeg/zDzMe2UanJLdewipx1dpm7ZeqOVCQmOhxWcsy+MPSY0F+SgcLFZseIeU6MRi9xVNNXhuhrUXjbDIVtxNQLq3N2BY6NOTqbo37elmyQPKQsutVG5JrAbBGsujUWDJRFt/B6ihyAnmYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OE5z2INF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42155143cb0so5652215e9.2;
        Tue, 04 Jun 2024 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717522636; x=1718127436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jAQz1OzNuVRV4MMQBkIujhUPrDPoUbZI6wfidAz600=;
        b=OE5z2INFDpDlEwv3xAcKEcE1js7BRyoh4MGV3qr4N/u0YEnmuulYHRK5HtsgFgVm6d
         I3ATcGnywE36ckqyJ0DqFIfs5NRdMj67/yQkiZ95tX00Yd5osuL/B4f/QeY5+K89j/9z
         vacf/wgSNoJcMyxW4UIh3m697HNy2WlsLtRJPEnvt1/b/apGxqZV9Z39G56t09Wylg5S
         pPuzvRsxJ3a9aYaH1SB7ua/BNz/sDMtoiQavwXmg62MVAGSRXqz8RGpR5N15xFl2P8mE
         pwdQmXFO++LjzlHKkRurdoa2qwcVX4tFHBtgR4suaZiyLh1eQbjNt1FeojWlsRNTANV9
         8Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522636; x=1718127436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jAQz1OzNuVRV4MMQBkIujhUPrDPoUbZI6wfidAz600=;
        b=J7nQR24+36+D9G7JUF9n3rfRtkC6r2dHtQarLXrP5YXKk30F87RPOUKoq0Ji1Ib2w7
         H1X3dGllhDu24vlgAo+y58GAqVGWzn9JlROkm7YH7kE16TtDiuFk1WrmSaBD7WP7Kd+J
         gZZkPwraecEeiumelWDZroFz82qxAq0+gDqNzIBjyCM6+MMylmlUYSZSTM/Q6MMXRNg6
         UD+3kZW7IOl4ULkmAD5+1GvBFSGa9bHD7jT/3nsF5Yq9etAKlPQ/1TzjYHtNIUTowmAK
         1XJMLMmEnuDpreztYvu7/sHjry0pClTIVSoO9Kk0pbXFk21Vmo6ctizrSZhGv8SZHkT5
         tKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4aMZeoc5uIkSBfChf5obwAC2GCwTg868ePKWT3Nl4XruoOYWEs0xxFMft2szl4fBq6ZcKYcjdtZMflxtZ5JrBbDTfBpPHVsp8DWbB4dTi+A4TcsA+cywiLvaAwe/7T2X1gyxBBa1eVaVl9VHv
X-Gm-Message-State: AOJu0YxJ7xiiAjS2nnV5C3nnCMgBwFcYQ89ChSDy8pA8lqTFAoUkPQ+5
	dj2Ynbldcwak6N/dKCx4I8vwZML8GQWNPlqsF2TXII4N3XcgTA1O
X-Google-Smtp-Source: AGHT+IHB1tn7ck8JPoGD530Qb9woIIz7zTI/7EqwQtLtT9qBSg0rq9BLfZX/k7nHm8//up6dmU8xIQ==
X-Received: by 2002:a05:600c:19c6:b0:421:1717:2cf0 with SMTP id 5b1f17b1804b1-421562df8e7mr3129345e9.24.1717522636317;
        Tue, 04 Jun 2024 10:37:16 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213c6629bdsm87844085e9.8.2024.06.04.10.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:37:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/Five SoC
Date: Tue,  4 Jun 2024 18:37:09 +0100
Message-Id: <20240604173710.534132-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document RZ/Five (R9A07G043F) IRQC bindings. The IRQC block on the RZ/Five
SoC is almost identical to the one found on the RZ/G2L SoC, with the only
difference being that it has additional mask control registers for
NMI/IRQ/TINT.

Hence new compatible string "renesas,r9a07g043f-irqc" is added for RZ/Five
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5
- No change

v3->v4
- No change

v2->v3
- Dropped items for rz/five
- Collected the RB tags

v1->v2
- Dropped the checks for interrupts as its already handled
- Added SoC specific compat string
---
 .../renesas,rzg2l-irqc.yaml                     | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index daef4ee06f4e..44b6ae5fc802 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -21,13 +21,16 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043u-irqc   # RZ/G2UL
-          - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
-          - renesas,r9a07g054-irqc    # RZ/V2L
-          - renesas,r9a08g045-irqc    # RZ/G3S
-      - const: renesas,rzg2l-irqc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043u-irqc    # RZ/G2UL
+              - renesas,r9a07g044-irqc     # RZ/G2{L,LC}
+              - renesas,r9a07g054-irqc     # RZ/V2L
+              - renesas,r9a08g045-irqc     # RZ/G3S
+          - const: renesas,rzg2l-irqc
+
+      - const: renesas,r9a07g043f-irqc     # RZ/Five
 
   '#interrupt-cells':
     description: The first cell should contain a macro RZG2L_{NMI,IRQX} included in the
-- 
2.34.1


