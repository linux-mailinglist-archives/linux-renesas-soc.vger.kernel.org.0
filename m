Return-Path: <linux-renesas-soc+bounces-325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B77FB86C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365491C2130B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B499A3FB32;
	Tue, 28 Nov 2023 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TgoMgYHt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="09KeOwxK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0ABD4E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 02:47:28 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2814F1F74D;
	Tue, 28 Nov 2023 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701168447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlbV1AMis5WhR4RYiVpHv6K91/iOI9c1hHapYA4Li2M=;
	b=TgoMgYHt0XwUMl3MuU09q+J7nnC7DyKcg328BpB55MDnyw2qWf7VCjAZ/yFNNT0R1VfH31
	1h68oOsNV9jibAsEF3Ovm5XXaGxI6EgmxW5GZC/5+u/JajgjzFxzXohXkoX4vSqlD/x0fx
	0v9CgdDUkSZDnD0V7/2ambw94xW/W7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701168447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlbV1AMis5WhR4RYiVpHv6K91/iOI9c1hHapYA4Li2M=;
	b=09KeOwxKdoa0HjBCN1wmOIeixQRrkXxp49ySxybGDmUPeKqtPXmZxa2i2XxTGRcN1ulAOl
	cPedifzPGXc78vAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D2998139FC;
	Tue, 28 Nov 2023 10:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 6IxJMj7FZWXpagAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 10:47:26 +0000
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
Subject: [PATCH 4/8] drm/shmobile: Do not include <drm/drm_plane_helper.h>
Date: Tue, 28 Nov 2023 11:45:20 +0100
Message-ID: <20231128104723.20622-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128104723.20622-1-tzimmermann@suse.de>
References: <20231128104723.20622-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 4.29
X-Spamd-Result: default: False [4.29 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.01)[42.42%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-0.42)[-0.416];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,ffwll.ch,gmail.com,loongson.cn];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Remove unnecessary include statements for <drm/drm_plane_helper.h>.
The file contains helpers for non-atomic code and should not be
required by most drivers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 8f9a728affde8..07ad17d24294d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -14,7 +14,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "shmob_drm_drv.h"
 #include "shmob_drm_kms.h"
-- 
2.43.0


