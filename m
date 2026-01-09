Return-Path: <linux-renesas-soc+bounces-26514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA892D0A4CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 14:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A623430FF828
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 12:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7630235B155;
	Fri,  9 Jan 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht7w8WeB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC935B159
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963100; cv=none; b=o/LZudfe1NUtuQPhwrDAES6jEHgqm6ha6i9Jcuk6eQpVjy3AtZdpMHXFR0I6XLgofaikLNwBZTBLuHbD7w3ajhF1r4PZaYKp2oRANtWDazJeNKIMCx7MNoou3qe9uDyEzqqHmqiOPdYhndYEA/CZOv75R+jmlzaQqNtBsZEwSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963100; c=relaxed/simple;
	bh=mdno2Ya3sQZeoP+RW7phTV1gRDXjpniBxUAGE8Uwflo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpcX/U7yu84qWrwU6WqkJd6VBhdqMIQFHNGTiJGnNr/7w/8zzgcZ08DGHrwPFzKE5ouYLQRISZu2jEXRUVuk6Axu+nYBql8MIAt+0muUY6qj3oLsTDy+dsvO+wCpg/baWfHLkBRf5/8/v0smGptWS5u0XcSOsK8wF0PNPh8gQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht7w8WeB; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432d2c96215so1322770f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 04:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963094; x=1768567894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI8vt7JQePdkONS+d96oec76ZepkNLDIDJmPL38SyBk=;
        b=Ht7w8WeBuXDOTOQTKX1H3f9nviOAzXao1AqE4e54RIMHyvroxeQC4sHjG1R6pE09ED
         QAEIhn9us7ArVL6AzFEBs6z3RmuEiz7MzjdRBaJ1iMISYjNiTenA075Uxf/SDnt28pa8
         Z57q/i6aIwAAV5vuXq1rb1RkHBInXNOsN01Lqqnpk5U1LsnJqdXA8mnT/DkptlqKVXAo
         pQmgb7GvmdHOnBOyn5gqu47KTezCshTbbzAA6QbGmtIQCB15TGlyav/aHmQj2N88rafX
         yRKJk/8F5eM/p3cDWrp3W6BxCrkFyULXMANEpYbXLErIS7ja7HjQo96qkvosC7JUYHHL
         9zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963094; x=1768567894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lI8vt7JQePdkONS+d96oec76ZepkNLDIDJmPL38SyBk=;
        b=nu0KcUcDjaTeYDRjPT2IA9aUHFpT7fBHUmBlNw+T340ys/A/Hpb+NOBxN084zVXCY+
         pYJeho13JsanZb1awCdUUQZlTfVSwohNOQT31Ok6b0tajfhRNP/Y1rnWAwNncNoOmRkl
         134zvWrq4S2qyLJM7NgCX5lolWffk691j3Tupb0Q+ZGS72edeImcgxKamDtHbffJLtjC
         btjyOItlhf4CTd19VALEGnfRADhBhGo87rlzmaE69dxSECqNPvOgmvkaRR3mPIJvXLM1
         BYUGq8FLayhkAr9xQO9vApJ81zFd2jAs7Wnwwch1ViHniTfkU+Y6gq40tbicqfqYJ8mP
         5LXg==
X-Gm-Message-State: AOJu0YzthxKsWBvn7HhD7QSRdpJiFivC2m65QEVQwIX2oWxvbYpPMQuX
	nzsAZsnv4aiCtXX0hcin6/ztNC50Pi/7dC0nAFKcw3Yc6eY5UkZ/qU1H
X-Gm-Gg: AY/fxX4qv5c1nigu7VT/EBcPWB1GNDnBHXeGCXPNx01+VoNIrIU3qmq7wHuOdzpcAcw
	p4bm/qJAnrAv+E/1CKMlhDJMt1EdccjMI56trEHLT2qmFYhxHndFchn1jNNWhoNEdaeUOPcsC/5
	cWtQQok/L3mCTQSKiwmCcJ1nq8Lwnadgn8bNnSIZYlu+uTj9Iq0bxmJYth+jPKNFtVZNq/sntJf
	0ah2nPZscmK7vnpbUg0m87RsNg5Zcl/YH3m2/yRnV6dZdPky2z9VAL4NNTT51jzYXpC5cUFhuUK
	7im56f08m5HsNPoVyWo4aHD3FQeGdw0ya8ioRPmxql7jRKWWMC+2K+S58qLQeFzev6ssWXg+Rpt
	6a2XTa1A6fvwC7Hs36BHwSX/L9It4/YyqPWKIrsxFepuc08e2wk1DFFC2lDBLTcyTxgPthNgkRJ
	zCw1HL+mO6VmT2vKFg0pSNksAgyRiJHFadrWDH9aBKKrRtji5nRKqiQXDnGNiXoYm8c6SO+/LTK
	nbsbF6Omn1G+HAyVaZxp4M=
X-Google-Smtp-Source: AGHT+IF/7O5Iq7m4d5dep0sK3aoe67xeYJTSa6/XcblkLgnoej6Sz9hCZGU8qUaHUfLbI7DU/KTyeg==
X-Received: by 2002:a5d:64e7:0:b0:432:86f5:18a1 with SMTP id ffacd0b85a97d-432c363510fmr9939620f8f.0.1767963094406;
        Fri, 09 Jan 2026 04:51:34 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3d06:ce2:401e:8cb8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm22837291f8f.8.2026.01.09.04.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:51:33 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
Date: Fri,  9 Jan 2026 12:51:27 +0000
Message-ID: <20260109125128.2474156-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260109125128.2474156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
in that AFLPN and CFTML are different, there is no reset line for the IP,
and it only supports two channels.

The schema already enforces reset-names only for RZ/G2L and RZ/G3E and
disallows it for all other SoCs, so only the resets property is explicitly
marked as unsupported for RZ/T2H and RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Grouped single compatible entries into an enum.
- Updated commit message about disallowing reset-names property.
- Added Reviewed-by tag.

v1->v2:
- No changes made.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index fb709cfd26d7..ceb072e0a304 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -42,7 +42,10 @@ properties:
               - renesas,r9a07g054-canfd    # RZ/V2L
           - const: renesas,rzg2l-canfd     # RZ/G2L family
 
-      - const: renesas,r9a09g047-canfd     # RZ/G3E
+      - items:
+          - enum:
+              - renesas,r9a09g047-canfd    # RZ/G3E
+              - renesas,r9a09g077-canfd    # RZ/T2H
 
       - items:
           - enum:
@@ -50,6 +53,10 @@ properties:
               - renesas,r9a09g057-canfd     # RZ/V2H(P)
           - const: renesas,r9a09g047-canfd
 
+      - items:
+          - const: renesas,r9a09g087-canfd  # RZ/N2H
+          - const: renesas,r9a09g077-canfd
+
   reg:
     maxItems: 1
 
@@ -179,7 +186,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - resets
   - assigned-clocks
   - assigned-clock-rates
   - channel0
@@ -243,11 +249,30 @@ allOf:
           minItems: 2
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-canfd
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+
+        interrupt-names:
+          maxItems: 8
+
+        resets: false
+    else:
+      required:
+        - resets
+
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - renesas,r9a09g077-canfd
               - renesas,rcar-gen3-canfd
               - renesas,rzg2l-canfd
     then:
-- 
2.52.0


