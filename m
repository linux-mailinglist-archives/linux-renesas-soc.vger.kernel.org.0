Return-Path: <linux-renesas-soc+bounces-26519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00817D0A9C0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57E6B301736C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD1835EDA5;
	Fri,  9 Jan 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Trc0yEKm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394835CB65
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968585; cv=none; b=OKISQHotHAYjF6TEu/KS9NpefzLg1Wx573s65Ke+QnABknIzKAaeLHT2otHQ4yxE+te5ATH4ypybFs8i10zhWBmvPAv2aHz2+sL6bBpB4Ta8//nyM7sXzPdG9vQGKDLlnBQDm445sWl1vzAsLuYmNQMheOcT9Gr1kjdQxOdVHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968585; c=relaxed/simple;
	bh=8StS9AudZ5ELgzUszlHjdxqc4ZzB03vmI08McQOGmMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBNRLmxqv7dingupvlzreS+ZGReuiiBoUnbS7Zo9DWNbs0xGgf87cfpfQcoVbsctzHCNBW0EQzfxBh4kjR5TLUx/uT5Qdf1nPh94dJgs1HtsKm7+m5z5wCqKf5tq6lnG+NGMykFOlnsSH9qK0Pd810w4wAArsTFIvdqIEdNNnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Trc0yEKm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso26048645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968582; x=1768573382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/U8h75XwUt+UA3XN3Z2NnuJmQpm0jrMH1mHKDyxkLA=;
        b=Trc0yEKmRuxqTIE75tSpPhD4xBAcDji9Emz99Jy9mWPwQv2FR8EJVXLwN9wZn74XSz
         PVQJDmLpjEi/THFHqk8b8nwsoY7XApsxY6ObnnrMlqVXqH7CY1X3yJ59mXD50D4E8S/F
         6spbjgsa+nbZlL9R0VxiRTpX28KnNk6Ds75LMJnkZT+Z6YI2nTPG8LrBbf2E5yLlLdoe
         b03iFuaiQhI/pPRwW1UpE5KuaLM8oG22PwveS+daNC4huY011wPY1gscAzSuklTzgMz4
         NDH2ChdMMxGp8AWbwdOKFnoZ2ufZPfNwbUnItf/5ED3c4CF5SM9j4ocWD3/2nW4WPJwm
         B78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968582; x=1768573382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/U8h75XwUt+UA3XN3Z2NnuJmQpm0jrMH1mHKDyxkLA=;
        b=Huyw9M1yznaH1SyVTlPKmkFYH9vzWEN05/TBQXrpTjrdUc8EUQ4E3ZHjIDefUzFI4h
         cGrf0ogMj6rVRqVwTuKXVrfT+eyAKZMn8snfAoKnlf67QN6B5OHIPzNKdmssvf47XRCr
         ybbJ4xUMdED6ZJcUE6beWNK4yWc6rafph832bHV/Akjg+trGH+qhw+A/7RRLORbNwGPS
         pZL/XPJ/V+ZDycc2UHK2GOYeITWtJEN+tpKS5c4UWWJTZeVv46JZ2oZdhmgx9U1btbvo
         s7AtiZPELODh3KyK6/8Eqq9yzEYCcXIpd9AUD4tJCIlNu4CorysPe7dPYDgHdfHpUYre
         uRcA==
X-Gm-Message-State: AOJu0YypBOj0hZFqBxTrL8XTaGyeFcA9DddDCOzrhWrjeCCGqgsHTH6O
	IVyj6IWsN+4faqd2q7E3Uo4tiWthbamkMf9khrzJHVG3TKUJv1CDWBc+
X-Gm-Gg: AY/fxX4NBsQoy7v7WBKSSjG3sw00VZwNIotniaJog+nIV1r6F162Qlxz2+m7NDewJLj
	6kgAYlbGaHs9AVQnaLmnD/p3hYZOSDCxGJW2nz+NaokobfolLeC7yAicCsKGliP4VQ3Bp0tY1jU
	gPcibSUXtk04uV1ECxPSLARruQnERRQ8f6TE2dNh5Yd4jW6pILPc9MB/SVyWQ3O8VJegwTLtTqO
	R4EjgPKW/9bi7uyBUznH9lXwF39kRQcCkOXrcHp9EN9B6T37i0iSnDME6VEWTiZGYf47Y4/RS1o
	Ff6ZQJ2pPep76/t9WAr5HWEWa2CnJe5Y/XnBGjrSvWKSa3zxnKMj0VLUUwapX3NHTYDEYJ0TBP6
	q9yEjPI3rg5cveCB+VSJXM/q7+q7bf4PFn/tJPG5wjzQveKNIgaJSBwlwilmsv2A7S85HajgyNP
	+9e6tfqeM6iWnnY4REtpqxYivzZQWXovXmZefjNYXAbyqhYRaA5z4qAn9pZopx4g3Q+ce5iS4Ig
	iyj7qVtOYdAEI0nqxruN2I=
X-Google-Smtp-Source: AGHT+IEgu9V46k2J5LBAMEh1g2MEves4OrqcaxWfxeqNCRR7OBNXNqIbjP1ZQudEk7xIyl4ki1lndA==
X-Received: by 2002:a05:600c:45ca:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-47d84b39832mr98984675e9.28.1767968581673;
        Fri, 09 Jan 2026 06:23:01 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3d06:ce2:401e:8cb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a1e11sm61448855e9.19.2026.01.09.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:23:00 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: pcs: renesas,rzn1-miic: Add renesas,miic-phylink-active-low property
Date: Fri,  9 Jan 2026 14:22:49 +0000
Message-ID: <20260109142250.3313448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the renesas,miic-phylink-active-low property to allow configuring the
active level of PHY link status signals provided by the MIIC block.

EtherPHY link-up and link-down status is required as a hardware feature
independent of whether GMAC or ETHSW is used. With GMAC, link status is
obtained via MDC/MDIO and handled in software. In contrast, ETHSW exposes
dedicated PHY link pins that provide this information directly in
hardware.

These PHY link signals are required not only for host-controlled traffic
but also for switch-only forwarding paths where frames are exchanged
between external nodes without CPU involvement. This is particularly
important for redundancy protocols such as DLR (Device Level Ring),
which depend on fast detection of link-down events caused by cable or
port failures. Handling such events purely in software introduces
latency, which is why ETHSW provides dedicated hardware link pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message to elaborate the necessity of PHY link signals.
---
 .../devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
index 3adbcf56d2be..825ae8a91e8b 100644
--- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
@@ -86,6 +86,13 @@ patternProperties:
           and include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h for RZ/N2H, RZ/T2H SoCs.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      renesas,miic-phylink-active-low:
+        type: boolean
+        description: Indicates that the PHY-link signal provided by the Ethernet switch,
+          EtherCAT, or SERCOS3 interface is active low. When present, this property
+          sets the corresponding signal polarity to active low. When omitted, the signal
+          defaults to active high.
+
     required:
       - reg
       - renesas,miic-input
-- 
2.52.0


