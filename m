Return-Path: <linux-renesas-soc+bounces-14170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A1A57DF9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 21:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FC3D3B313D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 20:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C2420DD5B;
	Sat,  8 Mar 2025 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClsIbTYi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDC192B7F;
	Sat,  8 Mar 2025 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741464591; cv=none; b=VyuWLlAppdzbIUwQSBM7i/yp4QlGGB7UmavcF+tLDtkDi0Lx7+KCj3WSL7afJHq3fa3WstnH4cLkuMt+HbTlTnlAXoMVqjmhlbPhoEemhutGmlfJvEmVFByR53rYLVjzSiEqrFhu8zoCcEzh3W+CWkDoiV3/LT9ya/98+eq5tLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741464591; c=relaxed/simple;
	bh=yrMO4Rs7nN0Cw5lpD3srX0hq0wzTWnSkW+Tc5sFikKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wn/GT2Ob3V8vJG947da+14BAewuv+sYEGlqeX6BvpvFuPhkwUNr5w3zDK/S1Hic3wtzswThs4ol+DRmt1i+OcAyf9G0mXGDRaiCSQXmuqtSssizhYJEo/nttoReQz8BlQspweuwTVIzohZlPg0nNMI9pc19xmj996KDuYuMtlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClsIbTYi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so5776476a12.3;
        Sat, 08 Mar 2025 12:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741464588; x=1742069388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOcWeH9cOoWIoLTarBpOEp4/tET9FvK6ZLczK+JD90I=;
        b=ClsIbTYipw1DW7EuMpE8O4aQn7muyC7wH4yTtMtgrRc74Df/omWqZow1QruEsc7YS3
         9Fg5CfGqAuAh0eYKbh4ngtUB3SsofayaiwjAW6ehxtOETZvj8SEE8Uw1DsKE0Nvzizxy
         e309H4P5Zb8JhDSj+uO5hCRyoVYw+rYNA8KFPl1RtV2B+lJA4o31i1KeEUgU8dAHx9d4
         7OZcILJqnhFLzK2+f2Ox75NgM4u8HrzW+0hCMC1rcMvPZQGmH7UMR1KVNNMcXCi65IlA
         zhe1tETj5uDkhVkXJ3cLN+j0C5aERWAAwfjPLZxOT3p2cAwNSPrBepqjGaYBdKytialO
         sreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741464588; x=1742069388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOcWeH9cOoWIoLTarBpOEp4/tET9FvK6ZLczK+JD90I=;
        b=tkF9aOABmhlejl3sRFD87pnmeTMH0lB+UbXzTFEjTL5fvHdCLli5KV4WaXdVi++v6K
         nUKQnx61rsfxRLLwqZ1AvArUwic+QeeHlu4LUBlUVYBXUoncfcDuGa+Rz4JgnlRc5GO3
         dDxSe65jwSga6ZsbV2VhMZm89tStXw1jrRGu/f+olYiSAWELX/Z8+cC+inJf/uoa/dWY
         3nRh/8a/PDBBCL5nrIEq9vlSfuboHw4jS43dW0sNSpm2iMIBw1QDWiNEpCTPu5l3QpEu
         /0xD9a+LJvsdE35qVRzjQ8QQbvUfGHSafqYYOuxxEZjdALO1xIVNX8at7pqVlY9LGd/4
         RidA==
X-Forwarded-Encrypted: i=1; AJvYcCVsvsvvrM/naPn0oTRan/VixtQm5ZHpdseEXLzikh/6chMw7iG0/ZtZ4ziC0TpXt6w9lVFajg4dSYOOcSYxCSr9VR0=@vger.kernel.org, AJvYcCXCSIaSVUxF8hAIWJjKyuTkZO9cLk22EOYCqwRlO+TO/TE3/rp+jt4VbZmvDDpm3SCxJ8vZBX+w4PMKIAbs@vger.kernel.org, AJvYcCXVvKFsD4pW0bBOONvyhOUc/IQJaxzUQh+JxNjSVgZNXpZYAQuFKNWIT5Ac3UqECHLjhCr6lUvWfr7n@vger.kernel.org
X-Gm-Message-State: AOJu0YwNoC+4sK34UdaJy2/P61lK/+5snlA84GYmYnwe/MTdKSgZS4+A
	DpaxcETD7NdVF5HyrKXfSKKSyFA3AV+kyGb4bDtmNknQL369vNfj
X-Gm-Gg: ASbGnct6u5O3s1Hv6Fe88Ug23vhml3HMt/C5PjBhoXruppL4QNeTRf1VUZgJkt48gRu
	Aj8+WhdjeiXZ28Kdq0zS8Josd8PgeaGTQQSH+S+EeufFmK76O00PvZIYWD8S4rpxHn15xX6UzSG
	QwVADtAB/VuJnrqDcOCj5FZt7VPJbk1xejojPahMcDR8pBk9zWr4+/WF7DBHIt3K5uMh2a8Trug
	nw7ld6MkAZdHMZ5/Xd6oMOl4h/ZBFHG8EzCvfJvYf+nKAHgIX6vksFmqGNE6CYdh1QvPfiiNzGP
	c2143P2JJrYjVgkKbSpcVUxI//e0K6kCX4v1UW25DBF3zaKBfQFxAOvZRE97u/PFjKXJa1eU2A=
	=
X-Google-Smtp-Source: AGHT+IFefOxAX6HCW4D++sT8bH2dVsUuQLZRT7RGCKiv19uqFJQMJHAvvDPQ3wDZsTf/Dgjn0OC1zw==
X-Received: by 2002:a17:907:3f1f:b0:abf:749f:f719 with SMTP id a640c23a62f3a-ac252737f80mr996212966b.7.1741464588029;
        Sat, 08 Mar 2025 12:09:48 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:238d:d8a2:7f2b:419e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac254346ce8sm340766466b.177.2025.03.08.12.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 12:09:47 -0800 (PST)
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
Subject: [PATCH net-next v2 1/3] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
Date: Sat,  8 Mar 2025 20:09:19 +0000
Message-ID: <20250308200921.1089980-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250308200921.1089980-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Note, for this change I will be sending a sperate patch for vendor
bindings to add constraints.

v1->v2
- No change
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 3f0aa46d798e..fad0d611a75c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -114,6 +114,8 @@ properties:
 
   interrupts:
     minItems: 1
+    maxItems: 11
+    additionalItems: true
     items:
       - description: Combined signal for various interrupt events
       - description: The interrupt to manage the remote wake-up packet detection
@@ -122,11 +124,11 @@ properties:
 
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


