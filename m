Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6EF66710A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 12:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbjALLhA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 06:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjALLfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 06:35:52 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A4ADE99
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:28:18 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id v14so16180592qtq.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVkg7cexigZFGH1i9uEFsbEca5M2rBUQKEAQ58o6p34=;
        b=DytgeXyDdHk15sv4aF+MkrkpVOMPwMyWWcWM1BtgAPDZa1Z1lPirjtluco9f0bZfIY
         rDJT5Cjy4gMVa/PrApS8D6mC2zISfF8DORhZyAiLdB5nN06BGNb+lWQcKKxI1nj2IN7k
         8vxyHIrVhzekV/b45A627OKxhBmcZo9Y3NaWLogjMX1LGHf1t0FWiR8/wuhwqfjsrHEA
         Ig2PGEknzh7WyoExoOJUUkK1wWdtsul10vaTEeH1QBdWEn4nYKFoNLBfEVB1QBy/TnBz
         kVMavBfmcTH92gztKFa1+yk/u2itjfV7udPCnRfZza6cHoSgXNFD5DCNKocrxGztpM3j
         EG4g==
X-Gm-Message-State: AFqh2kpYfmhhqkk9oLTlj2G4dtYN3i1L/8d29+aNuXvZ3cdrW8abq4xi
        4/6pIGQXiplgERR4KtMinoWyvvSB7dPgBw==
X-Google-Smtp-Source: AMrXdXvxmO4L7rJGIVeBaRl9fA283YwQY56jXBf7IFHCgNnooZcdLOFoDBeMcQYc0cPa27gI3jmnxA==
X-Received: by 2002:a05:622a:4810:b0:3a5:4e34:fafe with SMTP id fb16-20020a05622a481000b003a54e34fafemr118952373qtb.68.1673522897801;
        Thu, 12 Jan 2023 03:28:17 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id do44-20020a05620a2b2c00b006f8665f483fsm3791011qkb.85.2023.01.12.03.28.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 03:28:17 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-4b718cab0e4so234817057b3.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 03:28:17 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3069379ywb.47.1673522897186; Thu, 12
 Jan 2023 03:28:17 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com> <875yeepxfw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875yeepxfw.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 12:28:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzyj8hR9-GY5g3ZqVRD3FC4HxxtDEfLAxjiK=iFRpC9w@mail.gmail.com>
Message-ID: <CAMuHMdWzyj8hR9-GY5g3ZqVRD3FC4HxxtDEfLAxjiK=iFRpC9w@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2
 dtsi MIX + TDM Split dtsi
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Dec 14, 2022 at 2:48 AM Kuninori Morimoto
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
> This patch adds "Audio Graph Card2 + MIXer + TDM Split" DT setting file
> for ULCB/KF. Because it reach to subdevice maximum, it ignore HDMI.
> We can switch to use it if ulcb.dtsi / ulcb-kf.dtsi were updated.
>
> Because it needs "switching driver", not "add extra feature",
> it doesn't use Device-Tree overlay.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree for ULCB + Audio Graph Card2 (MIX + TDM Split)
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +/*
> + * Note:
> + * Because there is subdevice maximum, it will ignore HDMI output
> + *
> + *     (A) CPU0 (2ch) ------ (2ch) (X) ak4613  (MIX-0)
> + *     (B) CPU1 (2ch) --/                      (MIX-1)
> + *
> + *     (A) aplay   -D plughw:0,0 xxx.wav
> + *     (B) aplay   -D plughw:0,1 xxx.wav
> + *
> + *     (A) arecord -D plughw:0,0 xxx.wav
> + */
> +/ {
> +       sound_card: sound {
> +               compatible = "audio-graph-card2";
> +               label = "rcar-sound";
> +
> +               routing = "ak4613 Playback", "DAI0 Playback",
> +               "ak4613 Playback", "DAI1 Playback",
> +               "DAI0 Capture",    "ak4613 Capture";
> +
> +               /delete-property/ dais;
> +               links = <&fe_a          /* (A) CPU0   */
> +                        &fe_b          /* (B) CPU1   */
> +                        &be_x          /* (X) ak4613 */
> +               >;
> +
> +               dpcm {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       ports@0 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0>;
> +                               /*
> +                                * FE

FE = Front End?

> +                                * (A) CPU0 (MIX-0)
> +                                * (B) CPU1 (MIX-1)
> +                                */
> +                       fe_a:   port@0 { reg = <0>; fe_a_ep: endpoint { remote-endpoint = <&rsnd_a_ep>; }; };
> +                       fe_b:   port@1 { reg = <1>; fe_b_ep: endpoint { remote-endpoint = <&rsnd_b_ep>; }; };

Please preserve alignment (i.e. insert TAB before fe_[ab] labels).

> +                       };
> +
> +                       ports@1 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <1>;
> +                               /*
> +                                * BE

Back End? (I guess not Big Endian ;-)

> +                                * (X) ak4613
> +                                */
> +                       be_x:   port@0 { reg = <0>; be_x_ep: endpoint { remote-endpoint = <&ak4613_x_ep>; }; };

Likewise

> +                       };
> +               };
> +       };
> +};
> +
> +&ak4613 {
> +       port {
> +               /*
> +                * (X) ak4613

Perhaps add an arrow, and a target, like in the other patches?
(everywhere)

> +                */
> +               prefix = "ak4613";
> +               convert-rate = <48000>;
> +
> +               ak4613_x_ep: endpoint {
> +                       remote-endpoint = <&be_x_ep>;
> +               };
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
