Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05C43E95B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 18:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhHKQQk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 12:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhHKQQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 12:16:39 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B34C061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 09:16:15 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso4832281wmg.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S3vLFcFZJGnPiKze6/43mDjwygvEmMXKFCkx/iULFG8=;
        b=l+ZTa0gs6zMN9cz5T0WnnEPn5l4lsShoE4qZc2c16cC9vlc0sCKL5hNv29D6U8fMtf
         4sfq6tuihuY1CRyX7FUEaNd8AL93lBW7ppHVA+xNlYsfhjefICyDvnsFFhp/8iVkPtLs
         HqiePVtWrhRNoNJt5+yxE/XwPl4I1EbMvBMuhMhsZoIhqcjxFV2fbfS+edmyUUAIV2yN
         9Oa3uzcKWSGKlopDy7RWkqTa+Hc5lZ6Z/yrC7rKpxfBE0G73SCNNyzUhtL/S0CNBJXk8
         4BeTeTwrJ9WKvLZozkjLcP5wGu7ac0JR8vLt2FEomIH9pUfDoMdh8oxQPDHifTMu9Te8
         7ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S3vLFcFZJGnPiKze6/43mDjwygvEmMXKFCkx/iULFG8=;
        b=lsn4Dn3NoopsVMWVoBnBF1swVxwceRZiEKHVDvumLC0E7kPnCcrXQmwvMSss5VfjrR
         bBZBRUXDQJ9bfKuOXDDxS/spuCN4pk4vdSmQ+BX6NCE0R2mWPHG1xLc+jRBTR0vgk2py
         Ujd/lnIwdq/s0cfPjYGgZsjyrbDWqMAjAmLai2woiia9zEaMpQxaFtNJo7aDSXJbSPGG
         dJzbh7m4Y74Sy7/0VwIWz9Z0fxYrVfahjWMB79LPkNeM4YNfUVoJ305T5owOsv5pWjCO
         tAalLmLspWXMSOE67jyJqtl/LsLwbh1nrSm8+DI9Kf7Jb9gKQLXQc/5M5FTn6z/AJjhl
         qD6A==
X-Gm-Message-State: AOAM532xdW+uzyRlUPbSwvXEH9dkJhM5RmE/LEIeYpCbloSKG40dhb6P
        Mh4wpAhUn7DVmUclssLqoS5Jvhm3bJjNXP83gEc=
X-Google-Smtp-Source: ABdhPJy9ScWKLb/I+YFqI58MNdymkzH4D94Jt3aJ5t/OnGU+A0W8jGL+oxrlYG9lRCAgEkuIUc8cNJk6E2ucy6iG9CI=
X-Received: by 2002:a05:600c:4f83:: with SMTP id n3mr10906477wmq.123.1628698574110;
 Wed, 11 Aug 2021 09:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com> <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
In-Reply-To: <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 11 Aug 2021 09:20:30 -0700
Message-ID: <CAF6AEGttQ6iiXSG78fksDo6utfa3VFwFG5yXkk9XEr=+aEL95Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
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

On Wed, Aug 11, 2021 at 5:15 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Stephen,
>
> On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> > Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > > let the DRM bridge helpers handle chaining of operations.
> > >
> > > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > > requires all components in the display pipeline to be represented by
> > > bridges.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> >
> > With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> > arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> > looking for more info). As far as I can tell, we should only have one
> > eDP device on the board, for the bridge.
> >
> > localhost ~ # ls -l /sys/class/drm/card1-eDP*
> > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> > lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> > ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2
>
> Indeed.
>
> Does the display driver use the DRM connector bridge helper and
> DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?
>

There haven't been any recent changes about how we attach the bridge,
it doesn't pass DRM_BRIDGE_ATTACH_NO_CONNECTOR.. tbh I've not been
having time to follow too closely the recent changes with bridge stuff
myself.

But now with this patch we have both the ti bridge and the panel
bridge creating a connector..  removing the connector created by the
ti bridge "fixes" things, but not sure if that would break something
on other platforms.  I guess there should now always be a panel
bridge, so removing ti_sn_bridge_connector_init() would be a sane
thing to do?

BR,
-R
