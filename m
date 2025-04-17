Return-Path: <linux-renesas-soc+bounces-16104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A50EBA916AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 10:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B41871618CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 08:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C4A225A36;
	Thu, 17 Apr 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeXZA572"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3683E215F4C;
	Thu, 17 Apr 2025 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879321; cv=none; b=C8ZOsRw77I+lmQGC56yEa+iV/AZu2QOkPXsLrR9mPkAegFVKMfT0cXIm4AKALtuHGTGlEDANN9polaqTTrusCwnKiVvprkqoLrPJOgs11uVPQrdGPLFDLHJ/QX8jq3jKCrzAcvUF2XeVYKVcNqdtq5iPANQJoN5+OpVA+k5mOis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879321; c=relaxed/simple;
	bh=JV6/Zd7jmLkMX3zv5Il0vw94EGousU0d+tw5mlhV1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovGrR4zAEmRTG6bWsNCqQXoMIShEgZ4VNk1cJoefZ/SCUlCGBtlo5JzMbxD965KP9j173+3D9QMAOjqhL6cTZrveEgDe3mao8vIbn3XRVX2VmDsPVWhAHwMCgnZLmrcL191Sgop0P0EQNtx/fWCt39WB1hUJMvKVq4mADvwhp1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeXZA572; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso350719f8f.0;
        Thu, 17 Apr 2025 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879318; x=1745484118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=LeXZA572uvpTU3lE2PzpDdrW8NaWiv5GRVqRwXH4zjITmzvNJiX+0Kql2W5PkyB/+o
         /xE1+X847BVIeZrljYZeb6X+GzgFHVWxcI2TLYHQTZZzjzhEpfTLIuYMcxTfg5mZiRfY
         /+kG2NdaCnq2a6WJqVBFocPAC5JasdLEob6sw9oMGc2+BqYOVCqH4AajycSRpeGhSzNE
         XI2kVBX355djb0NKSqG0oLnXjfABAz12fcPUCbab6JgzzHuwLc1O3d5iv6/c6/mN1qkj
         kl7+niH0nO4OFwKByRvFRwJXqAbohHn6E/7e1fTblr9tUo0XeEUhdBsVmoBhMOVGV1Cm
         3RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879318; x=1745484118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=bhJJvwi7o3JWfx92mNoBztYdGm5bEMx0L7SC9TT/C0RLhITMOJrpw7WBhOOQr9VX9p
         UE7EwQFONUaGALf1Aus7lOr9xZ/nZimj10cH3sva6mqePFHQt5xxmKst5qZUI4fYMmO8
         uZdhZIWv/MNur2BZ9qVKN+zugEkaJi30hOh5jxHuM6zbQp0dt1hYdsr/bYbbOajTdDQy
         YupIL2dzBEsxtcUnulHvsa+KAzgiH/SYePD475rodBaPB6+Y7gV67EtLCPFB/yVUB/Gl
         ry0gf1Kb22ilH7uoOV02jQJYHt1vzGpYDy1Z4FYwZkX4o8Wf8w+FeXKWA4QkEqUQBU1Z
         TnGA==
X-Forwarded-Encrypted: i=1; AJvYcCUN7J32VcUHxmEXoQDycuLkkBxqJ7mKT0jPnim1ruu7y7LtWAIpkXZR3fTNfY+uSq55eKBrEZAEfZ8ihUrp@vger.kernel.org, AJvYcCVJ+BiwNapotT5HXDIKd0XV3+qVYQqxaIxxVrbIVPWsMMaANubarSH2kZ1hNCwPZxpHr9/HwrNb4e/B+rKBqB+5cYI=@vger.kernel.org, AJvYcCXXtL9IQ52fC1DX6AhPgeVd8s3Iuywls55rWutaw3M3byL/G2zMRDD9PP+VgEupVRNwSdf2ZGDBRU6W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5x+USt0Eq4SW5KJBozwAe+x5h0Q19Bwq/FZWs7lLiZHNjlCfQ
	IRpZhdg1Ypz6pZTdD2t9Hstcgi/chC7LKhKsboBKLrtEkHTeBoYx
X-Gm-Gg: ASbGnctFjV2bsfbuNN3d1giTcqRgi1tCuDsLqDBOYzza+vlPf/k7wj2SWAuj6U4cL5J
	MiTCOf44WY+tp5rgefPMA5Z9uYaB5gmyTe3JaVUgQifIfOGqyVGsihwwjDx5lyQP/YkU3uXQiuw
	d/6XPemhTAzAP1c4FiRr3DC63f65pWpTLv3wiKI0BVKGtmr2zMX3jkHOgPLY/7XgtZaaxo4NBVZ
	PywTaqFGD+Rp+84u3AcjDVp2epJfgHeZtyvQK/ubvC8/TwvSa8DP0RfNhwFuTF8Z6SQlIsI9D5g
	/NuNfhjF2MM3W7KJrWL2b4TIhz1DC+Y2xqSqwJDDRh5UKjxbrc5E5h6wi0QthnkF
X-Google-Smtp-Source: AGHT+IHgPKXoeOtA0iIqRJCI/YC2Q+S8g/TGS8VwA4DAmEhyGIU1Lls6vFCmEDBaic4nvV7UL9x/mA==
X-Received: by 2002:a05:6000:1449:b0:39a:d20b:5c25 with SMTP id ffacd0b85a97d-39ee5b2f6b7mr4334968f8f.26.1744879318069;
        Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:41:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v8 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Thu, 17 Apr 2025 09:40:12 +0100
Message-ID: <20250417084015.74154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 11 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/V2H(P) SoC, which features the
`snps,dwmac-5.20` IP.

Refactor the `interrupt-names` property by replacing repeated `enum`
entries with a `oneOf` list. Add support for per-channel receive and
transmit completion interrupts using regex patterns.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..4d4fcaeca8a8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -114,19 +114,25 @@ properties:
 
   interrupts:
     minItems: 1
-    items:
-      - description: Combined signal for various interrupt events
-      - description: The interrupt to manage the remote wake-up packet detection
-      - description: The interrupt that occurs when Rx exits the LPI state
-      - description: The interrupt that occurs when HW safety error triggered
+    maxItems: 11
 
   interrupt-names:
     minItems: 1
+    maxItems: 11
     items:
-      - const: macirq
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
+      oneOf:
+        - description: Combined signal for various interrupt events
+          const: macirq
+        - description: The interrupt to manage the remote wake-up packet detection
+          const: eth_wake_irq
+        - description: The interrupt that occurs when Rx exits the LPI state
+          const: eth_lpi
+        - description: The interrupt that occurs when HW safety error triggered
+          const: sfty
+        - description: Per channel receive completion interrupt
+          pattern: '^rx-queue-[0-3]$'
+        - description: Per channel transmit completion interrupt
+          pattern: '^tx-queue-[0-3]$'
 
   clocks:
     minItems: 1
-- 
2.49.0


