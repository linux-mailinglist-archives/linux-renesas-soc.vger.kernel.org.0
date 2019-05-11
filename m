Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 860541A91D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 May 2019 20:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfEKSrx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 May 2019 14:47:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57228 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfEKSrx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 May 2019 14:47:53 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAF8DD5;
        Sat, 11 May 2019 20:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557600471;
        bh=o+XFVheuZSBaiavhNHFksJC7rEbypGj1fvsXwiEGdBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qm6ADh0CSr9mQqo18gDAgHVbkJ2FO6HlOqvmFdexYhKWtcMltphjCViek6aTTZ23f
         vvqls2G5NK3UyW1+GmAzrmLsXR2ZafhbEr2WI6EYnwqguFRqP3UPS98VdW7uWqDyaG
         daaDCXcH2KFNjpWxJI7qtZBdB/gWQGHbMEVMMFpc=
Date:   Sat, 11 May 2019 21:47:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 5/9] drm: rcar-du: Add CMM support for M3-W
Message-ID: <20190511184735.GA16838@pendragon.ideasonboard.com>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
 <20190508173428.22054-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508173428.22054-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, May 08, 2019 at 07:34:24PM +0200, Jacopo Mondi wrote:
> R-Car M3-W provides a CMM for each of it's DU output channel. Add CMM as
> a supported feature for the SoC.
> 
> Temporary commit to be later expanded to all Gen3 SoCs V3H/M apart.

Could you please do so in a single commit ? It should be pretty
straightforward. Apart from that this looks good to me,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 75ab17af13a9..984553342b1f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -280,7 +280,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
> -		  | RCAR_DU_FEATURE_TVM_SYNC,
> +		  | RCAR_DU_FEATURE_TVM_SYNC
> +		  | RCAR_DU_FEATURE_CMM,
>  	.channels_mask = BIT(2) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*

-- 
Regards,

Laurent Pinchart
