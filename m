Return-Path: <linux-renesas-soc+bounces-13265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE8A39EC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD7A3A77FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CC526A0DF;
	Tue, 18 Feb 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LlSs4fnK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfjHjFGY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LlSs4fnK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfjHjFGY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0551126A0B0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888751; cv=none; b=XiIdj/PP6CvT0em5J6qx8724U5YMm1j1RRiV9Asb2Q3jMVaB6SWREJg4ZwySt4YN/XnYIb2dH3G+DMpW1KSdEtMHP8GwI837b4MNLsQAJVlFcrmE/8ksIS3a5ldYS/J59VLr88YiO978P6PCV6xnm19qr3BusGwRSf+Dw/UrWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888751; c=relaxed/simple;
	bh=WrgzNluLaqFPsXEEB9LgRldYkU+k7hdd90o6F5KHDlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XAdqir5Du/SiewHFDbTu2aPoQOBUHtLHPTY/Aql1tI9xS0wkGoOMkdQyoWktIa84g3iqORIhUl8xhMPJgkhe0YPCkG7Saxn8ptJaBWH9jsR7lpDZOvqPSjSFrdOH6Whahad4a/J2AUitmjsZuDYfmWQbzF1jFyC8WyNSlbIgJxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LlSs4fnK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zfjHjFGY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LlSs4fnK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zfjHjFGY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3493B21178;
	Tue, 18 Feb 2025 14:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM5J5/B9G8ujP3c8N205nGSWXTw5wg263Hg0+XOJCnY=;
	b=LlSs4fnKPUxG0YDSkxS+AScK2zHHU6AUFcTXFMqoBfjmib46R4TId977rux8ciCDiPyIUV
	S2M449+jRQKbixMD2cad0wE/SD6qgyzDKj00hFbcDdJfgbzsUVwJFPiG2BfVfKVadK/8z3
	73pLe+yXwh/4zHCYJ+glSBbIdv8wtIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM5J5/B9G8ujP3c8N205nGSWXTw5wg263Hg0+XOJCnY=;
	b=zfjHjFGYF0dL+zF8PaNbOFZbq2k6XV3o4mDpz+e90ubbpxZi99z68oCRZhaGD9oDnmQBXN
	FbDkD4gD2J20JMDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LlSs4fnK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zfjHjFGY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM5J5/B9G8ujP3c8N205nGSWXTw5wg263Hg0+XOJCnY=;
	b=LlSs4fnKPUxG0YDSkxS+AScK2zHHU6AUFcTXFMqoBfjmib46R4TId977rux8ciCDiPyIUV
	S2M449+jRQKbixMD2cad0wE/SD6qgyzDKj00hFbcDdJfgbzsUVwJFPiG2BfVfKVadK/8z3
	73pLe+yXwh/4zHCYJ+glSBbIdv8wtIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM5J5/B9G8ujP3c8N205nGSWXTw5wg263Hg0+XOJCnY=;
	b=zfjHjFGYF0dL+zF8PaNbOFZbq2k6XV3o4mDpz+e90ubbpxZi99z68oCRZhaGD9oDnmQBXN
	FbDkD4gD2J20JMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7E59132C7;
	Tue, 18 Feb 2025 14:25:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jEGGJ2qYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/25] drm/dumb-buffers: Fix and improve buffer-size calculation
Date: Tue, 18 Feb 2025 15:23:23 +0100
Message-ID: <20250218142542.438557-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3493B21178
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

Dumb-buffer pitch and size is specified by width, height, bits-per-pixel
plus various hardware-specific alignments. The calculation of these
values is inconsistent and duplicated among drivers. The results for
formats with bpp < 8 are incorrect.

This series fixes this for most drivers. Default scanline pitch and
buffer size are now calculated with the existing 4CC helpers. There is
a new helper drm_mode_size_dumb() that calculates scanline pitch and
buffer size according to driver requirements.

The series fixes the common GEM implementations for DMA, SHMEM and
VRAM. It further changes most implementations of dumb_create to use
the new helper. A small number of drivers has more complicated
calculations and will be updated by a later patches.

v3:
- document UAPI semantics
- fall back to bpp-based allocation for unknown color modes
- cleanups
v2:
- rewrite series
- convert many individual drivers besides the shared GEM helpers

Thomas Zimmermann (25):
  drm/dumb-buffers: Sanitize output on errors
  drm/dumb-buffers: Provide helper to set pitch and size
  drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/renesas/rcar-du: Compute dumb-buffer sizes with
    drm_mode_size_dumb()
  drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()

 drivers/gpu/drm/armada/armada_gem.c           |  16 +-
 drivers/gpu/drm/drm_dumb_buffers.c            | 156 ++++++++++++++++--
 drivers/gpu/drm/drm_gem_dma_helper.c          |   7 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  16 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  89 +++-------
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   8 +-
 drivers/gpu/drm/gma500/gem.c                  |  21 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  25 ++-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  29 +++-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  29 +---
 drivers/gpu/drm/mediatek/mtk_gem.c            |  13 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  27 ++-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   7 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  15 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |  17 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   7 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  12 +-
 drivers/gpu/drm/tegra/gem.c                   |   8 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  21 +--
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   7 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |   7 +-
 include/drm/drm_dumb_buffers.h                |  14 ++
 include/drm/drm_gem_vram_helper.h             |   6 -
 include/uapi/drm/drm_mode.h                   |  46 +++++-
 27 files changed, 401 insertions(+), 228 deletions(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

-- 
2.48.1


