Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746016B4091
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 14:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCJNip convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 08:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjCJNio (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 08:38:44 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5A46FFC1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:38:42 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id r5so5627844qtp.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678455521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ac7WXFeSz0T1kgsPY6QUVlYqlhcDHvgaWQ62vtXPhpU=;
        b=fGE0N5pATlLGUOA2vhnoFqWD9f+5L52tLsnOONwPm3VqXFnN5fvSw1zBZjgTUgf+Iz
         ed8ihQG1z+eMvFZb3P0HsAD9/ccdCW2rDYzfmY16Pvi2S3Sy1bS61GImcBgn4snd+hWF
         YkLqgpWcnM7fFW82LI25op2zGrO0LODYz8P3MabLC+To0SRQWQRtRw5fFgZv9uoTptFE
         v2Y5c4mB9Y1/U7S9liIdbViCtST6Fv5iBwHgJ3amUVozOt6Wb26TWVEJsz2ZoyhJtKxN
         SyAUtyGleEeWryTG2j5jkIcwKjDFVwdTkFB7QbMPQpfWZKR380hHgPA8cWsGQ9WZ8McG
         R16g==
X-Gm-Message-State: AO0yUKVMjLSqfjSN8CCRBzQBvl0rNeyU615/l1fLDwHEMA0kgVeP1fla
        yGqmwLyndi7+oH5YIX7B/W1oGt49JxO68w==
X-Google-Smtp-Source: AK7set/CqMybTeoafz8BNYflugzUC0jPVX+Hmx8dTNvYQQiZLTJgZA+Eaf38sFGmEL1vOEWJNtvz8g==
X-Received: by 2002:a05:622a:54c:b0:3bf:d9d2:484f with SMTP id m12-20020a05622a054c00b003bfd9d2484fmr42610908qtx.11.1678455521652;
        Fri, 10 Mar 2023 05:38:41 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id b1-20020ac801c1000000b003b9e1d3a502sm1395258qtg.54.2023.03.10.05.38.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:38:41 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id e82so5240876ybh.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Mar 2023 05:38:41 -0800 (PST)
X-Received: by 2002:a5b:f87:0:b0:b30:8d4b:230e with SMTP id
 q7-20020a5b0f87000000b00b308d4b230emr893331ybh.7.1678455521094; Fri, 10 Mar
 2023 05:38:41 -0800 (PST)
MIME-Version: 1.0
References: <87r0u1l9vc.wl-kuninori.morimoto.gx@renesas.com> <87o7p5l9t7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o7p5l9t7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Mar 2023 14:38:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRaL-44EZ+64Knj_Yy_txNZp9HXUzPg9BmTV16Z3WseQ@mail.gmail.com>
Message-ID: <CAMuHMdXRaL-44EZ+64Knj_Yy_txNZp9HXUzPg9BmTV16Z3WseQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a779g0: whitehawk: Add R-Car
 Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Mar 7, 2023 at 12:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> These adds R-Car Sound support for WhiteHawk board using
> ARD-AUDIO-DA7212 external audio board.
> It is using DT overlay.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso

> +&{/} {
> +       sound_card: sound {
> +               compatible = "audio-graph-card";
> +               label = "rcar-sound";
> +
> +               dais = <&rsnd_port0>;   /* DA7212 Audio Codec */
> +       };
> +
> +       tpu_clk: tpu_clk {

Will rename to "tpu-clk" while applying, as underscores are not
recommended in node names.

> +&rcar_sound {
> +       pinctrl-0 = <&sound_clk_pins>, <&sound_pins>;
> +       pinctrl-names = "default";
> +
> +       /* Single DAI */
> +       #sound-dai-cells = <0>;
> +
> +       /* audio_clkout */
> +       #clock-cells = <0>;
> +       clock-frequency = <5644800>; /* 44.1kHz groups [(C) clock] */
> +//     clock-frequency = <6144000>; /* 48  kHz groups [(C) clock] */
> +
> +       status = "okay";
> +
> +       /* update <clkin> to <tpu_clk> */
> +       clocks = <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 2927>, <&tpu_clk>;
> +
> +       ports {
> +               rsnd_port0: port {

Will change to "rsnd_port:", as you dropped the @0.

> +                       rsnd_endpoint: endpoint {
> +                               remote-endpoint = <&da7212_endpoint>;
> +
> +                               dai-format = "i2s";
> +                               bitclock-master = <&rsnd_endpoint>;
> +                               frame-master = <&rsnd_endpoint>;
> +
> +                               /* Please use exclusively to the 'capture' */
> +                               playback = <&ssi0>;
> +                               /* [CAPTURE] */
> +                               /* capture = <&ssi0>; */
> +                       };
> +               };
> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
