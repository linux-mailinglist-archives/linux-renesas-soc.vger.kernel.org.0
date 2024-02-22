Return-Path: <linux-renesas-soc+bounces-3097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC685F985
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A17781C23800
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 13:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E6D133296;
	Thu, 22 Feb 2024 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Pcb1WBB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z65ENF2K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UN99uD87";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HOo8CP+V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83A1332B7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608088; cv=none; b=Ua3xS+kHHzu6N3XG+qRq0/kN9Rnjga7ZnYPoymZOu2lXEXB/aWQLpYho+Gisk4ZCDmZaYhg8cluBpKc45i9cPxvzzE0exKdlZ7+MfMOV5DwL5oD9k82PA5w1MJA7V42rWGjHJ4wizAiraptZ7qEzJQsUkbDd8o2BkRTV47sqRug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608088; c=relaxed/simple;
	bh=S/WgxMx8LH0NMpWmlSzgPXZ3laQSscGK6/wS0GUYrTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJCDv6UUcvoqlXPrF/2v3/EvSnm/i4yXB6QXiJNqToCO9OmGoiS4/ZCAhMvcvEiheF13xyilyXb11C3Ezm4OlIs1IZjxp1L2rM2S8R9+MP4UTw1heuyIGhDwsSRIpUFR517VSaXtls2D3+ofZ452Aksil3bPiiXgSRVKjQUr7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Pcb1WBB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z65ENF2K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UN99uD87; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HOo8CP+V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D047421E84;
	Thu, 22 Feb 2024 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708608085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2zPveZip51AlXJR6nTeXUOua6RMEkBqbA0lsVzy5kqU=;
	b=2Pcb1WBBcpuFWjVqwmaiecG9syHI5hIFrflhNmfMGPUOFftA606VQBd9bDY4qWasNSVvsI
	cL+cy3ZWT6zttereXYzwxguI8n5Pk/c8xgBLtssihjWP1T5Mscu4WuG5BYVS3bALB4CpIJ
	YsnI/lbk6NI9CVuAtVpH3iA0ptwrRiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708608085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2zPveZip51AlXJR6nTeXUOua6RMEkBqbA0lsVzy5kqU=;
	b=Z65ENF2KKFVE357wweyw/EtINcrGV8wVBGbKw2YUe5eQl2QsZHvPVYpcJTMiKGh8F0udpv
	zz8g9VWjJ+YxTUAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708608084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2zPveZip51AlXJR6nTeXUOua6RMEkBqbA0lsVzy5kqU=;
	b=UN99uD87vzG6WWWanBMeUQllJZUmUJn/Eb/LcpkVyzkCEy08p68YDSpqK/gFIiZ1mUEO24
	RnsC9gXZmpn50GiM28oi+mpMNM72djq+J56+/SEtUn8DseC9uVYg1t6+ktLTmdYdW1mSvh
	ikLL9bHhTK0fNrynY1sx830dbN9NEOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708608084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2zPveZip51AlXJR6nTeXUOua6RMEkBqbA0lsVzy5kqU=;
	b=HOo8CP+VRWX96pCM4y0NqrFRX3fYmfRfbu+Esw2XkPBnSZJMYxsgPHeTolaE1UES4PXwhv
	tJ9ZyGsIDUKZosDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6371113419;
	Thu, 22 Feb 2024 13:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 3wdXFlRK12XeUwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Feb 2024 13:21:24 +0000
Message-ID: <76661c31-1b89-4a6a-8dea-376e817de315@suse.de>
Date: Thu, 22 Feb 2024 14:21:23 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors related
 to rzg2l_du_vsp_*()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
References: <20240222112643.110326-1-biju.das.jz@bp.renesas.com>
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
In-Reply-To: <20240222112643.110326-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UN99uD87;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HOo8CP+V
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,canb.auug.org.au,gmail.com,ffwll.ch];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[renesas];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Score: -3.00
X-Rspamd-Queue-Id: D047421E84
X-Spam-Flag: NO

Hi

Am 22.02.24 um 12:26 schrieb Biju Das:
> CONFIG_DRM_RCAR_VSP is related to R-Car and not related to RZ/G2L
> specific. This caused the below build issue. Fix this errors by replacing
> CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1. While at it, use
> IS_ENABLED() macro.
>
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition of 'rzg2l_du_vsp_enable'
>     47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
>        |      ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
>                   from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc *)'
>     72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc) { };
>        |                    ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition of 'rzg2l_du_vsp_disable'
>     61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
>        |      ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc *)'
>     73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc) { };
>        |                    ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition of 'rzg2l_du_vsp_atomic_flush'
>     66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
>        |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct rzg2l_du_crtc *)'
>     74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc) { };
>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition of 'rzg2l_du_vsp_get_drm_plane'
>     76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
>        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane *(struct rzg2l_du_crtc *, unsigned int)'
>     75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
>        |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition of 'rzg2l_du_vsp_init'
>    302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>        |     ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *, struct device_node *, unsigned int)'
>     66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>        |                   ^~~~~~~~~~~~~~~~~
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20240222124610.383e1ce3@canb.auug.org.au/T/#u
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I'm going to add

Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")

as well before merging the patch.

Best regards
Thomas

> ---
> v1->v2:
>   * Dropped EXPORT symbol as both *_crtc.o and *_vsp.o are within the single module.
>   * Updated the commit description.
> ---
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> index 12d98f04bf89..322eb80dcbaf 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> @@ -54,7 +54,7 @@ to_rzg2l_vsp_plane_state(struct drm_plane_state *state)
>   	return container_of(state, struct rzg2l_du_vsp_plane_state, state);
>   }
>   
> -#ifdef CONFIG_DRM_RCAR_VSP
> +#if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
>   int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>   		      unsigned int crtcs);
>   void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


