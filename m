Return-Path: <linux-renesas-soc+bounces-21312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB6B4339E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F99D7A7F53
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 07:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9717529B78D;
	Thu,  4 Sep 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKYZDvG5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9D299922;
	Thu,  4 Sep 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970402; cv=none; b=hTXH33DIUWN0dHF4JiLLjxAuZicFnQKJtoGUeB8M4GRKQZ8FZ5lFc2lnt2iK09TtKNppAi4SON0tVxeCAkxgGnurxOEVbf1q26BYhFOdLnWZ3bs+sqIhvnXGKTV8tz0/BI/+bboOgL+zy5AhetnvZwi0kNS3dpL2nJYdqt7BSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970402; c=relaxed/simple;
	bh=csfOS9fRfXixeanrTSuZs9yHZGC8qF31m0682PmjxP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aq705S4Xs3kx3p8gzKjexcgnkGG1bzedJyqqod/Jwx3LJPEam9Xax0BKoo/YIcC0FQlgZ0Rr/cUsGhKAyDFSqZnkrw1grAPx3KqZ66fl06S/hIS0qpreCbRdxs88FDM0oO8lqC+lA6DKIZy2vIrdoIhzieGio23SBEeR92lsIkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKYZDvG5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso4445275e9.2;
        Thu, 04 Sep 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756970399; x=1757575199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKqYPqEbjNWduF755anfejuQKrD7KxRh0yGNq3pFv7o=;
        b=hKYZDvG5VfgOr50LfZLz7xI8AaZlFiUKf7IKxOOgETEdECDRZKXQ+PzsYsuVBd4q6s
         /WrMy0fDvN0aN1sc7yyWX6eQXmICJy78RqPRZGioezFzaBLl6UpAQSLCjs8Mdf57cYZ6
         EdPc8ZHeWF1pefZUc2TzBEaUIRVov5KtSalb4fnWUV0R2y2jl4qXpOnCv21Dpp0kVMbk
         PfwT+k07xy9INJ7+LkMN3zmIWnP50r5o0R3jl7bmApcTa3YtdlxJyKtRVxzJ2Z5v1P8m
         1Jxl2+mESpklCPX2U71rEGnFFC6lnNqVgywdXVm6cbJrImgyiLy0W7r0HI4snpcACfE4
         E6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970399; x=1757575199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKqYPqEbjNWduF755anfejuQKrD7KxRh0yGNq3pFv7o=;
        b=Qa7e33qCANXZ7matEXD0TU+r0ymsZ7eFLdrUns8f65Lf0tOpVSLHImHgzaeAIvX449
         GcCl7FanO0yhhNQtY8nVaY5oeoQVoA17cs65L53K1ex856DVjzubytcBgzRsKnImD1NI
         lQNfr1ysxWRT1THrTCb+paPwRs9sM8wZsrcqxVRxI7p0hrnTrN2ahyMO0o7fAJSCiGmX
         /tUA0j9LMp4PbKSzGJWoiG3smtxYmm5Q+QIr2iYG9Hxod3Ls1JAiHjNChQavNaYanhoY
         n6uaFMkbshGdnY+lCG1f80Mam44NrJLdusnAAiogdavehVw1pOwFQiAMvIPAfUUjP7dO
         lcKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAxRrFMtPOwBmp4YKiXV3e/GdhR9z9IJH5e70MI1GpRShUGYXVGtuNshc6OBBFk4wUMrdqaeuioFLI@vger.kernel.org, AJvYcCVCW3vc3G7mZsKFL1FabLBQ7E61fgwShgf7aquasL3nwWo+BTjdP2T5CuvouUFkZ5yOf9+Gaeo2PpXr@vger.kernel.org, AJvYcCXFDJoNgc6Ycp35UScYQST34TVOl4HJq1AqGdN8Q0uzfKsi9bQasq2miLYvUefPn2f1ysbsXCRhAzG2pVpz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzh+M/YPX2BZZFAT/JvkgPATFM1ZoaZLkv0ddw0nwBONJHugMU
	LkfApEZbgxRVGqMUlx+U8YOtOwxG7m8Uak0nsRvvecqA40YzQmS/VitG
X-Gm-Gg: ASbGncuVyp/P1KOJo1cdpWdWMQAaqUI+1+hprGH0dYUqAxmu/nhmlbfQtH/7WUumypu
	dj0Hao5GCijUlAkBWuif8J9U7hyaY3UINZC38OwxMgH0aceYb+0xJSA4f5anVB2Pa8SXUYVMwcn
	QMe9RHObWwpFhpfvRfasTOiBtXxPNUaA2SRu0ZQLnPfdL6/h8lSNZmZWLdnyAGJRRCSOa8HqR3Y
	s61Y9yq/x1Fpb+Y84lPXcBiFqswhE3+4bp32f9KaFbjv7x1pZFc9OIGpjsdEVu9/gV9SDtgYxV/
	dsJRmzFbLIK9gTWjrcrMiQULK0gkf3BolI2X9BA8wz34xUl3vcwiEyY0WyVR15GtAGCjKiDzwu4
	5xD4vgBqKXeH3qdS8iBU0EoKDbsD1Qe7bUhxb/cGas6AyKJUbUdF6BKTp8w==
X-Google-Smtp-Source: AGHT+IHrj7IIQe7Zeil2YlYnI+2zpvvVEt1Y62sFe4t3fYFeyR9DTn3vu54KlWEiIuIazrxWcw8pWg==
X-Received: by 2002:a05:600c:548a:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45cb5f7c9fcmr42591635e9.35.1756970399008;
        Thu, 04 Sep 2025 00:19:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm270962835e9.23.2025.09.04.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:19:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet clocks
Date: Thu,  4 Sep 2025 08:19:53 +0100
Message-ID: <20250904071954.3176806-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock definitions for Ethernet (ETCLK A-E) to both R9A09G077 and
R9A09G087 SoCs. These definitions are required for describing Ethernet
devices in DT.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Dropped R9A09G077_GMAC* clock definitions.
- Updated commit message to reflect changes.

v1->v2:
- Added Acked-by tag from Conor.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 5 +++++
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 0c2ce81a8744..2a805e06487b 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -26,5 +26,10 @@
 #define R9A09G077_CLK_PCLKL		14
 #define R9A09G077_SDHI_CLKHS		15
 #define R9A09G077_USB_CLK		16
+#define R9A09G077_ETCLKA		17
+#define R9A09G077_ETCLKB		18
+#define R9A09G077_ETCLKC		19
+#define R9A09G077_ETCLKD		20
+#define R9A09G077_ETCLKE		21
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 70ee883f2386..09da0ad33be6 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -26,5 +26,10 @@
 #define R9A09G087_CLK_PCLKL		14
 #define R9A09G087_SDHI_CLKHS		15
 #define R9A09G087_USB_CLK		16
+#define R9A09G087_ETCLKA		17
+#define R9A09G087_ETCLKB		18
+#define R9A09G087_ETCLKC		19
+#define R9A09G087_ETCLKD		20
+#define R9A09G087_ETCLKE		21
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.51.0


