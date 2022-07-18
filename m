Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44DF2577FA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 12:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbiGRK14 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 06:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbiGRK1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 06:27:55 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C1E1ADA9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 03:27:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ss3so20312337ejc.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=;
        b=O1fWCAkBCBjaVHiCup0ZmH/N0dZjjnk8aMiNo1KKm0RxB6jzXedELhA6uI/knC6r9L
         0MKPBFWRTYiA27OzzbGTrKW+tNpF/1xlJz1QmqJyJrDjwKgNxl8GGghjaa/y8/vj8LfV
         MQhg462eUZuNrg68b5LDq+awrYHNUF70ZvgFSJL23xr+/54PP0W/0CfAKWPm/vBaDm5P
         N3/+gCpP8BDS4q9hT3D/nnz+aOW20DH+MJ/qUK1BoSPXricdeu0/a8nlDMAw/8t5nHBq
         b2RuCbmDv19ABez4bnNHBHaPetb4YrpuhtTXsu8pFGwuStJngTetANyB+kLSO+C6FjBa
         hhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aGrUsGmEyzfhhFC6yht8UK4tIhUB5L2Yyj7VtUSkBjg=;
        b=c5B7J5+/QSd+yWP1bOQOu4Fzd5CH4s2dZJiQEFebRBEE98Qfvlvh5bK9xSfICQAQXB
         u+UOiHAjgIrNqkXGO47SA4cOdFLPylWfk5HHXy5q8aaAHWLf6Pn0QiyDJ4/a5XbRpmKb
         EJmcqTbh82OyBIc3sfBEgPqtQPuy+H5SQ5twBnVbamDGtsBNVc2SYPzBmYNY0bp6Mtie
         K5eArsqPUPHEsImKGNzeIXEyRlIKwU23TkFOK34TlpMrQyBFgjm4WJGXjYNWUpNdjnvA
         pD1XUwsCZRolllUtqn+Q8O7UlRfXRte84SpPy8R9SJ8aO7b3nRhMeDK7DO4SvlNSzrkb
         MSUA==
X-Gm-Message-State: AJIora+KCpHbHZHp9S/UgDy6zalrz7h/LEIWLEbWFV7xmfreySVR5LTK
        GwxckEYLihlmiE97ij2QlRuTlMrUpOSvsX0AxMrFgQ==
X-Google-Smtp-Source: AGRyM1u8XN9HbZjR0yF63PO6LoPm+22MOk00Hd+2NOztBbWpmbYZ5KNQImOwAhfM8IGdUgjC9z/6Om+NlLM6ztosZFU=
X-Received: by 2002:a17:907:96a4:b0:72b:647e:30fd with SMTP id
 hd36-20020a17090796a400b0072b647e30fdmr24418029ejc.723.1658140072536; Mon, 18
 Jul 2022 03:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717175801.78668-1-sam@ravnborg.org>
 <20220717175801.78668-5-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-5-sam@ravnborg.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 18 Jul 2022 11:27:37 +0100
Message-ID: <CAPY8ntB2gXoUbUJhDLWVX3szaEKKKhnOO-qsKRZkMp1jDOt0Qg@mail.gmail.com>
Subject: Re: [PATCH v1 12/12] drm/todo: Add bridge related todo items
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Philip Chen <philipchen@chromium.org>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sam

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add todo in the hope someone will help updating the bridge drivers.
>
> v2:
>   - Updated descriptions in todo.rst
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  Documentation/gpu/todo.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 10bfb50908d1..fbcc232e0bc1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -480,6 +480,26 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
>
>  Level: Starter
>
> +Drop use of deprecated operations in bridge drivers
> +--------------------------------------------------
> +
> +&struct drm_bridge_funcs contains a number of deprecated operations
> +which can be replaced by the atomic variants.
> +
> +The following is more or less 1:1 replacements with the arguments
> +and names adjusted:
> +* pre_enable => atomic_pre_enable
> +* enable => atomic_enable
> +* disable => atomic_disable
> +* post_disable => atomic_post_disable
> +
> +* mode_set is no longer required and the implementation shall be merged
> +  with atomic_enable.

The dw-mipi-dsi and msm DSI host controller bridge drivers are
currently relying on mode_set as a convenient hook to power up the DSI
host prior to pre_enable of the bridge chain. Removing it is therefore
going to break those.

There is a proposed mechanism to allow for the removal of this hack
[1], but it's still waiting on R-B tags and/or discussion from bridge
maintainers (gentle nudge as you are one of those maintainers).

And do you mean merge with atomic_enable, or merge with
atomic_pre_enable? atomic_pre_enable would be more applicable for
almost all the bridges I'm aware of as they want to be configured
before video starts.

Cheers,
  Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2022-March/345466.html

> +Contact: bridge maintainers, Sam Ravnborg <sam@ravnborg.org>,
> +         Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +Level: Beginner or intermediate (depending on the driver)
>
>  Core refactorings
>  =================
> --
> 2.34.1
>
