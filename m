Return-Path: <linux-renesas-soc+bounces-13390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CCCA3D5F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 11:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304CE3B9DAA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 10:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391D91F03CA;
	Thu, 20 Feb 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e5eq5uP0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ajjYyaE/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U56jNFDp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y6Z3Xnwq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5E1EBFF9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045913; cv=none; b=Y4jMNOjuf0ZvbFSnI34fcj+yppVAwUe/q5W68CSqKn6VMxc83CeNJU+PA2OdZ0MVlDeqKE+xZe8iuCCwrne5WMkrrVdcx32KQX8KKCtUCgz+7RSi8Ypv9/+4rck1npd4bg80jEju3A8aqXzw3y76HnLRww8MqmLGFkU6mJvgju0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045913; c=relaxed/simple;
	bh=RYikLyRQEOYYe1C6kD84yowJfTxQZxtiO0IurvQr8ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCP3WR+ceKlJBkZCUjr5c+TXBpGIwnts0Xo0zbDR3ce+A0ij9xxMo/ZQikmg7gvDIZMMjdqj5B/mYXFrVvewed8aaHSpSvf5ZPV4++QSmEYON+7YPsbrpO5wrIbpNMIHUs1CGAXH0qf5HWguTE5zoXIOlLmUC+nJLbCKvbnFI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e5eq5uP0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ajjYyaE/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U56jNFDp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y6Z3Xnwq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C61F1F387;
	Thu, 20 Feb 2025 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740045909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=65zE77FFO0s0D2ildlq3h1u4o6X5a++vxcNcTRVNHEs=;
	b=e5eq5uP0lSiK917nOXNtjo5B2Il1opJ5S/TBMSPN4GHpYevG6+GNEH5dc8U5aFcpfpK5Cw
	9dyUqjpExeG/vOFUhwpAb2s+6fZYEFh8FlGNz8QvfTSNrsWn8qj0c2mzG9WiFdt5gULRCW
	TGicx3LEipQvDm3ioB7HkQ9PlaM5NCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740045909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=65zE77FFO0s0D2ildlq3h1u4o6X5a++vxcNcTRVNHEs=;
	b=ajjYyaE/xQ9d1+3WLRm22ouGPNw8XS1zONxWMbXADKRkZi7IsWu7kBhUGdbRBvbDAACQLH
	ia8HYBlw60OiJ8Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U56jNFDp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y6Z3Xnwq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740045908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=65zE77FFO0s0D2ildlq3h1u4o6X5a++vxcNcTRVNHEs=;
	b=U56jNFDpLXJPaOrLQJfvYY3y3udSaNl+sAmV78MflSnzJ2pXFkRW0fkt6nNPommYWeJs5b
	EObtbJwATSyG1yNBNUY8Q7ziNK7zMoXp/lIACti91Fo4GF8dJ6/bW/cfl+z2xiSc6Q8kLz
	E3iDjmZLFv7MoYUNUKKnoGOm4d4Ko3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740045908;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=65zE77FFO0s0D2ildlq3h1u4o6X5a++vxcNcTRVNHEs=;
	b=Y6Z3XnwqK8EgqLKD0rh0pt2PA9+fiVOipGfoO3odSV+zAHeoAfRNIAoiwb4DyQ4mJsF/Cn
	VtFt6JqsYZumY3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2B7A13301;
	Thu, 20 Feb 2025 10:05:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jF2hNVP+tmf1AQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 20 Feb 2025 10:05:07 +0000
Message-ID: <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
Date: Thu, 20 Feb 2025 11:05:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com>
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
In-Reply-To: <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6C61F1F387
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[20];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Hi

Am 20.02.25 um 10:18 schrieb Tomi Valkeinen:
[...]
>> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
>> + * legacy user space. Please don't use them in new code. Other modes
>> + * are not support.
>> + *
>> + * Do not attempt to allocate anything but linear framebuffer memory
>> + * with single-plane RGB data. Allocation of other framebuffer
>> + * layouts requires dedicated ioctls in the respective DRM driver.
>
> According to this, every driver that supports, say, NV12, should 
> implement their own custom ioctl to do the exact same thing? And, of 
> course, every userspace app that uses, say, NV12, should then add code 
> for all these platforms to call the custom ioctls?

Yes, that's exactly the current status.

There has been discussion about a new dumb-create ioctl that takes a DRM 
format as parameter. I'm all for it, but it's out of the scope for this 
series.

>
> As libdrm's modetest currently supports YUV formats with dumb buffers, 
> should we remove that code, as it's not correct and I'm sure people 
> use libdrm code as a reference?

Of course not.

>
> Well, I'm not serious above, but I think all my points from the 
> earlier version are still valid. I don't like this. It changes the 
> parameters of the ioctl (bpp used to be bits-per-pixel, not it's 
> "color mode"), and the behavior of the ioctl, behavior that we've had 
> for a very long time, and we have no idea how many users there are 
> that will break (could be none, of course). And the documentation 
> changes make the current behavior and uses wrong or legacy.

Before I go into details about this statement, what use case exactly are 
you referring to when you say that behavior changes?

Best regards
Thomas

>
> Clearly we need something new and better for the buffer allocation, 
> but for the time being, I'd be more comfortable just keep the current 
> behavior, at least for all the drivers I use or maintain: omapdrm, 
> tidss, renesas, xlnx, tilcdc.
>
>  Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


