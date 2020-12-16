Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9642DB872
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 02:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725275AbgLPBad (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 20:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPBac (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 20:30:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78261C061793
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Dec 2020 17:29:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B73232CF;
        Wed, 16 Dec 2020 02:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608082190;
        bh=z10NWkTW/0aIiMBMr80OgV8VP7UqJi9bCH1KxuUBtJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rV1q2KcsYUIswmwBG5Hi/j0T5pq676Ct7V+/byatxVJltHQib1o0BgoHxW2J6u10E
         phouVUgICZ5wIx84jEp5V9pt1USQyiQ0YA5g9ijXC+nA1VDiFjal7xcG7eHvs0NjmI
         hcy2Iu/+Lp8g9ewFaOn+yxlVnXiwc9fWD98XXoTA=
Date:   Wed, 16 Dec 2020 03:29:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 14/65] drm/rcar-du: Annotate dma-fence critical section
 in commit path
Message-ID: <X9ljB3sRJHXf7ZZJ@pendragon.ideasonboard.com>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-14-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201023122216.2373294-14-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Fri, Oct 23, 2020 at 02:21:25PM +0200, Daniel Vetter wrote:
> Ends right after drm_atomic_helper_commit_hw_done(), absolutely
> nothing fancy going on here.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org

I'm lacking context here, there's only one instance of a call to
dma_fence_begin_signalling() in the subsystem, and no cover letter in
the series to explain what's going on. Some information would help
reviewing the patch :-)

Also, could you mention in the cover letter for the next version if you
will merge the whole series, or expect individual maintainers to pick up
the relevant patches ?

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 72dda446355f..8d91140151cc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -441,6 +441,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_crtc *crtc;
>  	unsigned int i;
> +	bool fence_cookie = dma_fence_begin_signalling();
>  
>  	/*
>  	 * Store RGB routing to DPAD0 and DPAD1, the hardware will be configured
> @@ -467,6 +468,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
>  	drm_atomic_helper_commit_hw_done(old_state);
> +	dma_fence_end_signalling(fence_cookie);
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>  
>  	drm_atomic_helper_cleanup_planes(dev, old_state);

-- 
Regards,

Laurent Pinchart
