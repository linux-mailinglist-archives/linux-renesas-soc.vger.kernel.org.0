Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189BB66BCA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jan 2023 12:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjAPLQ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Jan 2023 06:16:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjAPLQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2023 06:16:55 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9056596
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:16:54 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id x7so14210856qtv.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZnNmMgsGI4iNkGgz+ik7SL9pEQ9UJJMcbUucvdaVsA=;
        b=OlMAxJWE/z43L3hbPQ/7Uo+gxfhS4tq66R4JulPeXxHkt0tXlKSbyYwh1/NBJ72Gp4
         Dn9RoppndNUQ91gx90JaVcb1XjvwBmjqCVIKee54hLzXyHbKbaIxjwXKYOg9kyze6LHP
         Humst9O4gvXxb78kwVp+Z4JeHjegSkX9Sw563uGXQHUbzC4JO4lns8mzRklI5SgvXyUh
         N69CLiVYQi4raGu/LBG8atNKLgW3IjqPHUWHF+Bxq2aeR1uq0chc91B2/vuEVTYurxeV
         NPq6JAMZWXL78bfdrJ6mEyZl4yZiHKwBhDEuw9qldV+JWflWLLtsSnHZ9xCLic26Jl4w
         07Jw==
X-Gm-Message-State: AFqh2krWpmQa6ODeqIZ0EyuBT7UOsl3PzQPg+YBpl8q6HYs+AcfyMYmZ
        s8HwrXCShtbY6IQ9kcFYdu85nj75xs0VXA==
X-Google-Smtp-Source: AMrXdXuk41c+761CEfq7hYfG4XB8HiTmeLalgDMXur2xTLb2Q7MrRUfYVqoWM23+F1UXvr+LS6TIsw==
X-Received: by 2002:ac8:6e8b:0:b0:3a8:741:1c45 with SMTP id c11-20020ac86e8b000000b003a807411c45mr116070689qtv.42.1673867813627;
        Mon, 16 Jan 2023 03:16:53 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id n15-20020a05620a294f00b0070383f1b6f1sm18212367qkp.31.2023.01.16.03.16.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 03:16:53 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-4c24993965eso369639357b3.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jan 2023 03:16:53 -0800 (PST)
X-Received: by 2002:a0d:e8c2:0:b0:4e0:d096:7795 with SMTP id
 r185-20020a0de8c2000000b004e0d0967795mr1417388ywe.358.1673867813029; Mon, 16
 Jan 2023 03:16:53 -0800 (PST)
MIME-Version: 1.0
References: <87fscfi424.wl-kuninori.morimoto.gx@renesas.com> <875ydbi40l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875ydbi40l.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 12:16:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVr-c=ht9GKkvSxdokqEoZTuOk41hRzXL7tpREy4+Pb9Q@mail.gmail.com>
Message-ID: <CAMuHMdVr-c=ht9GKkvSxdokqEoZTuOk41hRzXL7tpREy4+Pb9Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph
 Card dtsi MIX + TDM Split dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Fri, Jan 13, 2023 at 3:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> ALSA SoC has many type of Generic Audio Card driver (Simple Audio Card,
> Audio Graph Card, Audio Graph Card2), and Renesas/Kuninori Morimoto want
> to test these.
>
> Generic Audio Card driver had been requested on ALSA SoC.
> It has many type of device connection method, and historically,
> requested connection support range of generic driver have been
> upgraded.
>
> Upgrading connection support range itself was possible on generic
> driver, but could not implemented, because we need to keep compatibility
> on Device-Tree. This is one of the reason why we have many type of
> Generic Audio Card driver.
>
> ULCB/KF is good board to test these.
> Kuninori has been testing these Generic Audio Card driver by using his
> local patch to switching drivers. But it is good idea to upstream these
> from information sharing point of view, because DT setting is complex.
> It can be good sample for user. This patch is one of them.
>
> From normal user point of view who don't need to test the driver,
> it should keep as-is, nothing changed.
>
> This patch adds "Audio Graph Card + MIXer + TDM Split" DT setting file
> for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Link: https://lore.kernel.org/r/874jtypxfp.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree for ULCB + Audio Graph Card (MIX)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/*
> + * Note:
> + * Because there is subdevice maximum, it will ignore HDMI output
> + *
> + *     (A) CPU0 (2ch) <-----> (2ch) (X) ak4613 (MIX-0)
> + *     (B) CPU1 (2ch)  --/                     (MIX-1)

Shouldn't that be "<--/" (also in the other mix+split patches)?
No worries, I can fix all of these while applying.

> + *     (C) CPU3 (2ch)  ----> (8ch) (Y)
> + *
> + *     (A) aplay   -D plughw:0,0 xxx.wav
> + *     (B) aplay   -D plughw:0,1 xxx.wav
> + *
> + *     (A) arecord -D plughw:0,0 xxx.wav
> + */

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi

> +               /*
> +                * (Z) PCM3168A-c
> +                */
> +               port@1 {
> +                       reg = <1>;
> +                       /* (G) CPU6 <-> PCM3168A-c */

"<-".

> +                       pcm3168a_endpoint_c: endpoint {
> +                               remote-endpoint = <&rsnd_for_pcm3168a_capture>;
> +                               clocks = <&clksndsel>;
> +                       };
> +               };
> +       };
> +};

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
