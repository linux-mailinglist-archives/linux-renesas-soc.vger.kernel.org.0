Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D682915296A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2020 11:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgBEKuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Feb 2020 05:50:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54594 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727234AbgBEKuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Feb 2020 05:50:11 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83BB94F8;
        Wed,  5 Feb 2020 11:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580899808;
        bh=UTifZTLLpMTI0RjXCoRHBDNEtdBVGY9d8q0FCMF/KEs=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=jT6hyvWp23fjd1eR/G8A7L1pVRL+vHHp2MvwCrirctmTwaH9/cPyXoxTU6hwMcph0
         qTPTQb56E2qi4i6EEVyCyDYUOegdFJURmZRgHZjxe9ze+1KKnLpaxPwU3XGwt93Vgm
         1RYeL3HPFlWT1vCqon3XlkJFeWU2mFFb7yjmHDAo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cd432385-7470-80c7-31e1-164851c23e7b@ideasonboard.com>
Date:   Wed, 5 Feb 2020 10:50:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On 05/02/2020 09:32, Andy Shevchenko wrote:
> This file doesn't need everything provided by <linux/kernel.h>.
> All it needs are some types, which are provided by <linux/types.h>.
> 
> Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> not relying on implicit includes is indeed a good thing.

This explains things a bit better :-)

I'm sure the others will follow too, but here's my:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Update commit message (Geert, Laurent)
>  include/linux/platform_data/shmob_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> index fe815d7d9f58..08605fdb2226 100644
> --- a/include/linux/platform_data/shmob_drm.h
> +++ b/include/linux/platform_data/shmob_drm.h
> @@ -10,7 +10,7 @@
>  #ifndef __SHMOB_DRM_H__
>  #define __SHMOB_DRM_H__
>  
> -#include <linux/kernel.h>
> +#include <linux/types.h>
>  
>  #include <drm/drm_mode.h>
>  
> 

