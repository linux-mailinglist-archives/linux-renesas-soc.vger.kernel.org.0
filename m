Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFE57A4D69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Sep 2023 17:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjIRPtb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 11:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjIRPta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 11:49:30 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36852D46
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 08:46:17 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6befdb1f545so3270927a34.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 08:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695051719; x=1695656519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCuZw6mnjneAEm0yU5GAif4E0x/Kml2QU4/tcjP5Q4w=;
        b=Yy3IpIYUm/Pinqjf2cQHIaLYxrMtqoejV+MYfQ69O0cUWqDs0w25d7iQeWSb8W/tHl
         +71FxHuZJlyGUpPfUkY7goqXe4fHvFSpC7LirPJgRocVYKs7NLXBgxeoHvgHkSMu678K
         LUlPOdVqKk2mg0S4BXTIGsb/P4gWbqylPoEiR6rRNvo+NfqFqSpdJFPJtZF6Hts5sst/
         wCVuM1yIBQyKwN5ftMt5xOpkY6qZZNU4aiU2ZGpUmrulWiq6roI182IQdkzqYKrMNP7s
         0UPaTjbNeyA41gpK0dvcWj1As+pjaBSAuQolBC36QNTZHga3ZeSKP7XPwIjFe91/fCJX
         7CFw==
X-Gm-Message-State: AOJu0YyNVHnwYwqTWJ0IcKGB71VLAlCRDsNWcLUtMEaimrvyVEeexT29
        tnP8W8V+zzovYuGb3k1ZNNMesyuuHlpbFw==
X-Google-Smtp-Source: AGHT+IEY9f/1oxfA4lz6+YlzvPUiyrf8L8acjQdvvCshjPSmDATOaNwNRgl3ojtZJUwImHPlu8PQHw==
X-Received: by 2002:a81:5f43:0:b0:59b:c6a4:15c7 with SMTP id t64-20020a815f43000000b0059bc6a415c7mr9634044ywb.46.1695048133964;
        Mon, 18 Sep 2023 07:42:13 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id h4-20020a815304000000b005928ba6806dsm2619996ywb.97.2023.09.18.07.42.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:42:13 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59bc956b029so44037697b3.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 07:42:13 -0700 (PDT)
X-Received: by 2002:a81:7254:0:b0:583:a3ab:b950 with SMTP id
 n81-20020a817254000000b00583a3abb950mr8345208ywc.50.1695048133532; Mon, 18
 Sep 2023 07:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <87wmwxh4av.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmwxh4av.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Sep 2023 16:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_d_juuo01gbD81aHJ=bs8k3jXeiP7kkOzQDVxHcbzoQ@mail.gmail.com>
Message-ID: <CAMuHMdW_d_juuo01gbD81aHJ=bs8k3jXeiP7kkOzQDVxHcbzoQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: use multi Component for ULCB/KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Sep 11, 2023 at 3:44 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
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

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
> @@ -19,32 +19,31 @@
>   *
>   *     (A) aplay   -D plughw:0,0 xxx.wav (MIX-0)
>   *     (B) aplay   -D plughw:0,1 xxx.wav (MIX-1)
> - *     (C) aplay   -D plughw:0,2 xxx.wav (TDM-0)
> - *     (D) aplay   -D plughw:0,3 xxx.wav (TDM-1)
> - *     (E) aplay   -D plughw:0,4 xxx.wav (TDM-2)
> - *     (F) aplay   -D plughw:0,5 xxx.wav (TDM-3)
> + *     (C) aplay   -D plughw:1,0 xxx.wav (TDM-0)
> + *     (D) aplay   -D plughw:1,1 xxx.wav (TDM-1)
> + *     (E) aplay   -D plughw:1,2 xxx.wav (TDM-2)
> + *     (F) aplay   -D plughw:1,3 xxx.wav (TDM-3)
>   *
>   *     (A) arecord -D plughw:0,0 xxx.wav
> - *     (G) arecord -D plughw:0,6 xxx.wav
> + *     (G) arecord -D plughw:1,4 xxx.wav
>   */
> +/ {
> +       sound_card_kf: expand_sound {

Please no underscores in (new) node names (everywhere)

expand-sound?

> +               compatible = "audio-graph-scu-card";
> +               label = "snd-kf-split";
>
> -&sound_card {
> -       routing = "ak4613 Playback",   "DAI0 Playback",
> -                 "ak4613 Playback",   "DAI1 Playback",
> -                 "DAI0 Capture",      "ak4613 Capture",
> -                 "pcm3168a Playback", "DAI2 Playback",
> -                 "pcm3168a Playback", "DAI3 Playback",
> -                 "pcm3168a Playback", "DAI4 Playback",
> -                 "pcm3168a Playback", "DAI5 Playback";
> +               routing = "pcm3168a Playback", "DAI2 Playback",
> +                         "pcm3168a Playback", "DAI3 Playback",
> +                         "pcm3168a Playback", "DAI4 Playback",
> +                         "pcm3168a Playback", "DAI5 Playback";
>
> -       dais = <&rsnd_port0 /* (A) CPU0 */
> -               &rsnd_port1 /* (B) CPU1 */
> -               &rsnd_port2 /* (C) CPU2 */
> -               &rsnd_port3 /* (D) CPU3 */
> -               &rsnd_port4 /* (E) CPU4 */
> -               &rsnd_port5 /* (F) CPU5 */
> -               &rsnd_port6 /* (G) GPU6 */
> -       >;
> +               dais = <&snd_kf1 /* (C) CPU2 */
> +                       &snd_kf2 /* (D) CPU3 */
> +                       &snd_kf3 /* (E) CPU4 */
> +                       &snd_kf4 /* (F) CPU5 */
> +                       &snd_kf5 /* (G) GPU6 */
> +               >;
> +       };
>  };
>
>  &pcm3168a {
> @@ -103,13 +102,14 @@ pcm3168a_endpoint_c: endpoint {
>  };
>
>  &rcar_sound {
> -       ports {
> -               /* rsnd_port0-1 are defined in ulcb.dtsi */

Don't you need to add

    #address-cells = <1>;
    #size-cells = <0>;

like in the other files?

> +       ports@1 {

So now you end up with a "ports" node without a unit address, and a
"ports@1" node with a unit address, which looks very strange to me...

According to the example in the description for commit 547b02f74e4ac1e7
("ASoC: rsnd: enable multi Component support for Audio Graph
Card/Card2"), the first node should be named "ports@0":

    Ex) Audio Graph Card/Card2

            rcar_sound {
                    /* Component0 */
                    ports@0 {
                            ...
                    };

                    /* Component1 */
                    ports@1 {
                            ...
                    };
            };

This comment is valid for the other .dtsi files, too.

> +               #address-cells = <1>;
> +               #size-cells = <0>;
>
>                 /*
>                  * (C) CPU2
>                  */
> -               rsnd_port2: port@2 {
> +               snd_kf1: port@2 {
>                         reg = <2>;
>                         rsnd_for_pcm3168a_play1: endpoint {
>                                 remote-endpoint = <&pcm3168a_endpoint_p1>;

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

Same here: "rcar_sound,dai" node without a unit address, and
"rcar_sound,dai@1" node with a unit address.

According to the example in the description for commit 547b02f74e4ac1e7
("ASoC: rsnd: enable multi Component support for Audio Graph
Card/Card2"), the first node should be named "rcar_sound,dai@0":

    Ex) Simple Card

            rcar_sound {
                    ...

                    /* Component0 */
                    rcar_sound,dai@0 {
                            ...
                    };

                    /* Component1 */
                    rcar_sound,dai@1 {
                            ...
                    };
            };

This comment is valid for the other .dtsi files, too.

> +               reg = <1>;
>
>                 /* dai0-1 are defined in ulcb.dtsi */
>

The rest LGTM (for a sound-illiterate reviewer like me ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
