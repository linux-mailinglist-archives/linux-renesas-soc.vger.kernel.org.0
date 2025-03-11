Return-Path: <linux-renesas-soc+bounces-14289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CBBA5C9C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 16:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280A5188F546
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Mar 2025 15:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1015261366;
	Tue, 11 Mar 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CipJ1c/g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vCq7alnI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CipJ1c/g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vCq7alnI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD1260A5E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Mar 2025 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741708551; cv=none; b=NU7vPrnGE/Dhuua8YsGqeTVmqvmid/ljQR7SBSg4Q3SaJOV2Ol/JYgviow1rNFv5FLYrAfqn9wva3SoCxcswPNZFZAIJGyVJzozlJWVXcAvKq8vfqPpvo7aW2cJtyzOikamOsYc8W1jJd4hLOP0TDHte2bydu8GbCg3DXK3W5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741708551; c=relaxed/simple;
	bh=95QNBeQdm5Ml6t3+QYrhk1TC9NceFo3T3pZeqau2610=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUlmjMH2jhYhHnXrT/EWfPluUo9ddrdraIrwUTCdalUT7kS/6UyUrqsIvrnRpCJ+dZGhyKJxdEFEb8pbMJgeWcT+SDjQsEvdoJi3hTvFXJ4QdJxpGwvmrTq1yQbg+L5/pes0sXeDUE/grS7mzA5YdokjUSGleEGhkBhgF9hqnEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CipJ1c/g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vCq7alnI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CipJ1c/g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vCq7alnI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ADA6A1F388;
	Tue, 11 Mar 2025 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d8Bl0cF1v6O+xcrm1WAfWxFBe//+J0Nuv+Z/eyCvFo=;
	b=CipJ1c/grFgtrQlRy8Nng29YWlfhqZxmby//Oah73rMeF4sYcnX5KbUms1SUAp90EeDh7v
	RU2LSSG5GYu9xuKBY+jGBYKd5t0oTlYSBM/fH2RTplw0wyBnpLz9DWkbo6+ObJs9mkJKJk
	VycMlO06LViQHBjw2KHWFV42qn99Aco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d8Bl0cF1v6O+xcrm1WAfWxFBe//+J0Nuv+Z/eyCvFo=;
	b=vCq7alnIl7GS/jQY7YBk3JkQA/+EUOJ3MYUVhbmBxyCl70A9tWVf0SBgo9iK9x17aBg/1j
	75KQlvEYYpbDicCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d8Bl0cF1v6O+xcrm1WAfWxFBe//+J0Nuv+Z/eyCvFo=;
	b=CipJ1c/grFgtrQlRy8Nng29YWlfhqZxmby//Oah73rMeF4sYcnX5KbUms1SUAp90EeDh7v
	RU2LSSG5GYu9xuKBY+jGBYKd5t0oTlYSBM/fH2RTplw0wyBnpLz9DWkbo6+ObJs9mkJKJk
	VycMlO06LViQHBjw2KHWFV42qn99Aco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6d8Bl0cF1v6O+xcrm1WAfWxFBe//+J0Nuv+Z/eyCvFo=;
	b=vCq7alnIl7GS/jQY7YBk3JkQA/+EUOJ3MYUVhbmBxyCl70A9tWVf0SBgo9iK9x17aBg/1j
	75KQlvEYYpbDicCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27289134A0;
	Tue, 11 Mar 2025 15:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oDNHCNJc0GdUdQAAD6G6ig
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
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v4 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Tue, 11 Mar 2025 16:47:22 +0100
Message-ID: <20250311155120.442633-19-tzimmermann@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch according to hardware requirements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 90c6269ccd29..f752369cd52f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -75,10 +75,11 @@ const struct rzg2l_du_format_info *rzg2l_du_format_info(u32 fourcc)
 int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			 struct drm_mode_create_dumb *args)
 {
-	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	unsigned int align = 16 * args->bpp / 8;
+	int ret;
 
-	args->pitch = roundup(min_pitch, align);
+	ret = drm_mode_size_dumb(dev, args, 16 * args->bpp / 8, 0);
+	if (ret)
+		return ret;
 
 	return drm_gem_dma_dumb_create_internal(file, dev, args);
 }
-- 
2.48.1


