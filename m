Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26ABC1124AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 09:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfLDIX7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 03:23:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52630 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfLDIX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 03:23:59 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96AD92E5;
        Wed,  4 Dec 2019 09:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575447836;
        bh=nyd4XgcLyCSTsQupfb4xv5PHTwGKyb6g5i8r8JAXHVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=afblBDczenWomfuQolNaMdlOwLQiZ6lBV1+s5nJP0cq1IIYRBma4GLk/PiEl+OtYX
         p027OZRpAYqWRLrPJbKXCuPmvfGr2Sr42a6ZZYqXhDrEx2SSotyu6yAjzMUGInB7Mt
         j6ljitY8cjSQla2EKxmJfgOxHwZT1feGlJFqj7SI=
Date:   Wed, 4 Dec 2019 10:23:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191204082349.GA6705@pendragon.ideasonboard.com>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <CACRpkdZrReQs08+bXS7s7eJ-K76nMGvRgQ-L-1-baunEtiF40g@mail.gmail.com>
 <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191204081650.4n4ehbub4n7pxdom@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maxime,

On Wed, Dec 04, 2019 at 09:16:50AM +0100, Maxime Ripard wrote:
> On Tue, Dec 03, 2019 at 04:20:24PM +0100, Linus Walleij wrote:
> > On Tue, Dec 3, 2019 at 8:47 AM Maxime Ripard wrote:
> >
> > > Using only the mode as we do currently has a bunch of shortcomings as
> > > almost no encoder will be able to provide the typical pixel clock, and
> > > that situation leads to multiple things:
> > >
> > >   - If someone working on one encoder wants to upstream a panel they
> > >     have tested, chances are this will not be the typical pixel clock
> > >     / timings being used but rather the one that will match what that
> > >     SoC is capable of. Trouble comes when a second user comes in with
> > >     a different encoder and different capabilities, and then we have a
> > >     maintainance fight over which timing is the true timing (with a
> > >     significant chance that none of them are).
> > >
> > >   - If we can't match the pixel clock, we currently have no easy way
> > >     to make the usual measures of reducing / growing the porches and
> > >     blankings areas to match the pixel clock we can provide, since we
> > >     don't have an easy way to get the tolerance on those timings for a
> > >     given panel. There's some ad hoc solutions on some drivers (I
> > >     think vc4 has that?) to ignore the panel and just play around with
> > >     the timings, but I think this should be generalised.
> >
> > I've been confused with these things as they look today and it seems
> > the whole struct drm_display_mode could need some improvement?
> >
> > If .clock is supposed to be htotal * vtotal * vrefresh, what is the
> > .clock doing there anyway.
> 
> It's one thing I wonder as well. I guess it's just more convenient for
> everyone, since it's exposed by the VESA modes (iirc) and a lot of
> drivers really care about the clock.

My understanding is that the clock is the authoritative parameter, while
vrefresh is offered as a convenience to avoid calculating it manually
through drivers.

> > Sadly I am too inexperienced to realize where the tolerances should
> > be stated, but I guess just stating that hsync_start etc are typical,
> > then specify some tolerance for each would help a bit?
> 
> The timings structure discussed in the patch that started this
> discussion is actually doing this nicely, you have for each timing the
> minimum, typical and maximum value. The current issue with it though
> is that it's pretty difficult to use it, since it's not really tied to
> any of the panel code (or DRM helpers). The only driver that was
> supporting it was omapdrm and it was removed recently.
> 
> If we really wanted to support it, one path forward I can see would be
> to make the timings structure the primary one, and only use
> drm_display_mode for userspace facing code, and generate it from the
> timings. This would be a pretty invasive change though...
> 
> > On the DSI displays in video mode there is also this EOL area
> > which seems to be where the logic is normally just idling for a
> > while, that can be adjusted on some hardware as well, but
> > I don't quite understand it admittedly. Sometimes I wonder if
> > anyone really understands DSI... :/
> 
> I'm not aware of any EOL area in MIPI-DSI that would make the hardware
> idle, don't you mean LP-11?

-- 
Regards,

Laurent Pinchart
