Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C9A3B119D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 04:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhFWCPt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 22:15:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhFWCPs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 22:15:48 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E21E49B1;
        Wed, 23 Jun 2021 04:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624414411;
        bh=eTr6bTwliEL234bS6wj1Fd0elfBdWQDNvpn/GDYoPmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U6L0jIaH0VMK1EEzCDOqKlxFY79Ct0PSx7ApV6sOVZpYq8crnPb3uDl8M6qb2DCSQ
         nwGPwl2jqafkCaBcN2RGJWIuxEh8X1TasS1/nuYsV2eLhpOxVViCiV1SVHqh8ML9Kc
         JV+np2D2rPREdpccWeO3V18+WKa02/tAr9ktn0t4=
Date:   Wed, 23 Jun 2021 05:13:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm: rcar-du: Sort the DU outputs
Message-ID: <YNKYrmf4p65DruSh@pendragon.ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
 <20210622232024.3215248-2-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622232024.3215248-2-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Jun 23, 2021 at 12:20:22AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Sort the DU outputs alphabetically, with the exception of the final
> entry which is there as a sentinal.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 5f2940c42225..440e6b4fbb58 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -96,10 +96,10 @@ struct rcar_du_crtc_state {
>  enum rcar_du_output {
>  	RCAR_DU_OUTPUT_DPAD0,
>  	RCAR_DU_OUTPUT_DPAD1,
> -	RCAR_DU_OUTPUT_LVDS0,
> -	RCAR_DU_OUTPUT_LVDS1,
>  	RCAR_DU_OUTPUT_HDMI0,
>  	RCAR_DU_OUTPUT_HDMI1,
> +	RCAR_DU_OUTPUT_LVDS0,
> +	RCAR_DU_OUTPUT_LVDS1,
>  	RCAR_DU_OUTPUT_TCON,
>  	RCAR_DU_OUTPUT_MAX,
>  };

-- 
Regards,

Laurent Pinchart
