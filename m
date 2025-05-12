Return-Path: <linux-renesas-soc+bounces-17002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA637AB437F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4D218856F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8EC29DB9B;
	Mon, 12 May 2025 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI2gGvZz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E4229826B;
	Mon, 12 May 2025 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074245; cv=none; b=swOo+pR2AOa2N4ul32v0qlP6Yj/hw2QiqwoGTD11Ma2WV1Wvzb+KDUICnbwSEKtIIH6Dz1dUvrr3dgLdW5SCcaNiJUXWReXomYIK1mRgfNIcHhCDu4ChaIz98uWLEGIRedXcAEun0efcy90xXkEqSclLw7zKO+IVbfe+IHSJmMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074245; c=relaxed/simple;
	bh=eusjnOGb/ZY2HpGbND1nJZHAe/yvuvFGJ5uuZR3tQYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fC6gjQeHUjhBrcXehQ8mL5K5nYG2AOFW8tiky7MyqpWdaEUfpDmz4HGhw2CNDavY1TUEdjC0a5NvOMLKKBSoWaoZaT8h8PsN2Qars3jVELsVyt1dVIusjoCzobZBqRVHHT+yxuyFUhV+d1gWMgLUP8Tq9tOmpNAYUDOfN4M6L/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI2gGvZz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so35480975e9.1;
        Mon, 12 May 2025 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074242; x=1747679042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBldqOJbxPyk01FO14zb5LuQItiiBv1hPLg4G6aZDqY=;
        b=cI2gGvZzJDVkRGCLzthW+AfZaLcbQ9SPyHfKRUUqYuHzD2I2IMcQNKZcWjqzJ7qFco
         evVkb5CKAuMxoK8xm+83rtP4YZq/niTaE8XiIyBgQaRtruLeXRSMzJIPEejpNdL5WBxB
         xLEo9K3UePEW5EOVkk9Uk2VBMzIgSFw2VsRQKc0i+JS7s0T94ddQgnVNQ78gSMCxlg8U
         XoK+RVkWL9Y66FtG8zYImNjTnTcDlUeMU/6826VC4Ndd3HWPb3U05WutefUObm7ReTlb
         Ed0ReW/eetsMq/7A2FyZyeDz+3FsBO33kFNRFpz2/31smpMh7MELx7ZSuQlCRC6+Y1oB
         f1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074242; x=1747679042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBldqOJbxPyk01FO14zb5LuQItiiBv1hPLg4G6aZDqY=;
        b=BPvUwUZV+RLHCBl8nBwVXt6wL38RzcIPOY2e/xHdYGUJjJycpyYtS4IOWGv5PkteEo
         TmkGoVl8hSQ67jQQTrTiED4xxisnc73wkb5/G7hqmrcnlWdq3vrerA0TN7/vmxQAYEc+
         i7mhYbjgx6OJkvyFs/aydpbJyp4BEBP/PzWSXwSbM0zlwtfcY+EvoZ/kt0CQZXYNRFW5
         HHsyf+v/hgNyJO9lYkUz7cTRxLE6Vexz6ouyAkD23UZw1vXCgsFHiXU7g4O1ll4cXfxN
         eTBeQwTCGQvbQab32CSdSopBmzQF0hPkG4h7h4+JYX9JjyYjV30HuOav0tBN1p8eXP8o
         CvXg==
X-Forwarded-Encrypted: i=1; AJvYcCUcE5xouJuePVVXkPqHDRC0ycu4V/0NSEMouqMvDbvWDMB2hq2pBxiysbC177yWVkRagAWiGpPVQRuT@vger.kernel.org, AJvYcCX2bmVUje5PpU9GHnleUTm4fRHBHvneFZ+dSlQFHP83HkcSkhHS8tcigzUWviqqtyqKfP/Jb9VbUNUKHewz@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtM3Dg3AibgWySmuueOeKa9O0khb+zur2hFyaEkdX7XpyjqMO
	EUnJrk7oZVyVGCCDDf0JQIOQyFvPOyFhJ2pnjSpTlha3yIo0l7fi
X-Gm-Gg: ASbGncs37GolmDYj1vtqJE1aea3/P+j/z/Xnzf9DaI7PIT+xXW0EZ8WvTHfgPZIubBC
	n5sk91KagK5+3ce7zwKjCfiInkcm/3NxTrUjSzU0uo9JTWtGSrf6RuDMgW8LnCOb0BMF1B+SX1W
	03I7kU2iLKo6SzM8gXeRg2TKA/xJukv7LwslE2Fa/0XUlj6XX9Zh55YFTJmX38zOZf54SjxBWSD
	cLc1jN530YMx0nNqu1p14kNMuSdtEm7Hp86C4DED7uNN/Bwsx6TkcFNhrg9aB+NA6VrcTHUUThx
	xIP1UWU/oFYPVO5eDs9emLX/PKK9VX52sYEEZ6DlAHp5T/3CmAWQk1spJyQUi/E02j+nsl+QzG+
	f
X-Google-Smtp-Source: AGHT+IGqeZRKNxhHRaoSDKnh7ZHow4KAV/QyIpjtHrUPVuyzvNsX0/u3WONT1r4ZQ2DR3fjmEAYQUA==
X-Received: by 2002:a5d:4c4a:0:b0:3a1:fa6c:4736 with SMTP id ffacd0b85a97d-3a1fa6c494emr9331963f8f.57.1747074241993;
        Mon, 12 May 2025 11:24:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:24:01 -0700 (PDT)
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
Subject: [PATCH v5 12/12] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
Date: Mon, 12 May 2025 19:23:30 +0100
Message-ID: <20250512182330.238259-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
DPHY configuration, whereas it is absent on others like RZ/G2L.

Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
during probe. This allows LPCLK-aware SoCs to pass the clock via device
tree without impacting existing platforms.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Made use of devm_clk_get_optional() for lpclk
- Added Reviewed tag from Biju

v3->v4
- No changes

v2->v3:
- No changes

v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 35f0bceac055..98d2f30ae79d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -62,6 +62,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -790,6 +791,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.49.0


