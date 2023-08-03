Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0976F644
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Aug 2023 01:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbjHCXte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 19:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjHCXte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 19:49:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820011718
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Aug 2023 16:49:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 913AB600;
        Fri,  4 Aug 2023 01:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691106507;
        bh=+935kVH/FK/lofzSBEYDuqpBcdQ7yGNUnGss5L1DfQs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dBs9jcRLyTV8ok1g4FPuF2O8Ip+M1Xx53A8rvvB0KaE7jC18e3tFzYxF5Wu4yzOOs
         Ba0p4LgDSYN9SHD7SvzwJdByk5DWUQEwPQ0B267a5QEY2nw38encLLntpS4sseRjrv
         s8bNgm/mWsI73Ob3IVOzax0wuIKybwzDDt3IxmaE=
Date:   Fri, 4 Aug 2023 02:49:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Damian Hobson-Garcia <dhobsong@igel.co.jp>
Cc:     kieran.bingham+renesas@ideasonboard.com, taki@igel.co.jp,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] drm:rcar-du: Enable ABGR and XBGR formats
Message-ID: <20230803234938.GK9722@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230728200714.2084223-2-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230728200714.2084223-2-dhobsong@igel.co.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Damian,

Thank you for the patch.

On Fri, Jul 28, 2023 at 04:07:14PM -0400, Damian Hobson-Garcia wrote:
> These formats are used by Android so having them available
> allows the DU to be used for composition operations.
> 
> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>

This looks good to me. I'm not sure why I haven't included them
initially.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 96241c03b60f..d61bb2e44c06 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -122,6 +122,8 @@ static const u32 rcar_du_vsp_formats[] = {
>  	DRM_FORMAT_RGB888,
>  	DRM_FORMAT_BGRA8888,
>  	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_UYVY,
> @@ -154,6 +156,8 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>  	DRM_FORMAT_RGB888,
>  	DRM_FORMAT_BGRA8888,
>  	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_RGBX1010102,
> @@ -194,6 +198,10 @@ static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
>  			fourcc = DRM_FORMAT_XRGB8888;
>  			break;
>  
> +		case DRM_FORMAT_ABGR8888:
> +			fourcc = DRM_FORMAT_XBGR8888;
> +			break;
> +
>  		case DRM_FORMAT_BGRA8888:
>  			fourcc = DRM_FORMAT_BGRX8888;
>  			break;

-- 
Regards,

Laurent Pinchart
