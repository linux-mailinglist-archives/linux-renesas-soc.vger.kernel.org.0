Return-Path: <linux-renesas-soc+bounces-4763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23488ACAB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E434E1C21438
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21BC144307;
	Mon, 22 Apr 2024 10:30:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505B1448C9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781856; cv=none; b=hVjEMpTDj8nPPO0+Za2WrCwLV0kdjYpBeGW+lmr3Yp6sPf4eXuhUJvgx3dSufWBYLziiSRnU1DZTVHazz8ywlYRQaNK232DkZNa1vxbC5ncyN5/QNZ4jcXnr70VUzKYZO7PJFlrlpeavFVf0uaiUktv5drClA3WkIJGdo7C4I7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781856; c=relaxed/simple;
	bh=Uq4SppKFfjC2QjLWTQUTs9RxRAlhWRpI4RlcLV/lAa0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h2DZxIT6xgd99mOERIok/oDsqki+pVng8fdRACbT8eA6dPegb00+0SMIHMb9r28f3hxzXl1AGlKgOhmNTse4Fe7uLqTte48DQUJaLbUKdN1/az+c5fn2GmY72dtrtEI5oN1Fm8NrZfKXIvRtGJzjTQ6dLK1Ls0fRulQkkD85evk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id EAWj2C00J0SSLxL01AWjBK; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ryqw1-001cw2-7u;
	Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ryqwd-005i3h-8F;
	Mon, 22 Apr 2024 12:30:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 04/11] Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
Date: Mon, 22 Apr 2024 12:30:32 +0200
Message-Id: <df2876c72e82cbecfe8406fa058e8d3e895e4b93.1713780345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713780345.git.geert+renesas@glider.be>
References: <cover.1713780345.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit d1ef8fc18be6adbbffdee06fbb5b33699e2852be, as the
commit it fixes will be reverted, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/exynos/Kconfig   | 2 +-
 drivers/gpu/drm/rockchip/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 58cd772207413e94..6a26a0b8eff2c021 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -68,7 +68,7 @@ config DRM_EXYNOS_DP
 	bool "Exynos specific extensions for Analogix DP driver"
 	depends on DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HELPER=y || (DRM_DISPLAY_HELPER=m && DRM_EXYNOS=m)
+	depends on DRM_DISPLAY_HELPER
 	select DRM_ANALOGIX_DP
 	default DRM_EXYNOS
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 4b4ad75032fda17e..4b49a14758fe0412 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -46,7 +46,7 @@ config ROCKCHIP_ANALOGIX_DP
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
 	depends on DRM_DISPLAY_DP_HELPER
-	depends on DRM_DISPLAY_HELPER=y || (DRM_DISPLAY_HELPER=m && DRM_ROCKCHIP=m)
+	depends on DRM_DISPLAY_HELPER
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
 	help
 	  This selects support for Rockchip SoC specific extensions
-- 
2.34.1


