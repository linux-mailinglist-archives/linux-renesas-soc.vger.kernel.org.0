Return-Path: <linux-renesas-soc+bounces-14288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017AAA5C9BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F841890EA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5AE260A5B;
	Tue, 11 Mar 2025 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B13wF/hh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bTEh2TqP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B13wF/hh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bTEh2TqP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D696260A53
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708546; cv=none; b=QN6nFlncjJd5zpz374j6ejBXVgROBLz1ZwdbuifhIJ84kencyjKgSPx2xfxiX1q6E/bWEHpXupVilUmy5XtmvgkFBa8q9N73BBsv5Ko2V83TxlfvrAfauFPkDc9f4xreXBwwQNxuW+GLSQj5FQveR/Wdb1ZvNofc2xGWlgBgefw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708546; c=relaxed/simple;
	bh=QiQY6I+dVXacjSCpuQkpcuqMrE+Q/13JZ3CqYdWsmG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPJgUmEG5fqyrhtHD3RPth22NWwf7aXkt/Obv0Zl9liXCTXSaYb4dG/MePBwfj5BSYBD1N9Ki6rNIQBaXGX/aKKHL5+eT6+pOOw5yggiCPfk2JVeY8+j+5rU4VVBjlJW4Ip4sBoAERK3yctgWq5tT8B5qThy5jU3pTQnYgu9fMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B13wF/hh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bTEh2TqP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B13wF/hh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bTEh2TqP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A643421188;
	Tue, 11 Mar 2025 15:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=B13wF/hhGsclKJ3ghqTwEBQQq8IqncPYrgm0ozcnEJbYu+tM1cGmLgZD6hbywKKljkta0F
	rw6msYC/AYKr47IiZXST7c9Q/a/pTLVUgBIDi+PAf+I8VEn1VSNKoBNb1YRBLHuUUyRBdh
	zRAPiHR30nwNP9NrghGqWQHvxZLDjlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=bTEh2TqPFBtmNWBgLHjJKyTLCiLpXDTgY4hJoefeBwjYQVFMFhdt0N827lpYX3SG3FLZgq
	yiElxM1lbXKqOwBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=B13wF/hhGsclKJ3ghqTwEBQQq8IqncPYrgm0ozcnEJbYu+tM1cGmLgZD6hbywKKljkta0F
	rw6msYC/AYKr47IiZXST7c9Q/a/pTLVUgBIDi+PAf+I8VEn1VSNKoBNb1YRBLHuUUyRBdh
	zRAPiHR30nwNP9NrghGqWQHvxZLDjlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=bTEh2TqPFBtmNWBgLHjJKyTLCiLpXDTgY4hJoefeBwjYQVFMFhdt0N827lpYX3SG3FLZgq
	yiElxM1lbXKqOwBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D94613AB8;
	Tue, 11 Mar 2025 15:55:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0AAKAtRc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:55:00 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v4 21/25] drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:25 +0100
Message-ID: <20250311155120.442633-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,redhat.com,chromium.org,gmail.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 4.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index dde8fc1a3689..5e5e38d53990 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -23,6 +23,7 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 
@@ -66,15 +67,14 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	struct virtio_gpu_object_params params = { 0 };
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	int ret;
-	uint32_t pitch;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_4, 0);
+	if (ret)
+		return ret;
 
 	if (args->bpp != 32)
 		return -EINVAL;
 
-	pitch = args->width * 4;
-	args->size = pitch * args->height;
-	args->size = ALIGN(args->size, PAGE_SIZE);
-
 	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
 	params.width = args->width;
 	params.height = args->height;
@@ -92,7 +92,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	if (ret)
 		goto fail;
 
-	args->pitch = pitch;
 	return ret;
 
 fail:
-- 
2.48.1


