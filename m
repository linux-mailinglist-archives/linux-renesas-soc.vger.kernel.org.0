Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B6510F9E3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2019 09:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfLCIeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Dec 2019 03:34:01 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:35460 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfLCIeB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Dec 2019 03:34:01 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 33C3D80478;
        Tue,  3 Dec 2019 09:33:53 +0100 (CET)
Date:   Tue, 3 Dec 2019 09:33:51 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
Message-ID: <20191203083351.GA30687@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191203072443.GK4730@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203072443.GK4730@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=9hfdOVt4OdhUXmoMrC4A:9 a=CjuIK1q_8ugA:10
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

> > This patchset include a couple of different
> > things - all related to panels.
> > 
> > - The panel callbacks are optional - so drop error if
> >   callback is not present.
> >  
> > - Add support for backlight in drm_panel.
> >   This allows us to make much simpler backlight
> >   support to most panels.
> >   The patchset include conversion of most of the
> >   trivial cases.
> > 
> > - Drop drm_connector from drm_panel.
> >   This change required many changes to most
> >   panels and many bridges and display drivers.
> >   This is by far the most invasive change in this patchset.
> > 
> > - Drop the unused get_timings() callback.
> >   No users, so no need to keep it around.
> > 
> > With this patchset drm_panel_(attach|detach) are nop's
> > but they are kept for now.
> > 
> > A few of these patches has been sent out before - but versioning
> > started again from v1 - as the most patches are new.
> > 
> > I have tested the panel-simple changes, and thus some
> > of the infrastructure changes.
> > The testing was done on an earlier iteration - and I ended
> > up submitting this as Laurent and others started to depend on it.
> > Jitao has a patch to add more callbacks, and I wanted the
> > simplification of the callbacks before we add more callbacks.
> 
> Great series !!! Thanks for working on this.
And likewise - thanks for the detailed reviews!

I have a patch to remove drm_panel_(attach|detach),
but they was not included because there is also a patchset floating
that add more functionality to these.

I will address the feedback, it looked all straighforward, and post
an updated series.

> drm/panel: remove get_timings
I will drop this patch as we may need this later.

	Sam
