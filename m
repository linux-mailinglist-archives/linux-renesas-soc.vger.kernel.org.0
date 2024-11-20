Return-Path: <linux-renesas-soc+bounces-10643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED889D4152
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 18:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0AEFB25455
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 16:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A767E153814;
	Wed, 20 Nov 2024 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="a3LcGEyY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DED14A098;
	Wed, 20 Nov 2024 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121670; cv=none; b=B4z4mzntyPcNCqHNJNUrv1cnrV9DubEsxEf8m1kEDWWIK6ZMu10siRfx5oExJDmMkFdnlVhwhxPlqGJ2r4Aqfxa0tW21OVOZ50Qr+TCXqSPI6C8uu00jiRh/VCPzmeeQWj0ySdXFtkwwbd9TJp15kRXQ0XHgFucF9uSTr5C0opY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121670; c=relaxed/simple;
	bh=bthVctrNJCihdLyj4g8uRWHG5dJgIKUgoZvmq4GSKdQ=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=LWCVldn0U7CNCYs5G3vHVpGhFxq5qiBxUZic43PBjK0CFFXmOkNA1zpf5j8hp8HY0PANN65KFHEWlL453la/hAFpKbArfViMMA31erxCWGmeL24Asdgn+M1jXX7wf85Iyotljmt/vi2oG0d3bXDOaDNAIw89Lq0Jx9VJTdccEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=a3LcGEyY; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=AV7uFaaC4aI28aoKwdlmsUCmZVGlU7oO6K2cV0FF+zU=; b=a3LcGEyYQBiJVlcOXuBAooSEUI
	myv9cdUzqu7udEm5blR9p+8uz7cITWdaiRhLBdxizryl+VzHcjJWa1ipaUwIkYWwlNxE5jSKsj0jf
	+T6UfMRTnFHlRv+LKrEQsEG+/AnIHyRMBwYIfYCW1Y61e9noMYMArpeftU02wtu3RylY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:46480 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1tDn4h-00080k-4M; Wed, 20 Nov 2024 10:57:03 -0500
Date: Wed, 20 Nov 2024 10:57:02 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Message-Id: <20241120105702.3c6ccf6901d2251d067f2f6c@hugovil.com>
In-Reply-To: <20241120150328.4131525-1-chris.brandt@renesas.com>
References: <20241120150328.4131525-1-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.3 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] drm: renesas: rz-du: Increase supported resolutions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi,

On Wed, 20 Nov 2024 10:03:28 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> The supported resolutions were misrepresented in earlier versions of
> hardware manuals.
> 
> Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Tested on a custom RZ/G2LC board with two different display panels
of 600x1600 and 440x1920 resolutions in portrait mode.

Tested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index b99217b4e05d..90c6269ccd29 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -311,11 +311,11 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
>  	dev->mode_config.helper_private = &rzg2l_du_mode_config_helper;
>  
>  	/*
> -	 * The RZ DU uses the VSP1 for memory access, and is limited
> -	 * to frame sizes of 1920x1080.
> +	 * The RZ DU was designed to support a frame size of 1920x1200 (landscape)
> +	 * or 1200x1920 (portrait).
>  	 */
>  	dev->mode_config.max_width = 1920;
> -	dev->mode_config.max_height = 1080;
> +	dev->mode_config.max_height = 1920;
>  
>  	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
>  
> -- 
> 2.34.1
> 


-- 
Hugo Villeneuve

