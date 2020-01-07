Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E06F7132583
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2020 13:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgAGMAV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jan 2020 07:00:21 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36657 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAGMAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 07:00:21 -0500
Received: by mail-ot1-f68.google.com with SMTP id 19so63633801otz.3;
        Tue, 07 Jan 2020 04:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S1wiXwjq5bNvmzPILmmYBOTjMYtnHu6yYzhrvwBxyhQ=;
        b=rs5Js3e5x++qfkb+qt75GDucwSqZkT4UFz8GSP/m+CBzV1olZCagVBHcy62xZxK9z4
         IK6AUojLGL1fHluaB5AmwEizB11NZK2q0PcFZHHeXPHloN4yVmWbzemCCBrIgTkwNJf8
         3S3L3QQFDqEpR6M1+GlKmdlJD2BYJdbIECorqDHwfC/lV+eCGyc6wq2aNdApYQYEL9t3
         aiA3d7PJb1vgmCIA5BmQxCSJNM9M5qU9jZi0e0BL3b9BOuZ1+WYUvb+C8s4G2aFOBdEU
         3E9hqC9MZeZOP4z9Q/fHYaeNYN7wpUJXh5jlGnjd3l5GaZ5Ndj0TDUyZKixA3TJppnqC
         TZUQ==
X-Gm-Message-State: APjAAAWclD+ivXkAKzdQyyDQBYJti5XtsJwRzVKVI5uPZw6fn9NiehiN
        FItvQcBpcU7UuhluuwB/2zssle4Y8G+CRP3XY4s=
X-Google-Smtp-Source: APXvYqzT7NKt5AuNhkaTac1R66p2sfv4kCORKqYWKCFnDXfFGTTAXq67T4+HRh5ZfjBhcY6kAGr9/0+4yeC44TRkpqE=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr22257984ots.250.1578398420315;
 Tue, 07 Jan 2020 04:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20200102141246.370-1-geert+renesas@glider.be> <20200102141246.370-4-geert+renesas@glider.be>
 <20200105091303.GB29102@ravnborg.org> <CAMuHMdUL3tCZzCDyJkmqYT5n+-t+Z-Ubo4=+NJpHpZU1w5C07g@mail.gmail.com>
 <20200106170808.GA21745@ravnborg.org>
In-Reply-To: <20200106170808.GA21745@ravnborg.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 13:00:08 +0100
Message-ID: <CAMuHMdXa4zRipzxpKi=YnP672guW5YOvUJ49t6bEX9xp7DyuUg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: tiny: st7735r: Add support for Okaya RH128128T
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam,

On Mon, Jan 6, 2020 at 6:08 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > On Thu, Jan 02, 2020 at 03:12:46PM +0100, Geert Uytterhoeven wrote:
> > > > Add support for the Okaya RH128128T display to the st7735r driver.
> > > >
> > > > The RH128128T is a 128x128 1.44" TFT display driven by a Sitronix
> > > > ST7715R TFT Controller/Driver.  The latter is very similar to the
> > > > ST7735R, and can be handled by the existing st7735r driver.
> > >
> > > As a general comment - it would have eased review if this was split
> > > in two patches.
> > > One patch to introduce the infrastructure to deal with another set of
> > > controller/display and one patch introducing the new combination.
> >
> > I had thought about that, but didn't pursue as the new combination is
> > just 7 added lines.  If you prefer a split, I can do that.
>
> The good thing with a split is that is shows how little is really
> required to support a new controller/panel pair.
> So it would be good if you did so.

OK.

> > > > --- a/drivers/gpu/drm/tiny/st7735r.c
> > > > +++ b/drivers/gpu/drm/tiny/st7735r.c
> > > > @@ -1,8 +1,9 @@
> > > >  // SPDX-License-Identifier: GPL-2.0+
> > > >  /*
> > > > - * DRM driver for Sitronix ST7735R panels
> > > > + * DRM driver for Sitronix ST7715R/ST7735R panels
> > >
> > > This comment could describe the situation a little better.
> > > This is a sitronix st7735r controller with a jianda jd-t18003-t01
> > > display.
> > > Or a sitronix st7715r controller with a okaya rh128128t display.
> >
> > Indeed. It is currently limited to two controller/display combos.
> > But I expect more combos to be added over time.
> > Hence does it make sense to describe all of that in the top comments?
>
> If we do describe it we should do so as kernel-doc and then wire up the
> driver somwhere under Documentation/gpu/
> But there is no good place to wire it up yet.

Documentation/devicetree/bindings/display/sitronix,st7735r.yaml? ;-)

> > > > @@ -37,12 +39,28 @@
> > > >  #define ST7735R_MY   BIT(7)
> > > >  #define ST7735R_MX   BIT(6)
> > > >  #define ST7735R_MV   BIT(5)
> > > > +#define ST7735R_RGB  BIT(3)
> > > > +
> > > > +struct st7735r_cfg {
> > > > +     const struct drm_display_mode mode;
> > > > +     unsigned int left_offset;
> > > > +     unsigned int top_offset;
> > > > +     unsigned int write_only:1;
> > > > +     unsigned int rgb:1;             /* RGB (vs. BGR) */
> > > > +};
> > > > +
> > > > +struct st7735r_priv {
> > > > +     struct mipi_dbi_dev dbidev;     /* Must be first for .release() */
> > > > +     unsigned int rgb:1;
> > > > +};
> > >
> > > The structs here uses "st7735r" as the generic prefix.
> > > But the rest of this file uses "jd_t18003_t01" as the generic prefix.
> > >
> > > It would help readability if the same prefix is used for the common
> > > stuff everywhere.
> >
> > Agreed.
> > So I think it makes most sense to rename jd_t18003_t01_pipe_{enable,funcs}
> > to sh7735r_pipe_{enable,funcs}?
> s/sh/st/

Oops, seen to much SuperH-derived hardware ;-)

> Yeah, or maybe just sitronix_pipe_{enable,funcs} as we have support
> for more than one Sitronix controller anyway.

Note that there are other drivers for Sitronix controllers, e.g.
drivers/gpu/drm/tiny/st7586.c, which is a different beast.
So st7735r_* sounds better to me ('15 and '35 are very similar).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
