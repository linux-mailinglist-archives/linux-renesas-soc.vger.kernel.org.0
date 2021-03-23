Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7B9346D9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 23:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233936AbhCWWzn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 18:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbhCWWzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 18:55:19 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED026C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 15:55:18 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c3so16234141qkc.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LvU9YixOg9nG0JyAgipWS5BaDSSltUCSNOb0sRibXqk=;
        b=NzgtPq2QsAv7BhUS8h+F4Wk+wXsV0d0QLjKZAeel9RRSIJJqGu1FTYaKsaXndisD1l
         t/ik7aRfvYrXBNEIAw+uwZ/Rai7OXqKb7YevAxlQa6/T6v81CB6EgaaBH1eyNvdywvxP
         KlgjFE84KaUlyrpWo/2tyfVm4uPQK1pIj/FT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LvU9YixOg9nG0JyAgipWS5BaDSSltUCSNOb0sRibXqk=;
        b=lSw0d4zWGtDJb8RaHO7guCo3qqLMIyMPRVC3O6HXwN3HYgE05jgVjf7noGC4HAHrIl
         4hOTAgReDXJwI2QqUP+H2xqLeXuFobBXfxjUfJvdwuIV5aYRVWYa2c1HlFLYUMAr7OOH
         cjgQFg3eab4RQNX0kbj0OFxmA3c0AthcnHA013CfQ88iihYv/RHBs3KF/a3t67Yaa09T
         oAbLs0NWsENEuuhIosD/tqL2DHH1rYNM4/zAkeDR4J87iqUo9zBs4BHpVJv6rWV/BDEJ
         MU6oRkIgMblsmu7TUpejl6R7TrklqcGFbLqYP5NMM2XEvOgBimrLxol/2qZESNfy5QbE
         cdVg==
X-Gm-Message-State: AOAM5313GlY2ZatjjEMa7OyNhVbEkTeBmmk9fV7/j3OeHAos54A4YPMN
        rv250fGJBOKukkbV4+jZH0fx2rb2bQsfaA==
X-Google-Smtp-Source: ABdhPJw3e2IpOGuXhNMSeEQgEAS/EFrV3B422uP7vYWVO0KPSFERSga917kIUzmA9f3fVvFCAAY4hQ==
X-Received: by 2002:a05:620a:6c1:: with SMTP id 1mr428666qky.198.1616540117819;
        Tue, 23 Mar 2021 15:55:17 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id v66sm285638qkd.113.2021.03.23.15.55.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 15:55:17 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id x189so4767047ybg.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 15:55:17 -0700 (PDT)
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr706447ybv.79.1616540116568;
 Tue, 23 Mar 2021 15:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com> <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
In-Reply-To: <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Mar 2021 15:55:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
Message-ID: <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, Mar 23, 2021 at 2:42 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 02:08:42PM -0700, Doug Anderson wrote:
> > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > >
> > > The AUX adapter registered in probe() need to be unregistered in
> > > remove(). Do so.
> > >
> > > Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index da78a12e58b5..c45420a50e73 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> > >                 return -EINVAL;
> > >
> > >         kfree(pdata->edid);
> > > +
> > > +       drm_dp_aux_unregister(&pdata->aux);
> > > +
> > >         ti_sn_debugfs_remove(pdata);
> > >
> > >         of_node_put(pdata->host_node);
> >
> > Good catch. One question, though. I know DRM sometimes has different
> > conventions than the rest of the kernel, but I always look for the
> > "remove" to be backwards of probe. That means that your code (and
> > probably most of the remove function) should come _after_ the
> > drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
> > thing in probe then drm_bridge_remove() should be the first thing in
> > remove?
>
> I agree in theory, yes. However, in practice, if you remove a bridge
> that is currently in use, all hell will break lose. And if the bridge
> isn't being used, it makes no difference. Still, it's worth changing the
> order of operations to move drm_bridge_remove() first, as it won't hurt
> in any case and is logically better. It's not an issue introduced by
> this series though, so how how about it on top, or in parallel ?

Sure, it can be a separate patch. I'd kinda prefer it be a patch
_before_ ${SUBJECT} patch, though. Specifically it's harder for me to
reason about whether your new function call is in the right place and
won't cause any problems with the order being all jumbled. If we fix
the order first then it's easy to reason about your patch.

> You can
> even submit a patch if you want :-)

Happy to post it up if it won't cause more confusion w/ you posting
your next version and trying to figure out what to base it on (since
it will definitely conflict with your series).

-Doug
