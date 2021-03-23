Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDA9346AD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Mar 2021 22:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbhCWVJC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Mar 2021 17:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbhCWVIz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 17:08:55 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB82C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:55 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id by2so11221323qvb.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQwheX+ZOdsLRvA7XPASIVaHFFt/8Y47I6o+aENus34=;
        b=FxoCgZ66CW4DEmPHCY36UziylrUzDCKhrdi+/rBZqANTFV3kACH/P/9Cm35U6ZrXt7
         lebhYaqTec4eHBmwZucO69qCPAaky9irljkPvIZtE4z+NPF/8o/Ua2IsC7yP+cgyJysE
         ibZdoKOJCd3A1z5FR5scNPjOAOZ/gBAEqp50k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQwheX+ZOdsLRvA7XPASIVaHFFt/8Y47I6o+aENus34=;
        b=fsPxL2q4zsLV9+cXCc+2Jand+6pdNEc0Z7M1ff1KM/5Pvx8PamK83YBq4tBMORt+k1
         rNgaWnXuH0RhgqTQcEQqnoq7UAWzAso4UnwGhnE2bgDwJMX8QI6rOU0phVOKjqcyouGf
         QtJKRu/Fw1we22EmdaejXcDAwMWEY3lbbIgzBgssOX6Vjpc89S8Mij3XWRXwIIlY1Gqi
         e7yBsJk2b5WC7f54KG3xGYX7wPp30xrUmnXSmHRDL4VxfTUW+0YdgZvff72ptsXaqttF
         B5xOuI1+ZUbyjTRqFKeIKFHPBhH5QTXjTIrmHY9m4Q2vuItoNBCEBGXo6QERZYkPIWWw
         +VrQ==
X-Gm-Message-State: AOAM531e9ECErC+xekwmYkHIp7esugNJQCsq5WBdChaViJSssstNeryL
        EEfYZiwL/F/xCCf7lkozBNO2ANa3TRCftA==
X-Google-Smtp-Source: ABdhPJzo7qkE+5sp6/01SCHYBTJ1+oqlyUHXCM0pcInVF0UVaxxV+hqlsyDKWnPewlsBEF+nAWczQw==
X-Received: by 2002:a0c:c488:: with SMTP id u8mr6586681qvi.47.1616533734377;
        Tue, 23 Mar 2021 14:08:54 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id a138sm96121qkg.29.2021.03.23.14.08.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 14:08:53 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id m132so11827826ybf.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 14:08:53 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr270728ybi.276.1616533733297;
 Tue, 23 Mar 2021 14:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Mar 2021 14:08:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
Message-ID: <CAD=FV=W-+aS25wtnSmF8tWSDHTdNCjbFj0x02-1iqZ2p5qYzyA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/11] drm/bridge: ti-sn65dsi86: Unregister AUX
 adapter in remove()
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The AUX adapter registered in probe() need to be unregistered in
> remove(). Do so.
>
> Fixes: b814ec6d4535 ("drm/bridge: ti-sn65dsi86: Implement AUX channel")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index da78a12e58b5..c45420a50e73 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1307,6 +1307,9 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>                 return -EINVAL;
>
>         kfree(pdata->edid);
> +
> +       drm_dp_aux_unregister(&pdata->aux);
> +
>         ti_sn_debugfs_remove(pdata);
>
>         of_node_put(pdata->host_node);

Good catch. One question, though. I know DRM sometimes has different
conventions than the rest of the kernel, but I always look for the
"remove" to be backwards of probe. That means that your code (and
probably most of the remove function) should come _after_ the
drm_bridge_remove(), right?  ...since drm_bridge_add() was the last
thing in probe then drm_bridge_remove() should be the first thing in
remove?


-Doug
