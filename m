Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46ABE4D6483
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 16:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbiCKP0R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 10:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349060AbiCKP0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 10:26:17 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3CD1C1AD1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Mar 2022 07:25:10 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id kt27so19959315ejb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Mar 2022 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zwx2dquPgXqVb9I6BHmiQ+yT5s0mktYKdstbqhp11lo=;
        b=LZw05L5Lr1SXFIo6n9NicjBiQs9xio5ncAzPl86VwNojgxdv5FPbVwMMXuEcJz2S20
         ot3tgRK3A5u9pbBVwcgTi2rS4v13JgC5uYbnVZmyUnMWKjqhW5TNSobrzT5CLci/ll6v
         VKRbsmHUHjxAMKGUnVtLcdXXgpKMegfNZ1Xz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zwx2dquPgXqVb9I6BHmiQ+yT5s0mktYKdstbqhp11lo=;
        b=KehJSgNNjITBDjSBxLFaEqt1DmAaL4BIj9GbP6IkJ2YlTQ+t3d0hjX7fjBb7rfA59r
         uQT0cV+4on4UTObvLozCTfMX9W8Mb1Tx4di3avGyF72cPhT31zWJZifLRcOsLu8F1INH
         ksqJffy1XW2fjyFUyBDIyB0h4aHPCqEM4Ff7Ld0LB+njLfWydiDkklfT390h00P+PReQ
         CuuMrROEiB1pJTC4ImK/rVAjGyHrjAYymKew8fsk65Je1kshXz3ZWkADm2dXxJ9jjL5D
         oA1J+tjzFJt0Wit8z89z6/jIVJOpTnWNIjW/zhucQytN79jIcX8mTAT8IeMj88qa6ZTt
         c9EA==
X-Gm-Message-State: AOAM532WZiV95SxTY86s1wdAN/BntI6fHGPxF9HFHctglly35m2028j3
        2/ISmvFWqeuBm1RTUpFgzw+449w6eDwuEN+hw5Y=
X-Google-Smtp-Source: ABdhPJzY26Kfml5GRRvXdXwy1a4lTcCLy+g+VGK5JlUn4ai7SnoIzK4QbTIWe4sYZbP+NL58XqStpQ==
X-Received: by 2002:a17:906:7307:b0:6da:92e1:9c83 with SMTP id di7-20020a170906730700b006da92e19c83mr8990396ejc.459.1647012308221;
        Fri, 11 Mar 2022 07:25:08 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id m13-20020a056402510d00b00416ca731b5fsm1357133edd.9.2022.03.11.07.25.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 07:25:06 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id l1-20020a05600c4f0100b00389645443d2so5550182wmq.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Mar 2022 07:25:06 -0800 (PST)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr15836065wmc.29.1647012305467; Fri, 11
 Mar 2022 07:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com> <164697764297.2392702.10094603553189733655@Monstersaurus>
In-Reply-To: <164697764297.2392702.10094603553189733655@Monstersaurus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 11 Mar 2022 07:24:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6+VdLL0UM_j++fc5Wu7akm9LyJ_Ac19VCqbgPZiw3ZA@mail.gmail.com>
Message-ID: <CAD=FV=U6+VdLL0UM_j++fc5Wu7akm9LyJ_Ac19VCqbgPZiw3ZA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Thu, Mar 10, 2022 at 9:47 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> > > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > > +{
> > > +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> > > +
> > > +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
> > > +       pm_runtime_put_autosuspend(pdata->dev);
> >
> > Before doing the pm_runtime_put_autosuspend() it feels like you should
> > ensure that the interrupt has finished. Otherwise we could be midway
> > through processing an interrupt and the pm_runtime reference could go
> > away, right? Maybe we just disable the irq which I think will wait for
> > anything outstanding to finish?
>
> Should the IRQ handler also call pm_runtime_get/put then?

I thought about that, but I suspect it's cleaner to disable the IRQ
handler (and block waiting for it to finish if it was running). That
will ensure that the core isn't notified about HPD after HPD was
disabled.  Once you do that then there's no need to get/put in the irq
handler since we always hold a pm_runtime reference when the IRQ
handler is enabled.


> > > @@ -1247,9 +1342,29 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> > >         pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
> > >                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
> > >
> > > -       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
> > >                 pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > >
> > > +               if (!pdata->no_hpd)
> > > +                       pdata->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> > > +       }
> > > +
> > > +       if (!pdata->no_hpd && pdata->irq > 0) {
> > > +               dev_err(pdata->dev, "registering IRQ %d\n", pdata->irq);
> > > +
> > > +               ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
> > > +                                               ti_sn65dsi86_irq_handler,
> > > +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> > > +                                               pdata);
> > > +               if (ret)
> > > +                       return dev_err_probe(pdata->dev, ret,
> > > +                                            "Failed to register DP interrupt\n");
> > > +
> > > +               /* Enable IRQ based HPD */
> > > +               regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
> >
> > Why not put the above regmap_write() in the ti_sn_bridge_hpd_enable() call?
>
> I assumed the IRQ handler may get used by other non-HPD events. Which is
> also why it was originally registered in the main probe(). HPD is just
> one feature of the interrupts. Of course it's only used for HPD now
> though. I guess I could have solved the bridge dependency by splitting
> the IRQ handler to have a dedicated HPD handler function which would
> return if the bridge wasn't initialised, but went with the deferred
> registration of the handler.
>
> I can move this and then leave it to anyone else implementing further
> IRQ features to refactor if needed.

Sounds good. In general the pm_runtime_get reference need to go with
the IRQ enabling, so if someone else finds a non-HPD need then they'll
have to move that too.
