Return-Path: <linux-renesas-soc+bounces-14292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D06A5C9DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E221A7A2E00
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A833261383;
	Tue, 11 Mar 2025 15:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SjvLLsHe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8JlPHdv8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SjvLLsHe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8JlPHdv8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0725FA20
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708561; cv=none; b=IUJAPy2MSfpomdnjusk/1z9H4I6qSmhysUsEiboJR0BpcWv4OI5ugifPIvz3nR9ZsR9117H4mJ7u6yJknJt1EpNDuAJOiI/BK6X2ZMUEOq0SGMKZTKJ5vdybt8MQdSqk8D4qj91/m4dR4vb7MaEq0ZqtdhkmQigFnhfaVJqxEUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708561; c=relaxed/simple;
	bh=xYs8oGWRq2LYTA8YKgkU194x6bu4gm+T0o9xMcmO9Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4F4gksUEVGj6u0quEo/ASHDV4OdT3K3NkWXlBeVUtHFRjwnbNQMF6WDfEuBpOkkdsD2dQurre/wsWqufo9GCI8hOW7eiexK1/0a8Ts8+l8xiiA8HjJ+mQjOuZqBKMi+akKeJ1Dwv6bu83H/MZuj6NJVfleU4Y0oIHr6B2dMsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SjvLLsHe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8JlPHdv8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SjvLLsHe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8JlPHdv8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D69D1F454;
	Tue, 11 Mar 2025 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWelbGgEbCkjP4y//d+vHYWhnPzSt4ULU4ovN7MHpM8=;
	b=SjvLLsHe3qdAudRrPrvpBK0EcmYh0ziskEqZ8i1KeyCbS8EoQF35cAWsAqAja7EffcDZb1
	fIEZJoPmJn+2dwknAWAyxuY1lRlE5OUWrPkCfw94F2oTZGJXbFUrDY5vLFhUGUjfOQfNKv
	FWAY5liILNKzPBENjIraE7hsoSqf4rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWelbGgEbCkjP4y//d+vHYWhnPzSt4ULU4ovN7MHpM8=;
	b=8JlPHdv8s9lKjhTcW1rII9sjGNksn1+b0e760I1x5NvI2xbQRT5vdls1e73VWOugZnQgmb
	nUuTB0vZ76vY93AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWelbGgEbCkjP4y//d+vHYWhnPzSt4ULU4ovN7MHpM8=;
	b=SjvLLsHe3qdAudRrPrvpBK0EcmYh0ziskEqZ8i1KeyCbS8EoQF35cAWsAqAja7EffcDZb1
	fIEZJoPmJn+2dwknAWAyxuY1lRlE5OUWrPkCfw94F2oTZGJXbFUrDY5vLFhUGUjfOQfNKv
	FWAY5liILNKzPBENjIraE7hsoSqf4rQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWelbGgEbCkjP4y//d+vHYWhnPzSt4ULU4ovN7MHpM8=;
	b=8JlPHdv8s9lKjhTcW1rII9sjGNksn1+b0e760I1x5NvI2xbQRT5vdls1e73VWOugZnQgmb
	nUuTB0vZ76vY93AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4C5413AB8;
	Tue, 11 Mar 2025 15:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cO/UKtJc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:58 +0000
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
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 19/25] drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:23 +0100
Message-ID: <20250311155120.442633-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
References: <20250311155120.442633-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6),to(RLbwen1niosrcqbxsafh1)];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,rock-chips.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 64.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 6330b883efc3..3bd06202e232 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 
 #include <drm/drm.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -403,13 +404,12 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
 			     struct drm_mode_create_dumb *args)
 {
 	struct rockchip_gem_object *rk_obj;
-	int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	int ret;
 
-	/*
-	 * align to 64 bytes since Mali requires it.
-	 */
-	args->pitch = ALIGN(min_pitch, 64);
-	args->size = args->pitch * args->height;
+	/* 64-byte alignment required by Mali */
+	ret = drm_mode_size_dumb(dev, args, SZ_64, 0);
+	if (ret)
+		return ret;
 
 	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
 						 &args->handle);
-- 
2.48.1


