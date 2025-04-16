Return-Path: <linux-renesas-soc+bounces-16056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C5A8B6F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95B703BF8F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B10C23BF96;
	Wed, 16 Apr 2025 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo1Q/EL9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E722356D1;
	Wed, 16 Apr 2025 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800028; cv=none; b=f5DBxNS5dDIWgwKVUYPrPdfyvy4tZRPllVigx9dNhWIDqLGSFPzqx2TwoqJGEQVBtXdLfTfimSfThUWQVHO8Sl/QQDXNQ6deGE/zeEAyNvC1ICznugUeqjQete5RlKaTimtv+6vVfifN3IYXtSmSDcvwgt8450QhhxEK5rwXyMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800028; c=relaxed/simple;
	bh=JV6/Zd7jmLkMX3zv5Il0vw94EGousU0d+tw5mlhV1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmnATk8w7obTuSiB4dKzSIUpDBVl3Gl01sd7Uxwl3FIhEnZ7mJz+dvefXfp0z+tjMfFQ/D1TRzXf5yUCDskAYBTxsTo/H2o8yxvt7CD17yIxuSf0IoSdmyYznCEgD60+lzr5zyqkEPqEHQSJRUBN/DUUpOTT3IQxFajO6ibtdVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo1Q/EL9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so4193626f8f.0;
        Wed, 16 Apr 2025 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800025; x=1745404825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=Yo1Q/EL9hasJbbmtQL588/TTznKcCtaowlZ6DvPP8nKqsxw5zIE4j7ugQjfnJ+ZwL3
         uCUbkrae8rscKYbr4EPNZ7pwtiMAbvOlMRWB5Cv5BrGjGT1JgVi3THOzny8UYqw78071
         mejtkBevv4v60FBoslVZQoylc11r/KU7HY+2HgHxEGtUQxamCrU07+4ifRYUXT1Cf/1w
         jlNHRZg580QOCE4i/VGw7AStfy/uxlK9n12X0kDRnRvOHnyjh3y7+O6O0lzaD5bDQUXh
         4jzs+fzaKDKYvTDP/Wl/CI6uqBpovCoYdURuzdbUkXVpyXR8eCDOcEXw11eQKlMYAegW
         DVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800025; x=1745404825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxtx+wYgnayT5+SYG5cHUYe65nSDdAbTREq4fQgE5Vg=;
        b=CKFK8fQYKCM3yMugWltPS82Z5EHhPcEUdqoLamb9zyrfm2zHHSft89Y3AZoe36DgSm
         HTKN7cCKIo+CD1gBG+Iej88CCUnbDjB5E313UYPAIJpW/PazSba7oTgb5GVaxcK4u2YF
         +8Lv8HvovZZ9G/471MM17+/0r8ruR8B/XBY31f5DhXUIgOCxdVsaplo3UqJbEgvQoE2J
         oqv+CN8AwjgaN5E2MLBzaqktJa7Ve5d7dCqRtO6jmvsKKkHfc3zhv9IOV0j4witrNOJM
         Uq0ba2XtpHDi5hetfECCY1cAe3Y5ftgDka7H/f2ge4a6aig8EhPnWEPN3qL/KIuc4gGi
         E4vw==
X-Forwarded-Encrypted: i=1; AJvYcCULU7QO8q+9pg3T23YNzMWo0SvizEarHsAT9NdvJIIqkWpb3fQ6ufKbZZ/oasmmrWK9fWeKh8gqHqp0QKgcviVHa4o=@vger.kernel.org, AJvYcCUcL4mryN/mcf0whS3WP/npXHNn+PTa08VpCjRQ+85p553T73eOWli0chD6FH2j8DXG7wwjkB5XdIU0w24b@vger.kernel.org, AJvYcCXSvraZCchMtCBHF978vl9dr8vhZLZFRzYaggFrSMCG0YYOrfn1CuApDdwfzotDFsIEw7VD/H57PfO2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQo9i9eW/+DcuMeuXfs6ZHgjsElyl0at/EPWBHhmTao3lwmal6
	MuQjmW2n+4uQF5cGbJwjxBtx8wKo9BfFjVQNKvySg40QhO1hGHjz
X-Gm-Gg: ASbGncsKfBcP0C2W5BrRTzSNywAcZe+AVd73o5dYzofnWRbEoa96W5hWHAu4JnwP1PP
	Z8tEEXO+L8AtITQXyAxJkffhE8hsU8nsrgF2WugYZPWcV4w/MDzbvPa5nFo9vzLBfOmStPrynLX
	9E9+z+gTQStAGBcwB2gy5Zq6ss66vJe64xVdxPZPXMleSD/xcMZhbgrZ7XUcedqF1ZLGNMO+SQg
	PnI2fu2mkveqgx650LzDrVBHvEQCKu9IhkW/LgA/1a9duhqyVwUxNNRltyX11aO4CItLURLK0kV
	Ikz8lNO2d0tJCD/59pK5ys4QCzhPEMPwHoVK8YOLgSxjwXOE919+74GZjxHFMaWofP0e4KVYy75
	G
X-Google-Smtp-Source: AGHT+IHjVa5WDXcZCkMbAi3WRxmtcXMiaUdkFnUUCMfrR94dmm4AfGyFddim6DuqjvutFE0yMpkmTA==
X-Received: by 2002:a5d:5f49:0:b0:390:eebc:6f32 with SMTP id ffacd0b85a97d-39ee5bade02mr1377171f8f.48.1744800024211;
        Wed, 16 Apr 2025 03:40:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:23 -0700 (PDT)
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
Subject: [PATCH net-next v7 1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Wed, 16 Apr 2025 11:40:12 +0100
Message-ID: <20250416104015.47788-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


