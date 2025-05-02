Return-Path: <linux-renesas-soc+bounces-16642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD10AA7283
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F473B2AD9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B6C211A1E;
	Fri,  2 May 2025 12:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBzYfhka"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F922DF95;
	Fri,  2 May 2025 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190030; cv=none; b=JrZjFLh4xZH2n3C6nd3H2vHKDKNsCrYYxyhwJhwCan5yA54UYIZ907/XYD50ajAo41Kji+bIYPTA2i2LNn8Cic2mrVanmjBYoGmBmwUpwaHapjJkTT9npOCDcLhi9iy0QHfTMIFvcRv+J0RS1GyF4e98lPQZExydz/PsQ4hEWtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190030; c=relaxed/simple;
	bh=Lz+EkGSbFWZG2eJvbZPY/jeUHvOCoA+Qj0Teg3ATq7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUc0tyWIwRNKYpb+VwiLiwI9cLioK7qm9P7fihPX0cYQcGuGvzW+fbiyWusJ3m+qiAq552rJVDXz7Ths57KT6/BF/f6mM/WqsY3ww6OxuzkwUiwBQ7HqqQKvw6ektmjqXNcTHP/ha30zWTD7T6nkW+rynwkcd1GPU+4ZW/gAjGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBzYfhka; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso12115665e9.1;
        Fri, 02 May 2025 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746190026; x=1746794826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=;
        b=YBzYfhkaVh99dDik8lE8P4ARkposSNURopccWty3lCd8si/UY3soC88RbNnb+DKnu8
         uAoXooHaAj5fUmKWfmnYtCyYdkZybgd3npqpdEvDKlsud2JEzEKklP+ciCo9VSxu0tV0
         6Iq2WSIyHFafWyHDNzJ4tgB7xbtLDEfc/qCo9e9TE86S7gmPYs+pVaEPvKm0tMaOIiP6
         4ww9D//dW0NDHV6IFhQIjxqBVyNPxCGajBJ7kuaQp3byzw3ODYmP34fLts8BlqAjqeZA
         b9MnL72PC8xx6Q9bt9+AxGGfZ5fuhqlweLo8ZgZCg/swq4eTkQqOIO9jkdogM91QInHt
         hjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190026; x=1746794826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=;
        b=hbTVTmaACSxJkSsRWSTnMXXXM+A5HQVtC+CGnbBG7ETuyUJxfWcTsud26dCM2+liqb
         jp1ZG3kVXS0HThs2q4NojmvuFLQDaKCUvbcsq+UBKlomKAUUC+IAbmvTMHG32IHX5Ka6
         SC/oXlruTeD5h6nCPG98D4Ge/PSlxu1BCMJ9C4D5awTDhi0VRppiUQyTcIpx0KRNiMrK
         jjFWc58lwaG8FUc8mg4jpE5Jrp1WM0XE4P2KlOyGW8Fd0ZFzmnlMiM3eGV908Br2C5cn
         1l5C2lgEsekGqCumbeNXsXz4PM7kZsP9KvOXV9mzav6erRYqClqFj0FPa/wzlRsdfGtB
         tR/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNbTjHN0N5oUnA216znZTKr1u49KeVv1hs1wESePs+tftvj9984+/KzlkU524i+9CofWaaCZvdGYZu@vger.kernel.org, AJvYcCWhXPdyeg5CbRzCZ4V8qEsHCkhpXDztrcysSLcrz/kS9qDkgC2ql3UOFn7TJ/emZKszT9QR/KGRKyPoJ4ey/4NnPkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4lE/aSgA3aHPAlyYTk2/RiCb95UvQe/kMxC1C95fyC1PRGQh
	afXKJFL0AGrP+jU82JLLdLzTezjFaO0P3J9flxiH1HymfALNlmv2
X-Gm-Gg: ASbGnctDIoq705Oc/YD8/j0/uqMrJf+TPAvu1csvFl6Y27sfK5Y/cRChBJofeEYfRQ/
	3sNJ5ijM56Sia3OCtbyTw45RBGnSMDTOvS0pyW4nBo0HTARvY7CH9nsssKteF2cr7/BZBEa44YI
	FJOljBNfSAZDOCciBeZMmcL3qHPdQPWqkZQMwQAACWC6SfP8ExEPczRnCwHTMHodA6gO1rhtkbS
	KGd8gliwKZRhFf/1Ydgo6JbOd4wiCIt+EEChA5hAVZqPSVFOgfgIi0zuig5MCxaGQGv96YjjGKt
	brA1sGpqDWfapIb31V0MFrO4tF4meo9nZ9MWliJRFkvKL0xabO+u/6PR3HZFr3Ip6ZR2PJYk/qM
	=
X-Google-Smtp-Source: AGHT+IGligrngWzegbeijlkgnA144Fj0oT7CnzNyCMXUijz4fcNIQm7z8dwBSQY1cErpDIrT8CTnwg==
X-Received: by 2002:a05:600c:a016:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-441bbeafc6emr23873365e9.8.1746190026203;
        Fri, 02 May 2025 05:47:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:47:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Fri,  2 May 2025 13:46:26 +0100
Message-ID: <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also update the bindings to require the "resets" property for RZ/V2N
by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
the "resets" property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
I've restored the Reviewed-by tag from v1 with your suggestions applied.
I hope you're okay with this.
Cheers, Prabhakar
 
v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
-- 
2.49.0


