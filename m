Return-Path: <linux-renesas-soc+bounces-24355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 25689C41E7D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 08 Nov 2025 00:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E1094E2832
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 23:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352AD2D8783;
	Fri,  7 Nov 2025 23:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="k3zgUdcj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="txLJF6+K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3B6A33B;
	Fri,  7 Nov 2025 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762556670; cv=none; b=ipOTL6oBk0Ta6ctDFo0fAKy9zMHVNxsSLgtiLClmvqBV2xr8OuBnWd/U98rlKPcvETCX1TSSKAql3WcbYCvDNC+riGROedW+Sel9Mkehv13sIPPaXQwpRthKeGd4GV7YbDI2RAqf7BrhsCCny8B/LrVCVubsXn4KVR03MBb8lpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762556670; c=relaxed/simple;
	bh=1itBNKxvB8gKjd/v4bwE2PMFH4zdgibKRCKVc8YZEKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EnNc0XvKGMRPwRvTf96X40CzkVWwmm9bpftQuLfLw3kos6k+Af2RDQq8L/jD6LpzcX1CFEZnu8tIHBS0jP05d9b0y+kKP+ZbtEROVNzd7Re2Twb08Z9dZ55ltDpKi647bXJ5FfT/+8PYYHHVPyRo8YGonXET9/zNYqyAXBL6NLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=k3zgUdcj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=txLJF6+K; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d3F4V1sJPz9tky;
	Sat,  8 Nov 2025 00:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762556666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KOA+hwUJRwzGvUxdumSct2dsv0UMU4LHAXdtncVDhPY=;
	b=k3zgUdcjTWMufyhpZdoohbSuZZXkg2ba4gDJIKdoVlk+2tvioFukLLbqgM2+VHccTRKDSQ
	z7LkFT15ZeZ34mAhOM8wbNkj6xwy88FAXvPmKeEsl48YEW3lha8t6xc7V3DbHyjr7nCT9p
	0TpWURIDfInM1LzsB6+sf3UIR7vo4q5lrs7JTuytvNxWFrOa/h/CvSpBRWtc4vGIHBmfSN
	3oAfjFpQIcU0FTvdOnj21T6A92aqbRUdWEo4YZvqRS4kI9hiaY1DNYEIr+He/ZMTVs67Le
	bk1sEm09DCSVIc8+0EYw1fUYX/8kyWKJDuIununGA+z14YxQQat6Kttl0XNgYg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=txLJF6+K;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762556664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KOA+hwUJRwzGvUxdumSct2dsv0UMU4LHAXdtncVDhPY=;
	b=txLJF6+K7WeSnsTLyO1Bnh/teX0M9Be8jRJ91wOv7t09SOyBGl/sTWhw8YWYfgu1+b/tIY
	6jQE2o+jmYHb5QFwDmrqHXiH09Xru/VuncngabvOxgPRlZ4EXdIizeCe4w0Z0YNfssqYBQ
	cLas0AQeX43GWvW/rNAH4WQ9x2XI8LJ5IGihWLS7iCjLstpIQd8UZfEXBG0ar6vetEDnN4
	Z7kFLYzYEWLocr3z0IJkFeGsrFuGu1VP37ICjmNXchXNEXzqBCnY1m93FChG+Um8Li0dFX
	8TcD9niFTRmqHiQ5W1E9ob9Na8qNyCVmSswyEjTiGKPTVEFWOE8sRWPDT1UAgg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC
Date: Sat,  8 Nov 2025 00:04:10 +0100
Message-ID: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2e5fe89e8ece91143de
X-MBO-RS-META: 7qbcnczhz7r1s9zthm5qjinkkzpqtb6s
X-Rspamd-Queue-Id: 4d3F4V1sJPz9tky

Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
for modes which set neither DRM_MODE_FLAG_[PN].SYNC. The previous behavior
was to assume that neither flag means DRM_MODE_FLAG_N.SYNC . Restore the
previous behavior for maximum compatibility.

Fixes: 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 9413b76d0bfce..98bd7f40adbea 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -492,9 +492,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 
 	/* Configuration for Video Parameters, input is always RGB888 */
 	vprmset0r = TXVMVPRMSET0R_BPP_24;
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
+	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
+	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
 
 	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
-- 
2.51.0


