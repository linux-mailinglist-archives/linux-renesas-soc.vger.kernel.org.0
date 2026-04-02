Return-Path: <linux-renesas-soc+bounces-30781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H2dKE+bzmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:37:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D2938BFCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D5A1309945E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A673F1653;
	Thu,  2 Apr 2026 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x+PV2+1m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871281E98FF
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2026 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147261; cv=none; b=mCtbqIlpE0GdRX3m849ZTlOA175ebsPyVTKG9Dcdh3WjvZaSNNMIIfwJOYkm4+V1rCB7YHNFMp9ZJpKlBoqUlh4c6uscSZwjmQhcBBWirgBFyhEcxb6EOVY44zrBarbwzW079urnvrUwOw7NB1939T+y5ZjL73vyWz+hwVr+H7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147261; c=relaxed/simple;
	bh=2re1GAikj9CWKiiHDzKq7dn7JTOTQgGs1LXeb6SEPxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MJx7sjc6GAHDzFt+Z5W8RnZJjIPEptO6GYLHK5XuYnLeC0vg5EW7tt+oMCILmlMkG6930I0aZY6SHo92uYWj9qLdSaqKEsg2kawS4cRqxBaDnRK4wsOKf+WrIPmAnbQKiuT1IWeP7EPLteL+KA5BpWayBBMIeygwW+y9Yw2aW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x+PV2+1m; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 013844E428BE;
	Thu,  2 Apr 2026 16:27:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B33E6602CD;
	Thu,  2 Apr 2026 16:27:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEB5310450283;
	Thu,  2 Apr 2026 18:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775147254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=231dMFUljBtRP2ObnzQwRUlHPRV5FegZUmPtUy6qqIw=;
	b=x+PV2+1mOOtbFnsV9/nzrpx1si6Eb3lZ7DrmBzTrayVlmrz/2oE/KEdRzQcs2W/6AYFJDu
	wSezKY5rKgc2Dn2aFmJqP1kYssQ2MXHLf4VmrD89vW4CywNvCjQK2bRmabHN8RNrFiGTQa
	zX6Gz96ZzHJ3Td/FtqymkAnVt/eV9wF6gvAR34VcfprQhnl1oDRCH+lGyZ1cpJ13Jl9T+R
	gSntbsSWFMSdcb8rz1GNoVUhgovvAy4hFH1GljyytgEAH+gD2sz50sBqgZLHUcpCuy4bPM
	vGoWcKlpzRaw96PJXeq9wd4AEmDMg8kiEFD55hiOQBcHYURrfchp6tqVnZO9jg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 0/4] drm/bridge: convert users of of_drm_find_bridge(),
 part 4
Date: Thu, 02 Apr 2026 18:27:16 +0200
Message-Id: <20260402-drm-bridge-alloc-getput-drm_of_find_bridge-4-v4-0-421781c8c061@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOWYzmkC/5XO3QqCQBAF4FeJvW5jZlfNuuo9IsT90wFzYzUpw
 ndvFaGIbrw8Z+A782KdDWQ7dty8WLADdeTbGJLthum6bCvLycTMBIgMEPbchCtXgUy8lE3jNa9
 sf7v3U194VzhqTbHcEw7lQSiZobMHwyJ5C9bRY547X2Kuqet9eM7rA07tMoTZuqEBOXArEyVzl
 4IR+5Pyvm+o3Wl/ZdPUIL54iSt5MfGQo9JGY5L94eWHl5iv5GXkEeLnIhUg0x9+HMc3F+UoOKg
 BAAA=
X-Change-ID: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-4-0a92b361fe9d
To: Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
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
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30781-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 08D2938BFCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series converts many DRM drivers from the now deprecated
of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
allows correct bridge refcounting.

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
          a. ✔ add of_drm_get_bridge() (v7.0),
	       convert basic direct users (v7.0-v7.1)
	  b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
	  c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
	  d. ➜ convert direct of_drm_get_bridge() users, part 4
	       (some v7.1, some pending)
	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. … protect private_obj removal from list
    C. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. … Migrate i.MX LCDIF driver to bridge-connector
 6.   DRM bridge hotplug
    A.   Bridge hotplug management in the DRM core
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

This work is a continuation of the work to correctly handle bridge
refcounting for existing of_drm_find_bridge(). The ground work is in:

 - commit 293a8fd7721a ("drm/bridge: add of_drm_find_and_get_bridge()")
 - commit 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
 - commit 3fdeae134ba9 ("drm/bridge: add next_bridge pointer to struct drm_bridge")

The whole conversion is split in multiple series to make the review process
a bit smoother:

 - Part 2: mostly drivers in drivers/gpu/drm/bridge [2], applied
 - Part 3: other drivers, low-medium complexity [3], applied
 - Part 4: other drivers, converting the most complex cases [this series]

[2] https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com/
[3] https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- Patch 3: many improvements as suggested by Laurent
- Patch 1: add comment after Laurent's suggestion on patch 3
- Link to v3: https://lore.kernel.org/r/20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com

Changes in v3:
- Rebased on current drm-misc-next (on v7.0-rc3)
- Dropped patches already applied
- Link to v2: https://lore.kernel.org/r/20260131-drm-bridge-alloc-getput-drm_of_find_bridge-4-v2-0-e081bcdc1467@bootlin.com

Changes in v2:
- Removed bouncing recipient: Edmund Dea <edmund.j.dea@intel.com>
- used break instead of a warning patch 3, adapted patch 4 as a
  consequence
- Link to v1: https://lore.kernel.org/r/20260116-drm-bridge-alloc-getput-drm_of_find_bridge-4-v1-0-e34b38f50d27@bootlin.com

---
Luca Ceresoli (4):
      drm: renesas: rz-du: rzg2l_du_encoder: convert to of_drm_find_and_get_bridge()
      drm/kmb/dsi: convert to of_drm_find_and_get_bridge()
      drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()
      drm/omap: dss: convert to of_drm_find_and_get_bridge()

 drivers/gpu/drm/kmb/kmb_dsi.c                     |  2 +-
 drivers/gpu/drm/omapdrm/dss/output.c              | 11 +++++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 35 +++++++++++++++++++----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 19 +++++++++---
 6 files changed, 56 insertions(+), 14 deletions(-)
---
base-commit: 3bb828758df6ad0fd40e63fa2372eb896c9a7199
change-id: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-4-0a92b361fe9d

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>


