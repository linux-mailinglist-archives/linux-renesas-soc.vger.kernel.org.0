Return-Path: <linux-renesas-soc+bounces-16990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823FAB4340
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 994331890AD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7D72957BA;
	Mon, 12 May 2025 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="np+ppAEZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC13252904;
	Mon, 12 May 2025 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074230; cv=none; b=mefMcf+dlr9vQ/kYiuCrX4r/A/7/yVR6H1zU+RgN3yR8weeMpXguRH+EHXHrb2Y3eLxtpF3nmNFns88Uoa0p7jTlifph+JjJkn87kwtoedoUFDXZ1857bsr4yFLe5GXwh5Dz7FGaYxwXaSmhHopkS3cXnrf3xFp4Wlq+m3a5Va4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074230; c=relaxed/simple;
	bh=YGdZYaAtgOWcx3D7a930Eypmw9WsxIK0txMQmNGjVfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qp5IIBjuCrohSm9ELeWQj4O34mISX6RtDx9twPNNIjXKY4b91Lp/CvPSqxVwd6CzTvyaWIHkY4QGLcz5vVWMarHI5drJPx1GFJUpYA1Ak07dOtYgjFZrceFpAw1oyjKMCGvo4YTEBa6/Uyk/8emwEed6N66cHgEQmvxmLX6X0dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=np+ppAEZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a206845eadso1040989f8f.3;
        Mon, 12 May 2025 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074227; x=1747679027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilHGY/SBXpmuchbNBUiAgnLFaJqUjHxmRnA6J0g+FNI=;
        b=np+ppAEZH3MNGb0jNwFH4YhpyLgj5lKZLYTmpL24zQsL27knUmgPpuw7rzC1iKL0Zi
         ncjLoJXx9fubE2bMJpwnZkF1Eo+2scRNQPpw4WMB/xcFhJuyvVXP5oaEWXmvpnAWPCb/
         LsQaGxoaNlM6EFZ80HSVwB+o3iMmWEPwygldKj0B2GKKwYlg98hKYRJluUAcNcxL+Uyj
         JFhN9ciTPW7aC+vWdMzNDNqfSqJS2GQYeHpYFLygiHUsnPJLgLyN7bCVapCMrUA9kJVh
         DwWiBYDWP5n/ZDNNuwAql4LtMMWNulFoLo6supccHelZGsPHCwY1M9zHO0xtaAtaBQ4L
         9Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074227; x=1747679027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilHGY/SBXpmuchbNBUiAgnLFaJqUjHxmRnA6J0g+FNI=;
        b=WE+gxvBPZliwZzNxvD+QdSuSVJ+R9+6RkZvVeunslveWKiN9TnDv+cIlVRune70KsO
         GCjZ9HZ2uzCXHk0qU+YLhbjfLFBi9Apvec1LmlW/RNdGjSBX+87shIOY8K6g3CFHgb7z
         vZ/NvHplMwOSET0hHL4U76kzIxCoRA3bw/WoFCrLRg766zZVNSsnQT6ooseZwfhd4n5u
         KHFdxXDmLlaTq7wvDEEXhVAPpA64LbuW89InUWWDEFOKBgUKwOjiCauMWZP9wPjwbOzv
         Dv+72wD2Hu8ZdJNARVcoUO3v+V+CG/PgFnujYcAX4w4oVQwjbIvPQhVw3ecosojcz0iO
         F1tA==
X-Forwarded-Encrypted: i=1; AJvYcCWc/og34q7ERjSBu145VunfKth/FYnLs5vcF3HqGAN3r24gxPexpynaqMTk0RjzR/b2bBwFrURnx7wQIPfw@vger.kernel.org, AJvYcCWgGEswEhy0L6ZIG5GFuIY+etb13ADx0azI4f4E8Fk2CcjY9eb5Jd9aT3bNsTIpyTAjWxIE4k+PLdQE@vger.kernel.org
X-Gm-Message-State: AOJu0YwGKCzI+1+Eb/1vdLWpEQ7y9tRmVKeRlCIxPM4tWItH1krpfnD9
	8+76SFgIzssyHUhYsEO9a1cx9GToAGyzo/NdsniqKVg4qOH3DVJJ
X-Gm-Gg: ASbGnctNnQDCbfaiRhe++WyeAHew3Z9//3gaMQgT0nxtN/XMk+162qwZr7QY1FcqBQS
	eyzvgukwNJg6HPO03RAF17Xj6EN33LDxuSmeE0JBB++VMSzJpToOnfotcxRQQxUefEy49rvPD4e
	UlG758JH6vTdZwjaw4erS71VNIgeS/HSJL5fFCg3H/ikjjYNa8PN/salDPUUrgfjodHu9+ugkTs
	sZ3fmYSm5geFtrWd91Vx2a4wsmri1E1+BRPmwdPvan27kMLpieiLhxmWxYbOpdbI/ReADMH/zQf
	Rf+GsGBCfKNGc3xIxHiHVsK0xaduzVRxDO5Vinq7SrS40sviT0g45HukIX55XIH5WqHTWEgI9PC
	ulBdFY6e9gHs=
X-Google-Smtp-Source: AGHT+IHodW+DOLnG+Hp3KSPhPBglp6k0rsIi/MJiNipme6WTus3GMOGvlkseuWklg1JLL5ODZe9K3g==
X-Received: by 2002:a05:6000:420d:b0:3a2:30b:b2 with SMTP id ffacd0b85a97d-3a2030b01cbmr6738495f8f.57.1747074226480;
        Mon, 12 May 2025 11:23:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 00/12] Add DU support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:23:18 +0100
Message-ID: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


