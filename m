Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD92C4D5537
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 00:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344642AbiCJXXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 18:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344617AbiCJXW5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 18:22:57 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1BA166E14
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:21:55 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id y22so8946346eds.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PRoRNGVXeBqETfXyFZpgopVazVuZfI/uR73/ovgOFQY=;
        b=L+XUhuaJEipGfKdRYP0YvnmyWyW5lJGOgrzwPa/o+u54QQq4AWVLuHZIvZC0accbpV
         /aSkWVCNDX5cWh2Oc/bP8q8fVsVfvhNyxEAA0ntZB5Npfw7O7eGWb8juxgdRF+bhNvrz
         4Qyf1P6BcBPB2zHBxj/u0XbE8pSOhuWI0rq/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PRoRNGVXeBqETfXyFZpgopVazVuZfI/uR73/ovgOFQY=;
        b=HsTM3LSUfw6c6En4bimTZHvFhLoWXNuU2ykGxEux2WR2/R7WZ9zzERd16rV1TIKAGv
         O/MHPgmdRxdJpYihdQ7W3pAzGicnSYfzNP6LfpXILE5m2kv4Nk8L2zSobMfgAxLtGV4+
         EEZlF71nkRLK8JndziQFNGa8PUVkKyQFrX/eIb/ZgDfJV2x8BmN7GKn2HindiIkoxukO
         lwK9Mh8RWws/HgZSoKezUj03/cwM9MVyhPUmBgSCY6YmwaL0ZvUIae8ZNqjvs7R3++Uq
         v79Lwi/d9lEUrqxLbD+1MF3JU6XOrQmVIvb1kTYYvVGpR7cWFjYnCGGbuw6WA4plStCg
         sGHQ==
X-Gm-Message-State: AOAM5337yu9gNNLD1niUgLuZKWl6IIJJXKBbY6AGRPOE1ELBHC7/wKgd
        f/OzAhAg+RufGOf245PEdeHI26POSk3wwQdedMQ=
X-Google-Smtp-Source: ABdhPJz/bqukAbyq1cONsRwKeh+voNXqjvAGLdPJvKLADOXKrZa8657aJft8ksmQ0oa4WnNreOFDAQ==
X-Received: by 2002:aa7:c793:0:b0:408:4a69:90b4 with SMTP id n19-20020aa7c793000000b004084a6990b4mr6490383eds.58.1646954513648;
        Thu, 10 Mar 2022 15:21:53 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id m24-20020a170906161800b006d420027b63sm2246149ejd.18.2022.03.10.15.21.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 15:21:52 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so4388034wmp.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Mar 2022 15:21:51 -0800 (PST)
X-Received: by 2002:a7b:c042:0:b0:389:7336:158b with SMTP id
 u2-20020a7bc042000000b003897336158bmr5478597wmc.15.1646954511190; Thu, 10 Mar
 2022 15:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 10 Mar 2022 15:21:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U3fLvixpJfGxzmJd89+yVEDgbNYPsfJtq92QObUxw=3A@mail.gmail.com>
Message-ID: <CAD=FV=U3fLvixpJfGxzmJd89+yVEDgbNYPsfJtq92QObUxw=3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] drm/bridge: ti-sn65dsi86: Support non-eDP
 DisplayPort connectors
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
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
> Implement support for non eDP connectors on the TI-SN65DSI86 bridge, and
> provide IRQ based hotplug detect to identify when the connector is
> present.
>
> no-hpd is extended to be the default behaviour for non DisplayPort
> connectors.
>
> This series is based upon Sam Ravnborgs and Rob Clarks series [0] to
> support DRM_BRIDGE_STATE_OPS and NO_CONNECTOR support on the SN65DSI86,
> however some extra modifications have been made on the top of Sam's
> series to fix compile breakage and the NO_CONNECTOR support.

This confused me a little bit. As far as I know Rob's series is
abandoned and he's not working on it. I assume that Sam will
eventually re-post his series, but it had unsolved problems and the
bpp solution he had totally didn't work because nobody was setting
"output_bus_cfg.format" [1]. Did you solve that? ...or you're just
going to let your patches sit there and hope that Sam will solve the
problem and re-post his series?

I'll admit I didn't go through your git tree to figure out if you
solved it some way. If you did, I would have assumed you'd have
re-posted his patches in your series w/ the solution...

[1] https://lore.kernel.org/r/CAD=FV=WW6HWLOD9AzTpjwva9UHY=AR+LABEWqJQznz6Nbb4sOw@mail.gmail.com/

-Doug
