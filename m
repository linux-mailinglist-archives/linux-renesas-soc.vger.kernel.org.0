Return-Path: <linux-renesas-soc+bounces-342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F8A7FB98E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 12:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C721C20AA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD5246530;
	Tue, 28 Nov 2023 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uVNmItZz"
X-Original-To: linux-renesas-soc@vger.kernel.org
X-Greylist: delayed 371 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Nov 2023 03:43:31 PST
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC98418F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 03:43:31 -0800 (PST)
Message-ID: <6e4600d4-702b-4093-ab36-38a3b4258a58@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701171436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0I+W9bsb+kBg+427S8NtEnibAk7cRKVUP+7Q4R1dJ8M=;
	b=uVNmItZzZAlYPc6oY5zlKm6bvGWmpXicsQrXklpzYc6asRAbT2v3EGCskvzdPnJScGAL+l
	B7bIzLMFAy6zNVIlfC2magkq4P7abKHxr0OkBUZ+msULdzk0gpCDpydN58pBxi7ZwwGR1n
	CtsKS2BEdVAhHCw6z3oDtZBVs8a5lSc=
Date: Tue, 28 Nov 2023 19:37:09 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [3/8] drm/loongson: Do not include <drm/drm_plane_helper.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org
References: <20231128104723.20622-4-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128104723.20622-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

Thank you for the patch.


On 2023/11/28 18:45, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
>   drivers/gpu/drm/loongson/lsdc_plane.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
> index 0d50946332229..d227a2c1dcf16 100644
> --- a/drivers/gpu/drm/loongson/lsdc_plane.c
> +++ b/drivers/gpu/drm/loongson/lsdc_plane.c
> @@ -9,7 +9,6 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_atomic_helper.h>
> -#include <drm/drm_plane_helper.h>
>   
>   #include "lsdc_drv.h"
>   #include "lsdc_regs.h"

