Return-Path: <linux-renesas-soc+bounces-18233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40BAD83D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC8A3AB28D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 07:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9E525B2F2;
	Fri, 13 Jun 2025 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpnxcqgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kPjofHKQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpnxcqgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kPjofHKQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9EF281369
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798946; cv=none; b=RyeRjO5cNzmOnteZ86u5712MrKKpfH/VY5bdH0AFU2yUcRHk2GUoRwHBCKSETlnVhVpyo3b8/5scNkNa5PXk/gBwoACQy+dq2nCZxtBCtxORbgMRPh2d+eirwCD28dcKwVIi0yyQleobhgT67tLnOMMXe8FV7o98UivLEISAXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798946; c=relaxed/simple;
	bh=e3dLQ/YRXOTD4FzppCJsMoagmEwKwp+kqjL5L3nh8IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TACajo+sBYpeaZJTWbBoIjt+SeO1GTr3w8/hPCVKKqrxEFm/sJshAIF976lJqd4uInzJ9V8dNQf0Jyktq+/tY/fQ2HVc1z25nxRQt+ex55q+97BJx6HWbqnJg/tMr0DTNP4p9o97C/JE1mOUiP3Vx1sHKFke5aWW6ICthPuthGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpnxcqgj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kPjofHKQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpnxcqgj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kPjofHKQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4F20B2115E;
	Fri, 13 Jun 2025 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749798941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AFKIeJdzd7Bm1UfGUYdUXTMZwzn7kuZf09ynXcNd27k=;
	b=wpnxcqgjRop7dkbkBQ/X1iuElaw96F5zP50QsPn5I4PbCQYjlf8kTIsBu6JxfU6RPDJuDp
	RxQ4MhnWMcmky2ZNo4wk7bRNFuuNxkOpgFB9eXHAcKu2tTzWDaCYQ4M/VUWfplABYgNbFh
	sVh+N4mU2AnW9XJXV/M4hBmN1ndOy/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749798941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AFKIeJdzd7Bm1UfGUYdUXTMZwzn7kuZf09ynXcNd27k=;
	b=kPjofHKQaFEdsoc79AwOm7JvdSfaz141myzJctvWsea6Z/9xOjZvLdd1Jo7NEsyl0iHep4
	TeHnsN5rMrD7G5Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749798941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AFKIeJdzd7Bm1UfGUYdUXTMZwzn7kuZf09ynXcNd27k=;
	b=wpnxcqgjRop7dkbkBQ/X1iuElaw96F5zP50QsPn5I4PbCQYjlf8kTIsBu6JxfU6RPDJuDp
	RxQ4MhnWMcmky2ZNo4wk7bRNFuuNxkOpgFB9eXHAcKu2tTzWDaCYQ4M/VUWfplABYgNbFh
	sVh+N4mU2AnW9XJXV/M4hBmN1ndOy/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749798941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AFKIeJdzd7Bm1UfGUYdUXTMZwzn7kuZf09ynXcNd27k=;
	b=kPjofHKQaFEdsoc79AwOm7JvdSfaz141myzJctvWsea6Z/9xOjZvLdd1Jo7NEsyl0iHep4
	TeHnsN5rMrD7G5Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB0A513782;
	Fri, 13 Jun 2025 07:15:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TbJIMBzQS2iFFgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Jun 2025 07:15:40 +0000
Message-ID: <e2478a92-4e37-407c-8f2a-017d8f0e77ba@suse.de>
Date: Fri, 13 Jun 2025 09:15:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org
References: <20250311155120.442633-1-tzimmermann@suse.de>
 <20250311155120.442633-4-tzimmermann@suse.de>
 <d7e016fd-3d0e-4822-a404-a53ba11e5dc4@ideasonboard.com>
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
In-Reply-To: <d7e016fd-3d0e-4822-a404-a53ba11e5dc4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Hi

Am 12.06.25 um 10:43 schrieb Tomi Valkeinen:
> Hi,
>
> On 11/03/2025 17:47, Thomas Zimmermann wrote:
>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
>> buffer size. Align the pitch to a multiple of 8.
>>
>> Push the current calculation into the only direct caller imx. Imx's
>> hardware requires the framebuffer width to be aligned to 8. The
>> driver's current approach is actually incorrect, as it only guarantees
>> this implicitly and requires bpp to be a multiple of 8 already. A
>> later commit will fix this problem by aligning the scanline pitch
>> such that an aligned width still fits into each scanline's memory.
>>
>> A number of other drivers are build on top of gem-dma helpers and
>> implement their own dumb-buffer allocation. These drivers invoke
>> drm_gem_dma_dumb_create_internal(), which is not affected by this
>> commit.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_gem_dma_helper.c     | 7 +++++--
>>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 2 ++
>>   2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
>> index b7f033d4352a..49be9b033610 100644
>> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
>> @@ -20,6 +20,7 @@
>>   #include <drm/drm.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_drv.h>
>> +#include <drm/drm_dumb_buffers.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_vma_manager.h>
>>   
>> @@ -304,9 +305,11 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
>>   			    struct drm_mode_create_dumb *args)
>>   {
>>   	struct drm_gem_dma_object *dma_obj;
>> +	int ret;
>>   
>> -	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>> -	args->size = args->pitch * args->height;
>> +	ret = drm_mode_size_dumb(drm, args, SZ_8, 0);
>> +	if (ret)
>> +		return ret;
>>   
>>   	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
>>   						 &args->handle);
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> index ec5fd9a01f1e..e7025df7b978 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> @@ -145,6 +145,8 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
>>   	int ret;
>>   
>>   	args->width = ALIGN(width, 8);
>> +	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>> +	args->size = args->pitch * args->height;
>>   
>>   	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
>>   	if (ret)
> Won't the pitch and size just be overwritten by the
> drm_gem_dma_dumb_create() call?

Right, looks like it. Thanks for looking over this. The call to 
drm_gem_dma_dumb_create() needs to be changed 
drm_gem_dma_dumb_create_internal(). The latter doesn't modify the 
arguments besides some sanity checks. BTW patch 10 cleans up imx 
entirely. Best regards Thomas
>
>   Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


