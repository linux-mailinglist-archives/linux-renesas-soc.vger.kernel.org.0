Return-Path: <linux-renesas-soc+bounces-26191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DBCCE99A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 12:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AA593038943
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C7A2EAB8E;
	Tue, 30 Dec 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/XtL65W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C472EACF9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095903; cv=none; b=TB1vS/9B802Xm+VnDluD3Z3IDsNikkH2+kTnfVguZx/AA/PKY4vE5ScR1YUDbg9Sqmh1VjSzP5PRUhDZF6SSu31oytLfIzOjo9veQ0icdYMq0j58/F2dieJq+pLx0BpbdDioyYWg7L5Cume9yUIl0Mjk72pwaaBCcLM1lXovMso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095903; c=relaxed/simple;
	bh=RInXvReQ5POy4FMimtb0C34m5vk5/lbK61lYfvbonc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF7XQEz3haF8pVWW8QFFY02+ZNzlnz3zAzufRZJu37Ggi0102F/t5tUfon55xJao5PvFfj1weEGKd4AZEOpp6Rx+by8gLt6/aB8hvLFLvB2MgdDDMOaFQAYLnyiJtGfUoC7eOVp5QiENs8Wsq4zTcrTM7oSRZ2qMlT4BC1VxQjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/XtL65W; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so4040579f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Dec 2025 03:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767095899; x=1767700699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md4LenoxLA0hBS+HLQnseJu4WXkBm6RSI6SGmptImzA=;
        b=g/XtL65Wrk1YyEy8FhOyDZuCLp9WEnIf9JQxsaN0aFdzPq6goH0Jys7EK4Ag1xMfX5
         8q39O5u8bZDL/eat0AFGHyGnIhBinSViDD4NGu8vT8YKQZbLE8LYgioA3KLHumg0pHao
         qZF99dBhIyVDxHVUFHeiOX63BDQ56D14I9N7S4nW7ledAo40b/BEPPquJkuvOEqbr0KT
         J7KWvQ2V1QkZPiSQCWjdByVhDHYUGceDGViTpD2e+xnvAn1u5nZAw9NQj8x7qPd9mprh
         VHaBVJZ4KCuYrisSHqgUHJuJLAerb8s13O5ev2gvhxjE9d2xCq3aJ5NV9k6ptCOpcb6Z
         YpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767095899; x=1767700699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Md4LenoxLA0hBS+HLQnseJu4WXkBm6RSI6SGmptImzA=;
        b=GOp7QbBvv+onyiNaOLy0xyhkdspWQIHVSVC6rPAvWTTv2Hn0KPe4Ud9jtqmFrSfmpW
         /hOv+VQKEBir2bHvg7NM1RElBjaRJC+h6Ek0eckh3jGOQ3HVRsqNuMvK2O0+ddhBsBP/
         W1rac2YJGwps6KLl4xL16gNqQX0jllCk8K45ag8hQMv4rYUnYYtv0SI9MM/5R66BMvdw
         3+xhSg/3K7XeXOLNYMe7Sj6Pd+X2CPEIj83tkzlT8G4ecmfj8c++MqIMLr9wsFDkPr7F
         H7dLK1j3P4TSREdsRTj0F9pSA/KuvhxDlAAhCn91sru+MGQiMB3RoKI1dFHLpttBtEKD
         JFEA==
X-Forwarded-Encrypted: i=1; AJvYcCXvr/UPN4qpU6UuD0RGdrsHhp4UflRldLyaSPlF5nAXBKfe++kLl3UWRLqgDowH4WkL7yNSfxXMb5T+1ReR3dlXTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86A6CXhPkaGdID8TsVFh6aZO2vQuEzchF+4QvuPyXICXkpaud
	+C15QdazZuZqcOCq0jjFitH1OqysP/942Hsr1YFkHaZDSZIwrHfGLhUY
X-Gm-Gg: AY/fxX6vtlOE+j8Jmmf2w+rXSQBG4lmbpKnk61kg9+HPaidAaD/B492UiwsMy2HZUkh
	CGDu9zEj35qOOvuye+opPpewYFg9cjGS6PfO+gO8DT6r18AfVF5+WbShVWWxuGgeF8jl+JEyQi7
	NaFA2GDGmKxfjyGqAb3olG6bGGRhMsm1i90QNZAlGH8/F72gxpFXNpSyBNe0ivemIfnUzlCwJxh
	iBLoCgEt6zQgn95WiJnq0x7mlCUzkXfJzChyynJaMCt/Tc0JVr/y/ruJERQDwF81RPund0N/q7h
	YXALucPhd0NFLqViAi3cjFFkE9nI5VCXOcclrNe6W350jsVZgXdx7ouaZWELTtS+hzeIMojtPFf
	NSWT9iOG4JXfXo6u7vCHMT2B9UeZ203dkAR8woQ7HvPSM1cEB6jqntVd7/UfbZK6aEL3533gVPb
	Fu9RQQqrQvap6q9sgr1015k3H3yC7l/XtKzZ/Bgu9wbBG0xS47VGMr1LceavW80E14zXnR1LqJQ
	cZ/Zg1P5kBZxqcGbFuUvoCQ
X-Google-Smtp-Source: AGHT+IHtSz/WiusYFxkiAPspdPu38Bl3h2tcnJLHp2a1T6hYQPtR4Q1Zp/41Eow1xjcXx5s6xxYVCw==
X-Received: by 2002:a05:6000:22c3:b0:431:67d:53b3 with SMTP id ffacd0b85a97d-4324e50bb1dmr35616083f8f.43.1767095899416;
        Tue, 30 Dec 2025 03:58:19 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:efaa:981e:926e:8957])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm68337227f8f.35.2025.12.30.03.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:58:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
Date: Tue, 30 Dec 2025 11:58:13 +0000
Message-ID: <20251230115814.53536-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes made.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index fb709cfd26d7..4a83e9e34d67 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -50,6 +50,12 @@ properties:
               - renesas,r9a09g057-canfd     # RZ/V2H(P)
           - const: renesas,r9a09g047-canfd
 
+      - const: renesas,r9a09g077-canfd      # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g087-canfd  # RZ/N2H
+          - const: renesas,r9a09g077-canfd
+
   reg:
     maxItems: 1
 
@@ -179,7 +185,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - resets
   - assigned-clocks
   - assigned-clock-rates
   - channel0
@@ -243,11 +248,30 @@ allOf:
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


