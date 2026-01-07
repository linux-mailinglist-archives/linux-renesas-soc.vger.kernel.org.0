Return-Path: <linux-renesas-soc+bounces-26363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EE6CFF2BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 18:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB41328793C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805CB37E316;
	Wed,  7 Jan 2026 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZJ/XqDa0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682B36AB66
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802954; cv=none; b=Tf/TCV0F8qe1A0OylNXqwfdIUM6v0h3bdc9hvOMCjd9grtdwdDg0bf4ETo5kZSSweIUufKSW6n+5Oka7YPe/kjS+bqtU4U9rLTdXTDKCJuP/OEnbzWzpiZDzvuODDh8u9v8kE2jSI2GrirOOpBNPtG06y0oIPHHmzyPWonaeWJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802954; c=relaxed/simple;
	bh=7zX7UCcWA82ZAt7UqW3tRO2Mua+2JGkUZd30EIkwlVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jErf8VdAdicnN8FkIo7JGVsBrGib+3eW+axvoWP9CEB0DhOdB6W+CrM/PF3o8XGOahQyXOIvyN8Yx2WuGHO0vzYpRoz62L0OchgD5uwwEfHuL793kTg2wnsYgAYhsNFdctoTGktI7YAKXXs2bTg5g6RRRqDRKpJKUAS3T+WNCuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZJ/XqDa0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD5054E41FDE;
	Wed,  7 Jan 2026 16:22:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96426606F8;
	Wed,  7 Jan 2026 16:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81AB8103C87CB;
	Wed,  7 Jan 2026 17:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767802937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JdLe8UY54Ycj4piloj+rsekA1/AGyqvm+QpBgA+1OYI=;
	b=ZJ/XqDa0OSr4NYaLF8zcX+MPxD7NKgB+Hnw1y/rmL1ezS6TIK3DjMcoiPkOfBvWHC/bUOj
	gT7MIWvzWZ9cM3gWVjHaA2EsfQ76m7OiPjoGL3hbQVVn3NsxrMTripI10GGBdeogG9daJw
	pjLmjhL17iBrYq1psBENAaWnS46q7xyXsOR5hhAMD1mJPtXaT6gctPkjCKmQGYW/uUEIcs
	NiJSg1LN9O1HqzipnBoPU+bH5wfTXsoNYms2T01h4vpLHHY+ZIdJfqR9+qQaWYQy1cNghr
	zGzKHLAYHJCK7ubwgRrghHeOBIzLRAyrTK63Zl/Wm68beHX1TYgd1NG8KQHxrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/6] drm/bridge: convert users of of_drm_find_bridge(),
 part 3
Date: Wed, 07 Jan 2026 17:21:58 +0100
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACeIXmkC/y2NUQrCMBAFr1L224W0iiFeRSTEZLcu1KRsWhFK7
 24UP+cNzNugkgpVuHQbKL2kSskN+kMH8RHySCipMQxmOJveWEz6xLtKaiZMU4k40jKvy3f3hT1
 LTv7vj3hi5ywFG61jaMlZieX9u7ve9v0D/wtEBn4AAAA=
X-Change-ID: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-4f997ea7c79f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This series converts many DRM drivers from the now deprecated
of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
allows correct bridge refcounting. Where applicable it also converts
per-driver "next_bridge" pointers to the unified drm_bridge::next_bridge
which puts the reference automatically on bridge deallocation.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge
          a. ✔… add of_drm_get_bridge(), convert basic direct users
	        (v6.20?, one driver still pending)
	  b. … convert direct of_drm_get_bridge() users, part 2
	  c. ➜ convert direct of_drm_get_bridge() users, part 3
	  d.   convert direct of_drm_get_bridge() users, part 4
	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

This work is a continuation of the work to correctly handle bridge
refcounting for existing of_drm_find_bridge(). The ground work is in:

 - commit 293a8fd7721a ("drm/bridge: add of_drm_find_and_get_bridge()")
 - commit 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
 - commit 3fdeae134ba9 ("drm/bridge: add next_bridge pointer to struct drm_bridge")

The whole conversion is split in multiple series to make the review process
a bit smoother:

 - Part 2: mostly drivers in drivers/gpu/drm/bridge [2]
 - Part 3: other drivers, low-medium complexity [this series]
 - Part 4: other drivers, complex (not sent yet)

[2] https://lore.kernel.org/all/20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (6):
      drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
      drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
      drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
      drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  7 +++----
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  4 +++-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c     |  3 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c         |  4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |  4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |  1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      |  4 ++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  6 +++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 10 +++++++++-
 9 files changed, 28 insertions(+), 15 deletions(-)
---
base-commit: faeb4ff6d6e41c42741fd1df8e1d0b80f9452403
change-id: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-4f997ea7c79f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


