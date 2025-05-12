Return-Path: <linux-renesas-soc+bounces-17003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A540AB43DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E19E1643D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D840325A2C5;
	Mon, 12 May 2025 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L961RmaV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576D22AE45;
	Mon, 12 May 2025 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075389; cv=none; b=D+U5JJ+nK5v/SsMcHr4wQpvS8j2ujfysdTsukhs7N+6aXAY0o77DLNeXBqnksuqrKFto42j22d9tb+Fq2V27D0ZcMtOdWQh4Ja0adcYqgyEjDXHizYvl68+pyIpgcSHAFm1IUt5QBerqPqnM/KzvJDB2DwNdo6md9Ub1jxNePog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075389; c=relaxed/simple;
	bh=WAHXwRw1UMPSvTPh4tNXzcFI4Aiul5gq0hWNyWUMpxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mv+1+BqCjFjirwZbGUpyaFc7U+FzT4jP1F0746ECzNA8waSmDvInf2norqZEoMVz3HCLaqNUGLDxPrC36PbPfDM2BkPpMU5KbpMWtlZmUKNIEqZ+u+J9navsoc7RooDLfCqod8TM7ehkRu7Gk9DkfVZfOaCM0Fj+PFsRpD9rL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L961RmaV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso2901806f8f.0;
        Mon, 12 May 2025 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747075386; x=1747680186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etzeMqCvGPIevt6vxBFhorzveQl/MKqmDBynhGBwRdQ=;
        b=L961RmaVD3kG4ySP/dn9so14bm/PK9+GOk546fiMZGOzG+OESnyLci6R84IXQb8RF3
         /qJNKC0TT6QQeHzTZLqn2sV1XmKahda/ziOI8hGohy1XMzy/wOvQWn9nxLXnyNxemIxG
         iMOSne5an5oyJfgFdURYgwv3T5GR6gujpMmVtM6yCerpvcjJ36edOtW4hhEs+wxJMpzm
         AafSKNZ/SbwILEPO2JPHPyKqv3l8Fz4NwixyuvRjxYdA14DB9jwCxk1W6a4ITU/LJ2+H
         kHPVeT6Wlo+BuF6Egcz7Wp/gHi6ce/eQfEmy8TOCKXgOeUt3p6FgTA67+MB2t9Y0kz3y
         h0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075386; x=1747680186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etzeMqCvGPIevt6vxBFhorzveQl/MKqmDBynhGBwRdQ=;
        b=jxz3rgzTfkuccRA+CMlEm9U6V6GFIwOofjBbStSIB3UYAhIG+I1oyGjGlMQJxwskn4
         I+5TXui07mBjG+JTF9ehcAVFMWBEyvcOPMMHjuDdAqfm6PT0lu81hiUaYvxMMhlN4GL9
         GVU7JW46T+gL4TVXGS8GCn8BQjv6fOFRLq0YuYS/2JUqfKVAw2OFz1YHISpHr8hseGUU
         T2cGb+ocB0Vjc1Vw2tZvIGNNn4vqcIO9Agfd5xORnzAZw9kYpTmWt1JB/HhlkyYx92D3
         yaOZiYIXzFMppT5UsyvEWnAVE2Vr5iEQ3Fik3qaSCnAYQyU0G6IDnfuN+qO+T6lhleXE
         Gamg==
X-Forwarded-Encrypted: i=1; AJvYcCU8wTNl4b+5sM7ECaTAUx8+y+wZH3LLk8Ndx8Lu+xVzBsYsahhqiUnBzYEitK3IGi5+z9nuITorA2eT@vger.kernel.org, AJvYcCWTdiG22HQo2t/S2gQRdNfxhxm9W03oEHaEkHq3U153oPecDcuBL3lD4d9OyTDMndMiQfzR9M1I1mQP@vger.kernel.org, AJvYcCWl/oHUGI1CuKRlHQvwnB9ZVl6zXU7q29sThmFu/8UsJg9EdKeTqdUbhvNdm2DknZgUw69Mm3NAB35U1fRIQJn0JTk=@vger.kernel.org, AJvYcCXW9+pxi2FX4i9QqD4PVTGhvT5B0y3FC1NcG2vbZ6OXJu+qf5Un3IvhQckZPLa5yveo9NYOj2x5zZHMek80@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmZO82wbDpMam59jvP7z9x99u4Vfw+3rMboSA2w2M8R8bZyHF
	BO1gU+RPl9eTLFGHESbH/yq+nUT+FwCSUib/QFgbRL7GTK/wJhED
X-Gm-Gg: ASbGncs8Sj4HPtan7lRs2piB0tTFlJCDTKutbTmdirt8YxXNJh0BhEINJGKkhFicR2a
	GRCBV2kHMIKBDeHRRWW5mBdiGh361vWX9fx49XdTA/WRpCw5wgm1TVbKzUGbqHW3lFQKmweedDV
	yzVwH0gyZiplFxK4rIHBJM3gotIBK4KtwyEn4yRa07MObHiI0dWWKq4LNL06uURouT1L2g9Gzxe
	lTYf29nur1gOTxQeiOsrqeuL31W/umjk9TnxQq4p4EULJXGDB3+xPWFhMboJ4pr0EeRwEvAUCtF
	5O2rwtUxN267vMU1BNzFqU2xDE0qYnIKGcqhI2hdMwKzzt7R4EPmABxXxtskG2vKBaRG0yLrB2Z
	QZT3dcx2+6/E=
X-Google-Smtp-Source: AGHT+IGCZBki1TwOZKeT8nLYBD47cY3GzVmgBzninh+63BIY3vJ4w+vzka5WJDllqnhD0owmjq7S0Q==
X-Received: by 2002:a05:6000:3102:b0:3a0:b784:8826 with SMTP id ffacd0b85a97d-3a1f6431a65mr10789833f8f.19.1747075386042;
        Mon, 12 May 2025 11:43:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddd53sm13309203f8f.1.2025.05.12.11.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:43:05 -0700 (PDT)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/4] Add support for DU/DSI clocks and DSI driver support for the Renesas RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:42:58 +0100
Message-ID: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds DU/DSI clocks and provides support for the
MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
series [0], but has now been split into 4 patches due to dependencies
on the clock driver, making it easier to review and merge.

[0] https://lore.kernel.org/all/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note: This patch series applies on top of the following patch series:
[1] https://lore.kernel.org/all/20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Add support for DSI clocks
  clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/V2H(P)
    SoC
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

 .../bindings/display/bridge/renesas,dsi.yaml  | 116 ++++--
 drivers/clk/renesas/r9a09g057-cpg.c           |  63 ++++
 drivers/clk/renesas/rzv2h-cpg.c               | 237 +++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  17 +
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 343 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
 include/linux/clk/renesas-rzv2h-dsi.h         | 211 +++++++++++
 7 files changed, 990 insertions(+), 31 deletions(-)
 create mode 100644 include/linux/clk/renesas-rzv2h-dsi.h

-- 
2.49.0


