Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94506E5AB3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 09:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbjDRHp7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 03:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjDRHp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 03:45:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388364C1C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 00:45:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC6D7802;
        Tue, 18 Apr 2023 09:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681803948;
        bh=WXMqNLcsMzBdrCjOVU5w+1j2mj02wBkgJYuHzWk/1D4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fzNEKPtbSmPORakCx1oG+/uQWTelnSYg29fmE1KU+0dGA+AXDDnieD3kn+f3xLFJf
         MSoilFG1a3qC6p9dvTB2bvYoCmSh1Bx1g+4FlC0ArX7nvJyUfb4yPy62IYl4q7of7L
         rMljMSO+dEJBgDY6Joa3aPlOiY9/6rQyoAqRqUzM=
Date:   Tue, 18 Apr 2023 10:46:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] drm: shmobile: Use %p4cc to print fourcc codes
Message-ID: <20230418074605.GE4703@pendragon.ideasonboard.com>
References: <cover.1681734821.git.geert+renesas@glider.be>
 <71cbb983e0d6b153f5c4e0664b795421b34b10fb.1681734821.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71cbb983e0d6b153f5c4e0664b795421b34b10fb.1681734821.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Mon, Apr 17, 2023 at 03:40:21PM +0200, Geert Uytterhoeven wrote:
> Replace the printing of hexadecimal fourcc format codes by
> pretty-printed format names, using the "%p4cc" format specifier.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2:
>   - Add Reviewed-by.
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 4 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> index d354ab3077cecf94..713a7612244c647a 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -355,8 +355,8 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	format = shmob_drm_format_info(crtc->primary->fb->format->format);
>  	if (format == NULL) {
> -		dev_dbg(sdev->dev, "mode_set: unsupported format %08x\n",
> -			crtc->primary->fb->format->format);
> +		dev_dbg(sdev->dev, "mode_set: unsupported format %p4cc\n",
> +			&crtc->primary->fb->format->format);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index 60a2c8d8a0d947d2..3c5fe3bc183c7c13 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -96,8 +96,8 @@ shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  
>  	format = shmob_drm_format_info(mode_cmd->pixel_format);
>  	if (format == NULL) {
> -		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
> -			mode_cmd->pixel_format);
> +		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
> +			&mode_cmd->pixel_format);
>  		return ERR_PTR(-EINVAL);
>  	}
>  

-- 
Regards,

Laurent Pinchart
