Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8391E4E5ADA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 22:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiCWVtZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 17:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345025AbiCWVtY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 17:49:24 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD678E18A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Mar 2022 14:47:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id d10so5495158eje.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Mar 2022 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFPXmPT7/mwXkkz89BQ6Ja5ArCL0mt2OdL/RGrBAAyM=;
        b=OFCDwRlZ4PBEwBgRJ2fN0hWjPJeC4zcCImAwyCHTlIWxjUu97sa7XaKAMJN7NAkvb5
         D6SKJzYDt9JZr7b+KOER1At1m32cTeKX5DOzzThOMZXnDIWZsi2YCsQ05+hwPXQ6vtC5
         Gl5BfMsmzcGr4ViX9uMIBY4qmJd80xnnpWddw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFPXmPT7/mwXkkz89BQ6Ja5ArCL0mt2OdL/RGrBAAyM=;
        b=GbiIHl4P/+d3uilNuRIyXE0Syi28ryx3YRErtM/bhS8u1pbq9ysjD9xXAqIcLXacTe
         1QegRaQZFhETyjcN1oPcntjO4Y097o6FX3N2hVUZ+siwHzsIFc+6S/L4jfgI22PreZ2e
         sbjM9n6nWwNkm7/OFpSzUAC13M85v3ERBdN+OfM8TrCbfulebiT+dgSGaJ8whJnnJu1r
         9sRVBflPaLp5SF5DEEdLYx0bvwWquAMh+jO8LQhDgDY0UU4sgIL+WTy21vsTe/oAGFY3
         VI+iG7Gb9y2TlDFZsxWYKTL4cImz6Gs2UXhHe3OXqPrXZ3LAwvLK703lGPdR1cZtS4Sy
         vi3Q==
X-Gm-Message-State: AOAM530o/hlcu4ceXSnq5LVwDecCCJj/9pQ3jIxxXU1kW3P9VrawSZ8N
        zF28UYl7awVqq2vSAn0Jp06+bXvqOOZedQb7
X-Google-Smtp-Source: ABdhPJw86rX9Fhqk0cItnzWQYyD21Uzd12leGU7AdwJQsPdVa8p3XleEcKJp/N+xGSEqUlj0fbKSBw==
X-Received: by 2002:a17:906:4fcc:b0:6e0:3269:2054 with SMTP id i12-20020a1709064fcc00b006e032692054mr2276484ejw.117.1648072072050;
        Wed, 23 Mar 2022 14:47:52 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id r19-20020a17090638d300b006d6e4fc047bsm392361ejd.11.2022.03.23.14.47.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Mar 2022 14:47:51 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id m30so4039904wrb.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Mar 2022 14:47:51 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr1701592wrc.513.1648072070767; Wed, 23
 Mar 2022 14:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com> <20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220317131250.1481275-3-kieran.bingham+renesas@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 Mar 2022 14:47:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwThyeZ-LFvxD9RYA=_T7aycbE84QYSjA7crkAwv=2fQ@mail.gmail.com>
Message-ID: <CAD=FV=XwThyeZ-LFvxD9RYA=_T7aycbE84QYSjA7crkAwv=2fQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
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
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
>
> Changes since v2: [Kieran]
>  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
>
> Changes since v3: [Kieran]
>  - Remove PM calls in ti_sn_bridge_get_edid() and simplify
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
