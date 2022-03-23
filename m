Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339F84E5AD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 22:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345016AbiCWVtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 17:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345008AbiCWVtE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 17:49:04 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E2C8E1B2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Mar 2022 14:47:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h1so3480638edj.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Mar 2022 14:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rpLwbK3ZnF+KGIeTyi7JNaXNXc/YWjWIzY7cGfQ2thU=;
        b=h9CHNPAQ59ce5gX3E3LT7N4cDZX1qchaMgh3A5YmdHQ4QDZBFl/0mMp+tdW0oqGKqU
         GTnYaCQVfa+GI9VYPsnlf2uq/sE/M1KX/IqMVW7rwPFtP0S5ops03rpEgo3PT7MDeyrS
         DLhaTFlm20CZbBmtPVCo5pv+38jIh7WjTd/KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rpLwbK3ZnF+KGIeTyi7JNaXNXc/YWjWIzY7cGfQ2thU=;
        b=BL2l36jI38FXUO/J/04JTP6dbPmrre7mYEx5Mv6/8iMIC/6NFaHGHJYfatwLRBLOkL
         klTZg0mBWOVO1bPJDlcZoCtb4qI1tVGvsb1FyUdz8YcxmksJfxggSJ/cTbxQGHZ0l0mq
         gcXAZdQbi+hF0UU6gKaKDL7UM1NpDJrPXy+fxv1U+lxv82KmgccTzztPBbHBBIPtk5ii
         xR810i0ukKKRQ2i80iKdmsOa4xehnTsr+3eKxUfjXjicA4beWsjizOqu6IYlP0VkKV0G
         q8bTZhkPXgAqatiKTXHamJMbUy+xiV/LvdM9U0yGXfNp9MUH6momAqI+ax5I2OMBI5vz
         zgXg==
X-Gm-Message-State: AOAM5315vYCe1j63iJUE9wzpFoLDYcT30IMfWX5jOdYcYpzqth1uFhPm
        bAha5JmZogP1kVxgrL50mzQZ+zKbwpr5jA==
X-Google-Smtp-Source: ABdhPJx9pJ5Azd9C9qOzHi7VYtDtPYVYtEu3tccDeW0p7j+d6QUg6PLHQhD/mIWjmTQAPiHPAtITgA==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id g9-20020a056402090900b00415cdbf4748mr2735035edz.395.1648072051080;
        Wed, 23 Mar 2022 14:47:31 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id z11-20020a50e68b000000b00412ec8b2180sm487153edm.90.2022.03.23.14.47.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 14:47:29 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id r64so1711118wmr.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Mar 2022 14:47:29 -0700 (PDT)
X-Received: by 2002:a05:600c:2e02:b0:38c:8390:d8ca with SMTP id
 o2-20020a05600c2e0200b0038c8390d8camr1947078wmf.15.1648072049203; Wed, 23 Mar
 2022 14:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com> <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Mar 2022 14:47:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
Message-ID: <CAD=FV=WmkYg33qsXS4znQ8K2H0xVhJfZoPC+HjKt-rPhZ_R4KA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Mar 17, 2022 at 6:13 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> @@ -1241,9 +1350,32 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
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
> +               ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
> +                                               ti_sn65dsi86_irq_handler,
> +                                               IRQF_ONESHOT, "sn65dsi86-irq",
> +                                               pdata);
> +               if (ret)
> +                       return dev_err_probe(pdata->dev, ret,
> +                                            "Failed to register DP interrupt\n");
> +
> +               /* Enable IRQ based HPD */
> +               pdata->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
> +               /*
> +                * Keep the IRQ disabled initially. It will only be enabled when
> +                * requested through ti_sn_bridge_hpd_enable().
> +                */
> +               disable_irq(pdata->irq);

Instead, I think you should use `IRQF_NO_AUTOEN` which makes sure that
no matter what the state of the hardware is your IRQ won't fire
"early". ...and, of course, it saves a line of code. ;-)

Other than that this looks nice to me now so feel free to add my
Reviewed-by tag after the above is fixed.

-Doug
