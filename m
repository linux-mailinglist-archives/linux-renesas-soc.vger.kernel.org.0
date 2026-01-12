Return-Path: <linux-renesas-soc+bounces-26580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF7D11B1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 11:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47B430F090B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACF927AC4D;
	Mon, 12 Jan 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHBh9bM8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844512777F3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211851; cv=none; b=TBNGza/tg/S+x6R+aU9twOM8grmLO5HN0U0r5GNzuuPC9fEQIAxZ4ZTaP5RyjYFV6qQBXR9IoTQ8hX3Rn1JCE3Pt51S9KRJPMY3eQh5rTJuGRJBPBdGP4YA7iH5eF4Bl2xNIjijTP+1LbRP+MXHWCUOsLaFx6Ely92MXPwkxJeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211851; c=relaxed/simple;
	bh=LugxlYbsy+Qfs3ph7wJKDXpwM4nYBdQrHLWsWqrkdFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TFUKOFiQa5g9XN0RYfJAeNfMKjWeTVNkcIUSiwOkGbjn140GdjrZxi/xD1inn5pF91QdSX4C4WpA+OH39UhtZu5bHzuB2rHnX7mButqeDWuCgxThd7DJENC3UZUIkjZ7koP2MLoy4034cnvN5Ran2RR8UMBg0eCOY0cKHVoIzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHBh9bM8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327778df7fso3851017f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 01:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768211847; x=1768816647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mzvt2RNei64w7LNow6KpAr3At/3c7C1LxeBgW5hPbzQ=;
        b=nHBh9bM8L5Qcppt7wd4Dxx480Cv2Y/bZ5/pHahDuDTUGUkLzlnvNhqA3LWKoL6nxi9
         tlsveaPdifbXZ6l6cUyJcmolNXMnECnHGtmf25lIXwcjs4JyMD77Wn7MS3vcwvp37Fas
         uhXfdc2aSTKis08wZhWSgGc6XO9hBEF0RfnybweQ9Rd/jWPXWm83CAljOd7bGvLwvGRk
         btyIkaQLy/o1LdvDGH6gz0yqGwAWt/SeQge6y8DQ9WQ1MAiUJJ1+SduPCtcUwz5O+oEH
         ziNxFtGGyRvg2XglC1FQf2amkDSOfWQOnHRIrfT65EqMogFMMV3kaNVoiyrYZSyAYXx7
         5szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768211847; x=1768816647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mzvt2RNei64w7LNow6KpAr3At/3c7C1LxeBgW5hPbzQ=;
        b=Bc8we0vKRrbOgFKhL10e7hYJZhEZpO+gmY7Pg/j7YgU2K8SUhpVWQ8GF3XA+stzNeQ
         tQ9GVIsQ7S9aKomYKoqk/9wYzM2pUNsWhQbj9h/vMY6XSux/EsoODUOUog+jnqvidhTB
         MaogLZJuVpCaw33Z4qur5SWbzNrlMblHBLLxYTT3D/Ws9NcUnRogw2h+lfU5WZ41brOw
         Lug7sDBLvnIBw7A1anonbFaMgPcXVD2Ilw5QT7CARHySeHU77QQxiQK8xAkVfyDAApbX
         vU8hHIMWlmYQ3L0SIENiFp9OxdBuW4jdyJNit6Lis/299WZV0GiAi4R5XXTXteaatPNb
         ImAg==
X-Forwarded-Encrypted: i=1; AJvYcCWByrmV0cRxWimFwKY3vZ+0viVQQfWU5/dfrqrUxnDaJBmSSuXxrDR++fl38KjtlWs+Eh/InXgRrBhYqsubMAkhEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8E0AiGWEo/M14bxgaNzsxMizUEesLEsHIG+XoiRvTWoP/MJR+
	K4ihsBGrUCKKZVFIuKEEYhOEWqEwe2ztORwcNqpu+DT39TIuqcAuWXNe
X-Gm-Gg: AY/fxX6DGFnyiah4uqgATELdDVyXVFkFuW53AWgiVBSlysHi5DlcJx7NeXGQyUXxHdn
	smBCc08Vb4VtbKHTF79MRq8622k4+XvVOK5xhPBjPemf/nstQMLi52xPpSjrfrsOvO5Yd1WN51S
	kzVQWANpFLxX3/WkqeUHblnYONJCxAeEFr7PEB01EVOkCngA7CrBj5hyw7JdgqN/MHGzZ4KLEvK
	uFy+Qc7xwW+rV6I9V/dDhQ5BcudE/sEmTtWR5G6UhLOGnh5fmbY+7ZcXMtAJxvdorort+AoX26E
	++WWkaOJFpumCDGv+6HsYBZVNDQo3Y1qoMmPgd2Fhc0RI6MKt1V+lblovPTAH6RVqkPQ8OTnZo+
	PLy2UrVXGFwMKzdX/v5/U0sfYGzXznk4EW8MCeQtGlgqpX23X+Y5EviqjlW6AcKOu14XNctGu9q
	eGy7Yuujm8reZagLRBCoEVeEvjW7FzdkSwH2eDSw//wFFnxdg6bgBznEaAS3Hgb7FvOTjt8UKMy
	sTzOZi9oWzNm1F+QIYMfxt2
X-Google-Smtp-Source: AGHT+IHiMx0miHXV1Prj6ALTq018isqRXrCy6aZ7AnOL0DZCWJCV1GIa1Uskao4vqlEinSE11baR0w==
X-Received: by 2002:a05:6000:616:b0:431:9f1:e4c7 with SMTP id ffacd0b85a97d-432c363418dmr19272921f8f.21.1768211847238;
        Mon, 12 Jan 2026 01:57:27 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9336:b2a5:a8c1:722e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm37359450f8f.35.2026.01.12.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:57:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] dt-bindings: serial: sh-sci: Fold single-entry compatibles into enum
Date: Mon, 12 Jan 2026 09:57:22 +0000
Message-ID: <20260112095722.25556-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Group single compatibles into enum.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Dropped "- items:" to reduce indentation level.
- Added Reviewed-by tag. 
---
 .../devicetree/bindings/serial/renesas,scif.yaml  | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 72483bc3274d..a6ef02327be8 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -12,15 +12,16 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - renesas,scif-r7s9210          # RZ/A2
+          - renesas,scif-r9a07g044        # RZ/G2{L,LC}
+          - renesas,scif-r9a09g057        # RZ/V2H(P)
+
       - items:
           - enum:
               - renesas,scif-r7s72100     # RZ/A1H
           - const: renesas,scif           # generic SCIF compatible UART
 
-      - items:
-          - enum:
-              - renesas,scif-r7s9210      # RZ/A2
-
       - items:
           - enum:
               - renesas,scif-r8a7778      # R-Car M1
@@ -76,10 +77,6 @@ properties:
           - const: renesas,rcar-gen5-scif # R-Car Gen5
           - const: renesas,scif           # generic SCIF compatible UART
 
-      - items:
-          - enum:
-              - renesas,scif-r9a07g044      # RZ/G2{L,LC}
-
       - items:
           - enum:
               - renesas,scif-r9a07g043      # RZ/G2UL and RZ/Five
@@ -87,8 +84,6 @@ properties:
               - renesas,scif-r9a08g045      # RZ/G3S
           - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
-      - const: renesas,scif-r9a09g057       # RZ/V2H(P)
-
       - items:
           - enum:
               - renesas,scif-r9a09g047      # RZ/G3E
-- 
2.52.0


