Return-Path: <linux-renesas-soc+bounces-343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5577FB99F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 12:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D565B21C89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7124F889;
	Tue, 28 Nov 2023 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ejwq/Nb1"
X-Original-To: linux-renesas-soc@vger.kernel.org
X-Greylist: delayed 640 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Nov 2023 03:47:58 PST
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bb])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28544D59
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 03:47:58 -0800 (PST)
Message-ID: <ee38d09e-52f2-4b32-b3bb-95b3c93a19e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701172076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEP0y6b8YPmo3TxW7nBtwEPxFe/V/Vxl7mo9MWFelXo=;
	b=Ejwq/Nb1at/Q5qXPoigj1GLhEKkL0bsy7BytA11hnyUyV8hNzBHFXGn4ApW57XR1tu+VI9
	hhS0YN8B7+usiNrEJdMbA/WD4UvHg8iz85mAtIb+o0hirliNFiSt5JQ42yhwhQjUYCfwG8
	aQgEjTOXQ5kwduFvdQ5ONDjE1twdIA8=
Date: Tue, 28 Nov 2023 19:47:48 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [7/8] drm/simpledrm: Do not include <drm/drm_plane_helper.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org
References: <20231128104723.20622-8-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128104723.20622-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 2023/11/28 18:45, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
>   drivers/gpu/drm/tiny/simpledrm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 34bbbd7b53dd9..7ce1c46176750 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -25,7 +25,6 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_modeset_helper_vtables.h>
> -#include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   
>   #define DRIVER_NAME	"simpledrm"

