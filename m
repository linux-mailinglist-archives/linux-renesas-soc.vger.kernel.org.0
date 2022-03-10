Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 944104D551A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 00:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239444AbiCJXLc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 18:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbiCJXLb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 18:11:31 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A28199E25
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:10:29 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id dr20so15333800ejc.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTE9rVnkuj0LMpq7vU2LRlI4AFYhtjIA8F1mGbD5ltU=;
        b=c3ixXJGaiHRNX5hUWR2fAaOhNH1oY3csULtltMrpIqFAz++28BEFtjoaWM8eULXtd8
         n42vvgEgHkHw02bkBUiRN/KKqskZFiaWyb4b9QGGCLlwPHmJXuHKDqaukcMmsEneUHH/
         H8XtQhxleMXO1GBeCldLEqsziE+l/81y9MxWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTE9rVnkuj0LMpq7vU2LRlI4AFYhtjIA8F1mGbD5ltU=;
        b=NA6OJ/nNFqhPuRfW/dIdz7+2s2xYMT/sYQqREPvAeZeyr7+5M2qrWCDayRnSEDn37S
         I/VgmG7VVnwDdQP81dzDMoud4FmCM3x6QVqTGb3bFeYxf2NJy6WyaIqcur0HW0BrCwE2
         OjM/fs8z2O4JQXrw+K+9S8Hhp8QjZbVpVS7mRwDhVcSWv6LMpWMOW+u13AY93sTmskmr
         y3A3BUlG0iHxnmAJpd5MvhIZXejBAIu143AALa43S1x6F+ev3RHvaUbKlRTFGl8me2p2
         YTJyLzLdMdWv1gph8bRltmaRs6NpRC3ZisxrBD+l7yVuOlu8nZzz23zCKu0meRGuSNXd
         ircQ==
X-Gm-Message-State: AOAM5321OLCnrXoOTI9rdewLBQn+0tngFTUnC8c6eS6wgEbTQ+xt1jDd
        vbxHkOQXT1UytexCn3nmeNLu2iI7Ptt97ph0
X-Google-Smtp-Source: ABdhPJw54V5UIRleV5v2XFEa3wygiBixsaMMVcq3V82m0fxCcUU/rgyPAaB4j5hpy/GHgz37fKAS+g==
X-Received: by 2002:a17:907:6d9d:b0:6da:7d4c:287f with SMTP id sb29-20020a1709076d9d00b006da7d4c287fmr6152191ejc.741.1646953827242;
        Thu, 10 Mar 2022 15:10:27 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id q5-20020aa7cc05000000b004129baa5a94sm2512860edt.64.2022.03.10.15.10.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 15:10:26 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so4416196wmf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:10:25 -0800 (PST)
X-Received: by 2002:a7b:c042:0:b0:389:7336:158b with SMTP id
 u2-20020a7bc042000000b003897336158bmr5455866wmc.15.1646953825247; Thu, 10 Mar
 2022 15:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com> <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Mar 2022 15:10:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
Message-ID: <CAD=FV=UqTh-FLDyXvH=ED-4cbJ6ggDLsTGqhTeqNMsKDphbzYA@mail.gmail.com>
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

On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> @@ -1135,6 +1161,36 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       int val;
> +
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);

Don't you need a pm_runtime_get_sync() before this and a
put_autosuspend() after? The "detect" will be used in the yes-HPD but
no-IRQ case, right? In that case there's nobody holding the pm_runtime
reference.

Also, a nit that it'd be great if you error checked the regmap_read().
I know this driver isn't very good about it, but it's probably
something to get better. i2c transactions can fail. I guess another
alternative would be to init "val" to 0...


> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> +                                        : connector_status_disconnected;
> +}
> +
> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +
> +       /* The device must remain active for HPD to function */
> +       pm_runtime_get_sync(pdata->dev);
> +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG,
> +                    IRQ_HPD_EN | IRQ_HPD_INSERTION_EN |
> +                    IRQ_HPD_REMOVAL_EN | IRQ_HPD_REPLUG_EN);
> +}
> +
> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +
> +       regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
> +       pm_runtime_put_autosuspend(pdata->dev);

Before doing the pm_runtime_put_autosuspend() it feels like you should
ensure that the interrupt has finished. Otherwise we could be midway
through processing an interrupt and the pm_runtime reference could go
away, right? Maybe we just disable the irq which I think will wait for
anything outstanding to finish?


> @@ -1223,6 +1282,34 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
>         return 0;
>  }
>
> +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> +{
> +       struct ti_sn65dsi86 *pdata = arg;
> +       int ret;
> +       unsigned int hpd;
> +
> +       ret = regmap_read(pdata->regmap, SN_IRQ_HPD_STATUS_REG, &hpd);
> +       if (ret || !hpd)
> +               return IRQ_NONE;
> +
> +       if (hpd & IRQ_HPD_INSERTION_STATUS)
> +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_connected);
> +
> +       if (hpd & IRQ_HPD_REMOVAL_STATUS)
> +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_disconnected);
> +
> +       /* When replugged, ensure we trigger a detect to update the display */
> +       if (hpd & IRQ_HPD_REPLUG_STATUS)
> +               drm_bridge_hpd_notify(&pdata->bridge, connector_status_disconnected);

How does the ordering work here if _both_ insertion and removal are
asserted? Is that somehow not possible? Should this be "else if" type
statements then, or give a warn if more than one bit is set, or ... ?


> +       /* reset the status registers */
> +       regmap_write(pdata->regmap, SN_IRQ_HPD_STATUS_REG,
> +                    IRQ_HPD_STATUS | IRQ_HPD_INSERTION_STATUS |
> +                    IRQ_HPD_REMOVAL_STATUS | IRQ_HPD_REPLUG_STATUS);

IMO this regmap_write() belongs right after the read and should be
based on what you read--you shouldn't just clear all of them. AKA:

a) Read to see what interrupt are asserted.
b) Ack the interrupts that you saw asserted.
c) Process the interrupts that you saw asserted.

If you process before acking then you can miss interrupts (in other
words if you do "a" then "c" then "b" then you can miss interrupts
that come in after "b" but before "c".


> @@ -1247,9 +1342,29 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>         pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
>                            ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>
> -       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
>                 pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
>
> +               if (!pdata->no_hpd)
> +                       pdata->bridge.ops |= DRM_BRIDGE_OP_DETECT;
> +       }
> +
> +       if (!pdata->no_hpd && pdata->irq > 0) {
> +               dev_err(pdata->dev, "registering IRQ %d\n", pdata->irq);
> +
> +               ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
> +                                               ti_sn65dsi86_irq_handler,
> +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> +                                               pdata);
> +               if (ret)
> +                       return dev_err_probe(pdata->dev, ret,
> +                                            "Failed to register DP interrupt\n");
> +
> +               /* Enable IRQ based HPD */
> +               regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);

Why not put the above regmap_write() in the ti_sn_bridge_hpd_enable() call?

-Doug
