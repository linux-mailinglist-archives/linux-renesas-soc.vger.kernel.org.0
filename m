Return-Path: <linux-renesas-soc+bounces-29748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCT9IQJ0umkeWwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:44:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16852B9539
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5775D3025A66
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248023B7B8B;
	Wed, 18 Mar 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gDNPRIVz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F13A7F62
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826804; cv=none; b=JNC+gH2069Z0UoTkH+Og803XzoShg2s46QIzQlf82t5uhcyldp8SZqDoFg002FzYgYAHFGR9P21DeZfKdx59cLw4vi9MizvZqkEEitlm2E/6ScqjUifHCpsfUNj+4/JdkeCvQAOt/w/zm9egGvPwBWB4HXrGX5dpbk2TnCv+aII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826804; c=relaxed/simple;
	bh=hSX//j32FqvQVJUUvMNK/i6SNvR/3jZhFuHHPjM2qF8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YHgzQb10JNU4ewTxzAFDkKyodU4rEzVo+q1DelPHZyNbY0EhYiMu7zi92ps9xLsfDNw78+HJoOnzOvKqO26tKOyTlbQ+IcRxXQ4nszPyZtDKPV/r+oODr+nbf5nw8CoQzuwxfjNRiY0qMo8+WrPEqx7ionECSCoi23cFDBxmr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gDNPRIVz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0266CC55069;
	Wed, 18 Mar 2026 09:40:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E7146004F;
	Wed, 18 Mar 2026 09:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E77221045072A;
	Wed, 18 Mar 2026 10:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773826792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=k3+bNv2x/KQiUdh0VCKsF3Tn/5NfcZ6lw2x7t4La+Ng=;
	b=gDNPRIVzOdaoqYDRt9c8xZkT48+xx2+8gFwdIeXBTd/9rVMcySF011UN9w4DDN7bi06rKv
	rJg/691HMSYf8OhrH/HIaIuxjIZSmI4QEZNCtW8xovxQtXh4lATPQMWTLT6f9QiHsASpDq
	7atJjbjdIcsS+57LUlAxQcpiCPGcWriZKYFb08jcF6P67piil0t6mqfzy0AEArmYajkA0R
	ZcEjJuymPaPqep6/00NOfz5hn+cdqpmHHk8L2yQkm3S08H6/ziIWGCULJJchhrpG5mk0FZ
	cyeZp5RBNvKDq0Z+F1avnEPoAWRFmYD9vGsuU6rb41n6MXn96j9xrYNlAoqp9A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/4] drm/bridge: convert users of of_drm_find_bridge(),
 part 4
Date: Wed, 18 Mar 2026 10:39:34 +0100
Message-Id: <20260318-drm-bridge-alloc-getput-drm_of_find_bridge-4-v3-0-10f502520357@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANZyumkC/5WNywqDMBQFf0WybkoeNtqu+h+liHnpBU0kWmkR/
 72JuCjduZxzYGZBowlgRnTLFhTMDCN4F4GfMqTa2jUGg46MGGGCUFJgHXosA+j41F3nFW7MNLy
 mtFfeVhacrvY/x6S+MskFteaqUVQOwVh4b7nHM3IL4+TDZ6vPNK17iIpjoZligg3PJS/thWhW3
 KX3UwfurHyPUmpmP3pOD+pZ0pOSSqUVzcWffl3XL3DxczlJAQAA
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
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29748-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ideasonboard.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: F16852B9539
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
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
    C. … Add drm_bridge_clear_and_put()
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5.   Migrate i.MX LCDIF driver to bridge-connector
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
 drivers/gpu/drm/omapdrm/dss/output.c              | 11 ++++++---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 28 ++++++++++++++++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.h |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c     |  2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 14 ++++++++----
 6 files changed, 44 insertions(+), 14 deletions(-)
---
base-commit: 93eb544f1603103ce6be564bceb36e3875ba7ac0
change-id: 20260107-drm-bridge-alloc-getput-drm_of_find_bridge-4-0a92b361fe9d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


