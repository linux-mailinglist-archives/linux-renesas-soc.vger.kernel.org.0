Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28C1BBF3DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 15:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfIZNQ0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 09:16:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37788 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfIZNQ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 09:16:26 -0400
Received: by mail-ot1-f66.google.com with SMTP id k32so1958931otc.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2019 06:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+cUIF9luptWP9IQvmCVttunB3wdHiRkfLkTGVbqWzwA=;
        b=OHEsFgBd9AxMzCy8jhX+xWjDFw8/GYwaHT1RgLX0JQ0MD6mC4T0Uhf9IFsZrHh3DYD
         EEabqfvrWJc8Kd5kUItNKW5t9UdpU/GFenvnw2awIyTIs+p3OTK+T9rQiTkgdQMnq+Ig
         tuZYjcdVgJtz6pXBBi8lCbj1bYu9ZWd00s0baewEBU36EdmXP3tyoSADQb0z6LuJC1h+
         93s0AhWjMFHNVXck8kXTOV9cEqyQSalJEPlWJLRO1v64aQE5GPyNnMV3QwYujXSpp9E0
         6OF3VJ+kzqPvKGGDdUDuaULEyImNAULNBTm5ctRBHsp0bdY8VCyc5XM7tkrMgI1nK+aq
         2r7Q==
X-Gm-Message-State: APjAAAUv23/VAMi7H3DPToJV5S7Df6RGME/gE7PnRHE0HS6ubvslrfP8
        /gASAcjjUwz/m93aaEjmtaJu2GPWrrAxgZve8yIM9ZzL
X-Google-Smtp-Source: APXvYqx9Gl2wir+vt33OvhKwASb7DqsGekfVda0VCip69lk4x+uld19BdUN+mmN2AOXEmLn8Sxt+eIDReeWop3TqWLY=
X-Received: by 2002:a9d:193:: with SMTP id e19mr2444584ote.107.1569503785339;
 Thu, 26 Sep 2019 06:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190917062353.16966-1-geert+renesas@glider.be>
 <20190920234003.GJ12672@pendragon.ideasonboard.com> <20190920234310.GK12672@pendragon.ideasonboard.com>
In-Reply-To: <20190920234310.GK12672@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Sep 2019 15:16:14 +0200
Message-ID: <CAMuHMdUu9qaEvhx-cE3ggChOhwF8AiAB3txTj8t_apQn_kBxbw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar_lvds: Fix color mismatches on R-Car H2 ES2.0
 and later
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Sat, Sep 21, 2019 at 1:43 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sat, Sep 21, 2019 at 02:40:03AM +0300, Laurent Pinchart wrote:
> > On Tue, Sep 17, 2019 at 08:23:53AM +0200, Geert Uytterhoeven wrote:
> > > Commit 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk") states
> > > that LVDS lanes 1 and 3 are inverted on R-Car H2 ES1 only, and that the
> > > problem has been fixed in newer revisions.
> > >
> > > However, the code didn't take into account the actual hardware revision,
> > > thus applying the quirk also on newer hardware revisions, causing green
> > > color reversals.
> >
> > Oops :-S

Quite understandable, as there was no soc_device_match() in 2013...

> > > Fix this by applying the quirk when running on R-Car H2 ES1.x only.
> > >
> > > Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> >
> > Shouldn't this be
> >
> > Fixes: 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk")

Yes, that's where the issue was introduced. But see my original comment
about backporting below.

> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > > Does anyone know if this was fixed in ES2.0, or in any earlier ES1.x?
> >
> > Or if there's any ES1.x other than ES1.0 ? :-)
> >
> > > While the issue was present before aforementioned commit, I do not think
> > > there is a real need to fix the older code variant, as the new LVDS
> > > encoder was backported to v4.14-ltsi.
> >
> > Probably not, but I think there's still value in pointing to the right
> > erroneous commit. It's a Fixes: tag, not a Backport-up-to: tag :-)

OK.

> > > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/of_graph.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/sys_soc.h>
> > >
> > >  #include <drm/drm_atomic.h>
> > >  #include <drm/drm_atomic_helper.h>
> > > @@ -842,8 +843,23 @@ static int rcar_lvds_get_clocks(struct rcar_lvds *lvds)
> > >     return 0;
> > >  }
> > >
> > > +static const struct rcar_lvds_device_info rcar_lvds_r8a7790es1_info = {
> > > +   .gen = 2,
> > > +   .quirks = RCAR_LVDS_QUIRK_LANES,
> > > +   .pll_setup = rcar_lvds_pll_setup_gen2,
> > > +};
> > > +
> > > +static const struct soc_device_attribute lvds_quirk_matches[] = {
> > > +   {
> > > +           .soc_id = "r8a7790", .revision = "ES1.*",
> >
> > Do you mind splitting this in two lines ?

Yes I do: it makes it easier to locate fixes for early silicon.

> Actually, it could be argued that having both on the same line is more
> readable. I'll let you decide what you like best.

I'm happy to hear you're reconsidering!

> > With these small issues fixes,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Please let me know if I should fix while applying or if you want to send
> > a new version.

Feel free to fix (replace Fixes or add a second Fixes tag) while applying.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
