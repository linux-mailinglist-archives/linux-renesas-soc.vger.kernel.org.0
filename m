Return-Path: <linux-renesas-soc+bounces-19602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57586B0DF24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 16:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF0B1AC6B80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 14:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A312EB5C4;
	Tue, 22 Jul 2025 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HkNAr99t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xjaK24uY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HkNAr99t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xjaK24uY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB242EAD13
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195005; cv=none; b=Q8bU7ms96e2SBlJhmXumXmGN3gkWnEf9JvGoBzkOQZZOu57OAiHhUpzdphiGO0cQG+8bVw2XPhwr57Fv+ZFhGBDL8FhE6O6SWCsoTdUqeXK7+o8c5AMLJ3+h2+UV40BFgbdHR1ioTGe56epQ+DKtdrOOuxLndY2wOLrr8pw2Cog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195005; c=relaxed/simple;
	bh=U38vHwYvj/snWXvCq8nA+Zbfq/F5HTG8jvr3xzABwS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u33noZ4RbKE6Hwau/nLr2x5NafGIlV0lxpXVlBnpQVQsnP5U5k7JWFml6JMF//SLnD8qnV+WshwdvGXvnbVDZj+vCBoXOzo9BPo8+twDQYo6DYQ5mrJQxHLy82ywgiE09uEhc7PMVMGzqosF/52HhYlSSZfauQzguJ+pHdXyY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HkNAr99t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xjaK24uY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HkNAr99t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xjaK24uY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78A45211CF;
	Tue, 22 Jul 2025 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753195001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYaGKdibHtzw4fA/0MfIQrIP4w9AF7TLkj3JQ1iP4C4=;
	b=HkNAr99tGIBqUgCRhmCW9rD1j50SonENlFbfH0MtJBJHTKkCeFuUhsQE1jolCxWHzSKIQc
	4eKVstQcJwVsADzWHRSSbhmRrMPzOGnGpUBQlVzffTitT64t7PcJHW18/gszLGMllbC+Om
	aRtF/BkDKNjhdrHtc5Z0FPNIg/p+yLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753195001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYaGKdibHtzw4fA/0MfIQrIP4w9AF7TLkj3JQ1iP4C4=;
	b=xjaK24uYmPjCkFM0ssUCyZJ6kBuqE835ky/2krTcOOWZMPec3/BHPdPNyLWF41Z0kLvsYa
	TlbwdTSzzKPcOnAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HkNAr99t;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xjaK24uY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753195001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYaGKdibHtzw4fA/0MfIQrIP4w9AF7TLkj3JQ1iP4C4=;
	b=HkNAr99tGIBqUgCRhmCW9rD1j50SonENlFbfH0MtJBJHTKkCeFuUhsQE1jolCxWHzSKIQc
	4eKVstQcJwVsADzWHRSSbhmRrMPzOGnGpUBQlVzffTitT64t7PcJHW18/gszLGMllbC+Om
	aRtF/BkDKNjhdrHtc5Z0FPNIg/p+yLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753195001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AYaGKdibHtzw4fA/0MfIQrIP4w9AF7TLkj3JQ1iP4C4=;
	b=xjaK24uYmPjCkFM0ssUCyZJ6kBuqE835ky/2krTcOOWZMPec3/BHPdPNyLWF41Z0kLvsYa
	TlbwdTSzzKPcOnAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D574132EA;
	Tue, 22 Jul 2025 14:36:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ED+DKPChf2jxKQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 22 Jul 2025 14:36:32 +0000
Message-ID: <638111c1-454a-40c6-b3ce-6842a76ae11e@suse.de>
Date: Tue, 22 Jul 2025 16:36:23 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/25] drm/dumb-buffers: Fix and improve buffer-size
 calculation
To: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
References: <20250613090431.127087-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[20];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 78A45211CF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Ping for additional reviews. Especially patches 3, 4, and 5, which cover 
a wide range of drivers..

Am 13.06.25 um 11:00 schrieb Thomas Zimmermann:
> Dumb-buffer pitch and size is specified by width, height, bits-per-pixel
> plus various hardware-specific alignments. The calculation of these
> values is inconsistent and duplicated among drivers. The results for
> formats with bpp < 8 are sometimes incorrect.
>
> This series fixes this for most drivers. Default scanline pitch and
> buffer size are now calculated with the existing 4CC helpers. There is
> a new helper drm_mode_size_dumb() that calculates scanline pitch and
> buffer size according to driver requirements.
>
> The series fixes the common GEM implementations for DMA, SHMEM and
> VRAM. It further changes most implementations of dumb_create to use
> the new helper. A small number of drivers has more complicated
> calculations and will be updated by a later patches.
>
> v5:
> - use check_mul_overflow() for overflow test (Tomi)
> - imx: fix intermediate code (Tomi)
> - rz-du: include dumb-buffers header
> v4:
> - improve UAPI documentation
> - document bpp special cases
> - use drm_warn_once()
> - add TODO lists
> - armada: fix pitch alignment
> v3:
> - document UAPI semantics
> - fall back to bpp-based allocation for unknown color modes
> - cleanups
> v2:
> - rewrite series
> - convert many individual drivers besides the shared GEM helpers
>
> Thomas Zimmermann (25):
>    drm/dumb-buffers: Sanitize output on errors
>    drm/dumb-buffers: Provide helper to set pitch and size
>    drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/renesas/rcar-du: Compute dumb-buffer sizes with
>      drm_mode_size_dumb()
>    drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
>    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
>
>   Documentation/gpu/todo.rst                    |  27 +++
>   drivers/gpu/drm/armada/armada_gem.c           |  16 +-
>   drivers/gpu/drm/drm_dumb_buffers.c            | 170 ++++++++++++++++--
>   drivers/gpu/drm/drm_gem_dma_helper.c          |   7 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c        |  16 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c         |  89 +++------
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       |   8 +-
>   drivers/gpu/drm/gma500/gem.c                  |  21 +--
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  25 ++-
>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  29 ++-
>   drivers/gpu/drm/loongson/lsdc_gem.c           |  29 +--
>   drivers/gpu/drm/mediatek/mtk_gem.c            |  13 +-
>   drivers/gpu/drm/msm/msm_gem.c                 |  27 ++-
>   drivers/gpu/drm/nouveau/nouveau_display.c     |   7 +-
>   drivers/gpu/drm/omapdrm/omap_gem.c            |  15 +-
>   drivers/gpu/drm/qxl/qxl_dumb.c                |  17 +-
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   7 +-
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   8 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  12 +-
>   drivers/gpu/drm/tegra/gem.c                   |   8 +-
>   drivers/gpu/drm/virtio/virtgpu_gem.c          |  11 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  21 +--
>   drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
>   drivers/gpu/drm/xen/xen_drm_front.c           |   7 +-
>   drivers/gpu/drm/xlnx/zynqmp_kms.c             |   7 +-
>   include/drm/drm_dumb_buffers.h                |  14 ++
>   include/drm/drm_gem_vram_helper.h             |   6 -
>   include/uapi/drm/drm_mode.h                   |  50 +++++-
>   28 files changed, 447 insertions(+), 228 deletions(-)
>   create mode 100644 include/drm/drm_dumb_buffers.h
>
>
> base-commit: 75238c32deae15ee4120b42a5be556ec36807a84
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
> prerequisite-patch-id: 719d09751d38f5da743beed6266585ee063e1e29

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


