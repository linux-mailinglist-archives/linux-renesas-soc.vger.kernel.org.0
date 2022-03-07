Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3A74D0BF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 00:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234371AbiCGXWj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 18:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242042AbiCGXWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 18:22:39 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE72E49F06
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 15:21:43 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id bg10so35398341ejb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 15:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4LLMVs4SZ7QvseE6w5ftUNf9lVckC3RDBoYM0EFIDE=;
        b=ThMD+dbiLXkBNHXSUOp/TCqN39zftsJ2YeoVnCSVRgksqbEwShSMTLMQDxtpotpDPI
         UtnheIGCjS5S5J36Kmgg7Zfy4E31WE+cUU29Dkzdp6LTbSPvQbRzG+9UB5nzl+rHxN5d
         4dhxTaH+VrgM2Coi5dOnGVG7q5i2qwGS7J9MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4LLMVs4SZ7QvseE6w5ftUNf9lVckC3RDBoYM0EFIDE=;
        b=yvPtBCAkZU7I8IixKqSPmmtN5ecSgDBaY74VakduoCgJKRWyAxpxRU7e2jHgktcFI6
         KjTPwJKGyWNNbHZJl5W9I2LkcgTFccVabnhYtwCUgKBF5I50v/6ahOln7MJQfFVUQRK1
         WuogII9j59qY0OBqEacYJ4TQjrU/ZWi8u4QMIw6r9HOeR613fU/ceWrp/Ax3VoyHiF7T
         +0SlVfsLvnK2V89VfoCUkiXZzP3mgoruwi8FkPSH+pODeADkLZccHLYZ5RfVf9k6mXrJ
         IKXdGK1VyrDkZLkDzqeUe6LTdq9A0Mq1zp1vC4N8xz+aWhxg/JZYwLlrMScaF+tDFPXQ
         XTjw==
X-Gm-Message-State: AOAM5329nxM+S6c4QZmlS7OPeldfwusCnUus/fj9o9Afh8UW7uSelQeF
        Q2GcKAhuJQYS3whaUrhYPUe6X8o6JGU8Tz5L
X-Google-Smtp-Source: ABdhPJy8SfxZ6l4p1x5TU/IQcT3lPsKKyUx3UqsLK+c6w/N4uCq3vDaxF5kO9ZRw9pG9M6FXWd1ciQ==
X-Received: by 2002:a17:906:edbd:b0:6b6:bd54:235c with SMTP id sa29-20020a170906edbd00b006b6bd54235cmr11021030ejb.363.1646695302120;
        Mon, 07 Mar 2022 15:21:42 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id k20-20020a170906681400b006da86bef01fsm5224548ejr.79.2022.03.07.15.21.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 15:21:41 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id c192so10125052wma.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 15:21:41 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr1108164wms.88.1646695300817; Mon, 07 Mar
 2022 15:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com> <20220307175955.363057-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-3-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Mar 2022 15:21:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5VPogd4Lf9TRhpqdpfyhxArkS=fgfXMJa-hC-JqnW1Q@mail.gmail.com>
Message-ID: <CAD=FV=U5VPogd4Lf9TRhpqdpfyhxArkS=fgfXMJa-hC-JqnW1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: ti-sn65dsi86: Make connector creation optional
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Now that the driver supports the connector-related bridge operations,
> make the connector creation optional. This enables usage of the
> sn65dsi86 with the DRM bridge connector helper.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> ---
> Changes since v1:
>  - None
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

Can you please CC me on this series next time you send it out? I was
pretty involved in previous reviews here. Luckily I got CCed on one of
the patches so I knew to look, but since that one is (probably)
getting dropped it'd be good to make sure I was on the others. It's
also pretty important to include +Sam Ravnborg since there's a lot of
overlap with his series [1]:


> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ffb6c04f6c46..29f5f7123ed9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -745,11 +745,6 @@ static int  (struct drm_bridge *bridge,
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>         int ret;
>
> -       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -               DRM_ERROR("Fix bridge driver to make connector optional!");
> -               return -EINVAL;
> -       }

That won't work without some other fixes, sorry!

The problem is that you'll break ti_sn_bridge_get_bpp(). That
absolutely relies on having our own connector so you need to fix that
_before_ making the connector optional.

Rob Clark made an attempt on this [2] but Laurent didn't like the
solution he came up with. Sam's series that I mentioned [1] also made
an attempt at this, specifically in patch 5 ("drm/bridge:
ti-sn65dsi86: Fetch bpc via drm_bridge_state") of his series.
Unfortunately, it didn't work because the "output_bus_cfg.format"
wasn't set to anything. Personally I wouldn't mind Rob's solution as a
stopgap if Laurent removes his NAK. Then we're not stuck while someone
tries to find time to fix this correctly.

One last problem here is that your patch doesn't actually apply to
drm-misc/drm-misc-next, which is likely where it would land. I believe
it conflicts with my recent commit e283820cbf80 ("drm/bridge:
ti-sn65dsi86: Use drm_bridge_connector"). It looks like you based your
series on mainline, but you should really be targeting drm-misc-next.

-Doug

[1] https://lore.kernel.org/r/20220206154405.1243333-1-sam@ravnborg.org/
[2] https://lore.kernel.org/all/20210920225801.227211-4-robdclark@gmail.com/
