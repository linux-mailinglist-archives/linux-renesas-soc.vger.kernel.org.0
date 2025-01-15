Return-Path: <linux-renesas-soc+bounces-12161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B5A122BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 12:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6AF016695A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 11:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713092419E3;
	Wed, 15 Jan 2025 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gue6OANA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pBIzUrsO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gue6OANA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pBIzUrsO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649992416B0;
	Wed, 15 Jan 2025 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941030; cv=none; b=dbA3JKdUzgRMAaYaVtBfH+WNA2iUNu8ueRJa6Xe/9DorJlbWAfyxE8aWiLGRZE7A+SZo0fC5PfOIXCkXIoSsL56qSjVyHcUTPSw7dwoq7Mdyd8DMLENB4if3/bVzzs/etwoCUMhHZNF+WQz9j3MjV1R9Z5kf4N7LLqOAL8Cxofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941030; c=relaxed/simple;
	bh=Mr3l96Klovw3KgVUudXbHuAd/3dqDss2F/VOUNWfA/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvYIm/McSXysaA1zkkaSZE9Bca51NFY9R//eA8SdDbFT4YAOj6+kfT5Ss56853cAZzpUnkgCi0d33BjftYxeiJrJ4h0kqZIsWHHU4Eoigppcmx7hYJ75t4EYkzA3vZf5QwgPk5hQ2AiV9EM7ElQKFWN2cf1/rW9a1FHRg5YRVdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gue6OANA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pBIzUrsO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gue6OANA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pBIzUrsO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5F4BA2128E;
	Wed, 15 Jan 2025 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736941026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=41xWq7JaLoV6WimVJ2B8CLfq711kNJtLM2yFKO4NnDE=;
	b=gue6OANAY5sQA5om7qd2aiBlXV4Er7BqteagVRDSWhaTKaDzwiKecLQ5J6ruJo1P1BUJte
	C6ziHtnVsFja8iX2g6jfIuTmYxNKhidEfMRQnEO+DQx5PPSyNWjtFfEgbufND/2GjuAngC
	xzbpdVr3u1o3wOw7USgSD8ebeUbf0Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736941026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=41xWq7JaLoV6WimVJ2B8CLfq711kNJtLM2yFKO4NnDE=;
	b=pBIzUrsOdWDvVqFMQ4+GGfQIAfVqufpdFuB8NrwD1Dec489JuoXPDm0qkn0XUzaFOp5Olp
	5dUOE9gHR+gf/OCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gue6OANA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pBIzUrsO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736941026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=41xWq7JaLoV6WimVJ2B8CLfq711kNJtLM2yFKO4NnDE=;
	b=gue6OANAY5sQA5om7qd2aiBlXV4Er7BqteagVRDSWhaTKaDzwiKecLQ5J6ruJo1P1BUJte
	C6ziHtnVsFja8iX2g6jfIuTmYxNKhidEfMRQnEO+DQx5PPSyNWjtFfEgbufND/2GjuAngC
	xzbpdVr3u1o3wOw7USgSD8ebeUbf0Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736941026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=41xWq7JaLoV6WimVJ2B8CLfq711kNJtLM2yFKO4NnDE=;
	b=pBIzUrsOdWDvVqFMQ4+GGfQIAfVqufpdFuB8NrwD1Dec489JuoXPDm0qkn0XUzaFOp5Olp
	5dUOE9gHR+gf/OCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 224B613A6F;
	Wed, 15 Jan 2025 11:37:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZKHjBuGdh2fsPAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 15 Jan 2025 11:37:05 +0000
Message-ID: <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
Date: Wed, 15 Jan 2025 12:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
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
In-Reply-To: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F4BA2128E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,ideasonboard.com,163.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Hi


Am 15.01.25 um 11:58 schrieb Tomi Valkeinen:
[...]
>> These are all good points. Did you read my discussion with Andy on 
>> patch 2? I think it resolves all the points you have. The current 
>> CREATE_DUMB 
>
> I had missed the discussion, and, indeed, the patch you attached fixes 
> the problem on Xilinx.

Great. Thanks for testing.

>
>> ioctl is unsuited for anything but the simple RGB formats. The bpp 
>
> It's a bit difficult to use, but is it really unsuited? bitsperpixel, 
> width and height do give an exact pitch and size, do they not? It does 
> require the userspace to handle the subsampling and planes, though, so 
> far from perfect.

The bpp value sets the number of bits per pixel; except for bpp==15 
(XRGB1555), where it sets the color depth. OR bpp is the color depth; 
except for bpp==32 (XRGB8888), where it is the number of bits per pixel. 
It's therefore best to interpret it like a color-mode enum.

>
> So, I'm all for a new ioctl, but I don't right away see why the 
> current ioctl couldn't be used. Which makes me wonder about the 
> drm_warn() in your patch, and the "userspace throws in arbitrary 
> values for bpp and relies on the kernel to figure it out". Maybe I'm 
> missing something here.

I was unsure about the drm_warn() as well. It's not really wrong to have 
odd bpp values, but handing in an unknown bpp value might point to a 
user-space error. At least there should be a drm_dbg().

>
>> parameter is not very precise. The solution would be a new ioctl call 
>> that receives the DRM format and returns a buffer for each individual 
>> plane.
>
> Yes, I think that makes sense. That's a long road, though =). So my 
> question is, is CREATE_DUMB really unsuitable for other than simple 
> RGB formats, or can it be suitable if we just define how the userspace 
> should use it for multiplanar, subsampled formats?

That would duplicate format and hardware information in user-space. Some 
hardware might have odd per-plane limitations that only the driver knows 
about. For example, there's another discussion on dri-devel about 
pitch-alignment requirements of DRM_FORMAT_MOD_LINEAR on various 
hardware. That affects dumb buffers as well. I don't think that there's 
an immediate need for a CREATE_DUMB2, but it seems worth to keep in mind.

Best regards
Thomas

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


