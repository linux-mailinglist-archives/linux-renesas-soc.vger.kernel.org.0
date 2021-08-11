Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB9F3E99C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 22:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhHKUkO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 16:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhHKUkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 16:40:13 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C0FC061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 13:39:49 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so4904369otl.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 13:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=0Nc4dbze1UiRTeZtZjRzQEhvFahux2f34ScECRTRd14=;
        b=RaTKJI59CC3c94oNFMBO58g1w0ZmdBqkPUdbPlK6zt9Gkak5R/qNpzAFj48JK131Bo
         +AzvfX4Z7IWCJsztRlZJLgQvT7Sy7FtQ21+0f62yj6dVuhUw4j7KhTFD9PtiiyP5kjLn
         P990wx6of1F/4W/uG+IiXIEqqF0qdHFyWnk3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=0Nc4dbze1UiRTeZtZjRzQEhvFahux2f34ScECRTRd14=;
        b=Nx9dPmKWTNEUD89cu/zrMLJJj38fgCRWpLXwR89zDWPaRFH7WS/21mH7SN6Q2ewjlR
         WeQxCpNufjk/rZgRqZPNt6RB1xGQgmjH7sToLkCScBWW2rRsR2pPPrPjIIn6LBaf4lbN
         T8dXwHcqDtrbe//APxVj21Atbtn8iJL4jzeFQvEigRRFXJ9OnMJCJqgI1QZM+UGq5Lru
         XOLn6wyVIzjWLZMFJn+cT/jxL1V+ynH4c1ficQrJKoYACH41m1SZM22nvU8YutfIOUSD
         l4AyPnonzrjRSmCJK2foYlzVZfF/KJ0Pk+qQr7YHmHC16F0XPvUwkCj1FguNHbe7DDl1
         XmAw==
X-Gm-Message-State: AOAM5309cmNCegXOO6WdxThynQ52/qXtwjW7A2//Gc1kYxWUHjaBVlKF
        R+N473VjKO+yhq+VJWBMeyeVWwDqluURwZzaswe7iALpvjc=
X-Google-Smtp-Source: ABdhPJyimh1HTNJBFXXZHBBvKyYLkEHxV+CSvaHtv2RWM31z94v7y8gMhzWxEOHfwUnawB+tq2ZdiW77ofdWu+RJ9H0=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr628380otq.233.1628714389030;
 Wed, 11 Aug 2021 13:39:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 13:39:48 -0700
MIME-Version: 1.0
In-Reply-To: <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
 <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com> <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 11 Aug 2021 13:39:48 -0700
Message-ID: <CAE-0n53Cc3iPvnnzDs8bV=7DrQro4NYYyzuD_9kHg+-o33u0SA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
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

Quoting Rob Clark (2021-08-11 09:20:30)
> On Wed, Aug 11, 2021 at 5:15 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Stephen,
> >
> > On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> > > Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > > > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > > > let the DRM bridge helpers handle chaining of operations.
> > > >
> > > > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > > > requires all components in the display pipeline to be represented by
> > > > bridges.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > >
> > > With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> > > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> > > looking for more info). As far as I can tell, we should only have one
> > > eDP device on the board, for the bridge.
> > >
> > > localhost ~ # ls -l /sys/class/drm/card1-eDP*
> > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> > > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> > > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
> >
> > Indeed.
> >
> > Does the display driver use the DRM connector bridge helper and
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?
> >
>
> There haven't been any recent changes about how we attach the bridge,
> it doesn't pass DRM_BRIDGE_ATTACH_NO_CONNECTOR.. tbh I've not been
> having time to follow too closely the recent changes with bridge stuff
> myself.
>
> But now with this patch we have both the ti bridge and the panel
> bridge creating a connector..  removing the connector created by the
> ti bridge "fixes" things, but not sure if that would break something
> on other platforms.  I guess there should now always be a panel
> bridge, so removing ti_sn_bridge_connector_init() would be a sane
> thing to do?
>

So this patch works. We don't want to make the connector in this driver
for the next bridge because this driver is making the connector. I guess
eventually we'll drop this flag when this driver stops making the
connector here?

---8<---
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index cd0fccdd8dfd..a8d4818484aa 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -741,7 +741,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,

 	/* Attach the next bridge */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_dsi_detach;
