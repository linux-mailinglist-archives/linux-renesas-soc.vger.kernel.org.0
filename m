Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB885A5354
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 19:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbiH2Rig (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 13:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiH2Rid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 13:38:33 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41A09C1E4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:38:32 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id l16so4598875ilj.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0+dkz4XT6BC4woJUmIQjGs5an3772GdVi3+4JHxH154=;
        b=jbD2DuLHNNYoihk4LzL8I7Rt2XeDGhNOfaP5FSWQL18m6CJvxeqsk6NGNJc3pKMtCB
         qtyQY3mOVVMX/c7sISFt7WI40F5epfGh8PWqzimVQOsAGYrV/Z79EW/tCKw8qiEV134+
         BKJdoB3L3nm4raYojrDfvbo+x4qqgeo9DxO6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0+dkz4XT6BC4woJUmIQjGs5an3772GdVi3+4JHxH154=;
        b=OF/ZC1GxIFA5I8FO8XIZcRZsJaqXSNyPSc6qj0PzLij5FiemvBcFZJMiQdrkRhyc+d
         SEcGSeTGQE3LzHNvJT7GkKo+wAt7Njc80Xklhdd/4XOrL1T2zvpr2avjEWXbHyowwa7W
         2mfoe6/LqGu344gHIjUyGxF1sYyonSwFjkS1wD3XElDpOoDAOth1dF5FOMhAm3vPG9C+
         M2y19VtvUxwXWK7on8MiFRf4pepAP0IYplHLzLEqAeVIuvacdSn1G3RgKGukcg8iNTax
         EljDynYVxkiyozdrgm+/cIOuHF807l5CsYpqQMfNr6DGZRsGb7noEb2fQz0WVqsB9fVn
         JdNw==
X-Gm-Message-State: ACgBeo27W8sVJL4gtueUFzfkh2ETBYDmOq4PzIvQ/l+1LEZpvfqigP78
        KQjdEtFp/x/m4kb32m0XRlmSqCRXatq3RDWe
X-Google-Smtp-Source: AA6agR7ohF4fnjlRVa//V56xoRZ7M3yeV6Cmbxc657pNFPnd5ZeCSTMcDY1KtBO5Y0aufvTTbh820g==
X-Received: by 2002:a05:6e02:b2b:b0:2eb:1aaa:589a with SMTP id e11-20020a056e020b2b00b002eb1aaa589amr2573993ilu.63.1661794711743;
        Mon, 29 Aug 2022 10:38:31 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id i20-20020a02ca14000000b0034a5993e1b5sm11960jak.113.2022.08.29.10.38.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 10:38:29 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id q81so7162914iod.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:38:29 -0700 (PDT)
X-Received: by 2002:a05:6638:14d0:b0:349:d176:d376 with SMTP id
 l16-20020a05663814d000b00349d176d376mr9909135jak.58.1661794709288; Mon, 29
 Aug 2022 10:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com> <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Aug 2022 10:38:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
Message-ID: <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() and .detect()
> operations, and report the related bridge capabilities and type.
>
> These ops are only added for DP mode. They should also be used for eDP
> mode, but the driver seems to be mostly used for eDP and, according to
> the comments, they've had issues with eDP panels and HPD. So better be
> safe and only enable them for DP for now.

Just to be clear: the "They should also be used for eDP" is not correct.

* The detect() function should be returning whether the display is
physically there. For eDP it is _always_ physically there. Thus for
eDP the _correct_ implementation for detect is to always return true.
Yes, there is a line called HPD for eDP and yes that line is used for
full DisplayPort for detecting a display. For eDP, though, HPD does
not detect the presence of a display. A display is always there.

* For eDP implementing get_edid() is done in the panel so that power
sequencing can be done properly. While it could have been designed
other ways, that's how we ended up in the end. Thus eDP controllers
don't implement get_edid().


> @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       int val = 0;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> +       pm_runtime_put_autosuspend(pdata->dev);
> +
> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> +                                        : connector_status_disconnected;
> +}

I thought in the end we decided that you _could_ get a hot plug detect
interrupt if you just did a pm_runtime_get_sync() sometime earlier in
the case of DP. Basically you're just saying that if you're DP that
you always powered up. Doing some searches makes me find some
discussion at:

https://lore.kernel.org/r/20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com

Specifically, the right answer is: "In general the pm_runtime_get
reference need to go with the IRQ enabling"

In any case, if we want to start with just implementing "detect"
that's OK with me...

Thus with the commit message clarified, feel free to add my Reviewed-by.
