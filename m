Return-Path: <linux-renesas-soc+bounces-6380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BD90C38E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 08:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8F2B1F20CFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 06:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8021F4206E;
	Tue, 18 Jun 2024 06:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ijMMMZsx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jXagmq93";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ijMMMZsx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jXagmq93"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20A3F9D5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2024 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692201; cv=none; b=LhxC24RnT6ZTdPrm/K90UXDcp7Epruw7hxVPk1ORRk2HMwShbIYtlzOEO931FISkDoMbNhgV1+k3fCvlaCGunIzqrQXCi/yc1/16lP2qYBYJdVeNTtGfL14AyaZFkTFjhBlFnJjJUsjVYFAWPS9LwOirE5Hb6G98PdoDmiXbq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692201; c=relaxed/simple;
	bh=5lDLemxyUApaed7ww0TYq+V7xSd4wCGDSBAewVYXigc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhcflCptoBr/UwHFQqEsMx4LIxSAbGhOJthfyUCsZy3uhKOy2X+2xtKUnNic5s4eZdyXQ7h2elGpjrGYIdutOKhKp1YUBJqNaeBInfPnynklN97kvTvp7Kv3CSmeGbbtqtBcjgi20dsJvr+xYPWbG3kaiQwzZ/bvIvuetY9FTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ijMMMZsx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jXagmq93; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ijMMMZsx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jXagmq93; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 65DE622636;
	Tue, 18 Jun 2024 06:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718692197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VhxyLzMp0xY80/C6VM7Tfa3q/ANla3OH3yenX41cm14=;
	b=ijMMMZsxN4PRutNPD7sAbxYkh6qb7Q7zenmWRMGfiWYqVtbU7w55aZjSWosIStxxNaopFO
	wM0czZ61fkh2pf2oFJWOzskfdi63BuJfCKbrA+JjmNZ9/v1qBWCqFvT6HIgeWPEe8JMfpk
	m8150tk8Dct7dAOsSrIy86KIQl6x0js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718692197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VhxyLzMp0xY80/C6VM7Tfa3q/ANla3OH3yenX41cm14=;
	b=jXagmq93HfvcixrLyf2+z/GAtf/s7qAGMwbcvFYWmB7tMjRwUdC8N+Xi/4Hmpzb+nDWhra
	gxHZjNuOEAN0X9Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718692197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VhxyLzMp0xY80/C6VM7Tfa3q/ANla3OH3yenX41cm14=;
	b=ijMMMZsxN4PRutNPD7sAbxYkh6qb7Q7zenmWRMGfiWYqVtbU7w55aZjSWosIStxxNaopFO
	wM0czZ61fkh2pf2oFJWOzskfdi63BuJfCKbrA+JjmNZ9/v1qBWCqFvT6HIgeWPEe8JMfpk
	m8150tk8Dct7dAOsSrIy86KIQl6x0js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718692197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VhxyLzMp0xY80/C6VM7Tfa3q/ANla3OH3yenX41cm14=;
	b=jXagmq93HfvcixrLyf2+z/GAtf/s7qAGMwbcvFYWmB7tMjRwUdC8N+Xi/4Hmpzb+nDWhra
	gxHZjNuOEAN0X9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 319791369F;
	Tue, 18 Jun 2024 06:29:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bYJpCmUpcWZuXwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 18 Jun 2024 06:29:57 +0000
Message-ID: <22f4df70-92c8-4ead-bf56-65ccffe8953f@suse.de>
Date: Tue, 18 Jun 2024 08:29:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: Only set smem_start is enable per module
 option
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: peng.fan@oss.nxp.com, daniel@ffwll.ch, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20240617152843.11886-1-tzimmermann@suse.de>
 <2643bb67-e3a6-8ca7-37d1-e98080952589@linux-m68k.org>
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
In-Reply-To: <2643bb67-e3a6-8ca7-37d1-e98080952589@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.978];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

Hi

Am 17.06.24 um 19:42 schrieb Geert Uytterhoeven:
>     Hi Thomas,
>
> On Mon, 17 Jun 2024, Thomas Zimmermann wrote:
>> Only export struct fb_info.fix.smem_start if that is required by the
>> user and the memory does not come from vmalloc().
>>
>> Setting struct fb_info.fix.smem_start breaks systems where DMA
>> memory is backed by vmalloc address space. An example error is
>> shown below.
>>
>> [    3.536043] ------------[ cut here ]------------
>> [    3.540716] virt_to_phys used for non-linear address: 
>> 000000007fc4f540 (0xffff800086001000)
>> [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 
>> __virt_to_phys+0x68/0x98
>> [    3.565455] Modules linked in:
>> [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 
>> 6.6.23-06226-g4986cc3e1b75-dirty #250
>> [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
>> [    3.582452] Workqueue: events_unbound deferred_probe_work_func
>> [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
>> BTYPE=--)
>> [    3.595233] pc : __virt_to_phys+0x68/0x98
>> [    3.599246] lr : __virt_to_phys+0x68/0x98
>> [    3.603276] sp : ffff800083603990
>> [    3.677939] Call trace:
>> [    3.680393]  __virt_to_phys+0x68/0x98
>> [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
>> [    3.689214] __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
>> [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
>> [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
>> [    3.705161]  drm_client_register+0x60/0xb0
>> [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
>>
>> Additionally, DMA memory is assumed to by contiguous in physical
>> address space, which is not guaranteed by vmalloc().
>>
>> Resolve this by checking the module flag drm_leak_fbdev_smem when
>> DRM allocated the instance of struct fb_info. Fbdev-dma then only
>> sets smem_start only if required (via FBINFO_HIDE_SMEM_START). Also
>> guarantee that the framebuffer is not located in vmalloc address
>> space.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: Peng Fan (OSS) <peng.fan@oss.nxp.com>
>> Closes: 
>> https://lore.kernel.org/dri-devel/20240604080328.4024838-1-peng.fan@oss.nxp.com/
>> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for 
>> GEM DMA helpers")
>
> Thanks, this fixes the issue I was seeing on R-Car Gen3/Gen4 with 
> rcar-du.
>
> No regressions on R-Car Gen2 (rcar-du) and R-Mobile A1 (shmobile)
> which didn't shown the warning in the first place.

Right, your bug report overlapped with the other one. I'll add your 
report to the patch tags.

>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks a lot.

Best regards
Thomas

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


