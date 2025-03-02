Return-Path: <linux-renesas-soc+bounces-13863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB46A4B3F7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 19:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8A43AF814
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Mar 2025 18:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F61B1EB1B7;
	Sun,  2 Mar 2025 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KF4xEfKR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF1AD39;
	Sun,  2 Mar 2025 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740939514; cv=none; b=YfOWRL6Mkmmio08+P9r19m36dqJ6YvXVh949PQqRhZUgH4NOizaCUzqNhByJ5KfYbgiLwn6DCWI6dkt7Z/CBgDKrn84FqdQfTJTHr9GCJoB5Yix3bHuu0IT+5MJhLfZ8/kiyDlde68Krjoyk3zh9vKJvPBhaMkUbDQ2ZUFX2Tgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740939514; c=relaxed/simple;
	bh=IrMxo0YfPVIor62W3S0syRKacJWuzfkxP8QvrpFbPes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffCNr/iTl/RBexx/728KZNOzbB1Gn9PBwqTi2Tvqfw115YdC4sRJyiTfJGz4EW2sRiXhPpXhkdPkRiyxJJLXFHltYXNQ8gF2Ioq90kYgQhj3ifb4v8tO99JqwrOpmXfrdFWXATkvUBR2abxSUtOvTk/k20oHW+HC2NyOhLvs5yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KF4xEfKR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso23415305e9.0;
        Sun, 02 Mar 2025 10:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740939511; x=1741544311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j47nMLSU8rIoIgff3UiKE+ej95h7KEUzPY8Pc16hcS4=;
        b=KF4xEfKR+4e1X9FIhJe47dShmR6H12p4E2w6XjNX/curlisgzxLKjoOfGtOTAJbz1G
         gpGnicQyUoGULIQn17hIBWvq0pDFz8ZSxN5racWLa2wEI48zjbPOg0eyZEdTpdrULe6i
         4zkkfYUGnRDJRh0ORGxXG0N9onzTui1IZFacLge0HU47pczyLpsJSLKzihesdP4DUpFj
         cbstCFYt4fTIZ0tosLBS14SyzeG6mrAXP8dR+DkasIqWBJdiBUB17SblsruAGYSBtI9g
         81ZJXH6aPCeHhHyqpkoR8VlEXi1TPUyR2FrhBjyxGJM3JkIFZSQ2m0udjQf976H3R/hm
         XcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740939511; x=1741544311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j47nMLSU8rIoIgff3UiKE+ej95h7KEUzPY8Pc16hcS4=;
        b=NqfLOTq0a0wu2QOyOvcCVN5LmLL3EunhwK6AjjgKWL1Pl+lVXxyg54JjlkSDG9NqTA
         ujKYYORe1n6S48yJmZqfl/ILZFJiPm8TmTRJXvZQOyssJtQ2fnR1AB9FkwlrTMsF5Glr
         uTaiO29kmAHqsgwL+foIBnnDv6+5vpvtJ/Y3NZ/kzmto2d3qLPCrf0D9TIDfipScP176
         KWD4y/ICiIB2uXbzWfU9oFwomXKN7Ksgf8s+kCVPfjUxdOKFPyeCFDdl6Tea9sFRDTdI
         VTBAVMQbO4nEjmGNLSr3w21iGGkt+fM4tSPfwoEXnz9pAshZFpTYY+X30eIDC4aC74UL
         iAyw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJlt54wDo2NEfw9eILe/PM4xUGbnC55zuUh2xU4/2KFg1KLA1EP+MLeRnuNmSpRrkbKGFWeIoc7vW@vger.kernel.org, AJvYcCVaVa+lX0Q85Om7GZ+4MmYAS7DuTLIQfV4GevKLD0OA5uRzhvNldLqKaEHwP/9gSpElW+kW3/W0gWJSS5lB@vger.kernel.org, AJvYcCXrgsmLwCpcPZgdcpEKFxLx2IxEI/I9Pmn6tYO0+he0qiVfDXJ3OcPOQBB+wb7e6Cpys/WPAryBegLhpF+Duwsb57w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEY9dlRHduKXWMEK3VNWUHKBe6KBHCogjmhba3f+gkjF7YHes
	UOTT4iCBHZtTGfN/iis6g7ErMTG/Vck0uEZHH+a8IVEsFtVFmwUM
X-Gm-Gg: ASbGnctItjEj2/6KcjEujzzJSxv/z87ULO4w38P9CyMwMujGkvYA6hHImrgwp0OeatB
	bchjOz+vEt7nsZ4libpCx5nw/ZCfoVKh/fHa6LI0cA5EkorIrhFIMMzdZg2eLIPCGWoH+JNzSqx
	oTMfczd62ZBRRu5wyApP+/R9zhpqr6ahFvVzDA+zbJ8tnpAClcFXQdKVgp06PFyqv/7tS1ApRMZ
	KEaMuQ8/jInPJccqaMiCmuTjjuVZlI4Dm479fkqg+e7zbO+Rp4VysYPRDe55J1J1HnGetqOAfYR
	aI3vDFe8qTqYufjFYTw0PSpwQ2YShMEK6Nvs3yZfSNFj2e1D9KYHiR+kv/yCQPolBlgjhsoxwQ=
	=
X-Google-Smtp-Source: AGHT+IFu3mxyL77c5N9IhPZEiW2Zs7DweCJb1FfwiIbHmb0LVYdJXSoXpFp3B3YNU78f6FxwesL4Pg==
X-Received: by 2002:a05:600c:474a:b0:439:a0d6:a54a with SMTP id 5b1f17b1804b1-43ba67718bemr71965595e9.28.1740939510732;
        Sun, 02 Mar 2025 10:18:30 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:989f:3a70:8430:2268])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc1b5db02sm9552655e9.19.2025.03.02.10.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:18:30 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Sun,  2 Mar 2025 18:18:06 +0000
Message-ID: <20250302181808.728734-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to accommodate the Renesas RZ/V2H(P) SoC, which features the
`snps,dwmac-5.20` IP with 11 interrupts.

Also add `additionalItems: true` to allow specifying extra interrupts
beyond the predefined ones. Update the `interrupt-names` property to
allow specifying extra `interrupt-names`.

Also refactor the optional `interrupt-names` property by consolidating
repeated enums into a single enum list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..85d499bd49b5 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -110,6 +110,8 @@ properties:
 
   interrupts:
     minItems: 1
+    maxItems: 11
+    additionalItems: true
     items:
       - description: Combined signal for various interrupt events
       - description: The interrupt to manage the remote wake-up packet detection
@@ -118,11 +120,11 @@ properties:
 
   interrupt-names:
     minItems: 1
+    maxItems: 11
+    additionalItems: true
     items:
       - const: macirq
       - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
-      - enum: [eth_wake_irq, eth_lpi, sfty]
 
   clocks:
     minItems: 1
-- 
2.43.0


