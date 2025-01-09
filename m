Return-Path: <linux-renesas-soc+bounces-11991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A48A07A24
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C49177A1895
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B8021C197;
	Thu,  9 Jan 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mcNhyiMP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gptbxtyj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mcNhyiMP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gptbxtyj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF502206F27;
	Thu,  9 Jan 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434998; cv=none; b=rlrqpunbTUO9ESsU8Gc+d7/VU4QhR2S2lQ6Bid11FCbErUTgzEBOgygRXvisitpzLGcecPTmD9b8jQyKlKrf9WeLd+jeQGpnzodpZbV81glMqbRBTYC/FSXG3VxGnkoiODe9Fgk4r4Mt82QrMBbTB68Hd5mFVsU0BUDUgSPrkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434998; c=relaxed/simple;
	bh=xW/Gupb74krBZP6bo4+ZQTX9+jtseLVBG0wqvLbnX2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yt8BrA1+G2WlzSGj8JN2ZwGbi8iwIOLXobZwyJRzz9e0OV+W46S0Wnww0ceBMAwgnW5he6KopyFB3iJyOrXPWMW8CWqyaCQd00g1peC5XGEHUiXxnL0YiALoJZxPSws40KtFeBKHc4kJSJ+ped/S0bIBhRcMozQD2D4cUR7oKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mcNhyiMP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gptbxtyj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mcNhyiMP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gptbxtyj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B36C21173;
	Thu,  9 Jan 2025 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayMP9fgai3U2SRutfILrxld66PrmIAS8Xan8q+cw9vU=;
	b=mcNhyiMPnM+4j1AopsnKFUXAyXxBjIEzkwkM4SaRb6QPomPzcXjJDSMydwiTkaeendLYuu
	onTUMYPgd6lz099mNddFue/NFvbfZw/FP74gYFtSuDhctKd0uALTn8tGhNEcH/JRxCAJnv
	JMpR9FHiaNMB4stMe8C0ZyObftX5iQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayMP9fgai3U2SRutfILrxld66PrmIAS8Xan8q+cw9vU=;
	b=gptbxtyjgUS1zD900ZGA6biMREqapnx6iFpYtdoWkt0TK2hXPI337A2feZfbCYmSM5mS2P
	no98HSzI83Q0NVCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mcNhyiMP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gptbxtyj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayMP9fgai3U2SRutfILrxld66PrmIAS8Xan8q+cw9vU=;
	b=mcNhyiMPnM+4j1AopsnKFUXAyXxBjIEzkwkM4SaRb6QPomPzcXjJDSMydwiTkaeendLYuu
	onTUMYPgd6lz099mNddFue/NFvbfZw/FP74gYFtSuDhctKd0uALTn8tGhNEcH/JRxCAJnv
	JMpR9FHiaNMB4stMe8C0ZyObftX5iQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayMP9fgai3U2SRutfILrxld66PrmIAS8Xan8q+cw9vU=;
	b=gptbxtyjgUS1zD900ZGA6biMREqapnx6iFpYtdoWkt0TK2hXPI337A2feZfbCYmSM5mS2P
	no98HSzI83Q0NVCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84E9E139AB;
	Thu,  9 Jan 2025 15:03:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8o8oHzLlf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:14 +0000
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
Subject: [PATCH v2 00/25] drm/dumb-buffers: Fix and improve buffer-size calculation
Date: Thu,  9 Jan 2025 15:56:54 +0100
Message-ID: <20250109150310.219442-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0B36C21173
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

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
the new helper. A small number of  drivers has more complicated
calculations and will be updated by a later patches.

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

 drivers/gpu/drm/armada/armada_gem.c           |  16 +--
 drivers/gpu/drm/drm_dumb_buffers.c            | 133 ++++++++++++++++--
 drivers/gpu/drm/drm_gem_dma_helper.c          |   7 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  16 +--
 drivers/gpu/drm/drm_gem_vram_helper.c         |  89 +++---------
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   8 +-
 drivers/gpu/drm/gma500/gem.c                  |  21 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  25 +++-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  29 +++-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  29 ++--
 drivers/gpu/drm/mediatek/mtk_gem.c            |  13 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  27 +++-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   7 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  15 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |  17 ++-
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
 26 files changed, 333 insertions(+), 227 deletions(-)
 create mode 100644 include/drm/drm_dumb_buffers.h


base-commit: f06efdfad9d0e9f5cb74404ac98e1a5b3b246567
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.47.1


