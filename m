Return-Path: <linux-renesas-soc+bounces-17366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA1AC09E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F551BA283D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B4F1C5489;
	Thu, 22 May 2025 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CPInUPVN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3CC2EF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910139; cv=none; b=EWCcXYwuPvxfFLEexjGlfvYY+4ZnBusei6dNWGSduGUOf1xqu7iLZcPPv2Kcpgxj9u5ZDOCvJQsQ5LSlcV93wgjVgR7B0zDZ3YH39tEknQCxXdlAhrzw7UfEXJxbu9FyKNLlDtrI7kqOY8Fxks9Gi1Fyi03G5n5HdjuHLC7R9tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910139; c=relaxed/simple;
	bh=t2l3+MYFa+lGL2M/JBNWgVSExB76qlcCe7vsNP4PJgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4qqJ6zqCKtPVS3mEk0NVMzk+bcYM8+TgFBdRKaMV4MPEYTu6BAq3bfQ5gJFf7w0kDFQC/h0yjQzjY5LI6wM0hLOjdS++1IAmKbruZcnDk9Dkd9sgEEtpfjgNDzALyY9sx5bYcsI+OCCUpOmT9aDtTiRZniV2E442QMZg2aXcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CPInUPVN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=D/oyArN3YPryZs
	93MERe3cOmBDWIWI3BWGgCTzOTB+E=; b=CPInUPVNBVXrCT3L3+hDOfNtS3Z6Lq
	01PPY966dLBPmR9OJRIfaFzoQ5zuf6i9QbqhfPywA6YoW0IOny0nEXAXzRmGOmp8
	LVyEPe/iClMNUaIp262Gb6VEjWJutYKAyclHG+yUQtXt+dPzlSop/cnNmjXqHJSS
	oeR4T1WupFtdx1FAb9KiMYyS5XEFoqhFDjuUKw98R70tFI0Y5RnnJBbMpQlBLjNe
	lZPS0yhaWNxRF5pOiLHr/N5VnkbD0iQNCZkcmZRPq2t4j09XJe7+oHNyd4DYDchv
	gwpuKKvrOE++ba3HlgBGQy6Z/C4XkUcarSkrgrzy/gHUhWg/g/WQGMSA==
Received: (qmail 3619225 invoked from network); 22 May 2025 12:35:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 12:35:35 +0200
X-UD-Smtp-Session: l3s3148p1@0LCwCrc1uIggAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm: renesas: rcar-du: use proper naming for R-Car
Date: Thu, 22 May 2025 12:34:44 +0200
Message-ID: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not RCAR, but R-Car.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
index f9893d7d6dfc..e9e59c5e70d5 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
@@ -16,7 +16,7 @@ struct rcar_du_format_info;
 struct rcar_du_group;
 
 /*
- * The RCAR DU has 8 hardware planes, shared between primary and overlay planes.
+ * The R-Car DU has 8 hardware planes, shared between primary and overlay planes.
  * As using overlay planes requires at least one of the CRTCs being enabled, no
  * more than 7 overlay planes can be available. We thus create 1 primary plane
  * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.
-- 
2.47.2


