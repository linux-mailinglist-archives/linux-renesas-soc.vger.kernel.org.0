Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6113B241C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 01:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhFWXxp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 19:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFWXxp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 19:53:45 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F16DC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 16:51:26 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id b3so2850659qtq.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 16:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fiNrfVW4OkS2oRuAQGtv3n1k6FsYY6hgbuTNk8Jiq1Y=;
        b=Hzy2hTa57ImT+jIAndTOvOlNBzjqNS2aDF071yZj/iYidxQX4MPutW4n2ct6cTxJaV
         hQ0myn00i3hPqUM/L9YQNXogeO3ormYbQIJoy33KBTCBB/r3OybDaqLWkVKR8ximv883
         pQg1ulsv73O1tEV5NtnQAnOJadD/9tGgQHj1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fiNrfVW4OkS2oRuAQGtv3n1k6FsYY6hgbuTNk8Jiq1Y=;
        b=h6TJTH7mBVudnKkwcO0WT96PeHjzI9qeoXI5aN7OBPqjY1qb/Jmbn/daFZID619eTR
         ZIPje8CEjZ4nmwSDYUDu2ZhhPNW1+wjNDiYQvs1ZRM+nAEXrCa7mgg8bfOxxARAXRa88
         GPlXCunYIva3g7loJBwlBotIAU1yTCaNr8FWAoXOyeSY0oamuE+ChTTib/qMCPHzd6N5
         6kLYzTA7Ov/0mcrRF0RCYsOBrZKJ20w8W52n7cW4dTlfRia9GvQovC9xtT/ff762ZOUB
         xS/rth1qVWstS6y8vLzjMpweIR5gkQz62oF2sDZDnsSLGlEUsAcaR67YvtWiccnhLA0p
         YdAg==
X-Gm-Message-State: AOAM533JVyiSI5HiEkkxQfCqLgp9aHw0W93x1jtHbl9Hq390GqnfqeFV
        oxGDkP5hxdn6kfgQicKifSRjlPs4kuGJxw==
X-Google-Smtp-Source: ABdhPJxKL3Bav0J59NVOOj/G22E/vj8PCkIj8uKag1AlKsk37hNgJwQKH8QcRxnMRLKgpABhosK4cw==
X-Received: by 2002:ac8:59c8:: with SMTP id f8mr2301238qtf.89.1624492285255;
        Wed, 23 Jun 2021 16:51:25 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id t62sm1140437qkc.26.2021.06.23.16.51.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 16:51:24 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id f70so9718001qke.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 16:51:24 -0700 (PDT)
X-Received: by 2002:a25:bcb:: with SMTP id 194mr1037713ybl.32.1624492283992;
 Wed, 23 Jun 2021 16:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=XeUbw44OZ0H6hJhS3Pb7LgknVpKynHFxWpPx_qPQ6+QA@mail.gmail.com> <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
In-Reply-To: <YNPDAyODcvlWtxpj@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Jun 2021 16:51:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
Message-ID: <CAD=FV=W6npK+NhethhY8ghtt7gwDHYfpX00w07nHE82anqx5aA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug detection
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Jun 23, 2021 at 4:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > > @@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> > >
> > >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> > >         pdata->bridge.of_node = client->dev.of_node;
> > > -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > > +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)
> >
> > Checking for "no_hpd" here is not the right test IIUC. You want to
> > check for eDP vs. DP (AKA whether a panel is downstream of you or a
> > connector). Specifically if downstream of you is a panel then (I
> > believe) HPD won't assert until you turn on the panel and you won't
> > turn on the panel (which happens in pre_enable, right?) until HPD
> > fires, so you've got a chicken-and-egg problem. If downstream of you
> > is a connector, though, then by definition HPD has to just work
> > without pre_enable running so then you're OK.
>
> Agreed. It's even more true now that your rework has landed, as in the
> eDP case EDID is handled by the panel driver. I'll rework this.
>
> Should I also condition setting HPD_DISABLE to the presence of a panel
> then ? I could drop of_property_read_bool() and set
>
>         pdata->no_hpd = !!panel;
>
> > I guess then you'd need to figure out what to do if someone wants to
> > use "HPD" on eDP. Do you need to put a polling loop in pre_enable
> > then? Or you could just punt not support this case until someone needs
> > it.
>
> I think I'll stop short of saving the world this time, yes :-) We'll see
> what to do when this case arises.

How about as a compromise you still call of_property_read_bool() but
add some type of warning in the logs if someone didn't set "no-hpd"
but they have a panel?


> > > +                         | DRM_BRIDGE_OP_EDID;
> >
> > IMO somewhere in here if HPD is being used like this you should throw
> > in a call to pm_runtime_get_sync(). I guess in your solution the
> > regulators (for the bridge, not the panel) and enable pin are just
> > left on all the time,
>
> Correct, on my development board the SN65DSI86 is on all the time, I
> can't control that.
>
> > but plausibly someone might want to build a
> > system to use HPD and also have the enable pin and/or regulators
> > controlled by this driver, right?
>
> True. DRM doesn't make this very easy, as, as far as I can tell, there's
> no standard infrastructure for userspace to register an interest in HPD
> that could be notified to bridges. I think it should be fixable, but
> it's out of scope for this series :-) Should I still add a
> pm_runtime_get_sync() at probe time, or leave this to be addressed by
> someone who will need to implement power control ?

IMO if you've detected you're running in DP mode you should add the
pm_runtime_get_sync() in probe to keep it powered all the time and
that seems the simplest. Technically I guess that's not really
required since you're polling and you could power off between polls,
but then you'd have to re-init a bunch of your state each time you
polled too. If you ever transitioned to using an IRQ for HPD then
you'd have to keep it always powered anyway.

-Doug
