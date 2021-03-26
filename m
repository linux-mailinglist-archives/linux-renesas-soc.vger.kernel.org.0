Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1B349E34
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 01:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCZAn4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Mar 2021 20:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbhCZAnh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Mar 2021 20:43:37 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E61C06174A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Mar 2021 17:43:36 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id 7so3740449qka.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Mar 2021 17:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6l8qPlBwWGhFEr62tjoDbv6LpnDOpMR2bfxtHw91Jxs=;
        b=ZkdIaBz9YBB7X2wWeZDzOdwadwUmFCH5Zo/DN26SAAz9fLSNhRvK7G6ENjEtbI+hLW
         aH5yh0pa2ahVbOdqnqFh0kwTbUEXt0FwzOrI5aeGZWl252m2AxWpmGQNGKOSTpQ2ybNS
         uoUXKTOHOsUmRVgciH7rLfSudEqhFJYvGHljU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6l8qPlBwWGhFEr62tjoDbv6LpnDOpMR2bfxtHw91Jxs=;
        b=SRxL56EKBfP/HitsUa/FsCmImEIa7K4qsFNouFK8aegiP9mg53BApyCn5cQTbJmtsI
         G7HW9u4GWUxIsu+DBNBtObIZsUZGNcd1Q7M9cZv1PeJPYjcf0WXRpX3XyhhjmZlxM6XR
         mSCI/Xp7DIPIwbftO4128wX4d7Wmxt94cZJIwnGzdrfMizaNuDx86xuKEl4+WaJQF733
         q368a8b+aI7wAJohtA/xdyIA2JvRJZRSn2Ugqt+4xcZLThbu4MhgK9W+hdgxoWfwpXJ6
         V9jhRACqqDNjsj3DfNvKj776xliCCV/hSg2A/gDAoWl53Pw1Ja9K6uXPsOM1Hy4Tzs9X
         1cjg==
X-Gm-Message-State: AOAM533wcd3DmPkhvInDr5vY2ZcMnVnUeZkvtVCvc2rh1GDtOyr+p5iv
        5iFu8HCUZ/iHLmPu8SQU0aVblLn5AGdH5g==
X-Google-Smtp-Source: ABdhPJzsZq4JS5Z8iCC4Dor2OZbY+p+dtVUP+SQyvHCPuwDgym5m2KUK3JXvcdZ/1f2HIr1Srf0wIg==
X-Received: by 2002:a37:b8c6:: with SMTP id i189mr10415448qkf.456.1616719415876;
        Thu, 25 Mar 2021 17:43:35 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id e1sm5036841qti.10.2021.03.25.17.43.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 17:43:35 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id l15so4257975ybm.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Mar 2021 17:43:34 -0700 (PDT)
X-Received: by 2002:a25:69c1:: with SMTP id e184mr16137873ybc.345.1616719414494;
 Thu, 25 Mar 2021 17:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
 <YFpgfBW+U5R6urk0@pendragon.ideasonboard.com> <CAD=FV=W76DXDsy_Ug5cQUVUfz18MzYp92hPKOiRm3Hf1jknPgQ@mail.gmail.com>
 <YFpznvA/m3KfEEqz@pendragon.ideasonboard.com>
In-Reply-To: <YFpznvA/m3KfEEqz@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Mar 2021 17:43:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoivERNCXtCa6UFix6e+K5JZpXca_ipnEwtA4rkSLgZA@mail.gmail.com>
Message-ID: <CAD=FV=WoivERNCXtCa6UFix6e+K5JZpXca_ipnEwtA4rkSLgZA@mail.gmail.com>
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

On Tue, Mar 23, 2021 at 4:03 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Doug,
>
> On Tue, Mar 23, 2021 at 03:55:05PM -0700, Doug Anderson wrote:
> > On Tue, Mar 23, 2021 at 2:42 PM Laurent Pinchart wrote:
> > > On Tue, Mar 23, 2021 at 02:08:42PM -0700, Doug Anderson wrote:
> > > > On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> > > > >
> > > > > The AUX adapter registered in probe() need to be unregistered in
> > > > > remove(). Do so.
> > > > >
> > > > > Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > index da78a12e58b5..c45420a50e73 100644
> > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> > > > >                 return -EINVAL;
> > > > >
> > > > >         kfree(pdata->edid);
> > > > > +
> > > > > +       drm_dp_aux_unregister(&pdata->aux);
> > > > > +
> > > > >         ti_sn_debugfs_remove(pdata);
> > > > >
> > > > >         of_node_put(pdata->host_node);
> > > >
> > > > Good catch. One question, though. I know DRM sometimes has different
> > > > conventions than the rest of the kernel, but I always look for the
> > > > "remove" to be backwards of probe. That means that your code (and
> > > > probably most of the remove function) should come _after_ the
> > > > drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
> > > > thing in probe then drm_bridge_remove() should be the first thing in
> > > > remove?
> > >
> > > I agree in theory, yes. However, in practice, if you remove a bridge
> > > that is currently in use, all hell will break lose. And if the bridge
> > > isn't being used, it makes no difference. Still, it's worth changing the
> > > order of operations to move drm_bridge_remove() first, as it won't hurt
> > > in any case and is logically better. It's not an issue introduced by
> > > this series though, so how how about it on top, or in parallel ?
> >
> > Sure, it can be a separate patch. I'd kinda prefer it be a patch
> > _before_ ${SUBJECT} patch, though. Specifically it's harder for me to
> > reason about whether your new function call is in the right place and
> > won't cause any problems with the order being all jumbled. If we fix
> > the order first then it's easy to reason about your patch.
> >
> > > You can
> > > even submit a patch if you want :-)
> >
> > Happy to post it up if it won't cause more confusion w/ you posting
> > your next version and trying to figure out what to base it on (since
> > it will definitely conflict with your series).
>
> I'll need quite a bit of time before v2, as I'd like to test it, and
> that requires finishing support for the DSI bridge and the display
> controller :-) Please feel free to post a patch if you have time, I
> think it could get merged in drm-misc quite quickly.

I haven't forgotten about this and I've got it written, but I'm trying
to put it together with the work I'm doing to fix EDID reading and
that's still going to take me a while longer. I'm out tomorrow but
_hoping_ that I'll be able to at least get a new patch series (at
least RFC quality) next week...

-Doug
