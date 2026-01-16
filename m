Return-Path: <linux-renesas-soc+bounces-26926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C965AD37A43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 18:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66BD730F66AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 17:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E985396B66;
	Fri, 16 Jan 2026 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Eo3jnktp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B00369988
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584799; cv=none; b=RZnHaLiUJOdgno0DEX0nuzviutZx8ij8MIDiKV6f4yAfPLbPYX9wK6rjsrlR4787idXws3wLNUPIKkVe2TTW3nESUf0jXh+yU76aYPZqDUc38Bqhfdmz5FuBSpBdGyBUm0l2wzRsuUBinYPE7I37MDQzs1GbzTr1LcXfdpnD5BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584799; c=relaxed/simple;
	bh=EWbXrdU58BHuHTS+YkeY0AXvuDpPDrYQxJGpgbjk+2o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U5a6keiR+mw4McE1WCDkbQeuhenjE5TTqGMAq+P8uznx4MhuL8VsYVGp0OmyDh0bGMVXXTqwBgHbxAlLuwizRUM7/+0gTfnW9uSeC4Vr5v6dGEEedDRx4UNziz6jmqSTWLFaKJg7YjcpkcsAdVYO+kvtFcaRCoGMPe3gpmksEwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Eo3jnktp; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C239C1F1FC;
	Fri, 16 Jan 2026 17:32:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D6907606F9;
	Fri, 16 Jan 2026 17:33:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66FFC10B68686;
	Fri, 16 Jan 2026 18:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768584792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=g4Tdoi93NA1Hp85os9KbV+3XjDABS3sH3TF57/Tnbq8=;
	b=Eo3jnktpEgLunQwWyqaAfiHYpw+Tg5Q8yoqGX0GMW3gjAhRtx7JIoEO5Jp2+6qfTeITxG1
	hhaiKRkETaisrNzIOGLf3uk4no0uvVkY2Zsm6sqGMMDZ3Gsqv8x5/JN9Tu53ofpyA1321x
	N2K7cu9dKoEQNJyh8QlMHrmzMYLyOwqBvXHI9iXwwUFuDNF6gKvGk9Z3HeF+ZvdvhXe/9V
	W3PJmRdRVJFJHCoTjlkmKnk7pf4VwKcCNlHmmFhQD5t2cOiegJBWSa287oppCiNKlzDfAK
	jC2zzf/0DlVafUSXhX5IhBh6yR6TB7uptWNlPDvn2QiUhC+xvM/hl1A7ZLyW5g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/6] drm/bridge: convert users of of_drm_find_bridge(),
 part 4
Date: Fri, 16 Jan 2026 18:32:35 +0100
Message-Id: <20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADR2amkC/y2NUQrCMBAFr1L224Uklkq9ikhIu5u6UJOyqSKU3
 r1R/Jw3MG+Dwipc4NpsoPyWIjlVsKcGxkdIE6NQZXDGdcaaC5I+cVChasI85xEnXpfX+t19jj5
 KIv/3LZrQu+Hc2cg9QU0uylE+v7vbfd8PmQJGJH4AAAA=
X-Change-ID: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-4-0a92b361fe9d
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Linus Walleij <linusw@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
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
          c. … convert direct of_drm_get_bridge() users, part 3
          d. ➜ convert direct of_drm_get_bridge() users, part 4
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
 - Part 3: other drivers, low-medium complexity [3]
 - Part 4: other drivers, converting the most complex cases [this series]

[2] https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com/
[3] https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (6):
      drm: renesas: rz-du: rzg2l_du_encoder: convert to of_drm_find_and_get_bridge()
      drm/kmb/dsi: convert to of_drm_find_and_get_bridge()
      drm/mcde: dsi: warn in case of multiple subnodes
      drm/mcde: dsi: convert to of_drm_find_and_get_bridge()
      drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()
      drm/omap: dss: convert to of_drm_find_and_get_bridge()

 drivers/gpu/drm/kmb/kmb_dsi.c                     |  2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                   | 16 ++++++++-----
 drivers/gpu/drm/omapdrm/dss/output.c              | 11 ++++++---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 28 ++++++++++++++++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 14 ++++++++----
 7 files changed, 54 insertions(+), 20 deletions(-)
---
base-commit: 6821fd5cf409d7147441abedf31ec3e4daeb7b55
change-id: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-4-0a92b361fe9d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


