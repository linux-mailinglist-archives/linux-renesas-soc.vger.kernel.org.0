Return-Path: <linux-renesas-soc+bounces-20831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5974B2F1D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 10:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE7611BC2A8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 08:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2637A2EB850;
	Thu, 21 Aug 2025 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OFiNUD19";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="shuTzpzh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OFiNUD19";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="shuTzpzh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17C2EBDE9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764536; cv=none; b=DZrg31eVkOHcyuzWLJfQ3k8lfslAx37NUcN5dvMHH6bTBqb+i9qoQvq85R9o5ns9bjM8B7pSQDsAJ/q2skLnC9igtMBDvtEWrqSm5v17we6RFhwD5GtO0dXtsgQ/wEDsB8XweKZ3wH7k5Dfd5HdhXVWEmKXHs2yRwfdcWg0PnYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764536; c=relaxed/simple;
	bh=3C0O5/Yfye86A9+fum70gypP3EgtKFNJuuTXA6OCe6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nfn1z8/r8kMqSYqnW3WxOglHEA1jIKwcuQREtjUMLjpEcUVzS4j0IrfHCDE0mOcf5mEFl+PIql4BM2c1ihfcWpaldiH5gbVpX8nA78AGYAL9GKMDZRY5kzEn2nwIdYC3wkLDC+czkw0GF8FrRB0TISYIJFh2SEXRVobSzgwcQ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OFiNUD19; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=shuTzpzh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OFiNUD19; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=shuTzpzh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23FC42263E;
	Thu, 21 Aug 2025 08:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeF/TIfQ5z2dG/JFVs8HCwL/G447604zw5bvxDPQkpQ=;
	b=OFiNUD19W6D6N+wsG7pfg8cXNjXouyBJNxF08R6hQMVoJTSOLJvb340+JhoT/tHPbIeo1b
	buBoQ+gYvVFOCznOEXY/oPesDMuv8sQ3ef41xmyQLnhihXjXcCRmX57muoSn3cxGncxBKY
	IpzOGGvyBV45mzfodPsxGorq9FP6ksU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeF/TIfQ5z2dG/JFVs8HCwL/G447604zw5bvxDPQkpQ=;
	b=shuTzpzh5gftkKYzAwqtDJBw5zHjHu0ct+J/BfOsNmegojjDq03PMemmHaTV7I1oLlgd2t
	gJhvayI84Dgh1MDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OFiNUD19;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=shuTzpzh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755764532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeF/TIfQ5z2dG/JFVs8HCwL/G447604zw5bvxDPQkpQ=;
	b=OFiNUD19W6D6N+wsG7pfg8cXNjXouyBJNxF08R6hQMVoJTSOLJvb340+JhoT/tHPbIeo1b
	buBoQ+gYvVFOCznOEXY/oPesDMuv8sQ3ef41xmyQLnhihXjXcCRmX57muoSn3cxGncxBKY
	IpzOGGvyBV45mzfodPsxGorq9FP6ksU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755764532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeF/TIfQ5z2dG/JFVs8HCwL/G447604zw5bvxDPQkpQ=;
	b=shuTzpzh5gftkKYzAwqtDJBw5zHjHu0ct+J/BfOsNmegojjDq03PMemmHaTV7I1oLlgd2t
	gJhvayI84Dgh1MDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90E5413867;
	Thu, 21 Aug 2025 08:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QMslIjPXpmhzEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 21 Aug 2025 08:22:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
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
Subject: [PATCH v6 00/25] drm/dumb-buffers: Fix and improve buffer-size calculation
Date: Thu, 21 Aug 2025 10:17:07 +0200
Message-ID: <20250821081918.79786-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 23FC42263E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01

Dumb-buffer pitch and size is specified by width, height, bits-per-pixel
plus various hardware-specific alignments. The calculation of these
values is inconsistent and duplicated among drivers. The results for
formats with bpp < 8 are sometimes incorrect.

This series fixes this for most drivers. Default scanline pitch and
buffer size are now calculated with the existing 4CC helpers. There is
a new helper drm_mode_size_dumb() that calculates scanline pitch and
buffer size according to driver requirements.

The series fixes the common GEM implementations for DMA, SHMEM and
VRAM. It further changes most implementations of dumb_create to use
the new helper. A small number of drivers has more complicated
calculations and will be updated by a later patches.

v6:
- extend TODO item (Tomi)
- fix typos in documentation (Tomi)
v5:
- use check_mul_overflow() for overflow test (Tomi)
- imx: fix intermediate code (Tomi)
- rz-du: include dumb-buffers header
v4:
- improve UAPI documentation
- document bpp special cases
- use drm_warn_once()
- add TODO lists
- armada: fix pitch alignment
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

 Documentation/gpu/todo.rst                    |  37 ++++
 drivers/gpu/drm/armada/armada_gem.c           |  16 +-
 drivers/gpu/drm/drm_dumb_buffers.c            | 170 ++++++++++++++++--
 drivers/gpu/drm/drm_gem_dma_helper.c          |   7 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  16 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  89 +++------
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   8 +-
 drivers/gpu/drm/gma500/gem.c                  |  21 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  25 ++-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  29 ++-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  29 +--
 drivers/gpu/drm/mediatek/mtk_gem.c            |  13 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  27 ++-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   7 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  15 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |  17 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   7 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   8 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  12 +-
 drivers/gpu/drm/tegra/gem.c                   |   8 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  21 +--
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   7 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |   7 +-
 include/drm/drm_dumb_buffers.h                |  14 ++
 include/drm/drm_gem_vram_helper.h             |   6 -
 include/uapi/drm/drm_mode.h                   |  50 +++++-
 28 files changed, 457 insertions(+), 228 deletions(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

-- 
2.50.1


