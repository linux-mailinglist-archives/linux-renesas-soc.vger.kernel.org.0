Return-Path: <linux-renesas-soc+bounces-20994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B90B38968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 20:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7412C1B245AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 18:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356842DA746;
	Wed, 27 Aug 2025 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP4snp9R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C2262FDC;
	Wed, 27 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756318794; cv=none; b=qv/ge7zEnHX/d8gk2sSwsKPKE6+VmGGRduYk+ZbtGuAdi46f7zLScmRloiXY/BLpQWNwA9R/J7LWZ/M4D85dOG6Yn+7/txCPC8Ygz00teeTZGc04teRz+OD4LOSb8McjvtMYMtuUz6RdiZz5MibHbBQx3sW2PXycme4vY9EM96k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756318794; c=relaxed/simple;
	bh=8BjETvcyYN4X1RaT81hf+Tw0sc6S8h57C4sprBkRano=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSvpyC1w+oqwirwJSp3n+/1eFm44/7tdBGDnALR4REsEsvRkUz3uRct9rnFwOfDQXey50HMTqpIrvooWzuFg+4OQuNAYL8US8+cZnU8CrlqKEx6aaiXd8QI0Q9uTtpDC+1m0qd+YqskMJC4Huna91VhMPSgYD+H9P66BOEgoGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP4snp9R; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c7aa4ce85dso81430f8f.3;
        Wed, 27 Aug 2025 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756318791; x=1756923591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFanEiX3VG+Tw9wsy0BSBbFzmu8wJaMkAF2P1/YhChk=;
        b=eP4snp9RItAOzC+KZCmGKFFb2fLI8K6VNaVmFO6H8Ge4B2iPCzgjWcTrkdVuAdCo1L
         287bYP5i1h97gQZXjyTFUitetCMNiUd1hROQdl5/Qyqx5e1P+2QlFvZ8V7U/9HM3N9EH
         ia2oMYtHk9CMs36XFJBvjmPQAdN21NbVxbtuIKWZ7zvGhmyKG7dLwnAzelnE2g6r52km
         QeAtmaIFe0yRmqqAqJmXkRG5GvQabNiWBXNGAUJ0GDgehvFAwBLdhvz7Pv3vTSsLJBHa
         6MSDHuwSZ3FMMS1e19Qd6tmy7LI6NcDKe+ITcsdvhtHyIveZofbMdslh7+rH7mGwuwun
         8u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756318791; x=1756923591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFanEiX3VG+Tw9wsy0BSBbFzmu8wJaMkAF2P1/YhChk=;
        b=gv8KL1SG/JztzZ7jS9UOrKaEX0pEK64u+x4u+lX+U4gbZWYf+M+PQbjVKen6s4Mcms
         ae7HuzvdAvdK+5VFbLVPHFk4iLtkij5wKq9HGf1h73swfO3F8bnSLtPJIZ3BLsZ99goz
         eByz7dPremqzsFSwAW6nn50KYtUxeUVHXfd6pjQac3ynkiRS/hV693QZf7glL2FR0pnB
         fTEh8B1cp93EATyBomy2EGE4vHFr28ddyrI4bsmz2IB0n+deUm0mU34YqFdAVIf11aZh
         IUNcSmpG/0lXRenECGjqblcm7N6Lw5mv0ln6MRY8T4w4PREva9xu8GhZLc3k9YNPPWHi
         yR6A==
X-Forwarded-Encrypted: i=1; AJvYcCWtSSO2LMe3WQWGk4sO9riWimfmnmgA6qIMWS/90IpUT/Hafik2zUmd8beopHs5+nLMhtDTNqmc9i1p@vger.kernel.org, AJvYcCXoptPbdk9drg/k0+RhAgkNVXwtXVCU93ZncKUJPhrqXU567am/98y8Me38rHigPC63YrvwWOLm8uki@vger.kernel.org, AJvYcCXy9WRY6+O2IajHYbFNLrwS0Az/HxeRx987jBSJ35DBYfROKbeXYSzQb8aS/tIwuqczRX59aouFuUu10HB0@vger.kernel.org
X-Gm-Message-State: AOJu0YzYkRfBwLvwfOSZ1KGxuD5ydPiFLLPxIvo3mcyYEOjgBsjAHSqH
	mSNOMBtrpQ25UTN6GDxek1GrGqhcIcavt2fu+xGA0DWkQGhtKxFxqr5+
X-Gm-Gg: ASbGncu+rZ+1bYsatWciMvA0eKHQkmXMKl/HbijHbEEBpy8OyZKd+a/EGxAd59hZ3rQ
	tvkH9tWKOn8rQX10wHzGD/FlBCugvHDnQXhMOCOcqTUpRZfiPnN22/s2t7YZ6ughtbhVFzO6RFm
	l9DTWkIkuPCxHIok+QP5WCuW2S8IOSIVhM6JS+zfTPlm0HCXZGgcP910g71qcRIzDyAzVHp2mk+
	lZU0H3H3obG6nCaA89dcpM/2MV9MrQe2mQK894GYDskt/BJWGApSB0LJBswlYYqOi9j4HbXbXty
	F2TtVLadI8yUNVp295ZkJWjd0bZ1RhvD2AKM12+3kJDZ/m72D3/h4ZT4xPhgaq11Ir6MZFhQ2Ku
	x6LFeY9btZZKsWLq2q4GJkBi12x8i6q/c+dHzCvSi3TGGIEJI4lbTfCgh7iTKnKBajwMDZBKgrT
	Nppg==
X-Google-Smtp-Source: AGHT+IGO5/wZ0/9a2JC2pt3ohYEmR8gcYFieARTgYerUXMvL9rDT54uN1pu+8BOp0c/f2Yf2GKAn/Q==
X-Received: by 2002:a05:6000:188e:b0:3cc:72a4:3ea6 with SMTP id ffacd0b85a97d-3cc72a44c5fmr3071031f8f.37.1756318790318;
        Wed, 27 Aug 2025 11:19:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c546:df97:4816:d7e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6b1cdf05sm24604485e9.1.2025.08.27.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 11:19:49 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet and GMAC clocks
Date: Wed, 27 Aug 2025 19:19:43 +0100
Message-ID: <20250827181944.2750142-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827181944.2750142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250827181944.2750142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock definitions for Ethernet (ETCLK A-E) and GMAC (GMAC0-2)
peripherals to both R9A09G077 and R9A09G087 SoCs. These definitions
are required for describing Ethernet and GMAC devices in device trees.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 9 +++++++++
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 0c2ce81a8744..a9e88b0c502d 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -26,5 +26,14 @@
 #define R9A09G077_CLK_PCLKL		14
 #define R9A09G077_SDHI_CLKHS		15
 #define R9A09G077_USB_CLK		16
+#define R9A09G077_ETCLKA		17
+#define R9A09G077_ETCLKB		18
+#define R9A09G077_ETCLKC		19
+#define R9A09G077_ETCLKD		20
+#define R9A09G077_ETCLKE		21
+#define R9A09G077_GMAC0_PCLKH		22
+#define R9A09G077_GMAC1_PCLKAH		23
+#define R9A09G077_GMAC2_PCLKAH		24
+
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 70ee883f2386..c86ffa68f87c 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -26,5 +26,14 @@
 #define R9A09G087_CLK_PCLKL		14
 #define R9A09G087_SDHI_CLKHS		15
 #define R9A09G087_USB_CLK		16
+#define R9A09G087_ETCLKA		17
+#define R9A09G087_ETCLKB		18
+#define R9A09G087_ETCLKC		19
+#define R9A09G087_ETCLKD		20
+#define R9A09G087_ETCLKE		21
+#define R9A09G087_GMAC0_PCLKH		22
+#define R9A09G087_GMAC1_PCLKAH		23
+#define R9A09G087_GMAC2_PCLKAH		24
+
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.51.0


