Return-Path: <linux-renesas-soc+bounces-21358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB2FB44211
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B82CCA478E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 16:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA73B29B233;
	Thu,  4 Sep 2025 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU+Cd349"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36562367DC;
	Thu,  4 Sep 2025 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001795; cv=none; b=uS+j2HvdrBoS3WH8ccQpKRhDDj+s4s2mCswbwbh/ud+1vMxaQQ20femfWAslPTeUFmAty6DRBfaiYTy8wfvJyE7uBR3h1xO+nne7rY0aCddxT5LPOsus3WPOHEk4LOG7qRUysIXXEN3GuvIvXoZVyRQGnqaw956JvHglKLMWcOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001795; c=relaxed/simple;
	bh=sAzFasY0irDT+RWFfdcKlsf9/BNuAkoj4KNlayvUweA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpwgjxyI+40lL3i4NGnxqksCC6/k8eI2uY70yc5KFvXDCQAOll02M9Mo9rMSJyVlTVxGey3F/D5HGfxesF1N6pt94aXNmWiCS+/35ARlMetO55NKL0ePMhXWjNCngZivN3JgCjhmZmg0B4FJZGv85qetyPByR6oHgXfFFVWY43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU+Cd349; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso4560175e9.3;
        Thu, 04 Sep 2025 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757001791; x=1757606591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=inlzeL92Q1+R3JzgzpZ5gZz+OI69SWz4CtAKRdZzkcw=;
        b=HU+Cd349SNI+fA9/mWPl1jIUXtGKL2WCqRxKOwc+gnJRQTgaGRe8wNQca1ClfUa1yD
         /Hkeg/7or6fE4pzxq6TmsnwysknPYvrHYPA9hnN4ntd1VTa4nA7IO9WBq2FwcSfyNSgU
         yG+m9DO0izzs/CBTc1F/IuvmVHGXqmbnmv8rERzX+G9HLYAW/7hI8sWzpyZIQgTPw2hc
         LuLX4Y8n4z8M9wq2tNzBnaPpS4WBhQKncO9rtlb6BtVYY+BZ0ZfQV4XjA0DviOpM4cxu
         UGJorKj16Nv3dMgpTgkmyF59xKy/Zhi29ps92U1YAA5kkEZjzRMdz9c62RWIZoZpdF4I
         RZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001791; x=1757606591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=inlzeL92Q1+R3JzgzpZ5gZz+OI69SWz4CtAKRdZzkcw=;
        b=DkTPQk9uOV46FxVenhuOnDmLCVq7ZVRTkIqZUPmlna+ulI8POpACP5UdsMTmuxcFck
         zT5+gYxng570KhQ8aDMEi8kS5CeCCTvgNclsGrxcvluUq9hvLDYWhpTnNJyeXuu3ZDU1
         TwVmcAuKBmg/oJX+sc2y3feOuXklJUeSuJ5pMwa0yIkNgS2080Brr8SWDSvBP2RPBvZl
         rK/Dy0saCegSkANutxLXS2QKoqn//tvdOUq4knHIXlNobAnxXAeeDyjUcuKp9jufydrp
         dSZrXpW2qd5Fwgz7/awLxuSKODiUKOU9U/MizrRi6HjcGL+dlcR0bKZPtq222gf8x8ey
         kmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCULIepyvkeGjTbKVu8qB/9ApSJou/iEp7FK866jhf3rvhC+foHZCkmHuNW6ToYojppZPrO8LT6Y2Knffx2f@vger.kernel.org, AJvYcCWjY76Jw31TucJyd9mNX8I0zS7w//a5ju/1dsN8UaZQ1SeWIYiOzFN3FW4OnCUUbusYDUnEMNyB2QNtx3b2jh8YrY0=@vger.kernel.org, AJvYcCX4/YQZAtaHxMWd/QBmshymMQDELVY3Eppd79HEjYpyhAW7TuYsDGDbwC9sYw9M+3tuKKZNbGM2r6k5@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5LsgNg1yVdLYXI2Hc3o+bIsaK7KooCmnCWhfVD9JQPf3BSjI
	QEJ2c7SIn4uV/SvVTG/V97zM1VguQ6k5xO5ajUJJdlGfeRjGeqT4t0z+
X-Gm-Gg: ASbGncv/p4fOZNr+rndLMhnVsmoxmMApTup/udZZ1qRccMdGji+VKIUemNQMZ88VV+3
	6HXfxna2vqwt2XKck5jRwqNX+ZiJT8skRv97IycWXn+knnCkPIruEsJdGV2CiYHNeer4bYjHnYT
	LiJbQOGkJsAOTugn4G6RjSHZQhm5OMyLz/vyf/VrJB01kiYggHI/agYQFzW+eAPhqLLsc36rBBj
	44/s/6NABZ5PYk6patTZKUnLJ/OB/CCL0LAzoR/0OAPPyg2oZJRkudIi2hEDTYqzPSW0xPy1fdV
	JweThU8n2C3meu3b5T9eYfnFmVaufQJdnIwJnXp7XbPen9NvjNtXAVnpDX8FdRmhXPy9zPO22qD
	XaIyIazjJaDUPrvRC76UCz3LpSbXoB9yyVya8wcZrCEA6d7LLmvk4pBSuqg==
X-Google-Smtp-Source: AGHT+IFgIVReQPVQhz9k/P9YI/MxpwIZDmDNHMJlsOtsRqB1HD/exOoyXUahixSAJHYLjPaR1ELVcw==
X-Received: by 2002:a05:600c:4452:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-45b855983cfmr146238965e9.27.1757001790426;
        Thu, 04 Sep 2025 09:03:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm117935885e9.12.2025.09.04.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:03:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
Date: Thu,  4 Sep 2025 17:03:05 +0100
Message-ID: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the I3C Bus Interface on Renesas
RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
that found on the RZ/G3E SoC.

Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
"renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
"renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
compatibility with the RZ/G3E implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
index fe2e9633c46f..e41ba3ba4b58 100644
--- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
+title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface
 
 maintainers:
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
@@ -12,10 +12,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a08g045-i3c # RZ/G3S
-          - renesas,r9a09g047-i3c # RZ/G3E
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a08g045-i3c # RZ/G3S
+              - renesas,r9a09g047-i3c # RZ/G3E
+      - items:
+          - enum:
+              - renesas,r9a09g056-i3c # RZ/V2N
+              - renesas,r9a09g057-i3c # RZ/V2H(P)
+          - const: renesas,r9a09g047-i3c
 
   reg:
     maxItems: 1
-- 
2.51.0


