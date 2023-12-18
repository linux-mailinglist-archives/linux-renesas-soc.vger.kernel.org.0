Return-Path: <linux-renesas-soc+bounces-1183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A60816B49
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 11:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0BD42811EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 10:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8388F182BE;
	Mon, 18 Dec 2023 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r3TeZa9Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A7168B0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2023 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BB491583;
	Mon, 18 Dec 2023 11:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702895887;
	bh=NK82jHPRPfVYGy/vPkJOfacdFlxuccF09ZQE3BF+LRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3TeZa9YSBy4Z4Aq3fksHKD2/+bfY7e+odJ5HXMjCY+b2WVrgaLWR4kOY5mpNDJkZ
	 W22wHsqNrmAYWGCY3H2zmtDdPrQaia8taxV5jOlSducdwYWYr+i+EFDrTmTPm5CRLO
	 hZSZqKB3OQpJRrWv0BIj9FVNv1vzzwGvpPbiwmTo=
Date: Mon, 18 Dec 2023 12:39:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Message-ID: <20231218103903.GP5290@pendragon.ideasonboard.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Thu, Nov 16, 2023 at 12:24:24PM +0000, Biju Das wrote:
> The rcar_du_vsps_init() doesn't free the np allocated by
> of_parse_phandle_with_fixed_args() for the non-error case.
> 
> Fix memory leak for the non-error case.
> 
> While at it, replace the label 'error'->'done' as it applies to non-error
> case as well and update the error check condition for rcar_du_vsp_init()
> to avoid breakage in future, if it returns positive value.
> 
> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v1->v2:
>  * Replaced the label 'error'->'done' as it applies to non-error case as
>    well.
>  * Update the error check condition for rcar_du_vsp_init() to avoid
>    breakage in future, if it returns positive value.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 70d8ad065bfa..4c8fe83dd610 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
>  						       cells, i, &args);
>  		if (ret < 0)
> -			goto error;
> +			goto done;
>  
>  		/*
>  		 * Add the VSP to the list or update the corresponding existing
> @@ -743,13 +743,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  		vsp->dev = rcdu;
>  
>  		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
> -		if (ret < 0)
> -			goto error;
> +		if (ret)
> +			goto done;
>  	}
>  
> -	return 0;
> -
> -error:
> +done:
>  	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
>  		of_node_put(vsps[i].np);
>  

-- 
Regards,

Laurent Pinchart

