Return-Path: <linux-renesas-soc+bounces-17717-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED5AC9414
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 18:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E22FB7A3804
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 16:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BFF23507C;
	Fri, 30 May 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgVVQRp+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044724431;
	Fri, 30 May 2025 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624354; cv=none; b=XXVI6DLq8Ns8mXRPx/aLB/kxFi/z5h8c9/92ZgCOop4axFv4vdMtxfw9RSjzXenjOuCbEx9KivsJwxzutAVqbgsJ2MTKtEZDQdbWhF1ROnmYpjWsmGNz1h0TaW4y8eeLTYJDEb2xC5y2AxDdcAwX89keALTja8428ZTexATKaMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624354; c=relaxed/simple;
	bh=QDcFjTJoMHfp/IoCanlLWHbqTOuV5QdxXMqbbOeXlDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTASN0+T/tiuhYlG2BocnRyaLdvYB/ws4DiPTT4jjg4vmNmKAvQ3f3Dvt57SoCwrifURkuAopwGW4Z25oTCUg01rpxtSW94wIaPDb4KF0TAYCdSMT7lkTn1QqP6IRLC7IFGtoVywYJbU111thrzcyE2Dd0rbeZa1qm4pPg9H0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgVVQRp+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so1951627f8f.0;
        Fri, 30 May 2025 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624351; x=1749229151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkdnsh3Xxo+Ft79KgRHH0heaPX+QG6uGdrT0HQYcCXA=;
        b=DgVVQRp+BfTCFE2MKihSP93VJCgZd67dkItt4Y+lFg5NKP6f5f8ZWpgju7GO162ipU
         uLkG6yLISBC1TujNDNgziMra96FajW61rYEWKTiMI2eDhUmKxuDcpHCHLGTNAdWzAZTD
         yPu7HqPZs0LExhW5C/J6EyBOU3oFAWwq4kqM++L2CvSNzFG37Bns7wIlYycO9NT/afyU
         Xp9CdMF3Bfb2JphM8vmRf/iRTvTBEqYz6aSteNaXCB7iyGa6E8WTXdFELUSpyU0V8xwM
         YhjMWNfYBngbwDCNFvoyGU67+H5PGEXveDMIwG9IJLY+BRhgquTJh2wOqm0vSvkD38u/
         b+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624351; x=1749229151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkdnsh3Xxo+Ft79KgRHH0heaPX+QG6uGdrT0HQYcCXA=;
        b=YdEiMJOz4wzpUBKycMM6ORSqQyPehwPlgrr1qbb4Vs4HMwoV2l7NSnbqth4V58qIDJ
         XJe8LYEqXpprWEMhxjgnftpZMOVxayIv8oa2r2H54pUCI1XOWCKohUjCDTETQMABcTdP
         mJ/TZo1/ivFyORvs/bjub/w/kMJD8wukqRde5UQEUu3tARWuSX5l0tUDrk2zRX+xDlxG
         91qNrezC7mPUQjbrT/9qXnuh9BZKELptaQBjjXDczA4biIA5IVkD6bW3uoFnBl5ur2Wv
         w9UFfGJ/yFA+uwhBVYzatnhyb5wyJaHaOAzMvVlJUP4HuG5cLQfBmKlnbwTZlmQzaYWa
         P6YA==
X-Forwarded-Encrypted: i=1; AJvYcCWTQ4eLVzEJOFe08rE7jOiZHHxqSX0jj1pS/yvtmDmmwFsXEsAm2C9KY29VqDz1vdbaDWmNBlFAYLCdeIk3n8v4oVY=@vger.kernel.org, AJvYcCWuUSN/M0gaC5jpQ5HFasPLVlhyNNKXg8hOluFRgtIW1FRLYUA5UoqlJrnZKLafQjPGG2YSfEXDLIHVEKps@vger.kernel.org, AJvYcCXbwxBcy6TpC19blYuqYP9610x7LbIB4sPBd0KDBtLd3xSN6MMz9bbuJF8R56tDkodSeNWclh/5ETh/@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmFEA86ueAj0Ue0PQBdEtCi4xwlA4MBk0xwhQCvVFFVJfJOEb
	C/tBXGNoYxjZEschY3NhEDuG5aOayivnlZ5LVjeodOhMV+amhEpYjGCW
X-Gm-Gg: ASbGncuWjm+6aHUug2UDi2Ao3QBTVAxQTpBPzKv0wv7EHZlkCjmNLEI7eAefcO50Ffl
	LmHsY+tf6AmJIX9+G7KSpb9qzI5UYPo+ffcmzAGazhsljHb9SB0V5CFGXN7Vg8mB55mtsocgVPX
	pjKkG4UBEzZ/AX00PGe6cE5XkamSK/LR7kgaHCVeuseFU06FzvO73ZiBG9FYbNgC0oQXEI7LU8c
	rpU1cVhg1zCSActut7FA5rsXuen0N/hzj3Z5NFBr8Y0tU/6f3CrmuyrFx/ueBlpfHfX25Vt70FL
	+YI2sWLLP3T1qeuWnfNMEkvl+Dh+7aC7FaYHPmce/ZVkPoGVJFMsO3k5c4DZUMI0t1M6DvDkNQj
	irS02/D1B5w==
X-Google-Smtp-Source: AGHT+IEMdCh9bMOyoUceDJJDejeSDUZ4ZYwhPF0Vjns3pxUtXH1NXJj6z9RwihvUpQ4S/igJjH4hCw==
X-Received: by 2002:a05:6000:220b:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a4f7a825a2mr3097258f8f.31.1748624350952;
        Fri, 30 May 2025 09:59:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 00/12] Add DU support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 17:58:54 +0100
Message-ID: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Display Unit (DU) and prepares
the MIPI DSI driver to support the Renesas RZ/V2H(P) SoC. These patches
were originally part of series [0], but I have split them into two parts
to make them easier to review and merge.

This patch series does not have any clock dependencies, so it can be
merged independently via the DU tree. The remaining patches from series
[0] will be sent as a follow-up series, which can be merged via the
Clock/DU tree as they have dependencies on the clock driver.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v5->v6:
- Added reviewed tag from Biju and Laurent
- Updated commit messages
- Dropped parentheses around the calculation
- Added min_dclk above max_dclk in rzg2l_mipi_dsi_hw_info
- Renamed dphy_late_init to dphy_startup_late_init

v4->v5:
- Split up the series
- Added Reviewed-by tag from Biju
- Dropped feature flags for reset and LPCLK
- Patch 07/12 is new.

v3->v4:
- Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
  description freq_millihz
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication
- In rzv2h_dphy_find_ulpsexit() made the array static const.

v2->v3:
- Update the commit message for patch 1/15 to clarify the purpose
  of `renesas-rzv2h-dsi.h` header
- Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
- Replaced *_mhz to *_millihz for clarity
- Updated u64->u32 for fvco limits
- Initialized the members in declaration order for
  RZV2H_CPG_PLL_DSI_LIMITS() macro
- Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
- Replaced `unsigned long long` with u64
- Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
  rzv2h_cpg_pll_clk_recalc_rate() instead
- In rzv2h_cpg_plldsi_div_set_rate() followed the same style
  of RMW-operation as done in the other functions
- Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
- Dropped rzv2h_cpg_plldsi_clk_register() and reused
  rzv2h_cpg_pll_clk_register() instead
- Added a guard in renesas-rzv2h-dsi.h header
- Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
- Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
- Renamed plleth_lpclk -> plleth_lpclk_gear
- Collected reviewed tag from Krzysztof for patch 3/15
- Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it
  is not needed.
- Simplified V2H DSI timings array to save space
- Switched to use fsleep() instead of udelay()

v1->v2:
- Rebased the changes on top of v6.15-rc1
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Biju and Krzysztof.
- Replaced individual flags as reset flag
- Dropped unused macros
- Added missing LPCLK flag to rzvv2h info
- Dropped FCP and VSP documentation patch and sent them separately

Cheers,
Prabhakar

Lad Prabhakar (12):
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling

 .../bindings/display/renesas,rzg2l-du.yaml    |  23 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 144 ++++++++++++++----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   2 -
 4 files changed, 146 insertions(+), 34 deletions(-)

-- 
2.49.0


