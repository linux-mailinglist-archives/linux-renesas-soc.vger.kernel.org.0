Return-Path: <linux-renesas-soc+bounces-26510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D1D0A1D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 13:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 105A03113568
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 12:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C24635BDA8;
	Fri,  9 Jan 2026 12:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuCfUVU/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBE35B12B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767962318; cv=none; b=bd7LFTSBHaIeSA1PIcTbtCR7UqC4xLRTpuMfyY0a9qZc6u/i7kqozsATFGVlYlwVTbYNG7GSEo2KCCfMUgDf+xY3Rbo/HPfob9B6BKNzqbJtC+kUjBy/N9vsUhbOJH6W/UlNL627NUIMLRhA63BcAxXhPvhxC0w+WshB8bEOKNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767962318; c=relaxed/simple;
	bh=JYApr68wtO1IgeeQX97XtB8VFiH0AGBcAiljSulIrUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exAoTPii6o39ABJA3U051qjEs0mNEVn53EHLefKCAWgP1H4y89+3oh195sosZnNaymM4r4qD1qejWKtL91Oy/WSiJ9sP3y5Xl416dd3s16PW2rI1QkP0x/oltTKRNEmZkTA8SXE/vgZgUi1XhGmiek+Nq/L930Im7IU5o2wiZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuCfUVU/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so26251585e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 04:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767962315; x=1768567115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1Ry5v+SWBJqmYXgepJPkse9qv8WRlai5KDVImpPed4=;
        b=ZuCfUVU/S6Txus+PfoLZ1PNd0zAA4l3ekzEERt3V2UIZdVvrUNbJxKZsuVBWzL4WFU
         CtWsLgoYSx3QcmDPXY/uD/ltk/zACiNtIoNsigjIot2+oNfaR8Y4ln+9FMXoJPkXq598
         NPobL4zIkCJr0hrllK4Bzp8EeK0erNg1M8l53cqzdOZMInJ5x0QHAS8znMyG8sgylkdJ
         Dx96DzLN38TZaC++6QD/h76qNH/wOjnQy6h9ZmmEGR5bH4Euqjzw92g8y/w1wcTJVvx5
         CiLx9Uyt7lPW+YFT8kRpzoJrhul1sd9UWXgbN2EJnc1ikg6WrBImJojd00qGhREBKv7V
         n7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962315; x=1768567115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1Ry5v+SWBJqmYXgepJPkse9qv8WRlai5KDVImpPed4=;
        b=W6B0znIGe2Ka1rjqSKkIrfJ+ZCTSixcbUnDKtqKm9nBf16Ki27pnRwMoeyqznbHrcF
         I3ONw9jNuOd3u67BgzT49ZE75pTqrnGOI49WNrbmtceBRjj2d4c8UnZCE5iiImnQzoTy
         iG6TClHMt2MTg0rbUJj44GpbsV8ypSlOiwK6HzDu9HfTxkIECjINhZjyePoPyU22jETL
         oHFMd/UgDkUggjs7q/2oPBmHpl3H0P9qKdWrfxQXpVkG16rAu2+0P2073MD+mE/fEa3F
         y/Y4CSHI4dKe1tiUEgO7hOCcmL5+5X6tA4rYYFTlY1MS4jRBhg/oNBBCLOWTu+erCGdO
         3V6w==
X-Forwarded-Encrypted: i=1; AJvYcCXaOLbJDid2khBR+tSJBfSKD8xzXqYp4CVy64lJATrWJ6qNDwfyUtOmbrtA4dLW5ah16ZqpoTRgzVzy7gmTW7245w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5nX1TcF4CVeocExZVfk0fmfea3y4V5+SIECb3M/l36gsgwMZs
	W/MOAyeDgoXTjXlxDoJYPovcBS6cOx7FG6eERooLia5Th46Juw5reQtW
X-Gm-Gg: AY/fxX6mPY+JSWM9mpzw9m8/ukxSAsx6mv8xMdhus/YdIgDje2KrFfit1sKsEP+K12l
	mtmj1qumvk5Kp8ay5bmUTGcQh7Jt1teR2G+CkLnqEz9hS2rDMRaflsuVqCu8bmUJpILYI8BPF/b
	75Z33eIj2yEVcV52f5D0Gch1XUikpP7IlUTI3f4oQd+uEZh+2fNO0jB1M7b7wbmWZf7cD6UP3pd
	U7D25CkaiD9RmyGfYHEH2j0jDBjonWFI20+fTsEIuztC0DyMgAJvjYfki9FJ9tWarNn+j1l3wR+
	AZgUPU2v7whpFOGIZe5DPEaNT0MAnwiThJE2o2oc/wgO9pXMu0gZsQAX7mV0jhSt8oiVrlQ/UXc
	704yUhYhW0zb9WkErN07oubabFfIxxIviIBFxUsxB/S2EMHCzeuRU6xcNfZo4J08Dq4pWHebygb
	j4kKG+MSf3etsUM5XCtS377m9hdRLWq+8FlVmOYssrSqwHBG18DDPTSExcvgzB1IgxIebJti7RC
	A4B1KPgBm5sSMN9/L3HJSM=
X-Google-Smtp-Source: AGHT+IEWZrzNl5AJ9ePzJLbVDi2fmNB6EfpTUXDyBQ4Q2PKHHDld6QqEWKcGJu91UaKZ0q2M5WpLng==
X-Received: by 2002:a05:600c:3b1f:b0:477:63dc:be00 with SMTP id 5b1f17b1804b1-47d84b5b3e6mr99580875e9.25.1767962315169;
        Fri, 09 Jan 2026 04:38:35 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3d06:ce2:401e:8cb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8384646fsm174060935e9.15.2026.01.09.04.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:38:34 -0800 (PST)
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
Subject: [PATCH] dt-bindings: serial: sh-sci: Fold single-entry compatibles into enum
Date: Fri,  9 Jan 2026 12:38:28 +0000
Message-ID: <20260109123828.2470826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 .../devicetree/bindings/serial/renesas,scif.yaml          | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 72483bc3274d..d4cdbbf4c1f1 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -20,6 +20,8 @@ properties:
       - items:
           - enum:
               - renesas,scif-r7s9210      # RZ/A2
+              - renesas,scif-r9a07g044    # RZ/G2{L,LC}
+              - renesas,scif-r9a09g057    # RZ/V2H(P)
 
       - items:
           - enum:
@@ -76,10 +78,6 @@ properties:
           - const: renesas,rcar-gen5-scif # R-Car Gen5
           - const: renesas,scif           # generic SCIF compatible UART
 
-      - items:
-          - enum:
-              - renesas,scif-r9a07g044      # RZ/G2{L,LC}
-
       - items:
           - enum:
               - renesas,scif-r9a07g043      # RZ/G2UL and RZ/Five
@@ -87,8 +85,6 @@ properties:
               - renesas,scif-r9a08g045      # RZ/G3S
           - const: renesas,scif-r9a07g044   # RZ/G2{L,LC} fallback
 
-      - const: renesas,scif-r9a09g057       # RZ/V2H(P)
-
       - items:
           - enum:
               - renesas,scif-r9a09g047      # RZ/G3E
-- 
2.52.0


