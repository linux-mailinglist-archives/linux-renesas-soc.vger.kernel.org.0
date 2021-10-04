Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168914214F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 19:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbhJDRPt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 13:15:49 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:45671 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236127AbhJDRPs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 13:15:48 -0400
Received: by mail-vs1-f53.google.com with SMTP id v4so5797338vsg.12;
        Mon, 04 Oct 2021 10:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDIVmR/qFuDDiFyWNf3y3niN15+lX6TIgv0kekHzpE8=;
        b=JlNTqYWgky0nW1lEZ6JGhUQCZVPleQEhdvbgcz/JI4TzEOBaJeXjmREs3hqs9FkNoS
         Yc6rE6tR6YwU9qmXak1OkczTDxBz74RFDci/6ms43k2Eq+PXuzRi6BlA8k8OK9SEoy30
         GdT2nJzSTDwdOPjqqJmHte7NnDwWVxE04l/ZbUtkipR1EogS8bNPjuZ+Zz/tENPjrakc
         lPCHOhufPsw+IQAY7/xH3Ia322b0dQQSYuWa2lVEMWtAlj64nWWUFJ7CsfbrbQpc4PVh
         NoemZifgUh6Vi5K4PlZEbm3uOvVTAl2+BQBMTFl+HCKctnp+CxeKsXWXkPBYRQ1JoGss
         bRDw==
X-Gm-Message-State: AOAM532aAC4R9bsNSZ87KYqYJFGNqxWzFNasOzeDoHihCSFmlBPs9jhx
        tkyclS0G6kHTuV7ypmvuFIC3T8UtSj/JAZdRqog=
X-Google-Smtp-Source: ABdhPJyfd/P5arwYcERnUkJxEhSvSRTgfpXDmvSyUgqTuMJgZeXYqwzGlSFUN1nE+bCjMj2ewLylD/0E6wTHQevyZgk=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr13878232vss.35.1633367638697;
 Mon, 04 Oct 2021 10:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
 <20210914132020.v5.2.I62e76a034ac78c994d40a23cd4ec5aeee56fa77c@changeid>
 <CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU1w_idg@mail.gmail.com> <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
In-Reply-To: <CAD=FV=W07iZigvNaxv1WodhQZVm8hD-1NxTuBuapJYifi6ROng@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Oct 2021 19:13:47 +0200
Message-ID: <CAMuHMdVK9p3J762+TQM9ogS5YE2QdJ5fiXKOQo7mXy8TwzCeew@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] drm/edid: Break out reading block 0 of the EDID
To:     Doug Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Doug,

On Mon, Oct 4, 2021 at 6:26 PM Doug Anderson <dianders@chromium.org> wrote:
> On Mon, Oct 4, 2021 at 8:42 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > -       if ((edid = kmalloc(EDID_LENGTH, GFP_KERNEL)) == NULL)
> > > +       edid = (u8 *)drm_do_get_edid_base_block(get_edid_block, data,
> > > +                                               &connector->edid_corrupt,
> > > +                                               &connector->null_edid_counter);
> > > +       if (IS_ERR_OR_NULL(edid)) {
> > > +               if (IS_ERR(edid))
> >
> > So edid is an error code, not a valid pointer...
> >
> > > +                       connector_bad_edid(connector, edid, 1);
> >
> > ... while connector_bad_edid() expects edid to be a valid pointer,
> > causing a crash:
> >
> > Unable to handle kernel NULL pointer dereference at virtual address
>
> Sigh. Thanks for the report and analysis. I guess I don't have any
> displays reporting invalid EDIDs to test with. Hopefully this will
> help:

It doesn't happen all the time.  Looks like my EDID is only invalid after
a reset needed to resolve an s2ram crash in the adv7511 driver...

> https://lore.kernel.org/r/20211004092100.1.Ic90a5ebd44c75db963112be167a03cc96f9fb249@changeid/

Thanks for the quick fix!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
