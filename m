Return-Path: <linux-renesas-soc+bounces-7155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D7929E37
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 10:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AB1B2860AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 08:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EB629CE8;
	Mon,  8 Jul 2024 08:22:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E5648CDD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426956; cv=none; b=uC9lm03O+thj1TEbEewuMFfHSfULUSSlKJd62Jo9tMSs8/2m6qK/d8doV4xC2tzxJqLuOjcDVWuwS9Vk66IFxgyhMZnxkjoPGk3QGLzXdPmHjvxg67UwKoyN/Vx139QBKxbaMbiNi5Gh/pMbu0kSkI5aBJz0YIRGfPaPseRN1ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426956; c=relaxed/simple;
	bh=rnr/Xsq4tJcPXfm0cWxonTBCymaYYs7Ey43DvehuLd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPja6BBGDZHPbMoQ9iw4nnG3/VVmm5GDZlRmJ7qPLHJrmXYiTWdN3EGeeFtZGCPg/paXoiBd4Mv2NaOemVnf5iXI/uMs22FhR7VKrV+8JBLBWfIinTZskCYH4BGnfminRYmF8BJ/DXXLMj8wsBY6lW+T/xnAhI9HGVD7mcG0i9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,191,1716217200"; 
   d="scan'208";a="210645630"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2024 17:22:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.86])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6CFCC438B0A5;
	Mon,  8 Jul 2024 17:22:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rcar-du: rcar_lvds: Fix PM imbalance if RPM_ACTIVE
Date: Mon,  8 Jul 2024 09:22:17 +0100
Message-ID: <20240708082220.22115-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
case it won't call a put. This will result in PM imbalance as it
treat this as an error and propagate this to caller and the caller
never calls corresponding put(). Fix this issue by checking error
condition only.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 92ba43a6fe38..471a2d3bc203 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -361,7 +361,7 @@ static void rcar_lvds_enable(struct drm_bridge *bridge,
 	int ret;
 
 	ret = pm_runtime_resume_and_get(lvds->dev);
-	if (ret)
+	if (ret < 0)
 		return;
 
 	/* Enable the companion LVDS encoder in dual-link mode. */
@@ -550,7 +550,7 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq,
 	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
 
 	ret = pm_runtime_resume_and_get(lvds->dev);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	rcar_lvds_pll_setup_d3_e3(lvds, freq, dot_clk_only);
-- 
2.43.0


