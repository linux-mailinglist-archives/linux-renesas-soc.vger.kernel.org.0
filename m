Return-Path: <linux-renesas-soc+bounces-8500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38696473F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 15:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FB401C22C37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 13:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A22519306A;
	Thu, 29 Aug 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BqCPa1+w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A160042A96
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Aug 2024 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939557; cv=none; b=NkSTXec1r18NgmKNhOEaC1o5UsLUcOweMYc0kRdy5jnWVX1EUNx8XDTBKiEOx5Rh2FE/w1nyQBOgvE5sMLorogX5YXdPAy/WcXAb2Wl2r4cG1Vmos26C5VDzg2XBbXAuJJ8rjq2YLwdx8c+4Lv14wP2kHcRukNCv/p6+IxN5n7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939557; c=relaxed/simple;
	bh=dwJLBip6NVw3TOM7RLfpjT9Ru9SpDHoboleBfUqTopI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtfqH4p8UElpInTf0DmwZDMbkcGk2QJbDyASCmUgugEhbD0r7sZKk4UnXg8ZcNX4azKwL9ApALqEcjXOukJTD0mbDPQZkN6MKMgEZCIpaIIZzOkJvXhcTDa36B0uSLGXQkXBC98y59LoOUlZ1+Y7WJtZqXUHf7t2wFvspOWgvyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BqCPa1+w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B08A226;
	Thu, 29 Aug 2024 15:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724939485;
	bh=dwJLBip6NVw3TOM7RLfpjT9Ru9SpDHoboleBfUqTopI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqCPa1+wJWbi+8XrP2lKqTiaoIGnBYb/xoo6RV5yMZlrpqIEZX4/doc0SERofq+wW
	 VmH4Lck4NPXHT/cwXsTFE+xPk1pYfkZdsJL5m2oOaV8H+uBjtEYfWVJgh05w/hZNxo
	 MR/Urr3F3lpSo4hLO+SXubiSJ1YEqUMg87H7bH/M=
Date: Thu, 29 Aug 2024 16:52:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Message-ID: <20240829135203.GG12951@pendragon.ideasonboard.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
 <20231218103903.GP5290@pendragon.ideasonboard.com>
 <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240827222237.GH30398@pendragon.ideasonboard.com>
 <TY3PR01MB113469F39EFC94916FC2570B986952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113469F39EFC94916FC2570B986952@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Wed, Aug 28, 2024 at 07:21:32AM +0000, Biju Das wrote:
> On Tuesday, August 27, 2024 11:23 PM, Laurent Pinchart wrote:
> > Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
> > 
> > Hi Biju,
> > 
> > On Tue, Aug 27, 2024 at 04:43:12PM +0000, Biju Das wrote:
> > > Hi Laurent and Tomi,
> > >
> > > Gentle ping. Are you happy with this patch?
> > 
> > I've sent a pull request last Friday, see
> > https://lore.kernel.org/r/20240822234445.GA23541@pendragon.ideasonboard.com
> 
> I believe the commit[1] won't apply any more as the source location is moved.
> Shall I resend the patch or You will take care, please let me know.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/commit/?h=drm-next-20240823&id=866dfbc953d46cf7682c6a434a4dd6249677fd68

I think git will be able to handle that nicely.

> > > > -----Original Message-----
> > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Sent: Monday, December 18, 2023 10:39 AM
> > > > Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in
> > > > rcar_du_vsps_init()
> > > >
> > > > Hi Biju,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Thu, Nov 16, 2023 at 12:24:24PM +0000, Biju Das wrote:
> > > > > The rcar_du_vsps_init() doesn't free the np allocated by
> > > > > of_parse_phandle_with_fixed_args() for the non-error case.
> > > > >
> > > > > Fix memory leak for the non-error case.
> > > > >
> > > > > While at it, replace the label 'error'->'done' as it applies to
> > > > > non-error case as well and update the error check condition for
> > > > > rcar_du_vsp_init() to avoid breakage in future, if it returns positive value.
> > > > >
> > > > > Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from
> > > > > the same VSP")
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Reviewed-by: Laurent Pinchart
> > > > <laurent.pinchart+renesas@ideasonboard.com>
> > > >
> > > > > ---
> > > > > v1->v2:
> > > > >  * Replaced the label 'error'->'done' as it applies to non-error case as
> > > > >    well.
> > > > >  * Update the error check condition for rcar_du_vsp_init() to avoid
> > > > >    breakage in future, if it returns positive value.
> > > > > ---
> > > > >  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
> > > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > > > b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > > > index 70d8ad065bfa..4c8fe83dd610 100644
> > > > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > > > @@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> > > > >  		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
> > > > >  						       cells, i, &args);
> > > > >  		if (ret < 0)
> > > > > -			goto error;
> > > > > +			goto done;
> > > > >
> > > > >  		/*
> > > > >  		 * Add the VSP to the list or update the corresponding existing
> > > > > @@
> > > > > -743,13 +743,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> > > > >  		vsp->dev = rcdu;
> > > > >
> > > > >  		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
> > > > > -		if (ret < 0)
> > > > > -			goto error;
> > > > > +		if (ret)
> > > > > +			goto done;
> > > > >  	}
> > > > >
> > > > > -	return 0;
> > > > > -
> > > > > -error:
> > > > > +done:
> > > > >  	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
> > > > >  		of_node_put(vsps[i].np);
> > > > >

-- 
Regards,

Laurent Pinchart

