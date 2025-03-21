Return-Path: <linux-renesas-soc+bounces-14706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F67A6B902
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 11:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B24E4848DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF151EEA35;
	Fri, 21 Mar 2025 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MjoP/Xji"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132421DE3CE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Mar 2025 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742554002; cv=none; b=U59PTpNyWh00Crr8BsEWLxHx3DAZGG/BGZWiIsGpRaAp/KlGwLR4U9MGQz+xhlJyoz28SdN4FYNQJM3b9qmTiDDhY4pCOqze5GEmcpq9s6BRajH6r3+ZQddTQ/1yTnufm31+UusJZbrH26fUWXPoD/zPNL+9N/wO9kCFFuuYjsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742554002; c=relaxed/simple;
	bh=zgkx+mvkOnrCh2pBOwwEUvScJTGSdLxt/O+zjzEmDi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1WXGSXZYj0yERGWVfn0yY9gCLf9w73Q5+5nCkpnHvToYBUBwpcsw2O4v29GOOT1/V1vNUpr4+7D13SJdZVDpP5Q/6ZWVsGF+pun55JBZRZMJPetvSt2m8NHtdzIjw41Ca/cI5kuQowVIMFNq1B9+IPzXWCZCgdEGSpC/Fv5p6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MjoP/Xji; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [157.231.223.213])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAB37F6;
	Fri, 21 Mar 2025 11:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742553895;
	bh=zgkx+mvkOnrCh2pBOwwEUvScJTGSdLxt/O+zjzEmDi0=;
	h=From:To:Cc:Subject:Date:From;
	b=MjoP/XjihxRO1BSEk4Me9n1B1T6TiQ+e76KkqhTsiOQCNUs6TvQFgbH7Tiqi/OmmO
	 IkJAw0UUCISQ0SpmURwV4q1BRApix4mERyddqmJUehpVDAU7d2w7wJdOPfMRyLbaGl
	 NDMABlx1PKKVKuoe4ayacehrX213yuJS1xpnekZI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: renesas: rz-du: Support dmabuf import
Date: Fri, 21 Mar 2025 12:46:15 +0200
Message-ID: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rz-du driver uses GEM DMA helpers, but does not implement the
drm_driver .gem_prime_import_sg_table operation. This  prevents
importing dmabufs. Fix it by implementing the missing operation using
the DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() helper macro.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Kieran, would you be able to test this ?
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index cbd9b9841267..5e40f0c1e7b0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
 
 static const struct drm_driver rzg2l_du_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
-	.dumb_create		= rzg2l_du_dumb_create,
+	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
 	DRM_FBDEV_DMA_DRIVER_OPS,
 	.fops			= &rzg2l_du_fops,
 	.name			= "rzg2l-du",

base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
-- 
Regards,

Laurent Pinchart


