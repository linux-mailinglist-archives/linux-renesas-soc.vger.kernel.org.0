Return-Path: <linux-renesas-soc+bounces-8405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C729619FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 00:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30574284EBC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 22:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A93199E9A;
	Tue, 27 Aug 2024 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i6iqha0J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC884D34
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 22:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724797365; cv=none; b=rRVYnLzs8lgrj4lzSFcYqkIl4ELbteCnrmufiXtPsw+ffHXs8q8rJUvN8moYJrazbN2zSwySq2JiwjTGaX8VBCeRO3zwWHfg2mohs0VspyTaw1z6auIG4eL2twPzULIUzYMpgxdPImt2ypZQAD6z0P0mfG7DRKUZ15t/T49pBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724797365; c=relaxed/simple;
	bh=SixS31ES6MC72vAm06llo73TN+cIQRGrpwDlBT2Pmj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdPiqkYH7rXHLoQ/zWwyuJwxxPq2V7uD2sRxkKkKFEoc89CWkh+a7cJRv3fZRgeaWrKEo3tpbnpLsMLlW4cJOxftGV3HyTzH9ys0G5avfzsbKgvdYOvup/TKGaIi7LOYCIftXCr1aM7Tf/Jk1QojIledCvIvZX6AcUHK3APiymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i6iqha0J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45E752C5;
	Wed, 28 Aug 2024 00:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724797294;
	bh=SixS31ES6MC72vAm06llo73TN+cIQRGrpwDlBT2Pmj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6iqha0J+jsw936j+ioeawc6Cy96uNgyYyiKomQX4IsJT/RGcJLtaP+6qzbndudnw
	 9VIcLliiN0NiDdhKFi8l4mh7p+reFcn+rwfN3lZvUcUBREm9Mc0wCgWHSnKVhumKiE
	 QR7OQCDgRuI0dgWF7Bj1w6jdoCgIRoJkW0E/tCf4=
Date: Wed, 28 Aug 2024 01:22:37 +0300
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
Message-ID: <20240827222237.GH30398@pendragon.ideasonboard.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
 <20231218103903.GP5290@pendragon.ideasonboard.com>
 <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C640612E2AD57120787C86942@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju,

On Tue, Aug 27, 2024 at 04:43:12PM +0000, Biju Das wrote:
> Hi Laurent and Tomi,
> 
> Gentle ping. Are you happy with this patch?

I've sent a pull request last Friday, see
https://lore.kernel.org/r/20240822234445.GA23541@pendragon.ideasonboard.com

> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Monday, December 18, 2023 10:39 AM
> > Subject: Re: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Thu, Nov 16, 2023 at 12:24:24PM +0000, Biju Das wrote:
> > > The rcar_du_vsps_init() doesn't free the np allocated by
> > > of_parse_phandle_with_fixed_args() for the non-error case.
> > >
> > > Fix memory leak for the non-error case.
> > >
> > > While at it, replace the label 'error'->'done' as it applies to
> > > non-error case as well and update the error check condition for
> > > rcar_du_vsp_init() to avoid breakage in future, if it returns positive value.
> > >
> > > Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the
> > > same VSP")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > > ---
> > > v1->v2:
> > >  * Replaced the label 'error'->'done' as it applies to non-error case as
> > >    well.
> > >  * Update the error check condition for rcar_du_vsp_init() to avoid
> > >    breakage in future, if it returns positive value.
> > > ---
> > >  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > index 70d8ad065bfa..4c8fe83dd610 100644
> > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> > > @@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> > >  		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
> > >  						       cells, i, &args);
> > >  		if (ret < 0)
> > > -			goto error;
> > > +			goto done;
> > >
> > >  		/*
> > >  		 * Add the VSP to the list or update the corresponding existing @@
> > > -743,13 +743,11 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
> > >  		vsp->dev = rcdu;
> > >
> > >  		ret = rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
> > > -		if (ret < 0)
> > > -			goto error;
> > > +		if (ret)
> > > +			goto done;
> > >  	}
> > >
> > > -	return 0;
> > > -
> > > -error:
> > > +done:
> > >  	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
> > >  		of_node_put(vsps[i].np);
> > >

-- 
Regards,

Laurent Pinchart

