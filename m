Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B7A4D0BFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 00:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243127AbiCGXXb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 18:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343913AbiCGXXa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 18:23:30 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D606378
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 15:22:33 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id w4so19606685edc.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 15:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7c0lRQq10amigm9U6do+3Ys9rNR/b4CU3fPdyFOu4gY=;
        b=HwY5GTqnDqf74vvoTyzbBQmxNTwIEvaO8ErNPwkqdmhJj9sEm6Y9G+EStOPRdb4K7S
         iNeYXpjX7AWkD3Cf5J56hkeHc87m1Wze/ve9MZEDylQ53RIwtqNduwOM1SYKpVbOImc/
         rrmWooZg1AhyGRoFUXt26TjfoiOUAyUGKf0dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7c0lRQq10amigm9U6do+3Ys9rNR/b4CU3fPdyFOu4gY=;
        b=11hD50gbi6g8UymmTsjnprruKxK40zSaXFcLrreBmMbi6w9gdt8KNxHbyxK5+Yuibt
         FvsspOYHtkeLMr6XZ691BElrgT4hYMXDsgUgXDrvOHKXUVv9QyEfTNkoaNx4X0KkdK/k
         md1JPyHVN9yL7Tbm0vhC2IN04tgHujGJB52TNEFqKXF4egGGo7Q0B5QmFoMf/SCCMPMx
         Ba0iPTFMUhMeu3Dcf2WrrDvqElvd5R/meB/vlh6gqvBkJe3c7JRmWamdx5yQu4d4Ggf8
         KM4acx6s3JEzwZMMpSQxs6MZZi7mXSjkR/bfITM9Tw6eVefky7sTR8XadRsi2Hl0Umew
         xmMg==
X-Gm-Message-State: AOAM532RMuIejUxjW+hmi9OMcNoXXTzIho+YS7eDZVrJklKuEmUQoi5D
        K69qRIW5mhviJjfTPmvKWYtndxYZpUp64RZr
X-Google-Smtp-Source: ABdhPJxt48dAi1XJaBvIdcOunv7d4hrjY9lihf9XlTUL2nW5XuE1UpGplaoCgRIhmXsHrVbxF90Erg==
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id ds1-20020a0564021cc100b004132b12fc49mr13314660edb.118.1646695352171;
        Mon, 07 Mar 2022 15:22:32 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id p14-20020aa7cc8e000000b0040f13865fa9sm6847557edt.3.2022.03.07.15.22.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 15:22:31 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id r187-20020a1c2bc4000000b003810e6b192aso400557wmr.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 15:22:31 -0800 (PST)
X-Received: by 2002:a05:600c:4ec7:b0:389:bf36:ce3a with SMTP id
 g7-20020a05600c4ec700b00389bf36ce3amr1065825wmq.118.1646695350832; Mon, 07
 Mar 2022 15:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com> <20220307175955.363057-5-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-5-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Mar 2022 15:22:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Unx5CPgVF5X9q5G3SbbqqxNpxRQYPywYHy39uqndYpgw@mail.gmail.com>
Message-ID: <CAD=FV=Unx5CPgVF5X9q5G3SbbqqxNpxRQYPywYHy39uqndYpgw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Support hotplug detection
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
        Andrzej Hajda <andrzej.hajda@intel.com>
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
> @@ -1264,6 +1321,14 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>                 return PTR_ERR(pdata->next_bridge);
>         }
>
> +       pdata->no_hpd = of_property_read_bool(np, "no-hpd");
> +       if (pdata->next_bridge->type != DRM_MODE_CONNECTOR_DisplayPort &&
> +           !pdata->no_hpd) {
> +               dev_warn(pdata->dev,
> +                        "HPD support requires a DisplayPort connector\n");

Maybe "HPD support only implemented for full DP connectors".

Plausibly someone could come up with a reason to hook HPD up for eDP
one day, but so far we haven't seen it.


> @@ -1272,7 +1337,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>
>         pdata->bridge.funcs = &ti_sn_bridge_funcs;
>         pdata->bridge.of_node = np;
> -       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> +       pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD)
> +                         | DRM_BRIDGE_OP_EDID;

Seems like "OP_HPD" ought to be dependent on whether the IRQ was
provided, right? AKA you could have "detect" because HPD is plumbed
through to the bridge but not "HPD" if the IRQ from the bridge isn't
hooked up to the main processor...


> @@ -1840,6 +1906,34 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
>                                        pdata->supplies);
>  }
>
> +static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
> +{
> +       struct ti_sn65dsi86 *pdata = arg;
> +       int ret;
> +       int hpd;

`hpd` should be an `unsigned int` to match the prototype of regmap-read.


> @@ -1881,6 +1975,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>                 return dev_err_probe(dev, PTR_ERR(pdata->refclk),
>                                      "failed to get reference clock\n");
>
> +       if (client->irq > 0) {
> +               ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +                                               ti_sn65dsi86_irq_handler,
> +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> +                                               pdata);
> +               if (ret)
> +                       return dev_err_probe(dev, ret,
> +                                            "Failed to register DP interrupt\n");
> +       }

Is this the right place to request the IRQ, or should it be in
ti_sn_bridge_probe(). As soon as you request it the interrupt can go
off, but you're relying on a bunch of bridge stuff to have been
initted, right?


> @@ -1888,6 +1992,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
>         pm_runtime_set_autosuspend_delay(pdata->dev, 500);
>         pm_runtime_use_autosuspend(pdata->dev);
>
> +       /* Enable interrupt handling */
> +       regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);

Shouldn't we only enable interrupt handling if client->irq > 0? AKA
combine this with the "if" statement?



-Doug
