Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C081815D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 11:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfHEJsh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 05:48:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47194 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbfHEJsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 05:48:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 071782F9;
        Mon,  5 Aug 2019 11:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1564998514;
        bh=Hlh6gN/t4xFizjbxHfFQzVLy6XLN3G3JoWMd+k4cq+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=njb4pAnNHQunR991gcRzW/2IP86RN3qunFwrTDBtWjtmCMef9nA6OU6nVetreRI1n
         QIH94hCpAjye0HhE76vTyRnB0VUDhLkJGvi2wjx53YDM6xUJ0/L3Yo2DdP10d/mvyA
         fXASI8aA+Balq23VeA4qYdIQxtddCn/45ZRba3Qc=
Date:   Mon, 5 Aug 2019 12:48:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link
 panels
Message-ID: <20190805094832.GC29747@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082020.GH5008@pendragon.ideasonboard.com>
 <TY1PR01MB1770CA2012398B421E609D54C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770CA2012398B421E609D54C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Mon, Aug 05, 2019 at 09:12:34AM +0000, Fabrizio Castro wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 02 August 2019 09:20
> > Subject: Re: [PATCH/RFC 07/12] drm: rcar-du: lvds: Add support for dual link panels
> > 
> > Hi Fabrizio,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Aug 02, 2019 at 08:34:04AM +0100, Fabrizio Castro wrote:
> > > If the display comes with two ports, assume it supports dual
> > > link.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > index 2d54ae5..97c51c2 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > @@ -751,6 +751,9 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
> > >  			ret = -EPROBE_DEFER;
> > >  			goto done;
> > >  		}
> > > +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> > > +			lvds->dual_link = of_graph_get_endpoint_count(remote)
> > > +					== 2;
> > 
> > This is a bit of a hack, as I think the information should be queried
> > from the panel, like we do for bridges. I'd say we can live with this
> > for now, but as the data swap flag should come from the panel as well,
> > we will need infrastructure for that, and we can as well through the
> > dual link flag there at the same time.
> 
> I totally agree, this is a nasty hack, my series is missing the infrastructure
> for describing this information
> 
> > I think we should use the drm_bridge_timings structure for this purpose,
> > as it would make life more difficult for users of drm_bridge and
> > drm_panel to have two different structures (especially when wrapping a
> > drm_panel with drm_panel_bridge_add()). The structure could be renamed
> > if desired.
> 
> I am not too sure using drm_bridge_timings for panels would make everybody
> happy? Is there any alternative? Perhaps this calls for a new struct we could
> embed in both drm_bridge_timings and some drm_panel_<whatever> data
> structure?

I think we could simply rename the structure, all its fields apply to
panels too.

> > >  	}
> > >
> > >  	if (lvds->dual_link) {

-- 
Regards,

Laurent Pinchart
