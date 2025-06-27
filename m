Return-Path: <linux-renesas-soc+bounces-18862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A4AEC130
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 982031899FC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79B32EB5A4;
	Fri, 27 Jun 2025 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sly267TU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039A022B8A4;
	Fri, 27 Jun 2025 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056968; cv=none; b=qL2Zzioir/fmAd/5DwSL59Tzpo/PdWBE9p9gWt9EZXbKniiWavjsC+h8AJekGifXI4oLWr9qJ3Hiz5fxhYGvnJ2fCGM27849LSUwVjWjdGRR72H3e1WVd67jVpN9ebcoKa6Cyk+JADS5SDg+rq7OGvFmJoN5bZ84zMEH8Wed7sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056968; c=relaxed/simple;
	bh=zNCQNaiPd3jlbEEo86GsYioIXtKhOrcDSUq+16QVd+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJV9bLz5y4TP0JcsNDXLAqUKbpeMFQA2dx5GwVcEZw2koSko04hzaMa6Bdn43VmnNy/Ee+nBu/KEF1CuTlqcS1vfy1uPUaOUM3W+OZAjGl70CDMyFpgxhanNjCMiJFV3vHm+QW6pe0HES8/IjumvR7JWx2kBxqS3zq9SotIFEyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sly267TU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso25345275e9.3;
        Fri, 27 Jun 2025 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056965; x=1751661765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDjPNjwR4QRhLMuXtp8Qab3DSzyjcauBxBiyY5yYLvY=;
        b=Sly267TUjX4+8qHH76JBHVkTNv7M/hx002ns3a7F+OF5DaS7/JL5Z3bIa5dWwpznsc
         gV2vmFGeYLVHZ8DS4lrthRuE+eHXugG4AOLulVgj4sc/GYJlf4fDuFk9i2vNlj4MhMjX
         dO8O5DPVIwuGvWS/uAwVy8Y22aGNBnJfCXsNL8tv+7zkv7eyNtJ0LXEz2mEUfj/4S3Te
         shYIlOIQ31lkK78K15tuKF+umquScqJI+axJAaI9EC18WllB6sRTF0WD7xzZnJsLtk1s
         5vMxAiEDotC+tn3nEwdGGM1Wp6EtB/3yAf8bm4nkClyQd+DxJu3aDEgYXkQ0Efjnhc83
         NKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056965; x=1751661765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDjPNjwR4QRhLMuXtp8Qab3DSzyjcauBxBiyY5yYLvY=;
        b=Qe8U+d9ZQc+M2S5kxpeczlNDVLJolg1EICOHU+HIkSq4fkg+OYMsNTuGmz0SDk+h87
         tvfVeSwSU5/WxuNWjhvY0mou/vkanFwdpFaFwEWuNQQ2/o0Mppa7FwYLpQrsGgI79bBT
         fSaurrYqz5p5KNwNiSrxN/NgLBIQ5vKtBe7eu+BYlh6kBbOpBIje92KEW/NLEEaDT/Fd
         9FD/M5F1v8jTShIuVZfz6q28givhqKDpYVmrC8if95k/jexcchqPvrnaCOJVx+JFOZMb
         SOcixFHEp69oI78+cVswkljtS3Sp3UKbEV1qQ7sUZvWlSI4vgSG60FFT3rvpJ3mw59jv
         HRIA==
X-Forwarded-Encrypted: i=1; AJvYcCWVldzq8g2mU5eLNxwyrEwNg/8GUvglihZMGU3XUkn3YWW89cQ/F/H4a1t2zHp17o7gGSpb5TV9/53c@vger.kernel.org, AJvYcCXH29rwNCiaB1/fkKJGdxYFyFcQsEpUR3VlsuqzgNWGu3+c7TGaVwpV/FschrgEoZiWYvTAWgyF5toAr6OF@vger.kernel.org, AJvYcCXfF1Wmixk3hmtDKZ+mgPSZqkDFqyEZiyong45zdewAyLtozKZF8t4v05taNUmLCnRl4VUmwo4Qw9Dy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lSgUJJo7lVwsTxBFHTP/7BEAlkCrIUO1p3scL7n4IwsRzHdh
	ejRrno32Pwy8+tNKkGoxcIoUpZ6aB12/pSlIgVYSmiG3FM7LC4749uBYVEUvFakI
X-Gm-Gg: ASbGncsABO6s27pRonmFeFYgGwTAVSMBO3XHkdvqitCZ6CUfN6FiYeCoI4JS2Bkgxk1
	GX+4BKIZ34rsUbEE4mbp3X3/i45HgCXGke4rPBd9cC3zFFq6faTyOT3MSPPvkgsHdHlsWESiWEl
	4epIaA6JiXwLXemrxncRQuSI7TuKbz3TrUQAEikxYVTy7RV3lw3pbFd5Wekmk767rJ9MwrApJoS
	wGDwRk8cmAyCVMDkaD/gfnWIgla+zma3X5Fg/wZCDLAKJjq8Y8q48ZwGtw/w9aAWLc5psfKNW3D
	3oSvi2XSABty5ucsgdUpDovumNBRv5XGPWyBVfHNooHEWGTujorxvKC0lfT6WStzBhEmt5HrH2n
	qLuymcXMMonYmXOvfR29u
X-Google-Smtp-Source: AGHT+IGIslR4bn9nNz+PCdY8qPdOaTdPT+9n0eD4BRbObwTiEOLCS0yr2grnDSh0hlzTeepDk0S1tA==
X-Received: by 2002:a05:600c:8b28:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-4538ee5cefcmr46708815e9.25.1751056964943;
        Fri, 27 Jun 2025 13:42:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:44 -0700 (PDT)
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
Subject: [PATCH v2 1/6] dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
Date: Fri, 27 Jun 2025 21:42:32 +0100
Message-ID: <20250627204237.214635-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add XSPI core clock definitions to the clock bindings for the Renesas
R9A09G056 and R9A09G057 SoCs. These clocks IDs are used to support XSPI
interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-> v2:
- No change.
---
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
index f4905b27f8d9..a9af5af9e3a1 100644
--- a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -20,5 +20,6 @@
 #define R9A09G056_USB2_0_CLK_CORE0		9
 #define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
+#define R9A09G056_SPI_CLK_SPI			12
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
index 884dbeb1e139..5346a898ab60 100644
--- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -21,5 +21,6 @@
 #define R9A09G057_USB2_0_CLK_CORE1		10
 #define R9A09G057_GBETH_0_CLK_PTP_REF_I		11
 #define R9A09G057_GBETH_1_CLK_PTP_REF_I		12
+#define R9A09G057_SPI_CLK_SPI			13
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.49.0


