Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47D90665E3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 15:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjAKOqE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 09:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjAKOqD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 09:46:03 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA6B6328;
        Wed, 11 Jan 2023 06:46:02 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id d66so3488206vsd.9;
        Wed, 11 Jan 2023 06:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6oGhEpGw0nlmVNW90naWw9DJiWnxock79eatbawP6o=;
        b=elSo/qCSM9El+LwvAmUFs1M53ImUbkJ3Jpu1rNPVhdqnzHoIve9edFTBzGQahuMoIW
         B0mnhtaZiooDz0VgUm6t3QO6Ca8qgHrhY92sdWjtKvlAeO1o7gLLzpaw3/X+3Kwnk4Ii
         myWVDLo4NnwbZ0SEwCiOUjtJq4dRdcPsIfNSnOjjVMErh6UMpkFhfk8TLDcl4qfsD2uZ
         /QQi8QvFLGvPttXpY+XGElf5mn08NqLwpJqQK8j7RztygEaHBbUj/ty+NVxyOUrjudAl
         LcqJsl0Hd9S8iGQozvdNh9PG+hUAIAoSJRc9Fyr2vPfRq5uE+ERnFFrxwLxZwIzsPIfE
         orxg==
X-Gm-Message-State: AFqh2kq4y3MXNDbIjtg2ePqB7SxDXF0wXT0PWk/C9hqZEI1e2BtJc8eq
        aZN1OOyM0gt7cHziuRIrmU8kJ2fOSiyoqA==
X-Google-Smtp-Source: AMrXdXuQ3G+Nui4ViZKQy3cHmbGQTt9xFm4P2UFZvfFr34FcXoYRlp8IHnxaMsE4ellbtCY/tVwtug==
X-Received: by 2002:a05:6102:3d1f:b0:3c5:8369:1c6f with SMTP id i31-20020a0561023d1f00b003c583691c6fmr37015324vsv.18.1673448361421;
        Wed, 11 Jan 2023 06:46:01 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id h8-20020a05620a284800b006fa7b5ea2d1sm9049582qkp.125.2023.01.11.06.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 06:46:01 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-4d13cb4bbffso77329347b3.3;
        Wed, 11 Jan 2023 06:46:00 -0800 (PST)
X-Received: by 2002:a05:690c:d8c:b0:4a2:63c5:6c59 with SMTP id
 da12-20020a05690c0d8c00b004a263c56c59mr3792744ywb.384.1673448360609; Wed, 11
 Jan 2023 06:46:00 -0800 (PST)
MIME-Version: 1.0
References: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edt2pxhd.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Jan 2023 15:45:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
Message-ID: <CAMuHMdUH-CSmaKuM2HA-5j5cP_c2pygp9DqyQiOC9XkCUuzCKw@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm64: dts: renesas: Simple-Card /
 Audio-Graph-Card/Card2 dts for ULCB/KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

CC DT/ASoC

On Wed, Dec 14, 2022 at 2:47 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> ALSA SoC is now supporting generic Sound Card driver such as
> Simple-Card / Audio-Graph-Card/Card2, and it supports
> "normal connection" and "special connections".
> I'm its maintainer, thus I need/want to test these.
>
> I have been tested these by using my local patches to switching card,
> but maintenance it locally is not useful for me, and users who want to
> know the sample DT settings.
>
> And I have noticed that some local patch had bug, but no one noticed
> about it (of course :)
>
> ULCB/KF is very good board to test these.
> So, I want to upstream these.
>
> One note here is that this patch *should not* have effect to
> existing normal users, but useful for test user.
> So, this patch-set adds "3 card" x "2 use case" dtsi file,
> and ulcb/ulcb-kf "include" one of them which doesn't change anything.
> test user can switch to other card or other use case by changing
> "include" dtsi.
>
> [1/8][2/8] are small tidyup patches for all SoC sound.

Thanks for your series!

I really wanted to review this earlier, but I am held back by my lack
of understanding of the audio subsystem and the audio bindings.
It is also not clear to me what really is hardware description
(i.e. to be described in DT), and what is software policy (i.e. not
to be described in DT)...
Hence I have lots of questions ("A fool can ask more questions in a
minute than a wise man can answer in an hour." ;-)

What is the difference between "Simple Audio Card", "Audio Graph Card",
and "Audio Graph Card2"?  Why do we need to support all three of them?

How come we can have no #sound-dai-cells, #sound-dai-cells = <0>,
and #sound-dai-cells = <1>, for the same hardware?
What is the real difference between Single DAI and Multi DAI?
Why do we need to support both?

> Kuninori Morimoto (8):
>   ARM: dts: renesas: #sound-dai-cells is used when simple-card
>   arm64: dts: renesas: #sound-dai-cells is used when simple-card
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
>   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi

The above three all describe the same hardware configuration?

>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
>   arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
>   arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi

Is MIX and TDM Split a different hardware configuration, or software
policy?

Thanks!

>  arch/arm/boot/dts/r8a7742.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7743.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7744.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7745.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7778.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7790.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7791.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7793.dtsi                |   2 +-
>  arch/arm/boot/dts/r8a7794.dtsi                |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +-
>  .../boot/dts/renesas/salvator-common.dtsi     |   3 -
>  .../ulcb-audio-graph-card-mix+split.dtsi      |  89 +++++++++
>  .../dts/renesas/ulcb-audio-graph-card.dtsi    |  85 +++++++++
>  .../ulcb-audio-graph-card2-mix+split.dtsi     | 111 +++++++++++
>  .../dts/renesas/ulcb-audio-graph-card2.dtsi   |  26 +++
>  .../ulcb-kf-audio-graph-card-mix+split.dtsi   | 162 ++++++++++++++++
>  .../dts/renesas/ulcb-kf-audio-graph-card.dtsi |  88 +++++++++
>  .../ulcb-kf-audio-graph-card2-mix+split.dtsi  | 177 ++++++++++++++++++
>  .../renesas/ulcb-kf-audio-graph-card2.dtsi    |  30 +++
>  .../ulcb-kf-simple-audio-card-mix+split.dtsi  | 137 ++++++++++++++
>  .../renesas/ulcb-kf-simple-audio-card.dtsi    |  85 +++++++++
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  66 ++-----
>  .../ulcb-simple-audio-card-mix+split.dtsi     |  86 +++++++++
>  .../dts/renesas/ulcb-simple-audio-card.dtsi   |  89 +++++++++
>  arch/arm64/boot/dts/renesas/ulcb.dtsi         |  60 ++----
>  34 files changed, 1212 insertions(+), 120 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
