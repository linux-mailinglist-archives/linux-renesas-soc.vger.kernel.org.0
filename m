Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649D93E99D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 22:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhHKUrj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 16:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhHKUrj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 16:47:39 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18411C061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 13:47:15 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id f5so4817564wrm.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xkYKW1aYIWHZ7gLFcO7kToTpFwBuB09fXFKaH6RjOzY=;
        b=P7aF6vq8kBrIoi62jLzHWiyPVjgxLqJHCgY82rrIERX2GhJ2tBIoQTZGIgH4CJKiUf
         rnsWqUu/OmKcZGmti0RRNHjFAOAOTGJB5s7OtKd/HrJ5wbhZ0fB0eoB8A7LcZ6ARV0Tw
         pK3+dGmZYqXN4Jp+TiA0yK5VCjhGYr2fr6WXElDwB0Ux6gTzg7Ag3Sw/68lC/9GH3ZJh
         fkiqLcWa0Nknf6ZE7T75kEQXIo5lCsrpxLuIRT4QHjqmIEuS7vDxqwAe7TJuIluu/IsT
         LTrCWiaBHemlfs/DeDe7+lLJmfZpdbJ0HuvBHpqNNOjKfanVQW1jMG3a0T4XwqcysN+8
         B2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xkYKW1aYIWHZ7gLFcO7kToTpFwBuB09fXFKaH6RjOzY=;
        b=S6P/T+75SYGjml+bxIsr/ZgI0Cg99IRjSRtKgnSVSs+MF+rgOSHe53e5E5CvdmQhxE
         2yYV4kPEbuExJzsu+DpMbSvJUEA+lYyYAZjnMk6U0zbQTEDO0IgPuEDlOg5SeULbUpHF
         HOdUstfEuPuveLJUWimV+SyxzuQ55QQwkhNuwc6FQ1PNUlv4yuIYFifjjnIIKYDsobse
         55dWf0rmmdEx9NkY61xJEWCneaS5peUW7zASMO0NoeoDmCqM+ZG+6A2extacGR7sR/od
         vGZSz/+HBaKuAcTus2xSwODvYyX6BWh8tRo2Yo5CTyoXd3xE/vNd4rcWIMR9zuN+Uxks
         W+Og==
X-Gm-Message-State: AOAM530nBz6XkOE7cOEdv/CGJFi5Byse2IhtXWcaFBaJVsf2N+TOOU4A
        ijpI4/1pPGL3/FCRsHRdyd56y9GNYu+bMxnDzh4=
X-Google-Smtp-Source: ABdhPJw9CIgtsJLgu45cy9t9XnlzP3E8grnHn9hXS61kbJw9a221HmJeQHlx9moYCweYDGCBebImyxu5h7/CiUDOr+U=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr285330wrm.327.1628714833663;
 Wed, 11 Aug 2021 13:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com> <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
 <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
In-Reply-To: <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 11 Aug 2021 13:51:28 -0700
Message-ID: <CAF6AEGs=uOC7Fb0sHJG+iR=d7ORnRhRn-K_ogrKDwzuN=9qAhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 11, 2021 at 1:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-08-11 09:20:30)
> > On Wed, Aug 11, 2021 at 5:15 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Stephen,
> > >
> > > On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> > > > Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > > > > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > > > > let the DRM bridge helpers handle chaining of operations.
> > > > >
> > > > > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > > > > requires all components in the display pipeline to be represented by
> > > > > bridges.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > ---
> > > >
> > > > With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> > > > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> > > > looking for more info). As far as I can tell, we should only have one
> > > > eDP device on the board, for the bridge.
> > > >
> > > > localhost ~ # ls -l /sys/class/drm/card1-eDP*
> > > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> > > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> > > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> > > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
> > >
> > > Indeed.
> > >
> > > Does the display driver use the DRM connector bridge helper and
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?
> > >
> >
> > There haven't been any recent changes about how we attach the bridge,
> > it doesn't pass DRM_BRIDGE_ATTACH_NO_CONNECTOR.. tbh I've not been
> > having time to follow too closely the recent changes with bridge stuff
> > myself.
> >
> > But now with this patch we have both the ti bridge and the panel
> > bridge creating a connector..  removing the connector created by the
> > ti bridge "fixes" things, but not sure if that would break something
> > on other platforms.  I guess there should now always be a panel
> > bridge, so removing ti_sn_bridge_connector_init() would be a sane
> > thing to do?
> >
>
> So this patch works. We don't want to make the connector in this driver
> for the next bridge because this driver is making the connector. I guess
> eventually we'll drop this flag when this driver stops making the
> connector here?
>
> ---8<---
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index cd0fccdd8dfd..a8d4818484aa 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -741,7 +741,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>
>         /* Attach the next bridge */
>         ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> -                               &pdata->bridge, flags);
> +                               &pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>         if (ret < 0)
>                 goto err_dsi_detach;


I kinda think *all* bridges that create a connector (whether optional
or not) should OR in NO_CONNECTOR when attaching the next downstream
bridge.. since you never want multiple connectors

BR,
-R
