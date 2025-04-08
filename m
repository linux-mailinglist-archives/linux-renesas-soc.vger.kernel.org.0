Return-Path: <linux-renesas-soc+bounces-15581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B85A8164D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7AF37B3105
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245A2244186;
	Tue,  8 Apr 2025 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itvuakTL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F12C9A;
	Tue,  8 Apr 2025 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142968; cv=none; b=fD3kwdD7mHFDkQGU9y7fA1banT+vdF+8bJVVPjuOh5nh0oPgLyo7yNqB09wr1RuqvFfS2I2vxcJnqW2C7Yyk2jt2mfMfoJDRyuXaLir1htQm0o9J0/SWxeRrJXWkwOuxwgyg2AY3OGn9A3qA0zc59dnt4HgyI81U/aEpgaJeXt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142968; c=relaxed/simple;
	bh=aNjMjBImuHWm3Za2GhViisBUEbWGiBpRO0GDHuabOik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HToH6t5CmTA8YG0pxFvCgDyul95cN5FMPQisEGfXOMP1Fp3kDiL+/NsrZnoDLSf0adGNKaJ8Nk7PQEBDfzFzy8dSvR+lFgM+EQonqWaHfDqjCvD7+nv0M28RLr6u6OP/zbi4RQVyeOQi+rWl5KIbSSVMZ9GMgZ12Rmqv1NiHBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itvuakTL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso40791355e9.3;
        Tue, 08 Apr 2025 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142965; x=1744747765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxycxmR24mreWb3qYHH41P8fRm9tAvDYgVZJX5g6AZU=;
        b=itvuakTL3++YyIBr1GCEVegMvmJQnE9Ex3DgDIM3Zna63m6CxZ0QbMEN+DrlnWQ2Sw
         JGqGsHVtB1KO6XwPXiRMUU/AVjnF9aK9d6xF4C6UPLjiuqVPXFPUx2/8V9KJupIs8ozA
         vgFWbv6rLwl9YtTKwcqbNwLvNye8VlXS5bNIzyUDXU73OVCU9Epg3FrMMYk0AbUkaAVZ
         7cQ3w3vFEj2rDIZKmx5YYEXQQIk7MDqj6xrsXDYP8KwtsqfJLZ15zfwazRufC8vQJmuT
         ObK1zBeTvQ4myn9GiUHJDclYF65kHtQ1afYWKU9cN+NDDiRte1WdwMmHEf0Z77fO+wSQ
         ybxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142965; x=1744747765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxycxmR24mreWb3qYHH41P8fRm9tAvDYgVZJX5g6AZU=;
        b=K78wBAF7BrPS41sYapHnMyB9FZWLEeS/bkBzyL6JyRjXSfH1EMdvFrt5nHo+mnQnad
         M3whVV+On+RWKXvk0vSI9Q5KmUHwzgT1fEbUzN9hyuGbVC/c0RdIu1D/lVSmcRP9B4eG
         DfbfzdkCw5Owp/cJIpJ1WTox37UYwiG6rs9BcAQ+eN6e9enCuglceRpK/nIHrSghR6r2
         y1yFsMNPPVG1VysrQbUuzjkZy1FJo+zaJH2qK9kd9VtwdeujH9NVLyDltLZqedhVDs7l
         kmZXsbXn7QF0V/5MD2Ab4Frug10HXdWJSvh2VZ8mskJu0IRFNaq4pPrgsuHDHA0if+1K
         R3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtfBuTOVgfKzj0BhiQShXeQ+8uBCAby7hai+gy3mWdGfR2Pm/9OvCL9HhU1o3IiHm3km2FPtghqf3h@vger.kernel.org, AJvYcCVgGCnk3RFjyb5n6fImWOz/Nt6rqVLC9XFMmyBVCBD2GJoKvB9x/ac45qA2SDYLvkNUtHlU/Co7SA4HteO9@vger.kernel.org, AJvYcCW8qACsIAcRiXzJGJmtn+y/xsPWodHQdPjA60/tLpXLb8+UUNdMfSbCNnwevk4pFfNA+IK4YqzI79Fl@vger.kernel.org
X-Gm-Message-State: AOJu0YxkaWeihV6ZJPu61nFYzbdSQF6c12HX3+6DY/SSR1Mgj7qqUIRG
	jY8hKTLgWTk89tsIHNWVe+/5hH90WxpojIMcsFCjF63vGTN+61Ru
X-Gm-Gg: ASbGnctMvQKWGutjZGqxvfYOicbYl1soF9sYm+ebCQiL4J5BDhsD7AG+Ml0nXNdzMj2
	CbQnWcpc9XpyJSHl9kjbX3hZ9YQwP9P/w7rAdzWw7fT7uiMD0vjjZY4ZFLTeSAtFkLaNZni4C3y
	INmHy/9XHmII6sT96taMMX6ss2RCC21FMeh1M/oqTn1t0daTQvbQ13M34bAxDU5UxD0UG8DlOTa
	LH8paAC6E7qygANfHZPFev8fjC8xZWhELJ30xo+diXfm2OsWFNuGWMV0EK50TLYrRcIMuAvoRdv
	CoVz+/CxzZLEnK8OMvU3RruR4zo/yB3Umvd/EZUOHWy84iZxLaVdJcDKZMfg7W6pjOFdhoCn98j
	tYyI=
X-Google-Smtp-Source: AGHT+IG4pnFJ8kcq862U72zyRWeCt8XlAxDg3swXx2I9PFJY/N49qCA0Jg1JfeOeNkChX7NGEB4opQ==
X-Received: by 2002:a05:600c:5107:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43f1fdbf975mr428285e9.4.1744142964596;
        Tue, 08 Apr 2025 13:09:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/15] Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:08:57 +0100
Message-ID: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the Display Unit (DU) and MIPI DSI
interface on the Renesas RZ/V2H(P) SoC. The initial patches add PLLDSI
clocks and reset entries for the DSI and LCDC and the later patches add
support for the DU and DSI drivers. The DU block is similar to the
RZ/G2L SoC, but the DSI interface is slightly different. The patches
include updates to the device tree bindings, clock and reset
controllers, and the DU driver to accommodate these changes.

Note, my initial intention was to split the clock patches and the DU/DSI
driver patches into two separate series. However, I found that sending
them together will make it easier for the reviewers to understand clock
related changes.

Note, the clock patches apply on top of the below patch series:
- https://lore.kernel.org/all/20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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

Lad Prabhakar (15):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
  drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
  drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
  drm: renesas: rz-du: mipi_dsi: Add OF data support
  drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
    calculations
  drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
  drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
    RZ/V2H(P)
  drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
    VCLK and mode validation
  drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++-
 .../bindings/display/renesas,rzg2l-du.yaml    |  23 +-
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++
 drivers/clk/renesas/rzv2h-cpg.c               | 284 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 608 +++++++++++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  36 +-
 include/linux/clk/renesas-rzv2h-dsi.h         | 207 ++++++
 9 files changed, 1299 insertions(+), 66 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0


