Return-Path: <linux-renesas-soc+bounces-16656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E5AA7736
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 18:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDD3F4E0304
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 16:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669F225DD03;
	Fri,  2 May 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwwFaPTs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0725D203;
	Fri,  2 May 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203148; cv=none; b=g+8ZGF/6Ztwo+YeqMiCy69CFiH0Tck/v1NtytCrVhxs+TZu9/ktTUxO6sweGK4iQQwra8S911+WvP9Zdn2L4w7v/r0DLuF8OHH0JtHUBD4LBm2h/iehlezmjGINT2NtvpMlRpvy6AJ+haqI0rYdx0KGeiKqNgtFvOLpBtIf75g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203148; c=relaxed/simple;
	bh=EwSbdHBERTd6pqQh+LltY3oY+RPjN0l9A0253wmAGy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkSdeJVD+SiYEc4S1VKAEaotJGHstfNcsmZDOLDZZe5V6/nAeO3dLg9IG1uJ5/rhoUaaYsWNZQU+9zY2gliMhQAVVJl4lJpAiz2gZMLV/IbEJw+V/tW40InhgQjgY1Ka8/0G/eLbkNIQpn8+Kvyjwl01foNC3ApyNaiEGPvcQ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwwFaPTs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so20490865e9.2;
        Fri, 02 May 2025 09:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746203144; x=1746807944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ypXhiXFKasOWjLnzpie9p05fyvGjmZ0NHkZ8L97MCI=;
        b=QwwFaPTs1AZiuGiy2pVA5gWhXBJ2houocBCPVMiYrZMgYDixNXl1OgUkYsgoEfAyqa
         RL/EtPsiW86mO6Pq6xvCxcI8Uq3JlgcyxPEZm54ohgqrFKo4kSMaagLrtv/z2JS280x6
         LHbFy6fyyLLZHE/tDpLOdySYtAj/AGwNDlbKRafFWTUZECOf2KH3MKCFM1eeo1H6hzri
         YMZ3uqB4hAvuOpuAaDYFvJ6wc4d/IBh6v83uE/+XsLKMgQ3DgzAkyjEBpD3yjbqqwHMb
         SojQgCfMnncM8IoFoXYlrownZre/sIM+kY4PdBYzuOYzO4tXnCnsP9a+zSprZzuKyK7t
         oS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203144; x=1746807944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ypXhiXFKasOWjLnzpie9p05fyvGjmZ0NHkZ8L97MCI=;
        b=E7hzF/jbd6IswebG7ao/bIXFr2rzBJJmw0Z24nVG39Rzhh/6ei7s6tqfi/Xs5ytzFR
         dCKeT+jyjnhFM1qjSVdkvClyL9qLMmlqpbmUqix6K7YrUQXYnCHoBTBpe8dLMM+VoCzg
         EXplQqlBRkJARHtKvwZaL6v/qbqHRKjhZHqAuuUw/GszvRLIlGZSEALoxWzfLb5Nl5wL
         MmrejanzzCJsp3OyF2ti0iMn4HQxVGOoeXvgBdTVPb9MDvzi0kxnex6oby6tYPGv1i0h
         MXzOX28CBbjpoaVnNCHftbuoKzvVU/BCBxV9NUtV2ovwKN+YMuY6QxvtyP/KmCQOk13U
         oCpg==
X-Forwarded-Encrypted: i=1; AJvYcCW/hOnR5XuP1KWO3TveFzC8nDQ7TJZCqi8sruU0TFgd7fmj4+68XwhuSCeF5zgyIrpUD3N4rpFsVcs7n+k=@vger.kernel.org, AJvYcCWe8FMupF9Ravr4CPCKQJ4qDtoomydudrcUS/gcexUnpI+KE6skcig/NZwmXBD2Moe4XRfm5G9GYwlJxT1u/S2birM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVIVPKU+xUFCm6je8eyzaQrMdoCtcCSnmeRHnOc50yIc/y1j3S
	+ESzVPv0yHpuui5hPcnZrVAfTSrFkZyHwsXRBMZbdgW3b2sUZoTL
X-Gm-Gg: ASbGnctJfKPp6JkrYkiPUd8EtTLL8nTYhUskO6fZ+4gscmz8N93jQz3iZ0dUI2FTFZ5
	nQriNMDW2SSU0vn0nL5D05Ceqw3ZLn7Qa63SiG/Za6oyIUZirDUIhpRrLLRuuKSdoHcwACuS4xd
	ifPG1nVM/uS7gasDbxRU4KYFPs8HYqreziJ+haPNV6PQB//PcR8rmrJL3R17pv/Sc6oN2yu6AzH
	vdJ/b79u9fbPTNlqK3GE9b507Tv4ecyXCAvHnsoCKkac4/3d8tcRR5MoXFP/mo6J6GciRThOR0R
	EhebYoPLDUrT2tGgsY3zERecmnKv1ATj7sM+i1b2G3Y1DgOM5CeozxKEwtgeb990BroZDSmVBMI
	=
X-Google-Smtp-Source: AGHT+IFFsOh+qCz1DNQRSPc2jp6Jl7hwz2Aj4ZvAdyl2rsdrq6cb6FbqWgbdu3F6VxLaspCW/NR+IQ==
X-Received: by 2002:a05:600c:1d95:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-441bbec2288mr29723645e9.11.1746203143605;
        Fri, 02 May 2025 09:25:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a2874asm48584405e9.26.2025.05.02.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:25:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2N SoC
Date: Fri,  2 May 2025 17:25:40 +0100
Message-ID: <20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a compatible string for the Renesas RZ/V2N SoC variants that include a
Mali-G31 GPU. These variants share the same restrictions on interrupts,
clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
validation accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 019bd28a29f1..3297ed160ebc 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -25,6 +25,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
               - rockchip,px30-mali
               - rockchip,rk3562-mali
@@ -145,6 +146,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
     then:
       properties:
-- 
2.49.0


