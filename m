Return-Path: <linux-renesas-soc+bounces-324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426D7FB872
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD1B0B2193D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968E045C00;
	Tue, 28 Nov 2023 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61C31B8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 02:47:27 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D710B1F74C;
	Tue, 28 Nov 2023 10:47:25 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EFC5139FC;
	Tue, 28 Nov 2023 10:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id z3pyIT3FZWXpagAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 10:47:25 +0000
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
Subject: [PATCH 0/8] drm/plane-helpers: Minor clean ups
Date: Tue, 28 Nov 2023 11:45:16 +0100
Message-ID: <20231128104723.20622-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++++++++++++
X-Spam-Score: 15.09
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither permitted nor denied by domain of tzimmermann@suse.de) smtp.mailfrom=tzimmermann@suse.de;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: D710B1F74C
X-Spamd-Result: default: False [15.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 NEURAL_SPAM_LONG(3.50)[0.999];
	 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
X-Spam: Yes

Move drm_plane_helper_atomic_check() into udl, which is the only
driver using it. Remove several unnecessary include statements for
<drm/drm_plane_helper.h>.

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
 drivers/gpu/drm/drm_plane_helper.c            | 32 -------------------
 drivers/gpu/drm/loongson/lsdc_plane.c         |  1 -
 .../drm/renesas/shmobile/shmob_drm_plane.c    |  1 -
 drivers/gpu/drm/solomon/ssd130x.h             |  1 -
 drivers/gpu/drm/tiny/ofdrm.c                  |  1 -
 drivers/gpu/drm/tiny/simpledrm.c              |  1 -
 drivers/gpu/drm/udl/udl_modeset.c             | 19 +++++++++--
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  1 -
 include/drm/drm_plane_helper.h                |  2 --
 10 files changed, 17 insertions(+), 43 deletions(-)

-- 
2.43.0


