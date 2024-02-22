Return-Path: <linux-renesas-soc+bounces-3103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9385F9D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FB72B226A3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 13:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DF61332AC;
	Thu, 22 Feb 2024 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="crVj/Hpq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HQSTeXnU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KIdqhEzq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1mNxq/vY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04FC50A98
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608654; cv=none; b=JuOgMlrXThEqVq+xK76o2XJhJtmYAb1RLlEmqamhKKdheRtJHTS6eA6WE8+/BLcGHSsp/HAXcjWgOX5S755P/Wq6xcUaI4MVqS9JUJt8po3uqAon0i+I1rzU6YpqCWxaEGXnOYeDVEWpEye/f7is3e32gLhljrz0ruZR/F2IUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608654; c=relaxed/simple;
	bh=i5zzNeQRIItVCjwKeFaeizQd7Tv3JDtTMdRTdlU27Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=on0arEdHnSEfuQ+OKrRKo7mBXVSBHw8dmGKY46zt/dbbCy+NddfzhMD8Oczx2RcUg+z54fc4Nr2LvbWeZC+EnadyfetKD6L5ishcUP8bq+qQPBOOl+bqnPbyrFJfQ1/j8LSIfvdRicndm7o6/gks68mq8z86zG8wyDspqmAxs9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=crVj/Hpq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HQSTeXnU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KIdqhEzq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1mNxq/vY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C389D21E84;
	Thu, 22 Feb 2024 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708608650; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fIGeDtvmcTBDSIU6CTjKNbmpFwktR5HDc/TX4AbDtyA=;
	b=crVj/Hpq6V0hxiqjRoSUTCv6cb9CqwVx3VM5I7IaXqvWIZ8ZQSg1oNLwR6pG/kDmIv+7jC
	5322xrBKoMaMUjty6yzRSqw34V9kwWSe+H0UDftfEMwfHJGPAQc4YZVmzRNWWA0PrGBMCD
	QkqR+TbQPAGW58HpBKvZPchToTd8qyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708608650;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fIGeDtvmcTBDSIU6CTjKNbmpFwktR5HDc/TX4AbDtyA=;
	b=HQSTeXnU72R2rxKi2FY7eVcn37gYbkrsoMm8nNik1ETsVfjV9rO6BGQpPUhd82GW50kxAz
	feuH6/gbJSMGCxBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708608649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fIGeDtvmcTBDSIU6CTjKNbmpFwktR5HDc/TX4AbDtyA=;
	b=KIdqhEzqG6En+hoGLDE+eAv/NZhA6Zmsap16oNKwHphS3JNmwYIH8Aw6b40vKD4O2MBryz
	zSYJ1YAxx2QFiBMBKAVqUHpB8V5ewKzL7YB0YC3UVAiPGwMIYRvYZ7VcRw5Drs8T1IV/im
	IeFBqXmgGEgd9ZqiKFkxAX/WSARFAXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708608649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fIGeDtvmcTBDSIU6CTjKNbmpFwktR5HDc/TX4AbDtyA=;
	b=1mNxq/vYetLFp/a6T1M8cRetXMluYy+JqpLZgtVn4YXhJSwj0eUq4MBo5eyVVIK+jZPw1M
	pPIUiZoQ5EZj14Cw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D70613A6B;
	Thu, 22 Feb 2024 13:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id /rdRGYlM12UiVgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Feb 2024 13:30:49 +0000
Message-ID: <ca8e0f79-16c8-4c94-9232-bfed1d5b87fa@suse.de>
Date: Thu, 22 Feb 2024 14:30:49 +0100
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>
References: <20240222112643.110326-1-biju.das.jz@bp.renesas.com>
 <76661c31-1b89-4a6a-8dea-376e817de315@suse.de>
 <TYVPR01MB112791662AF3FA77FF547CEE386562@TYVPR01MB11279.jpnprd01.prod.outlook.com>
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
In-Reply-To: <TYVPR01MB112791662AF3FA77FF547CEE386562@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.59 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[renesas];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 BAYES_HAM(-3.00)[100.00%];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[auug.org.au:email,suse.de:email];
	 FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,canb.auug.org.au,gmail.com,ffwll.ch];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.59

Hi

Am 22.02.24 um 14:25 schrieb Biju Das:
> Hi Thomas Zimmermann,
>
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Thursday, February 22, 2024 1:21 PM
>> Subject: Re: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors
>> related to rzg2l_du_vsp_*()
>>
>> Hi
>>
>> Am 22.02.24 um 12:26 schrieb Biju Das:
>>> CONFIG_DRM_RCAR_VSP is related to R-Car and not related to RZ/G2L
>>> specific. This caused the below build issue. Fix this errors by
>>> replacing CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1. While at it,
>>> use
>>> IS_ENABLED() macro.
>>>
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition
>> of 'rzg2l_du_vsp_enable'
>>>      47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
>>>         |      ^~~~~~~~~~~~~~~~~~~
>>> In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
>>>                    from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous
>> definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc
>> *)'
>>>      72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc
>> *crtc) { };
>>>         |                    ^~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition
>> of 'rzg2l_du_vsp_disable'
>>>      61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
>>>         |      ^~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous
>> definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc
>> *)'
>>>      73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc
>> *crtc) { };
>>>         |                    ^~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition
>> of 'rzg2l_du_vsp_atomic_flush'
>>>      66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
>>>         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous
>> definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct
>> rzg2l_du_crtc *)'
>>>      74 | static inline void rzg2l_du_vsp_atomic_flush(struct
>> rzg2l_du_crtc *crtc) { };
>>>         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition
>> of 'rzg2l_du_vsp_get_drm_plane'
>>>      76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct
>> rzg2l_du_crtc *crtc,
>>>         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous
>> definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane
>> *(struct rzg2l_du_crtc *, unsigned int)'
>>>      75 | static inline struct drm_plane
>> *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
>>>         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition
>> of 'rzg2l_du_vsp_init'
>>>     302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct
>> device_node *np,
>>>         |     ^~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous
>> definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *,
>> struct device_node *, unsigned int)'
>>>      66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp,
>> struct device_node *np,
>>>         |                   ^~~~~~~~~~~~~~~~~
>>>
>>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Closes:
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> I'm going to add
>>
>> Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
>>
>> as well before merging the patch.
> OK to me. I thought since it is landing on next, fixes tag is not
> required. Fixes tag is required only when the patch is in a -rc series.
>
> Maybe I am wrong here??

Well, it's a fix to an existing commit. I think the rule of thumb is 
that likely anyone picking up the original commit also wants this patch. 
Adding the Fixes tag doesn't hurt at least.

Best regards
Thomas

>
> Cheers,
> Biju
>
>> Best regards
>> Thomas
>>
>>> ---
>>> v1->v2:
>>>    * Dropped EXPORT symbol as both *_crtc.o and *_vsp.o are within the
>> single module.
>>>    * Updated the commit description.
>>> ---
>>>    drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>>> b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>>> index 12d98f04bf89..322eb80dcbaf 100644
>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>>> @@ -54,7 +54,7 @@ to_rzg2l_vsp_plane_state(struct drm_plane_state
>> *state)
>>>    	return container_of(state, struct rzg2l_du_vsp_plane_state, state);
>>>    }
>>>
>>> -#ifdef CONFIG_DRM_RCAR_VSP
>>> +#if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
>>>    int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node
>> *np,
>>>    		      unsigned int crtcs);
>>>    void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB 36809
>> (AG Nuernberg)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


