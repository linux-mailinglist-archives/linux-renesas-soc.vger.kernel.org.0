Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97D31F1146
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 04:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgFHCCc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 22:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgFHCCc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 22:02:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFF8C08C5C3;
        Sun,  7 Jun 2020 19:02:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C23D50E;
        Mon,  8 Jun 2020 04:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591581749;
        bh=i1AmAGyM1Zj7pRO9Jd3l5vQMRbYrocwi6kzrZnDqAuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WirakFtdzE9ijjcmNr56wAKu+9v5XXpAX6UQl84sa6ca884vfIBDMyIUbrEvwKLxv
         ayFeIaQI5/ipbHhNHxtjZc4rFrca5XJzxn/cIAC5KYcNQDSzUd/QT3Zvo1mWZ6CE+u
         JWX7OkvNg2JXfVcVmP1Mi5nR51kQNp1tLH9ogrLk=
Date:   Mon, 8 Jun 2020 05:02:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Qian Cai <cai@lca.pw>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Message-ID: <20200608020207.GL22208@pendragon.ideasonboard.com>
References: <20200608014818.2814-1-cai@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200608014818.2814-1-cai@lca.pw>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Qian,

Thank you for the patch.

On Sun, Jun 07, 2020 at 09:48:18PM -0400, Qian Cai wrote:
> There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
> the generated .config a bit ugly.
> 
>  # ARM devices
>  #
>  # end of ARM devices
> 
>  CONFIG_DRM_RCAR_WRITEBACK=y
> 
>  #
>  # Frame buffer Devices
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 0919f1f159a4..d80696455d3e 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -48,3 +48,4 @@ config DRM_RCAR_VSP
>  config DRM_RCAR_WRITEBACK
>  	bool
>  	default y if ARM64
> +	depends on DRM

How about depending on DRM_RCAR_DU instead, as DRM_RCAR_WRITEBACK is
used to select compilation of rcar_du_writeback.c that is part of the
rcar-du driver ?

-- 
Regards,

Laurent Pinchart
