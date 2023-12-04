Return-Path: <linux-renesas-soc+bounces-605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADF802DD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 10:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 871A21F21180
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 09:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C5312E7E;
	Mon,  4 Dec 2023 09:09:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C4BCD
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Dec 2023 01:09:03 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9EEEB1FE5A;
	Mon,  4 Dec 2023 09:09:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B05413588;
	Mon,  4 Dec 2023 09:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id dKknFS2XbWV+KAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 04 Dec 2023 09:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	suijingfeng@loongson.cn
Cc: laurent.pinchart@ideasonboard.com,
	javierm@redhat.com,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/8] drm/plane-helpers: Minor clean ups
Date: Mon,  4 Dec 2023 10:07:45 +0100
Message-ID: <20231204090852.1650-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de (policy=none);
	spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither permitted nor denied by domain of tzimmermann@suse.de) smtp.mailfrom=tzimmermann@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [9.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 NEURAL_HAM_LONG(-0.96)[-0.958];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.52)[91.87%];
	 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
X-Spam-Score: 9.31
X-Rspamd-Queue-Id: 9EEEB1FE5A

Move drm_plane_helper_atomic_check() into udl, which is the only
driver using it. Remove several unnecessary include statements for
<drm/drm_plane_helper.h>.

v2:
	* fix documentation (Sui)

Thomas Zimmermann (8):
  drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
  drm/amdgpu: Do not include <drm/drm_plane_helper.h>
  drm/loongson: Do not include <drm/drm_plane_helper.h>
  drm/shmobile: Do not include <drm/drm_plane_helper.h>
  drm/solomon: Do not include <drm/drm_plane_helper.h>
  drm/ofdrm: Do not include <drm/drm_plane_helper.h>
  drm/simpledrm: Do not include <drm/drm_plane_helper.h>
  drm/xlnx: Do not include <drm/drm_plane_helper.h>

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 -
 drivers/gpu/drm/drm_crtc_helper.c             |  7 ++--
 drivers/gpu/drm/drm_plane_helper.c            | 32 -------------------
 drivers/gpu/drm/loongson/lsdc_plane.c         |  1 -
 .../drm/renesas/shmobile/shmob_drm_plane.c    |  1 -
 drivers/gpu/drm/solomon/ssd130x.h             |  1 -
 drivers/gpu/drm/tiny/ofdrm.c                  |  1 -
 drivers/gpu/drm/tiny/simpledrm.c              |  1 -
 drivers/gpu/drm/udl/udl_modeset.c             | 19 +++++++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  1 -
 include/drm/drm_plane_helper.h                |  2 --
 11 files changed, 19 insertions(+), 48 deletions(-)

-- 
2.43.0


