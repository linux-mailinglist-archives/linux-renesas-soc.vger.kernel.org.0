Return-Path: <linux-renesas-soc+bounces-6485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA18590E843
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7333F28618A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2D824B2;
	Wed, 19 Jun 2024 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YFnkFLU7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093612F38B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792563; cv=none; b=PiZJMrfrblx1PAc8wR73chJv6H+6wwTKxGrhUOdcXgfzNxN07BWcC/MjXXaqYJDAVE+49melu5B2LYVfB99Q3GFC3ydP+aPbBYp6zovp60LpIOF42R6zRvXoNuj16o6af5ul6fJYNOpX74us/0P5kNipdiyN1c3w/AYrD1nkzQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792563; c=relaxed/simple;
	bh=s5GeQVun/P8JpAdhwwqNjJn/k36Xql8MREpnjfZaDWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9p/ndYkRzUpZJl8OPDsqVuE18mS6Jzm4FZ9wosQU5C/V34lIEq57xsCkg9lUxXOGL1pSJAt+2yqwDKfOreB07TbxQqPvFMpgY0/wQ9LgxCC6R5eoZCwgUF9KsqFFAUrsIg9ItV1j3Mm8Bm2o7GPoc3tJzeUqrncg2kg62aXEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YFnkFLU7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91EEF89;
	Wed, 19 Jun 2024 12:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718792541;
	bh=s5GeQVun/P8JpAdhwwqNjJn/k36Xql8MREpnjfZaDWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YFnkFLU7BNBibM/6yGfmWyndxZB/bjjGpVBk59C2nXoaQdUBsCqTchl8xTwNB7mU5
	 CgGnODCac+v92PJIkxOQ6Bnfq00Vkn44uwcKBgTxBoqpOuiE4aSZx9KnNHUJ6s0te4
	 sGIYqGbXhtnFndve/QfVytRrTIftwJzI041QkQ+U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH 1/4] drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition
Date: Wed, 19 Jun 2024 12:22:15 +0200
Message-ID: <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Version 0.51 of the Renesas R-Car Gen4 TRM reports bit 16 of the
CLOCKSET1 register of the DSI transmitter module to be a reserved
field.

Fix this by correcting the CLOCKSET1_LOCK definition to match the TRM
and remove the CLOCKSET1_LOCK_PHY definition, as the register is simply
called "lock" in the datasheet.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index f8114d11f2d1..1bf9c4717d5a 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -141,8 +141,7 @@
 #define PHYSETUP_RSTZ			(1 << 0)
 
 #define CLOCKSET1			0x101c
-#define CLOCKSET1_LOCK_PHY		(1 << 17)
-#define CLOCKSET1_LOCK			(1 << 16)
+#define CLOCKSET1_LOCK			(1 << 17)
 #define CLOCKSET1_CLKSEL		(1 << 8)
 #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
 #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
-- 
2.45.2


