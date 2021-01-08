Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1297A2EF381
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbhAHNyP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:54:15 -0500
Received: from mail-qt1-f173.google.com ([209.85.160.173]:36096 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbhAHNyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:54:14 -0500
Received: by mail-qt1-f173.google.com with SMTP id z20so6532070qtq.3;
        Fri, 08 Jan 2021 05:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rqj5Xsr/qj48fOwKpidxFwGYAamy0pFhkyboNHnnmD0=;
        b=VKvenMBIj2wvAiIBOlgP8LH+6nirlRwZgGoSB2l7cMFA8EZViy8TWO4g7jxjnCPmh2
         XjCSeM853eseG8onXrKaU9ghNV9+eEkdAj3XzzMpIqYH1IrCOF4Oa7BKhqG0jBvfVfY7
         JamxjEBdB2MEOtmgV03CaJax1iq4p1SNbqk1dXvKOHgR3AMjHVfsKu1AbNkQbxe9mMcH
         POyqqx3AbaHHOXUKzCqLYcVioB4OFW5DR2Nen33KaUxhGLNOZFvkG4IJaAVONAAtcaiG
         oavbELZTseunFmnjTjeDl3sLpQ0/llgzNpSVZqyQy8sg98QlJ/ut2D7IlA8BurvoLUT3
         vebA==
X-Gm-Message-State: AOAM533wGDkbovMN5y+t/Kr31HRP1pflcDlCT03gxKcrKE989wmrg/UW
        /lLU4GqP8dnKO5zmjMU8Q3Jp/xx5W1a5MXS5SU1o6CrDkkI=
X-Google-Smtp-Source: ABdhPJxOLjxxIvzP+aqbdKXHt8YgvoA5SLGccMd6a22edrbQ9XXSRc6LPSCDN39g6QA0pEqGU+cPeToDlbJhQ0L819s=
X-Received: by 2002:ac8:6e8b:: with SMTP id c11mr3514144qtv.314.1610114012891;
 Fri, 08 Jan 2021 05:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-7-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-7-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:53:21 +0100
Message-ID: <CAMuHMdX17fDaCsOu09u-wJFPtx0ywp_mQfp3U4pQGHTPW9fovA@mail.gmail.com>
Subject: Re: [PATCH V2 7/9] arm64: dts: renesas: Introduce r8a774b1-beacon-rzg2n-kit
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> Beacon EmebeddedWorks is introducing a new kit based on the
> RZ/G2N SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.  It uses the same baseboard
> and SOM as the RZ/G2M.
>
> This SOM has only 2GB of DDR, and beacon-renesom-som.dtsi contains
> the base memory node, so an additional memory node isn't necessary.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Add missing du node entries.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts

> +/* Reference versaclock instead of audio_clk_a */
> +&rcar_sound {
> +       clocks = <&cpg CPG_MOD 1005>,
> +                <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
> +                <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
> +                <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
> +                <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
> +                <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
> +                <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
> +                <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
> +                <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
> +                <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
> +                <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
> +                <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> +                <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
> +                <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
> +                <&versaclock6_bb 4>, <&audio_clk_b>,
> +                <&audio_clk_c>,
> +                <&cpg CPG_CORE R8A774B1_CLK_S0D4>;

BTW, r8a774[abe]1.dtsi define CPG_AUDIO_CLK_I. If you would use
that instead of R8A774[ABE]1_CLK_S0D4, all rcar_sound clocks
properties overrides would become identical, and you could consolidate
them back in beacon-renesom-baseboard.dtsi.

That can be done in a single patch on top later, though.

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
