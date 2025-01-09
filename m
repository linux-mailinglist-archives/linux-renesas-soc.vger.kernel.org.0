Return-Path: <linux-renesas-soc+bounces-12014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6FBA07AFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29273A8DC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05FB22258B;
	Thu,  9 Jan 2025 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dzuXcjWP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GXC33VFD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dzuXcjWP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GXC33VFD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C56D222579;
	Thu,  9 Jan 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435011; cv=none; b=sHjN8g6S4OVysaeKHhEREWuYWy2vvpXKYyG+yof9PcQeOgncv/cFkwptWadeLhYnUbtvgcwg0jPcIxVeYfPcVChMs9iSoCGD/yj1fr3ZvpOj83GKEj0NPUaE5P2Q1HOLZy55uvcVXAcPkjIOEySwMjPgKQN2MGt21RmmUgzrNzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435011; c=relaxed/simple;
	bh=OBAyC/N93iuZeRfEIiziOC32bdof2w6Sz3s/1KqK/WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaKWKXEqR8ClZctN9+UcHkJKYcvfiSw2c8Gnw8wMxXePeXXAcAxUig68uxYvNOndBJAJbiSxk3qNUd5z6Vax8RCZ7nhEpnibMYWpOiJnTM/0tcD2Vzcn3yxdcMo9hMyd+Ek0qJ+mWQnqsMhjdNQJJFdz3/haMQJQvSe0acDa4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dzuXcjWP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GXC33VFD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dzuXcjWP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GXC33VFD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7ECDE21181;
	Thu,  9 Jan 2025 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s33VjAcs4jt+Ggz64uF8gmmMCcYYtbXaKoSCnL+Gt+g=;
	b=dzuXcjWPLaC8aZaUaOiJ6zUQGy/owwz//I0dH54es3oJMRNwT1TLKK04Z9LYc7Z+PFlbKg
	FCZQsxIJa6qHvf7n1Gu8wnLPMWFWFnVDrdjaFbIokdDxZAcP4Om3vkLLxPzpbeKZApQSw6
	DMnwRqVUggATMnlKNRJnLy7aKyfg2aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s33VjAcs4jt+Ggz64uF8gmmMCcYYtbXaKoSCnL+Gt+g=;
	b=GXC33VFDsf6gSbM4vfv7WU3KqZuksW+r6KT8ZCn22R+uVo5ClXkFt7tjon/6uIEKGmUY+a
	csgewV8GYcrPDIAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dzuXcjWP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GXC33VFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736435008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s33VjAcs4jt+Ggz64uF8gmmMCcYYtbXaKoSCnL+Gt+g=;
	b=dzuXcjWPLaC8aZaUaOiJ6zUQGy/owwz//I0dH54es3oJMRNwT1TLKK04Z9LYc7Z+PFlbKg
	FCZQsxIJa6qHvf7n1Gu8wnLPMWFWFnVDrdjaFbIokdDxZAcP4Om3vkLLxPzpbeKZApQSw6
	DMnwRqVUggATMnlKNRJnLy7aKyfg2aE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736435008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s33VjAcs4jt+Ggz64uF8gmmMCcYYtbXaKoSCnL+Gt+g=;
	b=GXC33VFDsf6gSbM4vfv7WU3KqZuksW+r6KT8ZCn22R+uVo5ClXkFt7tjon/6uIEKGmUY+a
	csgewV8GYcrPDIAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0453713A9E;
	Thu,  9 Jan 2025 15:03:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iEtfOz/lf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:27 +0000
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 24/25] drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:18 +0100
Message-ID: <20250109150310.219442-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7ECDE21181
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
and buffer size. Align the pitch to a multiple of 8.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1bda7ef606cc..fd2f250fbc33 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_file.h>
@@ -414,8 +415,10 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	 * object without pages etc.
 	 * For details also see drm_gem_handle_create
 	 */
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	obj = xen_drm_front_gem_create(dev, args->size);
 	if (IS_ERR(obj)) {
-- 
2.47.1


