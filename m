Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1CAA7A789D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 12:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbjITKJT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 06:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbjITKJS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 06:09:18 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC316AC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 03:09:11 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso6410817276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 03:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204550; x=1695809350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPz3uuka8iyWqx82huzjxihUaV+iOvkBpf3ElW6rQEQ=;
        b=nTIeAWEbo7HCvVF4OF0xZ7mjqOe5CXJ7jEByEidF4I7A8mPgGclXOS+9kkMSzl+q51
         Xdpr+oVO/ZBSYO5bCQ+8CQjqNsyAlid0gibQdHhjmLTTY6REsFm0b5FaSaLATdCqgVdB
         tPbAZPtKCRnPxIRNgo+8yqTv9XJB6ewiUAQkFJv+lLe9xeHsEMrfH2ySpSqRBV/vSVU2
         4HzW6zGxXVqjr7FtaOAq5R60D+t7DZNiUC1N//hNzjln0gJhxt58Of+n6sa+yKeEd/HM
         RKttMuiETVLsgzFghRS0pRQYQyFfTww0mzP4NaXPxbKylYf/C6X521/W/i1ATtKrxZe/
         EUTQ==
X-Gm-Message-State: AOJu0YzNm0KC3ETkMSH5mrXcxpaITTWBEu6MzwQSDdNzgVzIOuiQLcYI
        7Wr5GbR05k5iiJNk6EhcHQPn8c1kEEgg9Q==
X-Google-Smtp-Source: AGHT+IFCqQTcC9jm6bKuZsWnq6gK0sLVK7yEO8yd016bpXbFNZEefNp/3fUShWDqUcxSjZkv/pPKUQ==
X-Received: by 2002:a25:800b:0:b0:d78:878d:e1e1 with SMTP id m11-20020a25800b000000b00d78878de1e1mr2021865ybk.50.1695204550582;
        Wed, 20 Sep 2023 03:09:10 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 126-20020a251184000000b00d7e96c6eaf5sm2004869ybr.46.2023.09.20.03.09.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 03:09:10 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso6410800276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 03:09:10 -0700 (PDT)
X-Received: by 2002:a5b:78f:0:b0:d74:62df:e802 with SMTP id
 b15-20020a5b078f000000b00d7462dfe802mr2074068ybq.0.1695204550185; Wed, 20 Sep
 2023 03:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <87pm2dyarl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pm2dyarl.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Sep 2023 12:08:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSf1v_qt+O+-AD2d3rB6g7AyjoE0iZwfRYwVvwyK_oTQ@mail.gmail.com>
Message-ID: <CAMuHMdWSf1v_qt+O+-AD2d3rB6g7AyjoE0iZwfRYwVvwyK_oTQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: use multi Component for ULCB/KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Sep 20, 2023 at 2:00 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>         +-- ULCB -------------------+
>         |+--------+       +--------+|
>         ||    SSI0| <---> |ak4613  ||
>         ||    SSI1| <---> |        ||
>         ||        |       +--------+|
>         ||        |       +--------+|
>         ||    SSI2| <---> |HDMI    ||
>         ||        |       +--------+|
>         ||    SSI3| <--+            |
>         ||    SSI4| <-+|            |
>         |+--------+   ||            |
>         +-------------||------------+
>         +-- Kingfisher -------------+
>         |             ||  +--------+|
>         |             |+->|pcm3168a||
>         |             +-->|        ||
>         |                 +--------+|
>         +---------------------------+
>
> On UCLB/KF, we intuitively think we want to handle these
> as "2 Sound Cards".
>
>         card0,0: 1st sound of ULCB (SSI0 - ak4613)
>         card0,1: 2nd sound of ULCB (SSI2 - HDMI)
>         card1,0: 1st sound of KF   (SSI3 - pcm3168a)
>             ^ ^
>
> But, we needed to handle it as "1 big Sound Card",
> because of ASoC Component vs Card framwork limitation.
>
>         card0,0: 1st sound of ULCB/KF (SSI0 - ak4613)
>         card0,1: 2nd sound of ULCB/KF (SSI2 - HDMI)
>         card0,2: 3rd sound of ULCB/KF (SSI3 - pcm3168a)
>             ^ ^
>
> Now ASoC support multi Component which allow us to handle "2 Sound Cards"
> such as "ULCB Sound Card" and "Kingfisher Sound Card".
>
> This patch updates all ULCB/KF Audio dtsi.
> One note is that Sound Card specification method from userland will be
> changed, especially for Kingfisher Sound.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
>
>         - "ulcb" uses "port@0"
>         - "ulcb" has #address-cells / #size-cells

Thanks for the update!
It looks much better now (I hope it still works?)

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi

> +                       ports@1 {
> +                               reg = <1>;
> +                               /*
> +                               * BE
> +                               *
> +                               * (Y) PCM3168A-p
> +                               */

checkpath: WARNING: Block comments should align the * on each line

> +                       be_y:   port { be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
> +                       };
>                 };
>         };
>  };

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
> @@ -115,7 +118,11 @@ &pcm3168a {
>  };
>
>  &rcar_sound {
> -       rcar_sound,dai {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       rcar_sound,dai@1 {
> +               reg = <1>;

Can you please make a similar change for "rcar_sound,dai", i.e. use
"rcar_sound,dai@0" and add #{address,size}-cells in the ULCB DTS files?

>
>                 /* dai0-1 are defined in ulcb.dtsi */
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
