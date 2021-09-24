Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADF74171F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 14:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343543AbhIXMjA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 08:39:00 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:39811 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245265AbhIXMi7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 08:38:59 -0400
Received: by mail-vk1-f177.google.com with SMTP id f73so3879605vkf.6;
        Fri, 24 Sep 2021 05:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=42I/j7EJUoe1na+qCjbWLO26DRP+d7+Jsq/Q0zLHtDU=;
        b=INxlBNIn5lroFdad63+AY9HCzb7+gW3EbwvlS0wa7yHSj19RRtvvXqexDl0+H2Quc5
         NEDJgLJgpLit0vHx8IKPzRw3otOqf4Y4/QDTzQdaZFjSCSDGtOCNIkqdu25uoVt/+zMe
         NtZL2wZUUw5S/nfHBIteupayuXmYu8LWKKEkM5kWmQ5pRIPrqriQbBL4BYvaqPhHCr/9
         2EbYtPM4Vk+XjhUIuNXxb5yznqPKnaq4mOZSaOW6lwkTaE22K3Joned+c6KrgEnOhtBO
         8iuRpeIj9Xwl3h1+WNQFPRf2jcsyeRxQjlHXpV8t9kd3m+30Dzc045lz2lhlV/voeV4C
         eZqQ==
X-Gm-Message-State: AOAM531GvFxqybDYEMW/WDZFyJcasjNBazZ/VGcC78dirVUoJc4QGSSH
        mTQHTWdHqFLqXncefzOp/IK43+IGm7RwbsAQV8U=
X-Google-Smtp-Source: ABdhPJyDLWMp4EQ2iv6EKC6E6I1Rf7GeNbzBrcz8iYtLmWXuBOn5YU+PcZnZqUd4X/n5/jjpEJnGnJ+041+EGAbSq/w=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr7384734vka.19.1632487046079;
 Fri, 24 Sep 2021 05:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
In-Reply-To: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 14:37:14 +0200
Message-ID: <CAMuHMdXQ5vv2rxWsd8EGJWufe4UwnvOoiSEXTSDWj7mUDqy+vA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 24, 2021 at 2:35 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> make dtbs_check:
>
>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml: bridge@2c: reg:0:0: 45 was expected
>
> According to the datasheet, the I2C address can be either 0x2c or 0x2d,
> depending on the ADDR control input.
>
> Fixes: e3896e6dddf0b821 ("dt-bindings: drm/bridge: Document sn65dsi86 bridge bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Also seen with the in-flight Falcon DSI display output patch:
>
>     arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: sn65dsi86@2c: reg:0:0: 45 was expected
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-

And the email address of this file's maintainer bounces.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
