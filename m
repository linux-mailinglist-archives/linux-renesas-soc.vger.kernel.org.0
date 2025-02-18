Return-Path: <linux-renesas-soc+bounces-13284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4EBA39FAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4686D1773F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E810726AAA8;
	Tue, 18 Feb 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QWDL29bU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lAtoQemF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QWDL29bU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lAtoQemF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189B26AAA9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Feb 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888809; cv=none; b=jEpakqC1vVSWd/8Hl49dXfC4sSpvrZ4tHgVJ6E2I8MYsgH+9wZ9mxAHMMEGlfwNxF26EB7nIGia4T/GA6uOfnF5KJefNrW/aF6YVJfEWCQFadPIMpVCgfyknkyYK49GM1J8fBMR4zflroPovKXFSSPPED0EDNQHteoWc8wxI2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888809; c=relaxed/simple;
	bh=QiQY6I+dVXacjSCpuQkpcuqMrE+Q/13JZ3CqYdWsmG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oe5c6T5Qa3HfYcZcMQNB3OgnJl0gy+TocTH/WzhJ2WysaiLaw6GbApNrzqXMK59PljYr1fywtLTrPL+fev63YLfyorEsO+q1m12gmA1MOGYFZpnplxEV1Ta0ZNkDK1ayPTASEmlPe49QhQsrE4bRR4csJU4XsaKQuZFQg4V0oH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QWDL29bU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lAtoQemF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QWDL29bU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lAtoQemF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 383F21F45F;
	Tue, 18 Feb 2025 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=QWDL29bUrP2m6sl99ubzg2utgJbWY7wqEDZxGo0png17kql089qwzM6TyLp7jSFe9lx7yu
	aL0eBRPKqxg9WKiXJimbGYQgB9oypMx0IAjnBQORjTCHFQfy2azE3RY8eaMHj0qYHO39WH
	PETn3Ek6MfsDkmpSNcCLRMBZ5+Y3auM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=lAtoQemFGr2tpXkJ/Posnbf8F7aYSpmSmfN+lQFJfDdybRUFQ7ZuDIqwGcFNyy2vGfrn0S
	/IWap1dBZ+LiEiCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QWDL29bU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lAtoQemF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739888759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=QWDL29bUrP2m6sl99ubzg2utgJbWY7wqEDZxGo0png17kql089qwzM6TyLp7jSFe9lx7yu
	aL0eBRPKqxg9WKiXJimbGYQgB9oypMx0IAjnBQORjTCHFQfy2azE3RY8eaMHj0qYHO39WH
	PETn3Ek6MfsDkmpSNcCLRMBZ5+Y3auM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739888759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3BQX9BaOsrc4Jv6PDvBUwp3VMnxYpvzhc2wpYz9lDE=;
	b=lAtoQemFGr2tpXkJ/Posnbf8F7aYSpmSmfN+lQFJfDdybRUFQ7ZuDIqwGcFNyy2vGfrn0S
	/IWap1dBZ+LiEiCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C70913A82;
	Tue, 18 Feb 2025 14:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0NrkJHaYtGdXYQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Feb 2025 14:25:58 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v3 21/25] drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 18 Feb 2025 15:23:44 +0100
Message-ID: <20250218142542.438557-22-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
References: <20250218142542.438557-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 383F21F45F
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,suse.de,redhat.com,chromium.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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


