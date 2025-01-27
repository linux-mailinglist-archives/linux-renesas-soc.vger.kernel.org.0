Return-Path: <linux-renesas-soc+bounces-12602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93378A1DB53
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 18:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E813A5623
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 17:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7FD1662EF;
	Mon, 27 Jan 2025 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCuQ87Up"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0A291E;
	Mon, 27 Jan 2025 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737999124; cv=none; b=EG5qoH8mQqM7+TXkGr5KLeOs0Vc1VWlHJ1f+j/OYMdK8rmxqDVPOaeAJau3cpmALrmHQO6c7ZYBaC/1GmHLHt2kx2LcUjCj6DsNR25xT9ZucR0UdiXCRokl6rM0jv9y9KVWJwCTAFqQa9hCIh0bVbeRdVYVjo59jQ3Ei1uY292o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737999124; c=relaxed/simple;
	bh=WkWIpdiJC27SvGibe34DHGnMGzhRupB0Nnp9Tapr6cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFbOZcHKC7NydvQW4vdYfJaifJNc8TY89hzncNHH8RWxVKSKmcUgLMYG5M+rxyS4/OX2Ae3uQCzKluQrT2ReNCjrdSLGrGksGcpW4JAujfSI8g1lmH8DXxZSz1ySHwbwSRCAI2e7A4qW/rByE3BxIDYJL6QrjWHjjCN4bLgq2sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCuQ87Up; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so2368988f8f.2;
        Mon, 27 Jan 2025 09:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737999121; x=1738603921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z2MMQedpsH2GPbDZJATIDcslx0EmXMUJV7GkfJHRjt8=;
        b=RCuQ87Upnvs+UkB7lQHStWarXXil5FtCorPL/l5Be60rAOqotQ79crs6lBYoe9DFCD
         6kA5gzOY2jmWxJW4T/LHkareR198BdnnnlCH1mS1Tzg01sN+4zoJkcVWuXqOtg5ayfPJ
         BN1s+d929lMeOxawYCDikPXh7wvvXG7xbTN1Oc8xYCORCkckXuiiMUXUCvdsSlYXdUYp
         RZjH7p2NOG9tB6ftuciRiPFpFhsfaRaShFheU4jYGUYfd3fSEU8obUJrceRwGOwIWYwM
         P3JFAGcrQDd83JkFZkK0hPbJ5Wha3U1wD/BYcXfHrv7+vLuGs7+BXfBzmNvvkBqjQheL
         3v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737999121; x=1738603921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2MMQedpsH2GPbDZJATIDcslx0EmXMUJV7GkfJHRjt8=;
        b=kp8q6a5VBxvjI5GN8Vrf9lz6do9yYUFSILQ7q356kC68MfZDeOnOwaj7HKC7YlRGrB
         49PVh+tl+IH1134xAuqETyX7baX5s622ItaSK3dZM/n7NAhPwbIpa+PU5Q9Grqd735Fq
         kIY7VlpJZ7OGBMjIS2JuXPh3ZpiP02AbKg/KeevniPhfc+AoNzTaYw4YYPAUF507Z6TF
         ZhVPWpuVuP2Awb8KzuNej1Y/kgxJfUeHmkkOD050b6+JDH7NJ3XDLTMmu/R7Y24AtUng
         tSAn6MjqGf2YetmjQ3GW8rWvlvfLhdJj56SxG8mIvJ/Vt5pNa+fy6hUQNArRxoUIsjrW
         RJyA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHGnw4VRtiGse2+ClVJAup0pZnS5z8hneFvEgsltIDmJN7NXjGosIxqBoG5TDvRUFSrQGQmiLCrqb7NoF@vger.kernel.org, AJvYcCVSvJ/JGsi0Z54pui1pe5txycRUf36dcR0sTnbK5tvr4t59VFF0/NbxI460rJEQE/fL04KkKaxAz/o=@vger.kernel.org, AJvYcCXxweklzdsjrdO5D4sHT26d9lmfy3e8ORPl2WFKz9Fwd8KmhMwEp7h/N9v2EbiqfionFbkwNFdN@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRCupqtNDxop63pt9kEqO1lZLxjMbeU9R4wmSyVRLyqhX3D3b
	nQ7tje6rPvCZsnq9C2AYKCQ1NX3w09saD7HGnpolYbNJGIX5Ikdk
X-Gm-Gg: ASbGncvoR5X8kKi+CcFU/GE9xHN9vNIXg5VRCgjCBvcB3+HBsfIz1WXhT2KP28AZzKd
	J0ejKlpb6VRBtJ7voPapcQhR69tBAN1kBMGf8io95nJ3POBygTxDUMAm3f9xqdCSFe5YpZOHLC2
	9AW/I+RyvnyQptHIKvjqBnfmZ2LahaC5BAbPwEs/oW3XADy3N6piuZnTo9Ng2LTHXkDlawPrgku
	TJVwjfOtaKkNE21ieapI2Ivl5/tOMWAzS708cj4W2p3sIsbb64nlc1WyNed606LW4fdppCPu74c
	XTLIpgW21YXsTr820YguvOFZ0jWJWigKyA==
X-Google-Smtp-Source: AGHT+IH6d5dXOKjdzQ3vPvGyqq++UXn5zuy3d62YayDLxIbZfPZbXj5hd5FkKZlLuZZe9Axvbpu8GA==
X-Received: by 2002:a05:6000:186f:b0:386:373f:47c4 with SMTP id ffacd0b85a97d-38bf57c934fmr40387836f8f.49.1737999121070;
        Mon, 27 Jan 2025 09:32:01 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:975a:72be:e657:7017])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188928sm11580551f8f.45.2025.01.27.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 09:32:00 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: renesas: r9a07g043: Fix HP clock source for RZ/Five SoC
Date: Mon, 27 Jan 2025 17:31:59 +0000
Message-ID: <20250127173159.34572-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

According to the Rev.1.20 hardware manual for the RZ/Five SoC, the clock
source for HP is derived from PLL6 divided by 2. This patch corrects the
implementation by configuring HP as a fixed clock source instead of a MUX.

The `CPG_PL6_ETH_SSEL` register, which is available on the RZ/G2UL SoC, is
not present on the RZ/Five SoC, necessitating this change.

Fixes: 95d48d270305ad2c ("clk: renesas: r9a07g043: Add support for RZ/Five SoC")
Cc: stable@vger.kernel.org
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Fixed build warning for non-ARM64 arch, sel_pll6_2 defined but not used.
---
 drivers/clk/renesas/r9a07g043-cpg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index b97e9a7b9708..ad712e530328 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -90,7 +90,9 @@ static const struct clk_div_table dtable_1_32[] = {
 
 /* Mux clock tables */
 static const char * const sel_pll3_3[] = { ".pll3_533", ".pll3_400" };
+#ifdef CONFIG_ARM64
 static const char * const sel_pll6_2[]	= { ".pll6_250", ".pll5_250" };
+#endif
 static const char * const sel_sdhi[] = { ".clk_533", ".clk_400", ".clk_266" };
 
 static const u32 mtable_sdhi[] = { 1, 2, 3 };
@@ -138,7 +140,12 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 	DEF_DIV("P2", R9A07G043_CLK_P2, CLK_PLL3_DIV2_4_2, DIVPL3A, dtable_1_32),
 	DEF_FIXED("M0", R9A07G043_CLK_M0, CLK_PLL3_DIV2_4, 1, 1),
 	DEF_FIXED("ZT", R9A07G043_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
+#ifdef CONFIG_ARM64
 	DEF_MUX("HP", R9A07G043_CLK_HP, SEL_PLL6_2, sel_pll6_2),
+#endif
+#ifdef CONFIG_RISCV
+	DEF_FIXED("HP", R9A07G043_CLK_HP, CLK_PLL6_250, 1, 1),
+#endif
 	DEF_FIXED("SPI0", R9A07G043_CLK_SPI0, CLK_DIV_PLL3_C, 1, 2),
 	DEF_FIXED("SPI1", R9A07G043_CLK_SPI1, CLK_DIV_PLL3_C, 1, 4),
 	DEF_SD_MUX("SD0", R9A07G043_CLK_SD0, SEL_SDHI0, SEL_SDHI0_STS, sel_sdhi,
-- 
2.43.0


