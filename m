Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64D61536A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2020 18:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgBERdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Feb 2020 12:33:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58092 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgBERdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Feb 2020 12:33:39 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5D84F8;
        Wed,  5 Feb 2020 18:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580924017;
        bh=3rppcfl802crYXV1mq6To15oEXeQJ2Eo2DfgnPf0fxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rAYlUf5zqywJCno3IDvWoX0GxB10MYGQQsR2ZfVibQKKSbiAu0rcwCgeDo+FvtRP5
         TpvAiz0X+S6OzwGKVwpHpD6a0RTTsFq+v567Rjlhuyem2HETsAlhIXBuS4wBvks0oY
         X+LDaZ1rkJqWGmmWgIZKAqHxT1r2aLwqTOA31hKg=
Date:   Wed, 5 Feb 2020 19:33:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
Message-ID: <20200205173322.GB4722@pendragon.ideasonboard.com>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

Thank you for the patch.

On Wed, Feb 05, 2020 at 11:32:26AM +0200, Andy Shevchenko wrote:
> This file doesn't need everything provided by <linux/kernel.h>.
> All it needs are some types, which are provided by <linux/types.h>.
> 
> Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> not relying on implicit includes is indeed a good thing.

Do we even need linux/types.h ? Apart from struct drm_mode_modeinfo,
shmob_drm.h seems to only contain plain C without using any externally
defined types.

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

-- 
Regards,

Laurent Pinchart
