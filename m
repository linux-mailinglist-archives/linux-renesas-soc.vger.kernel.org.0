Return-Path: <linux-renesas-soc+bounces-25291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A4C8F807
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C6EB3AAD2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B143376AA;
	Thu, 27 Nov 2025 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zvi7lwAw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE8F2D29CF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260696; cv=none; b=toG25zBcowg04Ks6prZhFo5znGmTzDjtO3QF0sJrinpa4ZSs1NkVVri6gNfmlp9YsEXtbDx8s7mbmNZp3NWLmPPBYoT1mJ441G0D0fryk+Qq6bIZZRpRhRYRXxc+9Ls3+isT/xgKMNDQuKmMR8fb6JjNJCK4BA6yu47/FwnQfvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260696; c=relaxed/simple;
	bh=KEbc3/wLZ3yEefdL/a1cNZY8vwLS/Lxd9eLnkid9nNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXzndlSgHJVc4RyfDOVQBoE7yZ+fK9rIRI8jJJCSnjGHyHhq6WXWKsb1uWaDWL0DURkTEF0nOmNDKSh0DBGlcN+qMqwenAX3RhMXLWbpCef0qoEsioxQPuW3SVQT91EJvWTFmQRP8IZzCJIRV/HjOv58zpb7MAW9F/SlHOUBkv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zvi7lwAw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477632d9326so5799815e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260692; x=1764865492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTcIqAVwbMuqqnuhs43S6Kmb3IEB/LqZTljfxPBsmsY=;
        b=Zvi7lwAwcd2HrdkNVCDaumV9JtI6WEo9shDE5tWNlQLnxWjwSKAAjbzTKBR38JZ/Zi
         JREmp0bCX9b+NfUv7a/jgC5PTaQXllFRYoEfJLFtgr8vMrVqEsz8bLVE23WzLBnroU1A
         GmbO2y9zfswBL/pH6LDj9tCtC9ZsoBopw2hS6zuvBN1+mW+G289C1tDvusUpIt+lewXz
         swiMdwyUuR01qfZKHUeVFKVglaEgI0fEFn3xCAh9qXjwPmjVJOWDwesafX3Wly4ldnSd
         mHCOxu+kOLYYaRwnnEj80A11aIj+gb1V4NLPF2TEB5N1PpFnbBpoiCglC8dcetOIRThG
         3gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260692; x=1764865492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gTcIqAVwbMuqqnuhs43S6Kmb3IEB/LqZTljfxPBsmsY=;
        b=uCaI6ec5Q95TPhL12ZUxOO4ML9SwGK1bmpEJSDvNyvDI7Ihxo5tEdcD/zJhUUT5GQA
         bxiEQad+vNJxroENKpkqa63ctD05MHvCFPEa2YOPUPAosl3lst4xrXLnwANOOFTWx4aH
         l8I3KL8KNJJj3XbmVt8whQOYY8qQnwkPYUaz1tQDCJeHU6AtYjOE1rvQVyUZNC1/P187
         IT2+RzcDcwtn/zEerWhctEsiH1i17yak1b8wS+DbEHQd+IFZG0i5I1hBiAchmKjhXTKw
         judP3hnZF9/JotsXm77Ku/4nZgOe2T/CUNOSNWwERCKTIPfafa19JvTCNBVNRsTe9TMX
         8vYg==
X-Forwarded-Encrypted: i=1; AJvYcCXP8XtpKsjoItCiLlMJMxfcgwiaff6Q85iQJsOfR5xndgVYhQUmsZ8sFmLcpSca5D2gRZfJREhXC7k50uym0j/0NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbH7pd3d9zCROjj+KyygGXblWCSF36/drPLvt/IcAbij7xO0eW
	utaRid74QfthM1/tMo/LmGFTjbaBVWU8leNObLDUzqCY3BgccVEMyoTy
X-Gm-Gg: ASbGncteWzFUWcbzXwg2J0bW26T6fdGHtfzh3Y4Kf+ut3Q3tIUvSDhUHS+l1NFxeqXr
	mToEL8h6joj+ba46YH6yUYzGoq13aFDYetcEAt8Kl7s67YcYCTCyp437zLG943JxhqrU5giFi2c
	1Mf0tQg48lLGoiYi+p4Q4yQqEk5P1vPFe+wqs2XyPuyEfjGA/XTUDQRNvqERcm2lz1iYOAiAPB7
	tbMg4qDumU33uOJXojMMdG8jaE3Xj3U2sSLLwAe8mPvTDBr9HAAJso8t9qfK3ls76NXV3bH/5Nr
	QsbV7ckDJSzjz1R9D8GJ9IdH0aYxJ4KUfFhC6yV+itp60jqY3BH+Dl1t0FoNkWmokDp/EACNk9A
	01K/AyDHMzTzPOMk+ant+rfGMXcbC0uStnbA3EpaLtKpZbvtRqm/d1zPJYbJRw4XAmxgaxuni3Y
	ePNO9aMiUxL7uVmpnDwH77pH3ojDWMmNj9t0EEOxpDSIzV
X-Google-Smtp-Source: AGHT+IF8N3ewnuyMX88+NXRH3kZ3Bujo+UW0AzRI4ObL0WXA2HX1MdjzHZTikAg14GThSQ8zCTgxFQ==
X-Received: by 2002:a05:600c:3b07:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-477c01d4b3dmr197554325e9.21.1764260692113;
        Thu, 27 Nov 2025 08:24:52 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:4f24:123b:7b7f:5ea9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm39163795e9.5.2025.11.27.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:24:51 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/V2N SoC
Date: Thu, 27 Nov 2025 16:24:46 +0000
Message-ID: <20251127162447.320971-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the Interrupt Control Unit (ICU) used on the Renesas RZ/V2N SoC.
Although the ICU closely matches the design found on the RZ/V2H(P) family,
it differs in its register layout, particularly in the reduced set of
ECCRAM related registers. These variations require a distinct compatible
string so that software can correctly match and handle the RZ/V2N
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped using RZ/V2H compatible as a fallback.
---
 .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
index 3f99c8645767..cb244b8f5e1c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
@@ -22,6 +22,7 @@ properties:
   compatible:
     enum:
       - renesas,r9a09g047-icu # RZ/G3E
+      - renesas,r9a09g056-icu # RZ/V2N
       - renesas,r9a09g057-icu # RZ/V2H(P)
 
   '#interrupt-cells':
-- 
2.52.0


