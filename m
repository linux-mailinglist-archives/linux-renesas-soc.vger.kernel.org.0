Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5E84D3B76
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 21:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiCIU5R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 15:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238243AbiCIU5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 15:57:15 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E774160F
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Mar 2022 12:56:16 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id g3so4487733edu.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Mar 2022 12:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DfY+Mxn7NkrB5fGdyvJbTh9f17PHMGqPxvl1oolx27I=;
        b=YMM12oofeP4ZisQc0o+00fngPoa67Wunfv87yQhMrELImGrxMcggFfqVweYBVhKRMr
         Mnl06j/k3qCyTUI6y2d7WnZ2PyosLmB/unuVm3yoUMgvFJdOY3/Y4SQaoenp5/l9xQ/N
         NWy5YJh/3RmmlA2XNHI8wotSIPZ9le79KIVXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfY+Mxn7NkrB5fGdyvJbTh9f17PHMGqPxvl1oolx27I=;
        b=Rjt0Gw/T5b5aJzfaKyuA0WF044TIlzcMDZIBxAptdEDvaPYf7Lb2Cbrddq4HhM4yHG
         2pWNmxU95QhPQ2JnVAz204c8B501vcwi857EJSmE+nnfMM153AcZ3bPDdE2gZnAffYjw
         PuBgG/0FSv3I+LcQZI78rXsZmKwGa6YbjSK6ggKH04+hDz+eB7uAjgm0zRM9F6/7fbMN
         neIQr3UByJ7ihNJ5uysTeKzqsYiU4y/hGrzW/BQh/bLZ20/iilr7rELaNK/HerdwD8dN
         iHlE2cJjhjIeTb7ulzRQspWpvX5YD1Cj+qAhUbP/dy7mc0asPjq3BB4hxYvbi5a+TEVk
         HkvA==
X-Gm-Message-State: AOAM5318QEBBQdoOVTmhrR0l4/eI0yX37RKzMsb+rnye+OkNFWWvpVCk
        TvZALpK9v4sG1At2VaAaofIgQq9KVQZcTkmO
X-Google-Smtp-Source: ABdhPJxAMdSWC9zogI6pIHX7HuHRw9BgC6r7R+r7yxaZK7fvyni5Qp617JdJjayqB7bElccX7lCBKw==
X-Received: by 2002:aa7:d14f:0:b0:415:cf37:324b with SMTP id r15-20020aa7d14f000000b00415cf37324bmr1280649edo.263.1646859374548;
        Wed, 09 Mar 2022 12:56:14 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906739600b006db726290dcsm922088ejl.217.2022.03.09.12.56.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 12:56:12 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id u10so4902715wra.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Mar 2022 12:56:12 -0800 (PST)
X-Received: by 2002:a5d:490f:0:b0:1f0:6791:a215 with SMTP id
 x15-20020a5d490f000000b001f06791a215mr1122625wrq.422.1646859371913; Wed, 09
 Mar 2022 12:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
 <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com> <164684549417.11309.167290259626544349@Monstersaurus>
In-Reply-To: <164684549417.11309.167290259626544349@Monstersaurus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 9 Mar 2022 12:55:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WyiUijqjvRpw-9ZMvKGdPJJO3UozsX=ROSzzeRQ1bozQ@mail.gmail.com>
Message-ID: <CAD=FV=WyiUijqjvRpw-9ZMvKGdPJJO3UozsX=ROSzzeRQ1bozQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
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

On Wed, Mar 9, 2022 at 9:05 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> >> I think it was done for DRM purpose, to prevent signals meant for a
> >> panel to be connected to a device that could capture video from a DP
> >> source.
>
> Is this better:
>
>         /*
>          * Only eDP pannels which support Alternate Scrambler Seed Reset (ASSR)

s/pannels/panels

>          * are supported by the SN65DSI86. For DisplayPort, disable scrambling
>          * mode.
>          */
>
> I don't know if it answers your 'why' ... and I don't think adding
>  "We think it is for DRM protection"
>
> really suits the comment.

Yeah, that looks pretty good. ...or even:

eDP panels use an Alternate Scrambler Seed compared to displays hooked
up via a full DisplayPort connector. SN65DSI86 only supports the
alternate scrambler seed, not the normal one, so the only way we can
support full DisplayPort displays is by fully turning off the
scrambler.


-Doug
