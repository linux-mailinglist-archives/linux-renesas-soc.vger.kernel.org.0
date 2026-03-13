Return-Path: <linux-renesas-soc+bounces-29350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA0fDtsLtGlvfwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:06:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A43412836CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39885302A54E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 13:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6858C2E8B6B;
	Fri, 13 Mar 2026 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKcLNzX9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A142EA732
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773407191; cv=none; b=QGEgjz9hh0wYRWN/i/yf9TTw604++BV2PXve9g7BmkbQcbnPomxx3gPe1RLKWiiwQpEQ7j6Drsm4IZUPXW8SbFgSjKJiGJZn/DzE4T07p9H8ymcQX9trIdUx3Xe1VDwxf2Py62bwP3I2Oabw80coDwf5qWIWJZ5JyMw5bB+WSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773407191; c=relaxed/simple;
	bh=YgKNNg49/YkZTSbEdG4sVgeSeSAh0M1PjzPJ39xAwXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKaj5dN9RHwELC8Ayc6Dujx79bmlg0o+hQaLZjv1j7lMDQjjrxvnwRgCaF9cScpWX+NbAoC5Zfq66cPZIsHPDGXCPyZbQM1mzEALYNfkjwBFPXdy2cIFXmpxSZJFAepp3HbilYjfbr3PtLFc9+ioratSIZZ5tHhxEjllc7vuPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKcLNzX9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852ff06541so22262005e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773407188; x=1774011988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rIMvx3G4GiLJ5SJmuQBiCjyrBNPvzb1sP/TsmepD1dY=;
        b=YKcLNzX9w3/Zdb8VF5liROzWPrSRRR130SO1jzs84JZTVvw8158+Z3S+XUGmM/mxJO
         8t4ZWMIgqc0YACPNw9ePJYm7IVaQyZBsqP0ZnNqhopZVcdXzI8VAQlVX0yde4T4HRmww
         0oW9lKX0TiMgzDIZZIVGUNWAWaloBCyQkLtPg9IHwss3jZi9wtS72NFbfnRYOwj19g5m
         ffAij1VyqnhKq1tVXrzLmDRP01lrc16QKSOMzskXtPxKh80cooe6FoPdvwJzd7/5g7mP
         SWPPpkBJYUwV6nSk/pSEu/2TI5ymKEoKf50RselSCnZ909dJBUi3+7ZoYdABqM+q9P88
         lkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773407188; x=1774011988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIMvx3G4GiLJ5SJmuQBiCjyrBNPvzb1sP/TsmepD1dY=;
        b=ie/IyUOIsUG1LNrUStEfHgk6//MVjULpym09iqwNOjD9MzUXeXDCtJtTk1MEAgm9qu
         gUIpp+Tsx8aQ0og0RVl4Y8i8ZGMYzMIzmCMMKWWfxSw5UAgXnXPocEl5hy+Zx3RYYPJe
         xFJrc8/4Y4+dvMvILHqVYjws2uUpAAZ+c9gswYFVzl+57YKxPSU54dKlHGWYutfzYZ9V
         6NouKVpQzNiaTEODenbnyZK7AKBwnxLgjbf2N8Q3c/1T0GCukQ6CP7jGiTJDHzLisHjs
         v81LbRbBq7iWphMswnx8uK5qCnYkpNeZNqW8NF0j88yc1m7FdKIuxM+ntYEi7KuKxu8t
         A63Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnuqqi30YeaPVufnzMi12v+SLLlU/6IoUXxqEfzmStfDe/N4ea4mCIIuV3bOiZ4BNxw5X3MOQwDxDoQtw5JEztYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMOXWs3Ux26ljoQeCn4So+d2o17A9T5BKOxGRV3kcSi0KlFYE
	aZfukGIeJt+uKxnIRM3a28jE0Tw7RvLl5iVK8E7xemokBKc02UCtIVNk
X-Gm-Gg: ATEYQzwmiMpDx7KqD8mVXiV8qMV83+JOBiMthhh2Fmz8BUgi04BfQGQ1eB+uE4cJFA0
	YjELg4i8S3ipPr5KlvcM3N8z92mg2L4enudGsXP3c/f18nxCiY7JZVIEDgd0+qSsc8DfG5q8lQM
	H7Zyyf087c0SOfi42mKo29toECoN6iZHfVM4g3WVf4Zjfjrq2DtCd6X3B8q3IhX//KW1gh4aSU0
	mOeFL09/UQHVVwx6uMYE/VvEqDWQUoDl0e1jcloe2sIrrPxFmFb4d8UaqkU2PFGVpbKB2/LpqcA
	NxmykalNfouHA9Ol+euCSBPCiQVBtEbwri+Sn9t1SoK1DMVtCkAJsJKVGm4TzeaC4fC1QaOUs7B
	yueHh3aedPCtBh+01vZIh+1TrrN5LX0/s6+/CeOyzyoeH96wbn1pMt2EYR9m5tB6Vyz35wXx2Kk
	pVWxcDHd06ScQy6Fen/iVVzdGbi2ukXMN4t1vCWPq+EBXUk4KV
X-Received: by 2002:a05:600c:3b14:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-485566d94afmr45564705e9.13.1773407187407;
        Fri, 13 Mar 2026 06:06:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6418:ccf7:57f1:473f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm559497155e9.2.2026.03.13.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:06:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Barker <paul@pbarker.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next] dt-bindings: net: Remove redundant ethernet-phy-ieee802.3-c22 fallback
Date: Fri, 13 Mar 2026 13:06:21 +0000
Message-ID: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-29350-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,armlinux.org.uk,pbarker.dev,linaro.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,ragnatech.se,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.8:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,renesas.com:email,0.0.0.1:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A43412836CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the ethernet-phy-ieee802.3-c22 compatible string from ethernet PHY
bindings and their examples. The c22 fallback is implicitly assumed for
PHY ID-based compatible strings and does not need to be stated explicitly,
unlike c45 which requires opt-in.

Remove the c22 pattern from the ethernet-phy.yaml schema and update
examples in amlogic,g12a-mdio-mux, mscc-phy-vsc8531, renesas,ether,
and renesas,etheravb bindings accordingly.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml         | 3 +--
 Documentation/devicetree/bindings/net/ethernet-phy.yaml        | 3 ---
 Documentation/devicetree/bindings/net/mscc-phy-vsc8531.yaml    | 3 +--
 Documentation/devicetree/bindings/net/renesas,ether.yaml       | 3 +--
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml    | 3 +--
 5 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
index ec5c038ce6a0..e9e575fab62c 100644
--- a/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml
@@ -69,8 +69,7 @@ examples:
             #size-cells = <0>;
 
             ethernet-phy@8 {
-                compatible = "ethernet-phy-id0180.3301",
-                             "ethernet-phy-ieee802.3-c22";
+                compatible = "ethernet-phy-id0180.3301";
                 interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
                 reg = <8>;
                 max-speed = <100>;
diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index 58634fee9fc4..d622e73a89ff 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -47,9 +47,6 @@ properties:
           second group of digits is the Phy Identifier 2 register,
           this is the chip vendor OUI bits 19:24, followed by 10
           bits of a vendor specific ID.
-      - items:
-          - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
-          - const: ethernet-phy-ieee802.3-c22
       - items:
           - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
           - const: ethernet-phy-ieee802.3-c45
diff --git a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.yaml b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.yaml
index 0afbd0ff126f..5e5dea7987e7 100644
--- a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.yaml
+++ b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.yaml
@@ -32,7 +32,6 @@ properties:
       - enum:
           - ethernet-phy-id0007.0570 # VSC8531
           - ethernet-phy-id0007.0772 # VSC8541
-      - const: ethernet-phy-ieee802.3-c22
 
   vsc8531,vddmac:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -120,7 +119,7 @@ examples:
         #size-cells = <0>;
 
         ethernet-phy@0 {
-            compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+            compatible = "ethernet-phy-id0007.0772";
             reg = <0>;
             vsc8531,vddmac = <3300>;
             vsc8531,edge-slowdown = <7>;
diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
index f0a52f47f95a..dd7187f12a67 100644
--- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
@@ -121,8 +121,7 @@ examples:
         #size-cells = <0>;
 
         phy1: ethernet-phy@1 {
-            compatible = "ethernet-phy-id0022.1537",
-                         "ethernet-phy-ieee802.3-c22";
+            compatible = "ethernet-phy-id0022.1537";
             reg = <1>;
             interrupt-parent = <&irqc0>;
             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 1e00ef5b3acd..6aea1acaaa59 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -364,8 +364,7 @@ examples:
             #size-cells = <0>;
 
             phy0: ethernet-phy@0 {
-                    compatible = "ethernet-phy-id0022.1622",
-                                 "ethernet-phy-ieee802.3-c22";
+                    compatible = "ethernet-phy-id0022.1622";
                     rxc-skew-ps = <1500>;
                     reg = <0>;
                     interrupt-parent = <&gpio2>;
-- 
2.43.0


