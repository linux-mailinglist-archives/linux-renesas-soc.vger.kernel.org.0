Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F8C2DC26F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 15:45:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgLPOos (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 09:44:48 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51955 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgLPOor (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 09:44:47 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 610E0C000B;
        Wed, 16 Dec 2020 14:44:05 +0000 (UTC)
Date:   Wed, 16 Dec 2020 15:44:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
Message-ID: <20201216144415.dobj5pn54ceres7j@uno.localdomain>
References: <20201216005021.19518-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201216005021.19518-2-laurent.pinchart+renesas@ideasonboard.com>
 <20201216131656.hinoo4tpannaboqm@uno.localdomain>
 <X9oQZAEB3pbfGSZc@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X9oQZAEB3pbfGSZc@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Dec 16, 2020 at 03:49:24PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> > > +	if (lvds->panel) {
> > > +		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
> > > +							      lvds->panel);
> >
> > Reading the devm_drm_panel_bridge_add() function documentation:
> >
> >  * devm_drm_panel_bridge_add - Creates a managed &drm_bridge and &drm_connector
> >
> > Doesn't this conflict with the drm_bridge_connector_init() called by
> > the encoder in [4/4] ?
>
> It would, if the documentation was right :-) The function only creates a
> bridge. A connector will only be created when the bridge is attached
> without DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Well, reading it again, it is kind of implied that if NO_CONNECTOR is
given to the bridge, no connector will be registered at all.

>
> Would you like to send a patch to fix the documentation ?
>
> > > +		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
> > > +			ret = -EINVAL;
> > > +			goto done;
> > > +		}
> > > +	}
> > > +
> > >  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> > >  		ret = rcar_lvds_parse_dt_companion(lvds);
> > >
>
> --
> Regards,
>
> Laurent Pinchart
